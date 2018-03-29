

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

