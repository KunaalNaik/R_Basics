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

##### Categorical

# Attrition Plot
attrition_plot <- ggplot(data, aes(x = factor(Attrition))) + geom_bar() +
  labs(title = "Attrition Bar Plot",
       x = "Attrition",
       y = "Count")
print(attrition_plot)


# Attrition By Department
# Stage 1 - Calculate the percentage of attrition by department
attrition_percentage <- data %>%
  group_by(Department) %>%
  summarize(AttritionRate = mean(Attrition) * 100)

# Stage 2 Plotting
attrition_dept_plot <- ggplot(attrition_percentage, aes(x = Department, y = AttritionRate, fill = Department)) +
  geom_bar(stat = "identity") +
  labs(title = "Percentage Attrition by Department",
       x = "Department",
       y = "Attrition Rate (%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the plot
print(attrition_dept_plot)


# Avg Salary by JobRole
ggplot(data, aes(x =MonthlyIncome , y = JobRole,fill=JobRole)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Average Monthly Income by Job Role",
       x = "Job Role",
       y = "Average Monthly Income")



##### Numerical Plots

### Histogram - Age
age_histogram <- ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black")

# Display the histogram
print(age_histogm)

### Histogram - MonthlyIncome
MI_histogram <- ggplot(data, aes(x = MonthlyIncome)) +
  geom_histogram(binwidth = 1000, fill = "skyblue", color = "black")

# Display the histogram
print(MI_histogram)


### Box Plot - Age
age_boxplot <- ggplot(data, aes(y = Age)) +
  geom_boxplot(fill = "skyblue", color = "black") 

# Display the box plot
print(age_boxplot)

### Box Plot - MonthlyIncome
MI_boxplot <- ggplot(data, aes(y = MonthlyIncome)) +
  geom_boxplot(fill = "skyblue", color = "black") 

# Display the box plot
print(MI_boxplot)


# install.packages("corrplot")
### Correlation Heat Map (Continuous Numerical Features, Regression)
# 1 Select numerical features for correlation analysis
numerical_features <- data[, c("Age","DailyRate","MonthlyRate","HourlyRate","MonthlyIncome")]

# 2 Calculate the correlation matrix
correlation_matrix <- cor(numerical_features)

# 3 Create a correlation heatmap using corrplot
corrplot(correlation_matrix, method = "color", tl.cex = 0.7)



### With Labels
# 1 Select numerical features for correlation analysis
numerical_features <- data[, c("Age","DailyRate","MonthlyRate","HourlyRate","MonthlyIncome")]


# Reshape the correlation matrix for plotting
cor_matrix_melted <- reshape2::melt(correlation_matrix)

# Create a correlation heatmap with labels
corr_heatmap <- ggplot(cor_matrix_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1)) +
  geom_text(aes(label = round(value, 2)), color = "black", size = 3) +
  theme_minimal() +
  labs(title = "Correlation Heatmap", x = "", y = "")

# Display the correlation heatmap
print(corr_heatmap)

