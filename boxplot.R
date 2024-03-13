library(dplyr)
library(ggplot2)

data_air <- airquality %>% 
  select(-c(Solar.R, Temp)) %>% 
  mutate(Month = factor(Month, order = TRUE, labels = 
    c("May", "June", "July", "August", "September")),
    day_cat = factor(ifelse(Day<10, "Begin", ifelse(Day<20,
    "Middle", "End"))))
glimpse(data_air)

data_air_nona <- data_air %>% na.omit()

box_plot <- ggplot(data_air_nona, aes(x=Month, y=Ozone))
box_plot + 
  geom_boxplot(outlier.colour = "red", outlier.size = 2) + 
  coord_flip() +
  stat_summary(fun.y=mean, geom="point", size=3) +
  theme_classic()

box_plot +
  geom_boxplot() +
  geom_dotplot(binaxis = 'y', dotsize = 1, stackdir = 'center') +
  theme_classic()

ggplot(data_air_nona, aes(x = Month, y = Ozone, color = Month)) +
  geom_boxplot() +
  theme_classic()

ggplot(data_air_nona, aes(Month, Ozone)) +
  geom_boxplot(aes(fill = day_cat)) +
  theme_classic()

box_plot +
  geom_boxplot() +
  geom_jitter(shape = 15,
              color = "steelblue",
              position = position_jitter(width = 0.21)) +
  theme_classic()

box_plot +
  geom_boxplot(notch = TRUE) +
  theme_classic()
  
