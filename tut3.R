fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
for (i in fruit) {
  print(i)
}

c <- list()
for (i in seq(1, 4, by=1)) {
  c[[i]] <- i*i
}
print(c)

begin <- 1
while(begin <= 10) {
  cat('This is loop number', begin)
  begin <- begin+1
  print(begin)
}

stock <- 50
price <- 50

loop <- 1
while(price > 45) {
  price <- stock + sample(-10:10, 1)
  loop <- loop + 1
  print(loop)
}

m1 <- matrix(C <- (1:10), nrow=5, ncol=6)
m1
a_m1 <- apply(m1, 2, sum)
a_m1

movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

movies_lower <- unlist(lapply(movies, tolower))
str(movies_lower)

dt <- cars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
lmn_cars
smn_cars

avg <- function(x) {
  (min(x)+max(x)) / 2
}
fcars <- sapply(dt, avg)
fcars

below_avg <- function(x) {
  avg <- mean(x)
  return(x[x > avg])
}
dt_s <- sapply(dt, below_avg)
dt_l <- lapply(dt, below_avg)
identical(dt_s, dt_l)

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)

PATH <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv' 
df <- read.csv(PATH, header = TRUE, sep=',')
length(df)

require(readxl)
library(readxl)
readxl_example("geometry.xls")

example <- readxl_example("datasets.xlsx")
df <- read_excel(example)
excel_sheets(example)

iris <- read_excel(example, n_max=5, col_names = TRUE)
iris

example1 <- read_excel(example, range = "A1:B5", col_names = TRUE)
dim(example1)

example2 <- read_excel(example, range=cell_rows(1:5), col_names = TRUE)
dim(example2)

iris_na <- read_excel(example, na='setosa')
sum(is.na(iris_na))

library(haven)
PATH_sas <- 'https://github.com/guru99-edu/R-Programming/blob/master/binary.sas7bdat?raw=true'
df <- read_sas(PATH_sas)
head(df)

PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv"
df_titanic <- read.csv(PATH, sep = ",")
list_na <- colnames(df_titanic)[apply(df_titanic, 2, anyNA) ]
list_na

library(dplyr)
df_titanic_drop <- df_titanic %>% na.omit()
dim(df_titanic_drop)

avg_missing <- apply(df_titanic[, colnames(df_titanic) %in% list_na],
                     2, mean, na.rm = TRUE)
avg_missing

df_titanic_replace <- df_titanic %>% 
  mutate(replace_mean_age = ifelse(is.na(Age), avg_missing[1], Age),
         replace_mean_fare = ifelse(is.na(Fare), avg_missing[2], Fare))

sum(is.na(df_titanic_replace$age))
sum(is.na(df_titanic_replace$replace_mean_age))

median_missing <- apply(df_titanic[,colnames(df_titanic) %in% list_na],
                        2,
                        median,
                        na.rm =  TRUE)
df_titanic_replace <- df_titanic %>%
  mutate(replace_median_age  = ifelse(is.na(Age), median_missing[1], Age), 
         replace_median_fare = ifelse(is.na(Fare), median_missing[2], Fare))
head(df_titanic_replace)

df_titanic_impute_mean <- tibble(
  sapply(df_titanic,
         function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x)))

directory <- getwd()
directory

df <- mtcars %>% 
  select(mpg, disp, gear) %>% 
  group_by(gear) %>% 
  summarize(mean_mpg = mean(mpg), mean_disp = mean(disp))
write.csv(df, "table_car.csv")


