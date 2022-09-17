library(dplyr)
library(ggplot2)
library(summarytools)


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Data_Preprocessing_Sanity")

#Data Import
data <- read.csv("JobChange_train.csv")

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))


##### Check Summary (summarytools)
dfSummary(data)


##### Identify Missing Values
colSums(is.na(data)) / nrow(data)
