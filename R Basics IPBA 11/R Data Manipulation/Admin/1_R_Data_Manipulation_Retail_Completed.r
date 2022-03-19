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
product_details$product_new <- as.factor(product_details$product)

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
#right to delete
retail$Total_Units <- NULL

### 3/ Sort
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)


#order the entire table
retail[order(retail$Cost,decreasing=TRUE),]

sort_cost<-retail[order(retail$Cost,decreasing=TRUE),]
head(sort_cost)

# Find Top Revenue Months - Order | ascending, descending | 1 col, 2 col
sorted<-retail[order(retail$Item_Category,retail$Revenue,decreasing=TRUE),]
head(sorted)


### 4/ Subsetting Data / Filtering with Conditions
#Using logical operators

# Find Rows with Cost > 10000
retail$Cost<10000
class(retail$Cost<10000)
#retail[rows_subset_criteria,column_subset_criteria]
retail[retail$Cost<10000,]
retail[retail$Cost<10000,"Cost"]
retail[retail$Cost<10000,c("Item_Category","Cost")]

#Assign values to the sub-setted data, useful for cleaning data, treating missing values
retail_new<-retail
summary(retail_new$Unit_Price)

#Replace outliers
retail_new[retail_new$Unit_Price>69,c("Cost", "Unit_Price")] <- 74 #to each element subset 74 is assigned
summary(retail_new$Unit_Price)
retail_new$Cost

# Right Replacement
retail_new[retail_new$Unit_Price>69,"Unit_Price"] <- 74
summary(retail_new$Unit_Price)
retail_new$Cost

# And Condition
retail[retail$Cost > 5000 & retail$Cost < 10000,]

# Or Condition
retail[retail$Month == "Jan" | retail$Month == "Feb",]

# Same condition using Which
which(retail$Cost <10000)
class(which(retail$Cost <10000))
retail[which(retail$Cost < 10000),]

# Select Maximum Sales using Which
which(retail$Cost == max(retail$Cost, na.rm=TRUE)) #, na.rm=TRUE

# Find Row with Maximum Sales
retail[which(retail$Cost == max(retail$Cost, na.rm=TRUE)),]
#Similarly using which to subset columns
retail_sub<- retail[,which(names(retail) %in% c("Month","Revenue"))]
head(retail_sub)



### 5/ Missing Values

##How to check missing values?
sales<-c(100,200,NA,300,400,NA,500,600,700,NA,1000,1500,NA,NA)
is.na(sales)

#Choose values without missing values
na_removed<-sales[which(!is.na(sales))]
!is.na(sales)
which(!is.na(sales))
na_removed

# Remove Missing Values - colsums + is.na (identify Missing values at Bulk)
sum(is.na(retail$Cost)) # vector , rowm column
colSums(is.na(retail))

### 6/ Get Unique Values in Columns
table(retail$Item_Category) # Freq -> convert to factor

#  Find Unique from Item_Category - unique , table
unique(retail$Item_Category) # Unique values in a column

### 7/ Aggregate
agg_retail <- aggregate(retail$Revenue, by = list(retail$Item_Category), max, na.rm=TRUE )

m <- aggregate(retail$Cost,by=list(retail$Item_Category),mean)
m
class(m)

# Aggregate Cost By Item_Category | aggregate -> data.frame | tapply -> array

