install.packages("tree")
install.packages("dplyr")
install.packages("varImp")
install.packages("randomForestExplainer")
install.packages("extrafont")
install.packages("randomForest")
install.packages("readxl")
install.packages("ggplot2")

# Load the libraries
library(randomForest)
library(randomForestExplainer)
library(extrafont)
library(tree)
library(dplyr)
library(varImp)
library(ggplot2)
library(readxl)


# Register all fonts available in your system
#font_import(prompt = FALSE)  # This can take a few minutes the first time
#loadfonts(device = "win") 

#upload data
demographics <- read_excel(".../dummyData.xlsx")
str(demographics)

#filter for the desired parameters
demographics_filtered <- demographics %>% select(COUNTY_ID, COUNTY_DISPOSITION, STATE_DISPOSITION, 
                                                DISPOSITION_ADJ_DELINQUENT, '#_REFERRALS_AT_DISPOSITION',
                                                CHARGE_GRADE, CHARGE_COUNT, OFFENSE_CATEGORY,                                              CHARGES_GROUP, CHARGE_STATUS, CHARGE_ADJ, GENDER, RACE, 
                                                AGE_AT_REFERRAL, REFERRED_BY, PARENT_STATUS, PRIOR_REFERRAL_COUNT)
str(demographics_filtered)

#Check categorical variable levels
offenses <- demographics_filtered %>% count(OFFENSE_CATEGORY) %>% arrange(desc(n))
offenses[0:32,]

#Only include the 10 most frequent offense categories for efficiency
demographics_filtered$OFFENSE_CATEGORY <- ifelse(
  demographics_filtered$OFFENSE_CATEGORY %in% offenses$OFFENSE_CATEGORY[1:10], 
  demographics_filtered$OFFENSE_CATEGORY, 
  "Other")

#Set categorical variables to factors
demographics_filtered <- demographics_filtered %>% mutate_at(c("COUNTY_DISPOSITION", "STATE_DISPOSITION", "DISPOSITION_ADJ_DELINQUENT", "CHARGE_GRADE", "OFFENSE_CATEGORY", "CHARGES_GROUP", "CHARGE_STATUS", "CHARGE_ADJ", "GENDER", "RACE", "REFERRED_BY", "PARENT_STATUS"), as.factor)
demographics_filtered <- demographics_filtered %>% rename(Num_Prior_Ref = `#_REFERRALS_AT_DISPOSITION`)
str(demographics_filtered)
unique(demographics_filtered$PARENT_STATUS)
sum(is.na(demographics_filtered))
 


#Create training and validation data sets
trainindex <- sample(1:nrow(demographics_filtered), 0.8*nrow(demographics_filtered)) 
validationindex <- setdiff(1:nrow(demographics_filtered), trainindex)
demos_train <- demographics_filtered[trainindex,]
demos_validation <- demographics_filtered[validationindex, ]
demos_train

#Check distributions of prediction classes with intent on up- or down- sampling as needed
unique(demographics_filtered$RACE)
count(demos_train[demos_train$RACE=="Asian",])
count(demos_train[demos_train$RACE=="White",])
count(demos_train[demos_train$RACE=="Black",])
count(demos_train[demos_train$RACE=="Multiracial",])

#separate and re-sample training set by each prediction class for proper training without 
#the influence of over-represented categories

classWTrain <- demos_train%>% filter(demos_train$RACE=="White")
classATrain <- demos_train%>% filter(demos_train$RACE=="Asian")
classBTrain <- demos_train%>% filter(demos_train$RACE=="Black")
classMTrain <- demos_train%>% filter(demos_train$RACE=="Multiracial")

classWTrain <- classWTrain[sample(nrow(classWTrain), 800, replace = FALSE ),]
classATrain <- classATrain[sample(nrow(classATrain), 20, replace = TRUE ),]
classBTrain <- classBTrain[sample(nrow(classBTrain), 800, replace =  FALSE),]
classMTrain <- classMTrain[sample(nrow(classMTrain), 800, replace = TRUE ),]
demos_train <- rbind(classWTrain, classATrain, classBTrain, classMTrain)
head(demos_train$RACE)

#train a simple decision tree for a baseline accuracy
tree.RACE <- tree(RACE ~., demos_train)
summary(tree.RACE)
tree.predict <- predict(tree.RACE, demos_validation, type="class")
plot(tree.RACE)
text(tree.RACE, pretty=0, cex=.5)
table(tree.predict, demos_validation$RACE)
#error_tree <- (2+63+23+8+10+114+160)/(2+63+23+8+10+114+160+131+66+209)
#error_tree

#prune the tree to prevent over-fitting
tree.race.prune.cv <- cv.tree(tree.RACE, FUN = prune.misclass)
par(mfrow= c(1,1))
plot(tree.race.prune.cv$size, tree.race.prune.cv$dev, type = "b")
plot(tree.race.prune.cv$k, tree.race.prune.cv$dev, type = "b")
tree.race.prune <- prune.misclass(tree.RACE, best = 4)
plot(tree.race.prune) # get shallow trees which is nice to interpret
text(tree.race.prune, pretty=0, cex=1) 
tree.predict.pruned <- predict(tree.race.prune, demos_validation, type="class")
table(tree.predict, demos_validation$RACE)
#error_after_prune <- (646+733)/(646+733+633+520)


#Bagging and Forests
bag.race <- randomForest(RACE~., data = demos_train, mtry = 6
                          , importance = TRUE, ntree = 25)
bag.race
plot(bag.race)
bag.predict <- predict(bag.race, newdata = demos_validation)
table(bag.predict, demos_validation$RACE)
#error.bag <- (1+10+19+7+9+64+28)/(1+10+19+7+9+64+28+1+188+68+391)
#error.bag

rf.race <- randomForest(RACE~., data = demos_train, mtry = 15, importance = TRUE, ntree = 100)
rf.race
rf.predict <- predict(rf.race, newdata = demos_validation)
table(rf.predict, demos_validation$RACE)
#error.rf <- (8+22+6+11+57+25)/(8+22+6+11+57+25+2+187+66+401)
#error.rf

# Visualize the random forest
explained_rf <- explain_forest(rf.race)
str(explained_rf)


# Get feature importance
importance_df <- data.frame(Feature = rownames(importance(rf.race)),
                            Importance = importance(rf.race)[, 1])

# Sort the features by importance
importance_df <- importance_df[order(importance_df$Importance, decreasing = TRUE), ]

# Plot the feature importance using ggplot2
ggplot(importance_df, aes(x = reorder(Feature, Importance), y = Importance)) +
  geom_bar(stat = "identity", fill = "orchid3") +
  coord_flip() +  # Flip coordinates to make the plot horizontal
  labs(title = "Feature Importance", x = "Feature", y = "Importance") +
  theme_minimal() +  # Apply the minimal theme
  theme(text = element_text(family = "Calibri", size = 14))

