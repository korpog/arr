library(ggplot2)
library(dplyr)
path <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/women.csv'
df <-read.csv(path)

ggplot(df, aes(x=height, y = weight)) +
  geom_point()

beta <- cov(df$height, df$weight) / var(df$height)
alpha <- mean(df$weight) - beta * mean(df$height)

df <- mtcars %>% 
  select(-c(am, vs, cyl, gear, carb))
glimpse(df)

model <- mpg~disp + hp + drat + wt
fit <- lm(model, df)
fit
summary(fit)

anova(fit)

par(mfrow=c(2,2))
plot(fit)

df2 <- mtcars %>%
  mutate(cyl = factor(cyl),
         vs = factor(vs),
         am = factor(am),
         gear = factor(gear),
         carb = factor(carb))
model2 <- mpg~disp + hp + drat + wt + vs + am + gear + carb
fit2 <- lm(model2, df2)
summary(fit2)

library(GGally)
df <- mtcars %>% 
  select(-c(am, vs, cyl, gear, carb))
ggscatmat(df, columns = 1:ncol(df))
