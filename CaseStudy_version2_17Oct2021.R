# Case Study

# Data manipulation

# 1. sorting
# 2. filtering
# 3. grouping/ rolling up
# 4. adding new columns, deleting columns from the data
# 5. Data transformations - sales -- sqrt(sales)
# 6. Merging (joining the data using Primary key and sec keys)
# 7. Selecting data which is req

# Objective 1 : Find YoY Sales - growth, decline
# Objective 2 : Find YoY sales by Categories - growth, decline

library(dplyr)
library(lubridate)

# setwd
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Oct 2021\\Case Study")

# import all 4 Tables

orders <- read.csv("Orders.csv") # ,header = TRUE, stringsAsFactors = FALSE, na.strings = ""

orderDetails <- read.csv("OrderDetails.csv")

categories <- read.csv("Categories.csv")

products <- read.csv("Products.csv")

# Objective 2 : Find YoY sales by Categories - growth, decline

# Join to get all information in one table - Base table (orderDetails)

# 1/ Join products to orderDetails  (by productid)
orderDetails_1 <- merge(x=orderDetails,y=products,x.by="productid")

# 2/ Join categories to orderDetails (by categoryid)
orderDetails_1 <- merge(x=orderDetails_1,y=categories,by="categoryid")

# 3/ Join orders to orderDetails (by orderid)
orderDetails_1 <- merge(x=orderDetails_1,y=orders,by="orderid")

# 4/ Create Sales column using Mutate
orderDetails_1 <- mutate(orderDetails_1,total_sales=unitprice*qty)

# 5/ Create order_year column Mutate (date conversion)
orderDetails_1$orderdate <- ymd_hms(orderDetails_1$orderdate)
orderDetails_1 <- mutate(orderDetails_1, order_year = year(orderdate))

# 6/ get Summary of Sales by year
group_year = group_by(orderDetails_1, order_year)
sales_summary_year <- summarize(group_year, y_sales = sum(total_sales))

# 7/ Get Summary of sales by Year, Categoryname
group_year_category = group_by(orderDetails_1, order_year, categoryname)
sales_summary_year_category <- summarize(group_year_category, y_sales = sum(total_sales))






#new column having sales by category


#new column having years


  





