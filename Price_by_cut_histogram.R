price_hist1 <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 1,color = ('black'), fill = ("white")) +
  scale_x_continuous(limits = c(0,800),breaks = seq(0,800,100)) 
price_hist1
