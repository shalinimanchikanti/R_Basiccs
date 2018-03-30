qplot(x = price, data = diamonds) + facet_wrap(~cut)

by(pf$price,pf$cut,summary)


qplot(x = price, data = diamonds,
      xlab = "Price",
      ylab = "Number of counts",
      binwidth = 1,
      color = I('black'), fill = I("Red")) +
  scale_x_continuous(limits = c(600,800),breaks = seq(600,800,50)) +
  facet_wrap(~cut, scales = "free_y")

# Create a histogram of price per carat
# and facet it by cut. You can make adjustments
# to the code from the previous exercise to get
# started.

qplot( x = carat , data = diamonds)
# Adjust the bin width and transform the scale
# of the x-axis using log10.

qplot(x = price/carat, data = diamonds,
      xlab = "Price for each carat",
      ylab = "Number of counts",
      binwidth = 0.1,
      color = I('Red'), fill = I("Gold")) +
       scale_x_log10() +
      facet_wrap(~cut, scales = "free_y")
# Submit your final code when you are ready.

# ENTER YOUR CODE BELOW THIS LINE.

?facet_wrap
