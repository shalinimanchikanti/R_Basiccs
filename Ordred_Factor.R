

redit <- read.csv('reddit.csv')
str(redit)

table(redit$employment.status)
summary(redit)


levels((redit$age.range))

print(l)
library(ggplot2)
qplot(data = redit,  x = redit$age.range)

#setting levels of Ordered Factors

redit$age.range <- ordered(redit$age.range, levels =c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
qplot(data = redit,  x = redit$age.range)

redit$age.range <- factor(reditfactor, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"), ordered = T)
# t -true
qplot(data = redit,  x = redit$age.range)
#print(is.factor(redit))
#reditfactor <- factor(redit)
#print(is.factor(reditfactor))

#new_level <- factor(reditfactor, levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
#print(new_level)
#qplot(data = redit,  x = new_level)

print(levels(redit$income.range))
income_range <- ordered(redit$income.range, levels = c("Under $20,000" , "$20,000 - $29,999",
                                                     "$30,000 - $39,999", "$40,000 - $49,999"  , "$50,000 - $69,999",  
                                                       "$70,000 - $99,999","$100,000 - $149,999" ,"$150,000 or more"
                                                     ))

print(income_range)
qplot(data = redit,  x =income_range)