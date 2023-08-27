library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  
library(corrplot)


##### Import & Clean
## setwd("C:\\Users\\USER\\Documents\\GitHub_Jigsaw\\R_Basics\\IPBA 17")

#Data Import
data <- read.csv("https://raw.githubusercontent.com/KunaalNaik/R_Basics/main/IPBA%2017/Employee_Attrition.csv")

##### Outlier

### Check 
# Create a box plot after treating outliers
mi_boxplot <- ggplot(data, aes(y = MonthlyIncome)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Box Plot of Age (Outliers Treated with IQR)",
       y = "MonthlyIncome") +
  theme_minimal()

# Display the box plot
print(mi_boxplot)


### Treat
# Calculate Q1 and Q3 for the Age column
Q1 <- quantile(data$MonthlyIncome, 0.25)
Q3 <- quantile(data$MonthlyIncome, 0.75)

# Calculate the IQR (Interquartile Range)
IQR <- Q3 - Q1

# Calculate the lower and upper bounds for outliers
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Identify and treat outliers
data$MonthlyIncome[data$MonthlyIncome < lower_bound] <- lower_bound
data$MonthlyIncome[data$MonthlyIncome > upper_bound] <- upper_bound

# Create a box plot after treating outliers
age_boxplot <- ggplot(data, aes(y = MonthlyIncome)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Box Plot of Age (Outliers Treated with IQR)",
       y = "MonthlyIncome") +
  theme_minimal()

# Display the box plot
print(age_boxplot)










