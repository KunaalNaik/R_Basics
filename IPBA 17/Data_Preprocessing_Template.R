library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Data_Preprocessing_Sanity")

#Data Import
data <- read.csv("Employee_Attrition.csv")

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))


##### Convert String to Numerical
# experience
data <- data %>% mutate(experience = ifelse(experience == ">20", 20, experience))
data <- #Write here
  
  # Convert to Numeric
  data$experience <- as.numeric(data$experience)
data$experience


##### Check Summary for Pre-processing (DataExplorer)
### Look For Numeric, Categorical Features & Missing Values %
#write here

##### EDA 

### Identify Missing Value Columns
### Old Way
colSums(is.na(data)) / nrow(data)

### Better Way 
#write here


## Treat Missing Values - Numerical

# Get all Numerical Column Names
#write here

# Treat city_development_index
data$city_development_index <- ifelse(is.na(data$city_development_index), ave(data$city_development_index, FUN = function(x) mean(x, na.rm = TRUE )), data$city_development_index)

# Treat training_hours
#write here

# Treat experience
#write here


## Treat Missing Values - Categorical 

# Get all Categorical Column Names
#write here

# Treat gender
data$gender <- ifelse(is.na(data$gender), "missing", data$gender)

# Treat enrolled_university
#write here

# Treat education_level
#write here

# Treat major_discipline
#write here

# Treat company_size
#write here

# Treat company_type
#write here

# Treat last_new_job
#write here


## Transformation - Numerical
# WHY
data_box_plot <- select(data, c("city_development_index","training_hours","experience"))
data_long <- melt(data_box_plot)  

# Applying ggplot 
ggplot(data_long, aes(x = variable, y = value)) + geom_boxplot()

# Transformation city_development_index
data$city_development_index <- scale(data$city_development_index, center = TRUE, scale = TRUE)

# Transformation training_hours
#write here

# Transformation experience
#write here


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
