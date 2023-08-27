library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  

#Data Import
data <- read.csv("https://raw.githubusercontent.com/KunaalNaik/R_Basics/main/IPBA%2017/job_change.csv")


##### Categorical

# Change Plot
change_plot <- 
print(change_plot)

# Change By education_level
# Stage 1 - Calculate the percentage of attrition by department
job_change_percentage <- data %>%
  group_by() %>%
  summarize(AttritionRate = mean() * 100)

# Stage 2 Plotting
change_dept_plot <- 

# Display the plot
print(change_dept_plot)


##### Numerical

#


