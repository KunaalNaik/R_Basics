library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Data_Preprocessing_Sanity")

#Data Import
data <- read.csv("JobChange_train.csv")

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))


##### Convert String to Numerical
# experience
data <- data %>% mutate(experience = ifelse(experience == ">20", 20, experience))
data <- data %>% mutate(experience = ifelse(experience == "<1", 0, experience))

# Convert to Numeric
data$experience <- as.numeric(data$experience)
data$experience


##### Check Summary for Pre-processing (DataExplorer)
### Look For Numeric, Categorical Features & Missing Values %
plot_intro(data)

##### EDA 

### Identify Missing Value Columns
### Old Way
colSums(is.na(data)) / nrow(data)

### Better Way 
plot_missing(data)


## Treat Missing Values - Numerical

# Get all Numerical Column Names
plot_correlation(data, type = "continuous")

# Treat city_development_index
data$city_development_index <- ifelse(is.na(data$city_development_index), ave(data$city_development_index, FUN = function(x) mean(x, na.rm = TRUE )), data$city_development_index)

# Treat training_hours
data$training_hours <- ifelse(is.na(data$training_hours), ave(data$training_hours, FUN = function(x) mean(x, na.rm = TRUE )), data$training_hours)

# Treat experience
data$experience <- ifelse(is.na(data$experience), ave(data$experience, FUN = function(x) mean(x, na.rm = TRUE )), data$experience)


## Treat Missing Values - Categorical 

# Get all Categorical Column Names

# Treat gender
data$gender <- ifelse(is.na(data$gender), "missing", data$gender)

# Treat enrolled_university
data$enrolled_university <- ifelse(is.na(data$enrolled_university), "missing", data$enrolled_university)

# Treat education_level
data$education_level <- ifelse(is.na(data$education_level), "missing", data$education_level)

# Treat major_discipline
data$major_discipline <- ifelse(is.na(data$major_discipline), "missing", data$major_discipline)

# Treat company_size
data$company_size <- ifelse(is.na(data$company_size), "missing", data$company_size)

# Treat company_type
data$company_type <- ifelse(is.na(data$company_type), "missing", data$company_type)

# Treat last_new_job
data$last_new_job <- ifelse(is.na(data$last_new_job), "missing", data$last_new_job)


## Transformation - Numerical
# WHY
data_box_plot <- select(data, c("city_development_index","training_hours","experience"))
data_long <- melt(data_box_plot)  

# Applying ggplot 
ggplot(data_long, aes(x = variable, y = value)) + geom_boxplot()

# Transformation city_development_index
data$city_development_index <- scale(data$city_development_index, center = TRUE, scale = TRUE)

# Transformation training_hours
data$training_hours <- scale(data$training_hours, center = TRUE, scale = TRUE)

# Transformation experience
data$experience <- scale(data$experience, center = TRUE, scale = TRUE)


## Outlier - Numerical
boxplot(data$training_hours)

x <- data$training_hours
qnt <- quantile(x, probs=c(.25, .75), na.rm = T)
caps <- quantile(x, probs=c(.05, .95), na.rm = T)
H <- 1.5 * IQR(x, na.rm = T)
x[x <= (qnt[1] - H)] <- caps[1]
x[x >= (qnt[2] + H)] <- caps[2]

#Commit Change
data$training_hours <- x

# Check again
boxplot(data$training_hours)

##### Final Check for Missing Values
plot_missing(data)
