library(dplyr)
data <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/lahman-batting.csv") %>%
    select(c(playerID, yearID, AB, teamID, lgID, G, R, HR, SH))  %>% 
    arrange(playerID, teamID, yearID)
glimpse(data)

data %>% 
  group_by(lgID) %>% 
  summarise(mean_run = mean(HR)) %>% 
  ggplot(aes(x = lgID, y = mean_run, fill = lgID)) +
    geom_bar(stat = 'identity') +
    theme_classic() +
    labs(x = 'baseball league', y = 'average home run',
         title = paste("Example group_by() with summarise()"))

ex1 <- data %>% 
  group_by(yearID) %>% 
  summarise(mean_game_year = mean(G))

ggplot(ex1, aes(x=yearID, y=mean_game_year)) +
  geom_line() +
  theme_classic() +
  labs(x="Year", y="Average games played",
       title=paste("Average games played from 1871 to 2016"))

data %>% 
  group_by(lgID) %>% 
  summarise(median_at_bat_league = median(AB),
            median_no_zero = median(AB[AB>0]))

data %>% 
  group_by(lgID) %>% 
  summarise(sum_homerun = sum(HR))

data %>% 
  group_by(playerID) %>% 
  summarise(min_g = min(G), max_g = max(G)) %>% 
  arrange(desc(max_g))

data %>%
  group_by(playerID) %>%
  summarise(number_year = n()) %>%
  arrange(desc(number_year))

data %>% 
  filter(yearID > 1980) %>% 
  group_by(yearID) %>% 
  summarise(mean_game_year = mean(G))