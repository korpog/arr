library(ggplot2)
ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color=factor(gear)))

my_graph <- ggplot(mtcars, aes(x = log(mpg), y = log(drat))) +
  geom_point(aes(color = factor(gear))) +
  stat_smooth(method = "lm",col = "#C42126",se = FALSE,
              linewidth = 1)

mean_mpg <- mean(mtcars$mpg)
my_graph + labs(
  title = paste("Plot Mile per hours and drat, in log.\nAverage mpg is", mean_mpg)
)

my_graph +
  scale_x_continuous(breaks = seq(1, 3.6, by = 0.2)) +
  scale_y_continuous(breaks = seq(1, 1.6, by = 0.1)) +
  theme_minimal() +
  labs(
    x = "Drat definition",
    y = "Mile per hours",
    color = "Gear",
    title = "Relation between Mile per hours and drat",
    subtitle = "Relationship break down by gear class",
    caption = "Authors own computation"
  )
ggsave("plot.png")
