library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(lattice)
library(caret)

# Source : https://www.kaggle.com/code/goyalshalini93/car-price-prediction-linear-regression-rfe/data


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Regression")

#Data Import
data <- read.csv("predict_CarPrice_simple.csv", na.strings=c("NA","NaN", " "))

# Exclude ID Column from Dataset
head(data)
head(data[,2:ncol(data)])

data_corr <- data[,2:ncol(data)]

# Check Data
plot_intro(data_corr)


### WIP
# Plot Correlation between Independent Variables 
plot_correlation(data_corr)

##### Select Top Features ()
correlationMatrix <- cor(data_corr)

# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)

# print indexes of highly correlated attributes
print(highlyCorrelated)


##### HeatMaps
# rounding to 2 decimal places
corr_mat <- round(cor(data_corr),2) 
head(corr_mat)

# convert to matrix
data_corr_matrix <- as.matrix(data_corr)

# Default Heatmap
heatmap(data_corr_matrix)

# With Proper Scale
heatmap(data_corr_matrix,scale="column")