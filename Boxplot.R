
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

# There won’t be a solution video for this
# exercise so go to the discussion thread for either
# BOXPLOTS BY CLARITY, BOXPLOT BY COLOR, or BOXPLOTS BY CUT
# to share you thoughts and to
# see what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# =================================================================

by(pf$price,pf$color,summary)
by(pf$price,pf$color,IQR)