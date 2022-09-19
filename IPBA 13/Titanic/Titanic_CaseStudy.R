library(dplyr)
library(ggplot2)
library(DataExplorer)
library(summarytools)
library(reshape2)  


##### Import & Clean
setwd("D:\\GitHub\\R_Basics\\IPBA 13\\Titanic")

#Data Import
data <- read.csv("Titanic_train.csv")

# Empty String
data <- data %>% mutate(across(where(is.character), ~ na_if(.,"")))

##### Convert String to Numerical
# Convert Transported to 0 and 1
# Write Code


##### Check Data Summary
plot_intro(data)

### What Percent columns have missing values?
#

### What Percent columns are Discrete?
#

### What Percent columns are Continuous?
#

##### Exploration 
### Identify Missing Value Columns
plot_missing(data)



## Treat Missing Values - Numerical

# Get all Numerical Column Names
plot_correlation(data, type = "continuous")

# Treat Age
# Write Code

# Is Age Normal?

# Treat Room_Service
# Write Code

# Is Room_Service Normal?

# Treat FoodCourt
# Write Code

# Is FoodCourt Normal?

# Treat ShoppingMall
# Write Code

# Is ShoppingMall Normal?

# Treat Spa
# Write Code

# Is Spa Normal?

# Treat VRDeck
# Write Code

# Is VRDeck Normal?

## Treat Missing Values - Categorical 

# Get all Categorical Column Names

# Treat HomePlanet
# Write Code

# Which is the higest category?
# Does this help predict Transported?

# Treat CryoSleep
# Write Code

# Which is the higest category?
# Does this help predict Transported?

# Treat Cabin
# Write Code

# Which is the higest category?
# Does this help predict Transported?

# Treat Destination
# Write Code

# Which is the higest category?
# Does this help predict Transported?

# Treat VIP
# Write Code

# Which is the higest category?
# Does this help predict Transported?

# Treat Name
# Write Code

# Which is the higest category?
# Does this help predict Transported?


## Transformation - Numerical
# WHY
data_box_plot <- select(data, c("Age","RoomService","FoodCourt","ShoppingMall","Spa","VRDeck"))
data_long <- melt(data_box_plot)  

# Applying ggplot 
ggplot(data_long, aes(x = variable, y = value)) + geom_boxplot()

# Transformation Age
# Write here

# Transformation RoomService
# Write here

# Transformation FoodCourt
# Write here

# Transformation ShoppingMall
# Write here

# Transformation Spa
# Write here

# Transformation VRDeck
# Write here

## Outlier - Numerical
# Treat FoodCourt
boxplot(data$FoodCourt)

# Write court here

#Commit Change
data$FoodCourt <- x

# Check again
boxplot(data$FoodCourt)

##### Final Check for Missing Values
plot_missing(data)
