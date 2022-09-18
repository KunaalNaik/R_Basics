library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)

# Source : https://www.kaggle.com/code/goyalshalini93/car-price-prediction-linear-regression-rfe/data


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Regression")

#Data Import
data <- read.csv("predict_CarPrice_simple.csv", na.strings=c("NA","NaN", " "))

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))

##### Identify Missing Values
colSums(is.na(data)) / nrow(data)


# Exclude ID Column
head(data)
head(data[,2:ncol(data)])

data_corr <- data[,2:ncol(data)]


# rounding to 2 decimal places
corr_mat <- round(cor(data_corr),2) 
head(corr_mat)


# The mtcars dataset:
data_corr_matrix <- as.matrix(data_corr)

# Default Heatmap
heatmap(data_corr_matrix)

# With Proper Scale
heatmap(data_corr_matrix,scale="column")



plot_correlation(data_corr)

plot_intro(data_corr)
plot_bar(data_corr)
