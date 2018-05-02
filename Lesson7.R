
#seperating the columns with tabs/
pf <- read.delim("pseudo_facebook.tsv")
# read.csv("filename" , sep = "\t")

library(ggplot2)
#to see column labels
#displaying the columns in dataframe
names(pf)

ggplot(aes(x= gender, y = age), data = subset(pf, !is.na(gender))) + 
      geom_boxplot() + 
  stat_summary(fun.y = mean, geom = 'point', shape = 1)


ggplot(aes(x= age, y = friend_count), data = subset(pf, !is.na(gender))) + 
  geom_line(aes(color = gender), stat = 'summary', fun.y = median)

install.packages("dplyr")
install.packages("tidyr")


library(dplyr)
library("magrittr")
library("tidyr")

pf.fc_by_age_gender <- pf %>% 
  group_by(age, gender) %>% 
  summarise(mean_friend_count = mean(friend_count),
            median_friend_count = median(friend_count),
            n = n())


pf.fc_by_age_gender <- pf %>% 
  filter(!is.na(gender)) %>%
  group_by(age, gender) %>% 
  summarise(mean_friend_count = mean(friend_count),
            median_friend_count = median(friend_count),
            n = n()) %>%
  ungroup() %>%
  arrange(age)
  
head(pf.fc_by_age_gender)


pf.fc_by_age_gender.wide <-
  subset(pf.fc_by_age_gender[c('age', 'gender', 'median_friend_count')],
         !is.na(gender)) %>%
  spread(gender, median_friend_count) %>%
  mutate(ratio = male / female)


library(ggplot2)
ggplot(aes(x = age, y = median_friend_count), data = pf.fc_by_age_gender) +
  geom_line(aes(color = gender))

head(pf.fc_by_age_gender.wide)

install.packages('reshape2')
library(reshape2)

pf.fc_by_age_gender.wide <- dcast(pf.fc_by_age_gender,
                                  age ~ gender,
                                  value.var = 'median_friend_count')

head(pf.fc_by_age_gender.wide)

library(ggplot2)
ggplot(aes(x = age, y = female / male ), data = pf.fc_by_age_gender.wide) +
  geom_line() +
   geom_hline(yintercept = 1, alpha = 0.3, linetype = 2)


pf$year_jouned <- (floor(2014 - pf$tenure/365))

summary(pf$year_jouned)
table(pf$year_jouned)
?cut
pf$year_joined_bucket <- cut(pf$year_jouned, c(2004,2009,2011,2012,2014))
table(pf$year_joined_bucket, useNA = 'ifany')

ggplot(aes(x = age, y = friend_count),
       data = subset(pf, !is.na(year_joined_bucket))) +
  geom_line(aes(color = year_joined_bucket), stat = 'summary', fun.y = median)


ggplot(aes(x = age, y = friend_count),
       data = subset(pf, !is.na(year_joined_bucket))) +
  geom_line(aes(color = year_joined_bucket), stat = 'summary', fun.y = mean)+
  geom_line(stat = 'summary', fun.y = mean, linetype = 2)

ggplot(aes(x = age, y = friend_count),
       data = subset(pf, !is.na(year_joined_bucket))) +
  geom_line(aes(color = year_joined_bucket), stat = 'summary', fun.y = mean)+
  geom_line(stat = 'summary', fun.y = mean, linetype = 2)


?names
names(pf)
with(subset(pf, tenure >=1), summary(friend_count/ tenure))

ggplot(aes(x = tenure, y = friendships_initiated/ tenure),
       data = subset(pf,tenure >=1)) +
  geom_line(aes(color = year_joined_bucket), stat = 'summary', fun.y = mean)


ggplot(aes(x = 7 * round(tenure / 7), y = friendships_initiated/ tenure),
       data = subset(pf,tenure >=1)) +
  geom_line(aes(color = year_joined_bucket), stat = 'summary', fun.y = mean)

ggplot(aes(x = tenure, y = friendships_initiated/ tenure),
       data = subset(pf,tenure >=1)) +
  geom_smooth(aes(color = year_joined_bucket))

#Scatter Matrices
#install.packages("GGally")
library(GGally)

theme_set(theme_minimal(20))

#set the seed to reproduce the results
set.seed(1836)
pf_subset <- pf[ , c(2:15)]
names(pf_subset)

ggpairs(pf_subset[sample.int(nrow(pf_subset), 1000),])

