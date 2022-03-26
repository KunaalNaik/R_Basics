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

##### References
# https://www.kaggle.com/rhythmcam/r-titanic-nn-80
# Ref : https://statsandr.com/blog/descriptive-statistics-in-r/

##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\R Basics IPBA 11\\R Data Sanity")

#Data Import
data <- read.csv("insurance_claims.csv")

# Drop Features
drop <- c("X_c39")
data = data[,!(names(data) %in% drop)]


##### Check Summary (summarytools)
summary(data)

#descr(data,
#      headings = FALSE, # remove headings
#      stats = "common" # most common descriptive statistics
#)

dfSummary(data)



##### Add Features

# 1/ Add Fraud Flag
# =IF(AM2="y",1,0)
data <- data %>% mutate(fraud_flag = if_else(fraud_reported == "Y", 1, 0))

# 2/ Add Row Number
data$row_count <- 1

# allows multiple operations at one time
data <- data %>% mutate(fraud_flag = if_else(fraud_reported == "Y", 1, 0)) %>% mutate(fraud_reported = as.factor(fraud_reported))

##### First Code - Plot Number of Frauds Chart 

# 1/ Convert Categorical feature As Factor
data <- data %>% mutate(fraud_reported = as.factor(fraud_reported))

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(fraud_reported))

# 3/ Then add a Bar Plot
g <- g + geom_bar()
g

##### Categorical Features

### policy_state
# 1/ Convert Categorical feature As Factor
data <- data %>% mutate(policy_state = as.factor(policy_state))

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(policy_state))

# 3/ Then add a Bar Plot
g <- g + geom_bar()
g

# Other Type of Plots
table(data$policy_state, data$fraud_reported)
mosaicplot(table(data$policy_state, data$fraud_reported),
           color = TRUE,
           xlab = "policy_state", # label for x-axis
           ylab = "Fraud" # label for y-axis
)



### policy_deductable
# 1/ Convert Categorical feature As Factor
data <- data %>% mutate(policy_deductable = as.factor(policy_deductable))

# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
# Make 
g <- ggplot(data, aes(policy_deductable)) + geom_bar()
# Display 
g

### auto_make
# 1/ Convert Categorical feature As Factor


# 2/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()



### auto_make - with "y"
# 





##### Numerical Features


### age
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(age)) + geom_histogram(bins = 15)
g

# 2/ If not Normal - Convert to Normal 
data <- data %>% mutate(age = log10(age))

#Re plot
g <- ggplot(data, aes(age)) + geom_histogram(bins = 15)
g

### policy_annual_premium
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()
g <- ggplot(data, aes(policy_annual_premium)) + geom_boxplot()
g


### property_claim
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()



### injury_claim
# 1/ Set the Chart Canvas with Required Features - For Categorical just use one Feature in aes()




##### Check Missing Values

### Categorical - Identify and Replace
## Impute property_damage
data <- data %>% mutate(property_damage = if_else(property_damage == "?", "missing", property_damage)) 

# If there are Nulls's 
data <- data %>% mutate(police_report_available = is.na(police_report_available))

### Numerical - Identify and Replace
## Impute property_damage
data <- data %>% mutate(umbrella_limit = if_else(umbrella_limit == 0, mean(umbrella_limit), umbrella_limit)) 

# If there are Nulls's 
data <- data %>% mutate(police_report_available = is.na(umbrella_limit, mean(umbrella_limit)))

