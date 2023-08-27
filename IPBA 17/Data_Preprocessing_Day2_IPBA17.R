library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  

#Data Import
job_data <- read.csv("https://raw.githubusercontent.com/KunaalNaik/R_Basics/main/IPBA%2017/job_change.csv")


##### Check Summary Statistics
summary(job_data)

##### Check Missing Values
# Check for missing values in each column
missing_values <- colSums(is.na(job_data))

# Display the count of missing values for each column
print(missing_values)

# Categorical 
categorical_columns <- c("gender", "relevent_experience", "enrolled_university",
                         "education_level", "major_discipline", "company_size",
                         "company_type", "last_new_job")

#names(data)[sapply(data, is.character)]

missing_values_categorical <- sapply(job_data[categorical_columns], function(col) sum(col == ""))
print(missing_values_categorical)


##### Numerical

# Treat - training_hours
# Calculate the median of the "training_hours" column
median_training_hours <- median(job_data$training_hours, na.rm = TRUE)

# Replace missing values in "training_hours" with the median
job_data$training_hours[is.na(job_data$training_hours)] <- median_training_hours

# job_data$training_hours[is.na(job_data$training_hours)] <- median(job_data$training_hours, na.rm = TRUE)

# Check for missing values in each column
missing_values <- colSums(is.na(job_data))

# Display the count of missing values for each column
print(missing_values)


# Treat - city_development_index
# Calculate the median of the "training_hours" column
median_city_dev <- median(job_data$city_development_index, na.rm = TRUE)

# Replace missing values in "training_hours" with the median
job_data$city_development_index[is.na(job_data$city_development_index)] <- median_city_dev


# Check
# Check for missing values in each column
missing_values <- colSums(is.na(job_data))

# Display the count of missing values for each column
print(missing_values)



##### Categorical

# Treat - major_discipline
# Replace missing values in "major_discipline" with "missing"
job_data$major_discipline[job_data$major_discipline == ""] <- "missing"

# Bar Plot to Check


# Treat - education_level

