

library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package

names(diamonds)

pf <- diamonds

#observations in a dataset
nrow(pf)

#number of variables in dataset
ncol(pf)

#to see the description of diamonds 
?diamonds

#choose the best color for diamond
diamonds$color

#to see how many are ordered factors
summary(diamonds)

# Create a histogram of the price of
# all the diamonds in the diamond data set.

library(ggplot2)
hist(diamonds$price)
price_hist <- ggplot(diamonds, aes(x = price)) +
        geom_histogram(color = ('black'), fill = ("white")) 

summary(diamonds$price)

#count the number of diamonds with price given a condition
diamonds$price < 500
sum(diamonds$price < 500)
length(which(diamonds$price < 500))

#other method
summary(diamonds$price < 500)

diamonds$price >= 15000
sum(diamonds$price >= 15000)
length(which(diamonds$price >= 15000))

diamonds$price < 250
sum(diamonds$price < 250)
length(which(diamonds$price < 250))

