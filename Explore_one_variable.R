#seeing the workspace
getwd()
#setting my workspace
setwd("/Users/shalinimanchikanti/Desktop/Courses_online/Udacity/Term2_nanodegree/RBasics/R_Program")
#list all files 
list.files()

#seperating the columns with tabs/
pf <- read.delim("pseudo_facebook.tsv")
# read.csv("filename" , sep = "\t")

library(ggplot2)
#to see column labels
#displaying the columns in dataframe
names(pf)

#plot using qplot 
qplot(x = dob_day, data = pf) +scale_x_continuous(breaks=1:31)

install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)

#Factorizing and using facet wrap 
x <- factor(pf)
print(is.factor(x))
m <- ggplot(data = pf , aes(x = dob_day)) +
      geom_histogram(binwidth = 1) +
      scale_x_continuous(breaks = 1:31) +   
      facet_wrap(~dob_month)
print(m)

#plot for friend_Count 
ggplot(aes(x = friend_count), data = pf) +
  geom_histogram()

qplot(x= friend_count, data =pf, binwidth = 10)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))+
  facet_wrap(~gender)

qplot(x = friend_count, data = pf) +
  facet_grid(.~gender)

#removing na values(only from gender variable )
qplot(x = friend_count, data = subset(pf, !is.na(gender)))+
  geom_histogram() +
  scale_x_continuous(limits = c(0,1000),breaks = seq(1,1000,50))+
  facet_wrap(~gender)

#removing na values(from all variables from the dataset)
qplot(x = friend_count, data = na.omit(pf), binwidth = 25)+
  geom_histogram() +
  scale_x_continuous(limits = c(0,1000),breaks = seq(1,1000,50))+
  facet_wrap(~gender)

#totalcount of male and female
table(pf$gender)

#statistics of a variable by(variable,categorial variable,stats)
by(pf$friend_count,pf$gender,mean)


#using color * I() function, caluculating tenure wrt days
qplot(x = tenure, data = pf , color = I('black'), binwidth = 30 , fill = I("#099DD9"))

#getting the binwidth for the year, caluculating tenure wrt years
qplot(x = tenure/365, data = (pf) ,
      xlab = "Number of years using Facebook",
      ylab = "Number of users in sample",
      color = I('black'), binwidth = .25 , fill = I("#F79420")) +
  scale_x_continuous(limits = c(0,7),breaks=seq(1,7,1))  

#caluculatting based on Age
qplot(x = age ,data = pf, 
      color = I('black'), binwidth = 1 , fill = I("#F79420")) +
    scale_x_continuous(limits = c(1,113), breaks = seq(1,113,10))

#multiple plots in one image
install.packages("gridExtra")
library(gridExtra)
p1 <- qplot(x= friend_count, data =pf)
p2 <- qplot(x= log10(pf$friend_count + 1), data =pf)
p3 <- qplot(x= sqrt(pf$friend_count), data =pf)
grid.arrange(p1,p2,p3,ncol=3)

#other way of doing multiple plot in one image using ggplot 
p1 <- ggplot(aes(x= friend_count), data =pf) + geom_histogram()
p2 <- p1 + scale_x_log10()
p3 <- p1 + scale_x_sqrt()
grid.arrange(p1,p2,p3,ncol=3)
# when you see the outpu,each plot always takes the x-axis
#as friend_count beacuse we are using p1 in our p2 and p3 plot
#that imples if we use scale_x_log we can get the x-axis as column name instead of log$colname

#installing package for count

?count

install.packages("plyr")
library(plyr)

# Frequency of polygon number of friends for each user using qplot
qplot(x = friend_count, y = ..count../sum(..count..),
      data = subset(pf,!is.na(gender)),
      xlab = "Number of friend",
      ylab = " Number of users for each friend",
      binwidth = 10, 
      geom = "freqpoly",
      color = gender)+
      scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))


# Frequency of polygon number of friends for each user using qplot with density
qplot(x = friend_count, y = ..density..,
      data = subset(pf,!is.na(gender)),
      xlab = "Number of friend",
      ylab = " Number of users for each friend",
      binwidth = 10, 
      geom = "freqpoly",
      color = gender)+
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,50))


# Frequency of polygon using qplot for proportion of likes 
qplot(x = www_likes,y = ..count../sum(..count..),
      data = subset(pf,!is.na(gender)),
      xlab = "Number of likes",
      ylab = " Number of likes for each user",
      binwidth = 10,
      geom = "freqpoly",
      color = gender) +
  scale_x_continuous(limits = c(0,1000), breaks = seq(0,1000,10))

max(pf$likes)

# Frequency of polygon using qplot for number of likes 
qplot(x = www_likes,
      data = subset(pf,!is.na(gender)),
      xlab = "Number of likes",
      ylab = " Number of likes for each user",
      geom = "freqpoly",
      color = gender) +
      scale_x_continuous() +
      scale_x_log10()

# other way of doing is ggplot for Frequency of polygon using qplot for number of likes 
ggplot(aes(x = www_likes), data = subset(pf, !is.na(gender))) +
  geom_freqpoly(aes(color = gender)) +
  scale_x_log10()

#how many www_likes there are in the entire data set for males.
by(pf$www_likes,pf$gender, sum)

#The second question is asking which gender has more www_likes in total.
by(pf$www_likes,pf$gender, sum)

#using boxplot
qplot( x = gender, y = friend_count , 
       data = subset(pf, !is.na(gender)),
        geom = "boxplot") + 
        scale_y_continuous(limits = c (0,1000))
# we observe that the max female is about 220/230 which may not be accurate 
# hence we use coord cartesian

#using coord cartesian
qplot( x = gender, y = friend_count , 
       data = subset(pf, !is.na(gender)),
       geom = "boxplot") + 
       coord_cartesian(ylim = c (0,1000))
# Now we can observe that the max female is around 240/250 which is close to accurate 

#Who made more friend requests on average - men or women?"
by(pf$friendships_initiated,pf$gender,median)

#other way  
qplot( x = gender, y = friendships_initiated , 
       data = subset(pf, !is.na(gender)),
       geom = "boxplot") +
      coord_cartesian(ylim = c (0,150))

#mobil_likes
summary(pf$mobile_likes)
#here we see that lot of data contains 0,
#we need to check if a person has ever checked rather than checking for how many times he checkin
# we do the following

summary(pf$mobile_likes >0)
# we just get logical counts as we use comparision operator
#this gives how many likes are more than 0 but we actually need to know 
#if the user checkedin or not

#creating a variable with null values 
mobile_check_in <- NA 
#ifelse (contion,True,False)
pf$mobile_check_in <- ifelse(pf$mobile_likes > 0, 1, 0)
#converting into factor
pf$mobile_check_in <- factor(pf$mobile_check_in)
summary(pf$mobile_check_in)


#percentage of mobile_checkin
sum(pf$mobile_check_in == 1)/length(pf$mobile_check_in)