library(dplyr)
library(ggplot2)
library(summarytools)

##### THIS WEEK

### Plot Features of both Data Types
# 1/ Categorical X 3 
# 2/ Numerical - Binning or Grouping X 3

### Insights

## Data Sanity
# 1/ Missing Value Treatment - Numerical - Replace by Median, Categorical - replace by Mode
# 2/ Transformation of Numerical/Categorical - Log Transformation, StandardScaler, one hot encoding

## Advanced
# 1/ Outlier Detection and Removal - Box Plot - Treat with Quartile 

##### Transition to ML
# Hopefully Build a Log Reg

##### Referances
# https://www.kaggle.com/rhythmcam/r-titanic-nn-80
# Ref : https://statsandr.com/blog/descriptive-statistics-in-r/

##### Import & Clean
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Data Sanity")

#Data Import
data <- read.csv("insurance_claims.csv")

# Drop Features
drop <- c("X_c39")
data = data[,!(names(data) %in% drop)]


##### Check Summary (summarytools)
#summary(data)

#descr(data,
#      headings = FALSE, # remove headings
#      stats = "common" # most common descriptive statistics
#)

#dfSummary(data)



##### Add Features

# 1/ Add Fraud Flag


# 2/ Add Row Number




##### First Code - Plot Number of Frauds Chart 

# 1/ Convert Categorical feature As Factor


# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()


# 3/ Then add a Bar Plot


##### Categorical Features

### policy_state
# 1/ Convert Categorical feature As Factor


# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()


# 3/ Then add a Bar Plot


# Other Type of Plots
mosaicplot(table(data$policy_state, data$fraud_reported),
           color = TRUE,
           xlab = "policy_state", # label for x-axis
           ylab = "Fraud" # label for y-axis
)



### policy_deductable
# 1/ Convert Categorical feature As Factor


# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()




### auto_make
# 1/ Convert Categorical feature As Factor


# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()



### auto_make - with "y"
# 





##### Numerical Features


### age
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()


# 2/ Then add a Bar Plot


### policy_annual_premium
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()



### property_claim
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()



### injury_claim
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()




##### Check Missing Values


