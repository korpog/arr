library(dplyr)
PATH <-"https://raw.githubusercontent.com/guru99-edu/R-Programming/master/british_household.csv"
data <- read.csv(PATH) %>% 
  filter(income < 500) %>% 
  mutate(log_income = log(income),
         log_totexp = log(totexp),
         children_fac = factor(children, order = TRUE,
                               labels = c("No", "Yes"))) %>% 
  select(-c(X, children, totexp, income))
glimpse(data)

cor(data$log_income, data$wfood, method = "pearson")
cor(data$log_income, data$wfood, method = "spearman")

mat_1 <- as.dist(round(cor(data[,1:9]), 2))
mat_1

library('Hmisc')
data_rcorr <- as.matrix(data[, 1:9])
mat_2 <- rcorr(data_rcorr)

p_value <- round(mat_2[["P"]], 3)
p_value

library(GGally)
ggcorr(data,
       nbreaks = 6,
       label = TRUE,
       label_size = 3,
       color = "grey50")

library(ggplot2)
ggpairs(data, columns = c("log_totexp", "log_income", "age", "wtrans"), title = "Bivariate analysis of revenue expenditure by the British household", upper = list(continuous = wrap("cor", size = 3)),
        lower = list(continuous = wrap("smooth", alpha = 0.3, size = 0.1)),
        mapping = aes(color = children_fac))

ggpairs(data, columns = c("log_totexp", "log_income", "age", "wtrans"),
        title = "Bivariate analysis of revenue expenditure by the British household",
        upper = list(continuous = wrap("cor",
                                       size = 3),
                     mapping = aes(color = children_fac)),
        lower = list(
          continuous = wrap("smooth",
                            alpha = 0.3,
                            size = 0.1))
)