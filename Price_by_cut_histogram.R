qplot(x = price, data = diamonds,
      xlab = "Price",
      ylab = "Number of counts",
      binwidth = 1,
      color = I('black'), fill = I("Red")) +
  scale_x_continuous(limits = c(600,800),breaks = seq(600,800,50)) +
  facet_wrap(~cut)

