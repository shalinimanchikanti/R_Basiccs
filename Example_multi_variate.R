dm <- diamonds

ggplot(data = dm, aes(x = price)) + geom_histogram() +
    facet_wrap(~color)

#histogram for price
ggplot(data = dm, aes(x = price))+ geom_histogram(aes(color = cut)) +
  facet_wrap(~color)+
  scale_fill_brewer(type = "qual")+
  scale_x_log10()

#scatter plot for price vs table
##we can the range for different cuts 
ggplot(data = dm, aes(x = table , y = price))+
  geom_point(aes(color = cut)) +
  scale_fill_brewer(type = "qual")+
  scale_x_log10(limits = c(50,80), breaks = seq(0,80,2))

# Create a scatterplot of diamond price vs.
# volume (x * y * z) and color the points by
# the clarity of diamonds. Use scale on the y-axis
# to take the log10 of price. You should also
# omit the top 1% of diamond volumes from the plot.

dm$vol <- dm$x * dm$y * dm$z 

summary(dm$vol)

?quantile
quantile(dm$vol, probs = 0.99)
  
ggplot(aes(x = vol , y = price), data = subset(dm, vol < quantile(vol,probs = 0.99)))+
  geom_point(aes(color = clarity)) +
  scale_fill_brewer(type = "div")+
  scale_y_log10()




