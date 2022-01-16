#Data Manipulaton with R
#setwd("D:\\GitHub\\R_Basics\\R Basics IPBA 11\\R Data Manipulation")
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Basics IPBA 11\\R Data Manipulation")
retail<-read.csv("retail_sales.csv")

#Create Dataframes
#Each column can be a different Data types. 
#Consider the following vectors : 

product=c("Bag","shoes","belt","belt")

total_price=c(500,1000,150,10000)

color=c("Blue","red","red","blue")

quantity=c(5,2,3,4)

#Create a dataframe
product_details <- data.frame(product,total_price,color,quantity,
                              stringsAsFactors=FALSE)

?data.frame

#Understand the idea of StringsAsFactors
product_details <- data.frame(product,total_price,color,quantity)

product_details
View(product_details)

class(product_details)


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
colnames(retail)

# Stick a Dataframe for multiple use
attach(retail) 
# We can directly use the Column Name
head(Cost)


detach(retail)
head(cost)
#usually used when using a single dataset, since when using multiple datasets it can create confusion
names(retail)


### 2/ Adding/Deleting Columns (Feature Engineering)

# Add a Column - Total Units
retail$Total_Units <- retail$Units_Available + retail$Units_Sold
str(retail)

# Delete - Total units
# Removes last columns
retail[-10]
retail[-"Total_Units"]

retail$Total_Units <- NULL

### 3/ Sort
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)

#order the entire table
retail[order(retail$Cost,decreasing=TRUE),]

sort_cost<-retail[order(retail$Cost,decreasing=TRUE),]
head(sort_cost)
sorted<-retail[order(retail$Item_Category,retail$Revenue,decreasing=TRUE),]
head(sorted)

# Find Top Revenue Months - Order | ascending, descending | 1 col, 2 col


### 4/ Subsetting Data / Filtering with Conditions
#Using logical operators

# Find Rows with Cost > 10000
retail$Cost<10000
class(retail$Cost<10000)
#retail[rows_subset_criteria,column_subset_criteria]
retail[retail$Cost<10000,]
retail[retail$Cost<10000,"Cost"]

#Assign values to the sub-setted data, useful for cleaning data, treatming missing values
retail_new<-retail
summary(retail_new$Cost)
retail_new[retail_new$Cost<10000,c("Cost", "Units_Sold")] <- 10000 #to each element subset 10000 is assigned
summary(retail_new$Cost)
retail_new$Units_Sold

# Same condition using Which
which(retail$Cost <10000)
class(which(retail$Cost <10000))
retail[which(retail$Cost<10000),]

# Select Maximum Sales using Which
which(retail$Cost == max(retail$Cost)) #, na.rm=TRUE

# Find Row with Maximum Sales
retail[which(retail$Cost == max(retail$Cost)),]
#Similarly using which to subset columns
retail_sub<- retail[,which(names(retail) %in% c("Month","Revenue"))]
head(retail_sub)

# And Condition

# Or Condition


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

