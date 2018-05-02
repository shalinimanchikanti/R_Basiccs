# The Gapminder website contains over 500 data sets with information about
# the world's population. Your task is to download a data set of your choice
# and create 2-5 plots that make use of the techniques from Lesson 3.

ur <- read.csv("/Users/shalinimanchikanti/Desktop/Unemploymentrate.csv",header = TRUE, sep = ",")

#error when I gave file = "path"; ignore file and directlt give path
library(tidyr)
?tidyr
?gather

#oneway
#nur <- gather(ur, key = "year", value = "rate" , 2:ncol(ur))
#2nd way  
newur <- gather(ur, "year", "rate", 2:ncol(ur),na.rm = TRUE)

#change the column name
names(newur)[1] <- "country"

??seperate
newur <- separate(newur,year, c("x","year"), sep ="X")

??deletecolumn
#deleting x column
newur <- subset(newur, select = -c(x))


?as.numeric
ggplot(newur,aes(x = as.numeric(year)), y =rate)+
  xlab("Year")+
  ylab("Unemplyment_Rate") +
  ggtitle("unemployment rate based on country")+
  geom_histogram(binwidth = 1 ,color = I("blue"), fill = I("Purple") ) +
  scale_x_continuous(limits = c(1980,2008), breaks = seq(1980,2008,5)) +
  facet_wrap(~country )+
  coord_flip()

# You might use a simple histogram, a boxplot split over a categorical variable,
# or a frequency polygon. The choice is yours!

# You can find a link to the Gapminder website in the Instructor Notes.

# Once you've completed your investigation, create a post in the discussions that includes:
#       1. any questions you answered, your observations, and summary statistics
#       2. snippets of code that created the plots
#       3. links to the images of your plots
