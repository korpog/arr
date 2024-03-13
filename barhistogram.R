library(ggplot2)
ggplot(mtcars, aes(x=factor(cyl))) +
  geom_bar(fill="coral", alpha=0.5) +
  theme_classic()

ggplot(mtcars, aes(factor(cyl),fill = factor(cyl))) +
  geom_bar()

data <- mtcars %>% 
  mutate(am = factor(am, labels = c("auto", "man")),
         cyl = factor(cyl))

ggplot(data, aes(x=cyl, fill=am)) +
  geom_bar() +
  theme_classic()

ggplot(data, aes(x = cyl, fill = am)) +
  geom_bar(position = "fill") +
  theme_classic()

ggplot(data, aes(x = cyl, fill = am)) +
  geom_bar(position = position_dodge()) +
  theme_classic()

data_histogram <- mtcars %>% 
  mutate(cyl=factor(cyl)) %>% 
  group_by(cyl) %>% 
  summarise(mean_mpg = round(mean(mpg), 2))

ggplot(data_histogram, aes(x=cyl, y=mean_mpg, fill=cyl)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_classic()

graph <- ggplot(data_histogram, aes(x = cyl, y = mean_mpg, fill = cyl)) +
  geom_bar(stat = "identity",
           width = 0.5) +
  coord_flip() +
  theme_classic()

graph +
  geom_text(aes(label=mean_mpg),
            hjust=1.5,
            color="white",
            size=3)

