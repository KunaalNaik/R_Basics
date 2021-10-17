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

# setwd
setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Oct 2021\\Case Study")

# import all 4 Tables

orders <- read.csv("Orders.csv") # ,header = TRUE, stringsAsFactors = FALSE, na.strings = ""

orderDetails <- read.csv("OrderDetails.csv")
  
categories <- read.csv("Categories.csv")

products <- read.csv("Products.csv")


# Objective 1 : Find YoY Sales - growth, decline

#install.packages("dplyr")
#install.packages("lubridate")

library(dplyr)
library(lubridate)

# Get Sales - OrderDetails
orderDetails_1 <- mutate(orderDetails, sales = unitprice * qty)

# Summary of Sales by Order ID - orderDetails_1
group_orderid = group_by(orderDetails_1, orderid)
orderDetails_summary <- summarize(group_orderid, t_sales = sum(sales))

# Join - orders (Base)  & orderDetails_summary
order_sales <- merge( x = orders, y = orderDetails_summary, by ="orderid")

#Sales by year - order_sales


class(order_sales$orderdate)

order_sales$orderdate <- ymd_hms(order_sales$orderdate)

class(order_sales$orderdate)

order_sales <- mutate(order_sales, year = year(orderdate))

# Summary of sales by year - order_sales
group_year = group_by(order_sales, year)
sales_summary_year <- summarize(group_year, y_sales = sum(t_sales))

  
  
