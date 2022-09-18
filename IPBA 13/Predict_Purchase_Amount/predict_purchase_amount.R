library(dplyr)
library(ggplot2)
library(summarytools)


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Data_Preprocessing_Sanity\\Rgeression")

#Data Import
data <- read.csv("predict_purchase_amount")

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))