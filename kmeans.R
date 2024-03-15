library(ggplot2)
df <- data.frame(age = c(18, 21, 22, 24, 26, 26, 27, 30, 31, 35, 39, 40, 41, 42, 44, 46, 47, 48, 49, 54),
                 spend = c(10, 11, 22, 15, 12, 13, 14, 33, 39, 37, 44, 27, 29, 20, 28, 21, 30, 31, 23, 24)
)
ggplot(df, aes(x = age, y = spend)) +
  geom_point()

library(dplyr)
PATH <-"https://raw.githubusercontent.com/guru99-edu/R-Programming/master/computers.csv"
df <- read.csv(PATH) %>%
  select(-c(X, cd, multi, premium))
glimpse(df)
summary(df)

rescale_df <- df %>%
  mutate(price_scal = scale(price),
         hd_scal = scale(hd),
         ram_scal = scale(ram),
         screen_scal = scale(screen),
         ads_scal = scale(ads),
         trend_scal = scale(trend)) %>%
  select(-c(price, speed, hd, ram, screen, ads, trend))

set.seed(2345)
library(animation)
kmeans.ani(rescale_df[2:3], 3)

pc_cluster <- kmeans(rescale_df, 5)


kmeans_withins <- function(k) {
  cluster <- kmeans(rescale_df, k)
  return (cluster$tot.withinss)
}

kmeans_withins(2)

max_k <- 20
wss <- sapply(2:max_k, kmeans_withins)
elbow <- data.frame(2:max_k, wss)

ggplot(elbow, aes(x = X2.max_k, y = wss)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 20, by = 1))

pc_cluster_2 <-kmeans(rescale_df, 7)
pc_cluster_2$cluster
pc_cluster_2$centers
pc_cluster_2$size

library(tidyr)
cluster <- c(1:7)
center <-pc_cluster_2$centers
center_df <- data.frame(cluster, center)

center_reshape <- gather(center_df, features, values,
                         price_scal:trend_scal)
head(center_reshape)

library(RColorBrewer)
hm.palette <- colorRampPalette(rev(brewer.pal(10, 'RdYlGn')),
                               space='Lab')

ggplot(data = center_reshape, aes(x = features, y = cluster, fill = values)) +
  scale_y_continuous(breaks = seq(1, 7, by = 1)) +
  geom_tile() +
  coord_equal() +
  scale_fill_gradientn(colours = hm.palette(90)) +
  theme_classic()

