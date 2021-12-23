library(dplyr)
library(ggplot2)
library(summarytools)

# https://www.kaggle.com/rhythmcam/r-titanic-nn-80
# Ref : https://statsandr.com/blog/descriptive-statistics-in-r/

setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Data Sanity")

data <- read.csv("insurance_claims.csv")

#Drop Features
drop <- c("X_c39")
data = data[,!(names(data) %in% drop)]


##### Check Summary
#summary(data)

#dfSummary(data)

#descr(data,
#      headings = FALSE, # remove headings
#      stats = "common" # most common descriptive statistics
#)

##### Add Feature Flags
data <- data %>% mutate(fraud_flag = if_else(fraud_reported == "Y", 1, 0))

##### Add Row Number
data$row_count <- 1

## First Code - Plot Number of Frauds Chart 

# 1/ Convert Categorical feature As Factor
data$fraud_reported <- as.factor(data$fraud_reported)

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(fraud_reported)) 

# 3/ Then add a Bar Plot
g + geom_bar()

## Categorical Features

##### policy_state
# 1/ Convert Categorical feature As Factor
data$policy_state <- as.factor(data$policy_state)

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(policy_state)) 

# 3/ Then add a Bar Plot
g + geom_bar()

# Other Type of Plots
mosaicplot(table(data$policy_state, data$fraud_reported),
           color = TRUE,
           xlab = "policy_state", # label for x-axis
           ylab = "Fraud" # label for y-axis
)

##### policy_deductable
# 1/ Convert Categorical feature As Factor
data$policy_deductable <- as.factor(data$policy_deductable)

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(policy_deductable)) + geom_bar()
g

##### auto_make
# 1/ Convert Categorical feature As Factor
data$auto_make <- as.factor(data$auto_make)

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(auto_make)) + geom_bar()
g

##### auto_make - with "y"
# 
g <- ggplot(data, aes(auto_make, fraud_flag)) + geom_col()
g

## NEXT WEEK

## Plot 2 Type Features ###
## 1/ Categorical X 3 
## 2/ Numerical - Binning or Grouping X 3

## Insights

## Data Sanity
## Missing Value Treatment - Numerical - Replace by Median, Categorical - replace by Mode
## Transformation of Numerical/Categorical - Log Transformation, StandardScaler, one hot encoding

## Outlier Detection and Removal
## Box Plot - Treat with Quartile 

## Transition to ML
## Hopefully Build a Log Reg