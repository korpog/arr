library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra)  # clustering algorithms & visualization

df <- USArrests
df <- na.omit(df)
df <- scale(df)
df <- as.data.frame(df)

distance <- get_dist(df)
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))