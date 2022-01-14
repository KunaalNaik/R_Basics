setwd("C:\\Users\\DELL\\OneDrive\\Documents\\Jigsaw Courses\\Courses\\R Basics\\R Basics IPBA 11\\R Data Manipulation")
oj <- read.csv("oj.csv")

str(oj)

#dataframe[rows,columns]
oj[1,3]



oj[c(1,2,8,456),c(1,3,6)]





oj[c(1:5),"brand"]


#Logical Subsetting

#Selecting only those rows where brand bought is tropicana
dat<-oj[oj$brand=='tropicana',]


oj[,"store"]
oj$store
oj[,1]







#Using Or condition, brand bought is tropicana or dominicks
dat1<-oj[oj$brand=='tropicana'|oj$brand=='dominicks',]
head(dat1)












#Using And condition, brand bought is tropicana and no feature advertisement is run
dat2<-oj[oj$brand=='tropicana' & oj$feat==0,]
head(dat2)











#Subsetting using which() operator
index<-which(oj$brand=="dominicks")
head(index)
dat3<-oj[index,]











#Selecting Columns
dat4<-oj[,c("week","brand")]
head(dat4)










#Selecting+Subsetting
dat5<-oj[oj$brand=='tropicana' & oj$feat==0,c("week","store")]
head(dat5)











#Adding new columns
oj$logInc<-log(oj$INCOME)
dim(oj)











#Revenue Column
head(oj$logmove)
head(exp(oj$logmove))
oj$revenue<-exp(oj$logmove)*oj$price










#Sorting data
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)










dat6<-oj[order(oj$week),]
head(dat6)
min(oj$week)










dat7<-oj[order(-oj$week),]
head(dat7)
max(oj$week)



##Group by summaries


class(oj$brand)
unique(oj$brand)








#Mean price of juice across brands







#Summarize-Price
#Summarize by-Brand (factor)
#Summarize how-Mean

#Syntax aggregate(variable to be summarized, by=list(variable by which grouping is to be done),function)



aggregate(oj$price,by=list(oj$brand),mean)
class(aggregate(oj$price,by=list(oj$brand),mean))











tapply(oj$price,oj$brand,mean)


class(tapply(oj$price,oj$brand,mean))












#Mean income of people by brand
#Summarize-Income
#Summarize by-Brand
#Summarize how-Mean
aggregate(oj$INCOME,by=list(oj$brand),mean)
class(aggregate(oj$INCOME,by=list(oj$brand),mean))
tapply(oj$INCOME,oj$brand,mean)
class(tapply(oj$INCOME,oj$brand,mean))










#Cross tabulations
# Units of different brands sold based on if feature advertisement was run or not
table(oj$brand,oj$feat)



class(table(oj$brand,oj$feat))











xtabs(oj$INCOME~oj$brand+oj$feat)








#dplyr
library(dplyr)
dat8<-filter(oj,brand=="tropicana")
dim(filter(oj,brand=="tropicana"))



dat9<-filter(oj,brand=="tropicana" | brand=="dominicks")
dim(filter(oj,brand=="tropicana"|brand=="dominicks"))



#Selecting Columns
dat10<-select(oj,brand,INCOME,feat)








dat11<-select(oj,-brand,-INCOME,-feat)







#Creating a new column
dat12<-mutate(oj,logIncome=log(INCOME))




#Arranging data 
dat13<-arrange(oj,INCOME)










dat14<-arrange(oj,desc(INCOME))


dat14<-arrange(oj,-INCOME)





#Group Wise summaries
gr_brand<-group_by(oj,brand)
summarize(gr_brand,mean(INCOME),sd(INCOME))







#Pipelines
#Base R code

mean(oj[oj$INCOME>=10.5,"price"])

#dplyr code
summarize(filter(oj,INCOME>=10.5),mean(price))




oj%>%filter(INCOME>=10.5)%>%summarize(mean(price))



oj%>%filter(price>=2.5)
   %>%mutate(logIncome=log(INCOME))
   %>%summarize(mean(logIncome),median(logIncome),sd(logIncome))



##Date
fd<-read.csv("Fd.csv")
str(fd)







fd$FlightDate<-as.Date(fd$FlightDate,"%d-%b-%y")

str(fd)


head(months(fd$FlightDate))
unique(months(fd$FlightDate))


head(weekdays(fd$FlightDate))
unique(weekdays(fd$FlightDate))




#Finding time interval

fd$FlightDate[60]-fd$FlightDate[900]

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "weeks")

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "days")

difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "hours")


#Subsetting data based on time information
library(dplyr)

#Subset the data for day=Sunday
dim(fd)
fd_s<-fd%>%filter(weekdays(FlightDate)=="Sunday")
dim(fd_s)
#Find the number of flights on Sundays for destination Atlanta
fd%>%filter(weekdays(FlightDate)=="Sunday",DestCityName=="Atlanta, GA")%>%nrow()
#Find the number of flights on Sundays for all cities
fd%>%filter(weekdays(FlightDate)=="Sunday")%>%group_by(DestCityName)%>%summarize(n())
#PISIXct and POSIXlt
date1<-Sys.time()
date1
class(date1)
weekdays(date1)
months(date1)
date2<-as.POSIXlt(date1)
date2
str(date2)
unclass(date2)
date2$wday
date2$zone
date2$hour
#Merging data
##Joins using Merge
df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6),State=c(rep("Alabama",2),rep("Ohio",1)))

merge(x = df1, y = df2, by = "CustomerId", all = TRUE)#Outer join:

merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)#Left join

merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)#Right join

merge(x=df1,y=df2,by="CustomerId")#Inner Join/Intersection of both tables



#Missing values
a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)
is.na(a)
sum(is.na(a))



air<-airquality
head(air)




sum(is.na(air$Ozone))
sum(is.na(air$Solar.R))



summary(air)


#Imputing Missing values

air$Ozone[is.na(air$Ozone)]<-45

summary(air)





air$Solar.R[is.na(air$Solar.R)]<-mean(air$Solar.R,na.rm=TRUE)
summary(air)






#reshape2()
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
age<-c(26,24,25)
weight<-c(70,60,65)
wide<-data.frame(person,age,weight)
wide










melt(wide,id.vars="person")



melt(wide,id.vars="person",value.name ="Demo_Value" )



melted<-melt(wide,id.vars="person",value.name ="Demo_Value" )








dcast(melted,person~variable,value.var = "Demo_Value")







#String manipulation
a<-"Batman"
substr(a,start=2,stop=6)

nchar(a)
tolower(a)
toupper(a)

b<-"Bat-Man"
strsplit(b,split="-")
c<-"Bat/Man"
strsplit(c,split="/")





paste(b,split=c)

c(b,c)

grep("-",c(b,c))


c(b,c)
grepl("/",c(b,c))

c(c,b)
grepl("/",c(c,b))


b
sub("-","/",b)





d<-"Bat-Ma-n"


sub("-","/",d)


gsub("-","/",d)






#sqldf
library(sqldf)
#Using SELECT statement
oj_s<-sqldf("select brand, income, feat from oj ")
#Subseting using where statement
oj_s<-sqldf("select brand, income, feat from oj where price<3.8 and income<10")
#Order by statement
oj_s<-sqldf("select store,brand,week,logmove,feat,price, income from oj order by income asc")
#distinct
sqldf("select distinct brand from oj")
#Demo sql functions
sqldf("select avg(income) from oj")
sqldf("select min(price) from oj")

