
qplot(x = price/carat, data = diamonds,
      xlab = "Price for each carat",
      ylab = "Number of counts",
      binwidth = 0.1,
      color = I('Red'), fill = I("Gold")) +
  scale_x_log10() +
  facet_wrap(~cut, scales = "free_y")


# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.
ggplot(diamonds, aes(x = cut, y = price) )+ geom_boxplot()

ggplot(diamonds, aes(x = color, y = price) ) +
  geom_boxplot() +
  scale_y_continuous()

ggplot(diamonds, aes(x = cut, y = price) )+ geom_boxplot()

#summary,IQR
by(pf$price,pf$color,summary)
by(pf$price,pf$color,IQR)

# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.
ggplot(diamonds, aes(x = color, y = price/cut) )+ geom_boxplot()
