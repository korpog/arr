library(ggplot2)
ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color=factor(gear)))

my_graph <- ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm",col = "#C42126",se = FALSE,
              linewidth = 1)
my_graph + labs(title = "Plot miles per hour and drat, in log")
