#Data Manipulaton with R
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Basics IPBA 11\\R Data Manipulation")
retail<-read.csv("retail_sales.csv")

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


#Creating new columns
retail$Profit <- retail$Revenue - retail$Cost

#Deleting a column in R
names(retail)
retail$Profit<-NULL
names(retail)


#order the entire table
retail[order(retail$Cost,decreasing=TRUE),]

sort_cost<-retail[order(retail$Cost,decreasing=TRUE),]
head(sort_cost)
sorted<-retail[order(retail$Item_Category,retail$Revenue,decreasing=TRUE),]
head(sorted)


##Subsetting Data

#Using logical operators
retail$Cost<10000
class(retail$Cost<10000)
#retail[rows_subset_criteria,column_subset_criteria]
retail[retail$Cost<10000,]
retail[retail$Cost<10000,"Cost"]

#Assign values to the sub-setted data
retail_new<-retail
summary(retail_new$Cost)
retail_new[retail_new$Cost<10000,c("Cost", "Units_Sold")] <- 10000 #to each element subset 10000 is assigned
summary(retail_new$Cost)
retail_new$Units_Sold

#which()
#Example1
which(retail$Cost <10000)
class(which(retail$Cost <10000))
retail[which(retail$Cost<10000),]

#Example2
which(retail$Cost == max(retail$Cost))
#subset rows
retail[which(retail$Cost == max(retail$Cost)),]
#Similarly using which to subset columns
retail_sub<- retail[,which(names(retail) %in% c("Month","Revenue"))]
head(retail_sub)

#which(names(retail) %in% c("Month","Revenue"))
#retail[,c(4,6)]

##How to check missing values?
#airquality dataset has missing values if a dataset is required
sales<-c(100,200,NA,300,400,NA,500,600,700,NA,1000,1500,NA,NA)
is.na(sales)


#Choose values without missing values
na_removed<-sales[which(!is.na(sales))]
!is.na(sales)
which(!is.na(sales))
na_removed


#difference between logical vector & which()
#Consider vector sales with missing values 
sales<-c(100,200,NA,300,400,NA,500,600,700,NA,1000,1500,NA,NA)
#subset data using logical operator
sales[sales>600]
#subset data using which
sales[which(sales>600)]
colSums(is.na(retail)) #is.na returns logical elements (where TRUE is 1) and ColSums the sum in that column
colSums(retail[,c("Cost","Revenue")])
summary(airquality)#NAs are present in first two columns
colSums(is.na(airquality))

?which

#using retail_na dataset
#This dataset has a few missing values
#Command to check missing: is.na()

retail_na<-read.csv("retail_NA.csv")
head(retail_na)
retail_na$Revenue
is.na(retail_na$Revenue)

#To check values which satisfy this criteria
retail_na$Revenue>10000 #using logical values
which(retail_na$Revenue>10000) #using which()



#Subset :What is the difference?
retail_na[retail_na$Revenue>10000,"Revenue"]

retail_na[which(retail_na$Revenue>10000),"Revenue"]

#Functions in R

#Write a code in R to find the 
#mean of Revenue for all those item
#categories which belong to Item_Category = "Literature"

table(retail$Item_Category)
retail[retail$Item_Category=="Literature",]
retail[retail$Item_Category=="Literature","Revenue"]

mean(retail[retail$Item_Category=="Literature","Revenue"])
mean(retail[retail$Item_Category=="Business Administration","Revenue"])

#find sum
sum(retail[retail$Item_Category=="Business Administration","Revenue"])

#Convert the above code to a function

#step1: Function Definition
summary.func <- function(Item_C,column,data)
{
  x<-mean(data[data$Item_Category == Item_C, column])
  print(x)
  
}

#step 2: Function Call
summary.func("Literature","Revenue",retail_na)


#including item_category as a parameter
#step1: Function Definition
summary.func <- function(Item_C,column,data,dc)
{
  x<-mean(data[data[dc] == Item_C, column])
  print(x)

}

#step 2: Function Call
summary.func("Literature","Revenue",retail_na,"Item_Category")
summary.func("Business Administration","Cost")

#mean petallength
#species=setosa in iris

#mean cost
#month Feb in retail


#aggregate(rolling up the data)
#Syntax aggregate(variable to be summarized, by=list(variable by which grouping is to be done),function)
m <- aggregate(retail$Cost,by=list(retail$Item_Category),mean)
m
class(m)

#unique
unique(retail$Item_Category)

#tapply does groupby too, but returns an array
n<- tapply(retail$Cost,retail$Item_Category,mean)
n
class(n)

#apply, sapply, lapply

#apply requires:
#row/column operation, 1 for row wise operation, 2 for column wise operation
#function to be applied on the data.
x<-apply(retail,2,max)

x

#lapply function is applied for operations on list objects and returns a list object
lt <- list(a=1:10,b=11:20)
lt
m<-lapply(lt, mean)
m
class(m)

#sapply is wrapper class to lapply with difference being it returns vector instead of list object
m<-sapply(lt, mean)
m
class(m)

##cbind and rbind
#cbind: Appending/joining columns without any criteria
#rbind: Appending/joining rows without any criteria

a<-c(1,2,3,4,5,10)
b<-c(2,6,7,8,9)
cbind(a,b) #repeats the elements in vector b in sequence
rbind(a,b)

#column bind works;row bind does not (because column names are different)
set1<-data.frame(customer=c("John","Tom"),age=c(24,25),status=c("E","UE"))
set2<-data.frame(c=c("John","Tom"),a=c(24,25),s=c("E","UE"))
set1
set2
cbind(set1,set2)
rbind(set1,set2)

#names(set2) <- c( "customer", "age", "status")

#both work
set1<-data.frame(customer=c("John","Tom"),age=c(24,25),status=c("E","UE"))
set2<-data.frame(customer=c("April","Alice"),age=c(26,27),status=c("E","UE"))
cbind(set1,set2)
rbind(set1,set2)

##Merge :splitting datasets
cost<-retail[retail$Item_Category=="Literature",c("Item_Category","Month","Cost")]
head(cost)


revenue<-retail[retail$Item_Category=="Literature",c("Item_Category","Month","Revenue")]
head(revenue)

cbind(cost,revenue)
write.csv(cost,"cost.csv",row.names=FALSE)
write.csv(revenue,"revenue.csv",row.names=FALSE)

##Merge
revenue<-read.csv("revenue.csv")
cost<-read.csv("cost.csv")
head(revenue)
head(cost)
total<-merge(revenue,cost,by=c("Item_Category","Month"))
head(total)


##Joins using Merge
#(needs an assignment to be solved in class right here after this)

df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6,7),State=c(rep("Alabama",2),rep("Ohio",2)))
df1
df2

merge(x = df1, y = df2, by = "CustomerId", all = TRUE)#Outer join:

merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)#Left join

merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)#Right join

merge(x=df1,y=df2,by="CustomerId")#Inner Join/Intersection of both tables


#using dplyr
install.packages("dplyr")
library(dplyr)

#filter rows
dat8<-filter(retail,Item_Category=="Literature")
dat8<-filter(retail, Item_Category=="Literature", Cost > 10000) #filter rows on multiple columns
dat8<-filter(retail, Item_Category %in% c("Literature", "Art & Architecture")) #filter rows by choosing categorical values in a column
dat8


#selecting columns
dat10<-select(retail,Item_Category,Cost,Revenue)
dat10

#sometimes you get the error:
#Error in select(retail, Item_Category, Cost, Revenue) : 
#unused arguments (Item_Category, Cost, Revenue)

#This is because there is a select function in MASS package as well. Remove mass package so that dplyr becomes effective

search()
detach(package:MASS)

#select all columns except a column
head(select(retail,-Cost))


#select all columns starting with "Co"
head(select(retail, starts_with("Co")))
#ends_with() = Select columns that end with a character string
#contains() = Select columns that contain a character string

#creating a new column
dat12<-mutate(retail,logRevenue=log(Revenue))
summary(dat12)

#arrange
retail$Revenue
dat14<-arrange(retail,Revenue)
dat14<-arrange(retail,desc(Revenue))
dat14<-arrange(retail,desc(Item_Category),Revenue)
dat14<-arrange(retail,Item_Category,desc(Revenue))
dat14

#Pipe operator: %>%
head(select(retail, starts_with("Co")))
retail %>% select(starts_with("Co")) %>% head 

#summarise
retail %>% summarise(avg_Cost = mean(Cost), distinct_Cost = n_distinct(Cost))
#sd(), min(), max(), median(), sum(), n() (returns the length of vector)
#first() (returns first value in vector)
#last() (returns last value in vector) 
#n_distinct() (number of distinct values in vector)

#groupby operator
names(retail)
retail %>% 
  group_by(Item_Category) %>%
  summarise(avg_Cost = mean(Cost), distinct_Cost = n_distinct(Cost), total = n())

#output is a tibble which is similar to dataframe but with different column types

#reshape2()
install.packages("reshape2")
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
Jan<-c(26,24,25)
Feb<-c(70,60,65)
wide<-data.frame(person,Jan,Feb)
wide

melt(wide,id.vars="person") #columns become one column called variable
long<-melt(wide,id.vars="person" )
long
class(long)
dcast(long,person~variable) #a table of persons (y) and variable (x)
dcast(long,person~variable, value.var = "value") #value.var tells the value to be distributed into multiple columns

retail$Month
head(retail)
months <-dcast(retail,Item_Category~Month, value.var = "Unit_Price") #Item_Category has duplicates which means the whole table needs to be aggregated and uses default as length to show the results
months <-dcast(retail,Item_Category~Month, value.var = "Unit_Price", fun.aggregate = sum)
months <-dcast(retail,Cost~Month, value.var = "Cost")
months <-dcast(retail,Cost~Month, value.var = "Unit_Price")
months
retail$Month

months

?dcast

#Importing multiple excel tabs at once

install.packages("readxl")
library(readxl)
setwd("C:\\Jigsaw Classes\\Classes\\1. Corporate training\\Data manipulation\\Star datasets")
read_excel_allsheets <- function(filename) {
  sheets <- readxl::excel_sheets(filename) #list the sheet names
  x <-    lapply(sheets, function(X) readxl::read_excel(filename, sheet = X)) #lappy applies a function on the list and returns a list
  #since list sheets has 3 elements (names) we need to create a function to read each sheet
  names(x) <- sheets #names of x is same as names of sheets
  x
}

IPL <- read_excel_allsheets("R Analysis IPL.xlsx")
class(IPL)
str(IPL)
Y2017 <- as.data.frame(IPL[1])
str(Y2017)
Y2016 <- as.data.frame(IPL[2])
str(Y2016)
Y2015 <- as.data.frame(IPL[3])
str(Y2015)

#Dates in R

Sys.time()
class(Sys.time())
Sys.timezone()

IPL_1 <- Sys.time()
class(IPL_1)

#subtract 08 hours
IPL_2<- IPL_1 - (8*60*60) #(POSIXct is inherently stored as number of seconds from 1-1-1970)
#ct stands for calendar time
#lt stands for local time
#whereas posixct is inherently stored as number of seconds, posixlt is stored in seconds + stores a list of day, month, year, hour, minute, second, etc.
as.numeric(IPL_1) #verify the dates stored in seconds by converting the POSIX object to numeric
str(IPL_1)
str(IPL_2)

date_in_data <- "30/3/2018 12:18:17"
class(date_in_data)
date_in_data2 <- "31/5/2018 12:18"
class(date_in_data2)

as.Date(date_in_data,"%d/%m/%Y %H:%M:%S")
#Note the time part is cut off in as.Date

#Use Posixct and Posixlt which give functions for date tranformation when date contains time information
h <-strptime(date_in_data, "%d/%m/%Y %H:%M:%S") #helps in converting character to posixlt object
h
class(h)
h - (8*60*60)
as.numeric(h)
#whereas posixct is inherently stored as number of seconds, posixlt is stored in seconds + stores a list of day, month, year, hour, minute, second, etc.

#below functions work only with posixlt
IPL_1 <- Sys.time()
class(IPL_1)
IPL_1$wday #does not work since it is posixct
IPL_3 <- as.POSIXlt(IPL_1)
class(IPL_3)
IPL_3$wday
IPL_3$zone
IPL_3$hour

date_in_data2 <- "31/5/2018 12:18"
h2 <-strptime(date_in_data2, "%d/%m/%Y %H:%M")
h2
class(h2)

#change format
h
class(h)
h_1 <- format(h, "%d/%m/%Y %H:%M")
h_1
h_2 <- format(h, "%d/%m/%y")
h_2
h_3 <- format(h, "%H:%M:%S")
h_3
h_4 <- format(h,"%I:%M %p") #24 hour format to PM
h_4
h_5 <- format(h, "%d/%m/%y %H:%M:%S")
h_5

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
strptime(x, "%d%b%Y") #since none of the time elements (hour, min, secs) are present time is ignored

h
class(h)
months(h)
weekdays(h)

IPL_1 <- Sys.time() 
IPL_4 <- IPL_1
IPL_2 <- h2 

class(IPL_1)#posixct object
class(IPL_2)#posixlt object since we used strptime above
class(IPL_4)

IPL_1 - IPL_2 
difftime(IPL_1,IPL_2, units = "weeks") 
difftime(IPL_1,IPL_4, units = "weeks")
difftime(IPL_1,IPL_2, units = "days")
difftime(IPL_1,IPL_2, units = "hours")
difftime(IPL_1,IPL_2, units = "mins")
difftime(IPL_1,IPL_2, units = "secs")
difftime(IPL_1,IPL_2, units = "auto")



#%a	Abbreviated weekday	(Wed)
#%A	Full weekday (Wednesday)
#%b	Abbreviated month	(Jan)
#%B	Full month (January)
#%c	Locale-specific date and time	
#%d	Decimal date
#%H	Decimal hours (24 hour)	
#%I	Decimal hours (12 hour)
#%j	Decimal day of the year	
#%m	Decimal month
#%M	Decimal minute	
#%p	Locale-specific AM/PM
#%S	Decimal second	
#%U	Decimal week of the year (starting on Sunday)
#%w	Decimal Weekday (0=Sunday)	
#%W	Decimal week of the year (starting on Monday)
#%x	Locale-specific Date	
#%X	Locale-specific Time
#%y	2-digit year	
#%Y	4-digit year
#%z	Offset from GMT	
#%Z	Time zone (character)

#install.packages('lubridate')
library(lubridate)

#List of string operators:http://www.jdatalab.com/data_science_and_data_mining/2017/03/20/regular-expression-R.html

hsb2 <- read.table('https://stats.idre.ucla.edu/stat/r/faq/hsb2.csv', header=T, sep=",")
hsb2[1:10,]
dim(hsb2)


l <- reshape(hsb2, 
             varying = c("read", "write", "math", "science", "socst"), #actual variable names in input data
             v.names = "score", #check output
             timevar = "subj", #check output
             times = c("read1", "write1", "math", "science", "socst"),  #variable names in output
             new.row.names = 1:1000, #otherwise rownames will be 'times'
             direction = "long")
l[1:10,] #we need to check id1
l.sort <- l[order(l$id),]
l.sort[1:10,]

w <- reshape(l.sort, 
             timevar = "subj",
             idvar = c("id", "female", "race", "ses", "schtyp", "prog"),
             direction = "wide")

w[1:10,]

#How to create a string in R - rules

a <- 'Start and end with single quote'
a
b <- "Start and end with double quotes"
b
c <- "single quote ' in between double quotes"
c
d <- 'Double quotes " in between single quote'
d

#Examples of invalid strings
#e <- 'Mixed quotes" 
e

#f <- 'Single quote ' inside single quote'
f

#g <- "Double quotes " inside double quotes"
g


x <- "Learning To MANIPULATE strinGS in R"
tolower(x)
toupper(x)

# replace 'A' with 'a'
x <- "This is A string."
chartr(old = "A", new = "b", x)
# multiple character replacements
# replace any 'd' with 't' and any 'z' with 'a'
y <- "Tomorrow I plzn do lezrn zbout dexduzl znzlysis."
chartr(old = "dz", new = "ta", y)

#To abbreviate strings use abbreviate():
streets <- c("Main", "Elm", "Riverbend", "Mario", "Frederick")
# default abbreviations
abbreviate(streets)
# set minimum length of abbreviation
abbreviate(streets, minlength = 2)

LETTERS
alphabet <- paste(LETTERS)
alphabet
alphabet <- paste(LETTERS, collapse = "")
#collapse creates one string and also removes space between strings when object is created
alphabet
# extract 18th character in string
substr(alphabet, start = 18, stop = 18)
# extract 18-24th characters in string
substr(alphabet, start = 18, stop = 24)
# replace 1st-17th characters with `R`
substr(alphabet, start = 19, stop = 24) <- "RRRRRR"
alphabet
substr(alphabet, 3, 6)



z <- "The day after I will take a break"
strsplit(z, split = " ")
a <- "Alabama-Alaska-Arizona-Arkansas-California"
strsplit(a, split = "-")

#collapse is used to eliminate the space in between two strings. 
#But not the space within two words of one string

a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c, sep = "", collapse = ""))

#Counting number of characters in a string - nchar() function
result <- nchar("Count the")
print(result)

library(stringr)

m  <- c("We are good", "We are very very good")
m
class(m)

str_detect(m, "very")
str_count(m, "very")
str_locate_all(m, "very")
str_extract_all(m, "very")
str_pad("a", 4)
str_trim("   a   b   ")
str_replace_all(m, "very", "ABRACADABRA")
s <- "abcde"
substr(s, 2, 4) <- "A"
s
substr(s, 2, 4) <- "ABCDEFGHI"
s

search()
library('MASS')
library(help=MASS)
head(airquality)

getwd()
titanic <- read.csv("titanic.csv", sep = '\t')
dim(titanic)
head(titanic)
summary(titanic)
mean(titanic$Age,na.rm = TRUE)
mean(titanic$Age)
titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age, na.rm = TRUE)
titanic$Age
colSums(is.na(titanic))
aggregate(titanic$Age,by=list(titanic$Sex),mean)

#Obtain the total number of customers and mean fare for each class
#Use dplyr with pipe function
library(dplyr)

titanic %>% 
  group_by(Pclass) %>%
  summarise(avg_Fare = mean(Fare), total = n())

length(titanic$Age[titanic$Age < 10])

titanic %>% 
  group_by(Pclass,Survived) %>%
  summarise(total = n())

arrange(titanic,Pclass,desc(Age))


