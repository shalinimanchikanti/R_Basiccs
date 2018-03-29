library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package

# Explore the largest peak in the
# price histogram you created earlier.
price_hist <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(color = ('black'), fill = ("white")) 

price_hist

# Try limiting the x-axis, altering the bin width,
# and setting different breaks on the x-axis.
price_hist1 <- ggplot(diamonds, aes(x = price)) +
               geom_histogram(binwidth = 10,color = ('black'), fill = ("white")) +
              scale_x_continuous(limits = c(0,1000),breaks = seq(0,1000,250))

price_hist1

price_hist1 <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 1,color = ('black'), fill = ("white")) +
  scale_x_continuous(limits = c(0,800),breaks = seq(0,800,100)) 
price_hist1

ggsave("price_hist1.png")
# There won’t be a solution video for this
# question so go to the discussions to
# share your thoughts and discover
# what other people find.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Submit your final code when you are ready.

# TYPE YOUR CODE BELOW THE LINE
# ======================================================================
