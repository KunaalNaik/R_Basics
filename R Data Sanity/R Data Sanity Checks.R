#library(shiny)
library(dplyr)
library(ggplot2)

setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Data Sanity")
data <- read.csv("insurance_claims1.csv")

## Prepare Data
# Write a Code to create Fraud_Flag and row_count
#data <- 

## First Code - Plot Number of Frauds Chart 
df_plot <- data %>% group_by(fraud_reported) %>% count()
df_plot

barplot(df_plot$n)

## Variation 2
yes = length(which(data$fraud_reported == "Y"))
no =  length(which(data$fraud_reported == "N"))  
combine_data = cbind(yes,no)
barplot(combine_data, beside=T)

## NEXT WEEK

## Plot 2 Type Features ###
## 1/ Categorical X 3 
## 2/ Numerical - Binning or Grouping X 3

## Insights

## Data Sanity
## Missing Value Treatment
## Outlier Detection and Removal
## Transformation of Numerical/Categorical

## Transition to ML
## Hopefully Build a Log Reg

## Extra

##g <- ggplot(df_plot, aes( y = fraud_reported, x = n))
##g

##ggplot(df, aes(x=reorder(cnt_No, cnt_Yes, function(x)-length(x)))) +
##  geom_bar(fill='yellow') +  labs(x='Fraud Reported')


## Plot Fraud X police_report_available (Category Variable)

