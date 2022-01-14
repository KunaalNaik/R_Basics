#Data Manipulaton with R
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Basics IPBA 11\\R Data Manipulation")
retail<-read.csv("retail_sales.csv")

### 1/ Data Checks and Data Types
# How to take a look at the dataset?
head(retail)
tail(retail)
dim(retail)
str(retail) #helps observe sample data with type of variable which 'summary' can't

#useful for numeric data
#study the distribution of the dataset
summary(retail) 
summary(retail$Item_Category) #difference between character and numeric summaries
names(retail)

# Stick a Dataframe for multiple use
attach(retail) 
# We can directly use the Column Name
head(Cost)


detach(retail)
head(cost)
#usually used when using a single dataset, since when using multiple datasets it can create confusion
names(retail)


### 2/ Adding/Deleting Columns

# Add a Column - Total Units


# Delete - Total units

### 3/ Sort

# Find Top Revenue Months - Order | ascending, descending | 1 col, 2 col


### 4/ Subsetting Data / Filtering with Conditions

# Find Rows with Cost > 10000

# Same condition using Which

# Select Maximum Sales using Which

# Find Row with Maximum Sales

### 5/ Missing Values

##How to check missing values?
sales<-c(100,200,NA,300,400,NA,500,600,700,NA,1000,1500,NA,NA)
is.na(sales)

#Choose values without missing values
na_removed<-sales[which(!is.na(sales))]
!is.na(sales)
which(!is.na(sales))
na_removed

# Remove Missing Values - colsums + is.na

### 6/ Get Unique Values in Columns

#  Find Unique from Item_Category - unique , table

### 7/ Aggregate

# Aggregate Cost By Item_Category | aggregate -> data.frame | tapply -> array

