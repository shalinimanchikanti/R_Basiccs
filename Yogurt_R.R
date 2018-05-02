getwd()
list.files()

yo <- read.csv('yogurt.csv')
#to see what columns are there
names(yo)
#to see the data types
str(yo)

#change the id from into factor

yo$id <- factor(yo$id)
str(yo$id)

qplot(data = yo, x = price, fill = I('purple'))
# we can notice that even if we increase the binwidths its a biased models because empty bins are coming into consideration.

#number of purchases
summary(yo)
unique(yo$price)
length(unique(yo$price))
table(yo$price)

#transform all flavours counts into onegroup
yo <- transform(yo, all.purchase = strawberry+blueberry+pina.colada+plain+
                               mixed.berry)

summary(yo$all.purchase)

qplot(data = yo, x = all.purchase, binwidth = 1, fill = I('purple'))

#example of time seires plot
library(ggplot2)
ggplot(aes(x = time , y = price), data = yo) +
  geom_jitter(alpha = 1/4, shape = 21, fill = ('orange'))

##loooking a t the samples of household
#set the date to reproduce results
set.seed(4230)
sample.ids <- sample(levels(yo$id), 16)
sample.ids

ggplot(aes(x = time, y = price), 
       data = subset(yo, id %in% sample.ids))+
        facet_wrap(~ id) +
        geom_line() +
        geom_point(aes(size = all.purchase), pch = 1)


#genomic data (has thousands of genetic measurements for each of a small sample 
# we like to identify genes associated with disease.
list.files()
nci <- read.csv("nci.tsv")
#changing the reading format
nci <- read.table("nci.tsv")

##Creating Heap
#change the column name
colnames(nci) <- c(1:64)
names(nci)

#melt fun
nci.lon.samp <- melt(as.matrix(nci[1:200, ]))

#assign the column name
names(nci.lon.samp) <- c('gene','case','value')

head(nci.lon.samp)

## creatign the heat map
library(ggplot2)
ggplot(aes(x = case, y = gene, fill = value), 
       data = nci.lon.samp)+
        geom_tile()+
    scale_fill_gradientn(colours = colorRampPalette(c('blue','red'))(100))