# **Modeling Racial Disparities in Juvenile Justice**

![JusticeScalesData400.jpg](data:image/jpeg;base64,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)


# Introduction

This project expands on research initiated through an internship with the Cumberland County Juvenile Probation Office which revealed that youth from racially marginalized groups are disproportionately referred to the county’s juvenile probation system and are subject to harsher disciplinary outcomes.

This study aims to identify the root causes of disproportionate referral rates in Cumberland County and examine their implications on structural bias within the U.S. juvenile justice system.

# Research Questions and Objectives

**Research Questions:**
  * How do demographic, social, and economic characteristics of a census tract relate to the number of juvenile probation referrals? What will be the number of juvenile probation referrals in future years given these relationships?

  * What demographic and offense-related factors can predict the race/ethnicity of a juvenile referred to Cumberland County’s probation office?

  Note: Due to sensitivity concerns and overall lack of data this project did not have access to data on youth who have not been referred so there are limitations on the models that can be run. But answering these questions, will allow us to better understand the relationship between race and other socio-economic factors in juvenile referrals

**Objectives:**

  * Estimate referral rates on the census-tract level to understand key drivers of juvenile justice involvement.

  * Predict the race of juveniles to determine which demographic and case related factors are strongly correlated with race within the juvenile justice system.

# Getting Started

1. **Clone the Repository**
```bash
 git clone https://github.com/darcelypena/juvenile_justice_research.git
```

2. **Choose your IDE**
  Choose
  Note: This project uses both the Python and R languages to run regression and classification models on referral data.

3. **Install and Load Required Packages**

  **Python Packages Used:**
  * Pandas
  * Numpy
  * Matplotlib
  * RandomForestRegressor
  * mean_squared_error
  * r2_score
  * train_test_split
  * LinearSegmentedColormap
  * plot_tree

  **R Packages Used:**
  * tree
  * dplyr
  * varImp
  * randomForest
  * randomForestExplainer
  * extrafont (extra: not needed for analysis)

  **Example R Package Installation:**
  ```bashr
  # Install packages to local device
  install.packages("tree")
  install.packages("dplyr")
  install.packages("varImp")
  install.packages("randomForest")
  install.packages("randomForestExplainer")
  install.packages("extrafont")
  ```
  **Example R Loading Libraries:**
  ```bashr
  # Load the libraries
  library(tree)
  library(dplyr)
  library(varImp)
  library(randomForest)
  library(randomForestExplainer)
  library(extrafont)
  ```
  Example Python Package Installation:
  ```bashr
  # Install packages to local device
  !pip install pandas numpy matplotlib scikit-learn
  ```

  Example Loading Packages in Python:
  ``` bashr
  # Import general libraries
  import pandas as pd
  import numpy as np
  import matplotlib.pyplot as plt

  # For colormap
  from matplotlib.colors import LinearSegmentedColormap

  # scikit-learn tools
  from sklearn.ensemble import RandomForestRegressor
  from sklearn.metrics import mean_squared_error, r2_score
  from sklearn.model_selection import train_test_split
  from sklearn.tree import plot_tree
  ```

# Data:

**Data Sources:**
  * **Pennsylvania Case Management System:** case records for juveniles from 2012 to 2022 who were referred to the Cumberland County Juvenile Probation Office, along with information on charges and dispositions received
  * **US Census - ACS Survey:** demographic, social, and economic characteristics for all census tracts in Cumberland County from 2012 to 2022

**Cleaned Data Tables:**

1. **census_referrals:** contains relevant demographic, social, and economic characteristics for each census tract in Cumberland County on a yearly basis along with the number of juvenile referrals.
  * 140 rows, 26 columns
  * Columns: location, year, total households, count of youth in elementary school, count of youth in high school, average family size, unemployment rate, mean household income
  * Import Dataset (Python):
  ```
  census_referrals = pd.read_excel('../census_referrals.xlsx')
  ```

# Models

1. **Predicting Juvenile Referral Counts**
  
  A Random Forest regression model was used to predict juvenile referral counts at the census tract level in Cumberland County and to explore which societal factors are most strongly associated with higher referral rates.

  We chose to use a Random Forest model because it is well-suited for capturing nonlinear relationships, which is important given that juvenile referrals are likely influenced by complex interactions among societal factors. Unlike a single decision tree, which can easily overfit a small dataset, Random Forest reduces this risk by averaging the results of multiple trees, improving generalizability. Additionally, Random Forest provides estimates of feature importance, helping us identify which societal variables are most strongly associated with higher referral counts.


2. **Predicting Race of Referral Recipient**

  A Random Forest model was trained to classify a referral recipient’s race. The most influential variables were then examined to seek out patterns between the predictors for each race.

  A random forrest model was chosen for this analysis to get a better idea of the range of importance the various predictors could possess. Additionally, random frorests are robust models that can handle, to an extent, disproportionate dependent variable distributions--making them great for a data like this, with ~2000 white referral recipients, ~1000 African American referral recipients, ~500 Multiracial, and 5 Asian. Additionally, the random forest explainer provides a nice visual representation of the distribution of node-levels each predictor fell into over 100 different trees.



# Results

1. **Predicting Juvenile Referral Counts**

  The Random Firest regression model has a 94% accuracy in predicting juvenile referral counts and a mean squared error of 1.28.

  **Top Feature Importances:**
  * count of youth in high school grades 9-12
  * count of Black or African American residents
  * count of Asian or Asian American residents
  
  ![feature_imp_final.png](attachment:feature_imp_final.png)
  
   **Features with Highest Average Split Depth**
 * total population of females (4.2)
 * count of African American residents (4.8)
 * count of youth in high school grades 9-12 (4.9)

![featuresplitdepth_final.png](attachment:featuresplitdepth_final.png)

2. **Predicting Referred Recipient's Race**

  The Random Forest regression model has a 83.6% accuracy in predicting the race of a referred recipient.

  **Primary Split Features:**
  * parent status - signifies whether the referred recipient comes from a home with married, divorced, separated, or single parent home
  * offense category- such as criminal mischief, theft-related, trespass, or simple assault
  * age at referral

  **Least Influential Split Features (lowest in tree):**
  * charge group-whether the charge was substantiated, reduced, guilty, or amended
  * state and county disposition- indicates whether the juvenile was transfered, consent decree was extended, or the juvenile received probation

  This bar chart demonstrates the overall importance of each feature: 
  
  ![Feature%20Importance.png](attachment:Feature%20Importance.png)

   


The tree below is randomly chosen from the 100 in the forest, and cut for simplicity, to represent what the forest could include:
     
   ![treeExample.png](attachment:treeExample.png)
    


   This image displays the depth distribution of each parameter as the number of trees grows:
     
![ParameterDepths.png](attachment:ParameterDepths.png)
   

# Conclusions

Strong predictors of referrals counts are race, youth population density, and unemployment. This model highlights potential structural biases in the juvenile justice system as race is consistently the most important feature. The role of economic factors are secondary suggesting other systematic influences in demographic makeups.

Some of the strongest predictors of race in this analysis were factors not included in the judicial system, but instead in the recipient’s homes. It was found that white referral recipients came from homes with both parents deceased, divorced, married, or separated, with black and multi-race recipients coming from mainly single parent homes. From there, age and type of offense were used to differentiate between the other races--indicating certain races follow patterns in their age and type of crime committed.

# Social, Legal, & Ethical Implications

**Social:**

This model indicates that areas with higher youth populations and certain racial demographics have higher referral rates. Social services and community organizations may use this data to target interventions and offer resources to at risk-youth. This includes recognizing youth of various races could be considered “at risk” for different reasons.

**Legal:**

The strong influence of race in predicting referral rates could indicate discriminatory practices within the juvenile justice system. This would call for legal reform aimed at reducing racial disparities.

**Ethical:**

If the model identifies a particular racial group as a key factor in higher referral rates or certain types of crimes, it can inadvertently stigmatize that community and perpetuate harmful stereotypes.
