# dataframe
a <- c(1,2,3,4)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
df <- data.frame(a,b,c,d, stringsAsFactors = TRUE)
names(df) <- c('ID', 'items', 'store', 'price')
str(df)

df[1:3, 3:4]

quantity <- c(10, 35, 40, 5)
df$quantity <- quantity
df$ID
subset(df, subset = price > 5)

# list
vect <- 1:5
mat <- matrix(1:9, ncol=5)
df <- EuStockMarkets[1:10,]

my_list <- list(vect, mat, df)
my_list[[2]]

PATH <-'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/prison.csv'
df <- read.csv(PATH)[1:5]
head(df)

library(dplyr)
set.seed(1234)
data_frame <- tibble(  
  c1 = rnorm(50, 5, 1.5),   
  c2 = rnorm(50, 5, 1.5),  
  c3 = rnorm(50, 5, 1.5),
  c4 = rnorm(50, 5, 1.5), 	
  c5 = rnorm(50, 5, 1.5)
)
df <- data_frame[order(data_frame$c1),]
head(df)

df <- data_frame[order(-data_frame$c3, data_frame$c4),]
head(df)

library(dplyr)
df_primary <- tribble(
  ~ID, ~y,
  "A", 5,
  "B", 5,
  "C", 8,
  "D", 0,
  "F", 9)
df_secondary <- tribble(
  ~ID, ~z,
  "A", 30,
  "B", 21,
  "C", 22,
  "D", 25,
  "E", 29)

left_join(df_primary, df_secondary, by='ID')
right_join(df_primary, df_secondary, by='ID')
inner_join(df_primary, df_secondary, by='ID')
full_join(df_primary, df_secondary, by='ID')

df_primary <- tribble(
  ~ID, ~year, ~items,
  "A", 2015,3,
  "A", 2016,7,
  "A", 2017,6,
  "B", 2015,4,
  "B", 2016,8,
  "B", 2017,7,
  "C", 2015,4,
  "C", 2016,6,
  "C", 2017,6)
df_secondary <- tribble(
  ~ID, ~year, ~prices,
  "A", 2015,9,
  "A", 2016,8,
  "A", 2017,12,
  "B", 2015,13,
  "B", 2016,14,
  "B", 2017,6,
  "C", 2015,15,
  "C", 2016,15,
  "C", 2017,13)
left_join(df_primary, df_secondary, by = c('ID', 'year'))

library(tidyr)
# Create a messy dataset
messy <- data.frame(
  country = c("A", "B", "C"),
  q1_2017 = c(0.03, 0.05, 0.01),
  q2_2017 = c(0.05, 0.07, 0.02),
  q3_2017 = c(0.04, 0.05, 0.01),
  q4_2017 = c(0.03, 0.02, 0.04))
messy

tidier <- messy %>% gather(quarter, growth, q1_2017:q4_2017)
tidier

messy_1 <- tidier %>% spread(quarter, growth)
messy_1

separate_tidier <- tidier %>%
  separate(quarter, c("Qrt", "year"), sep="_")
head(separate_tidier)

unit_tidier <- separate_tidier %>%
  unite(Quarter, Qrt, year, sep="_")
head(unit_tidier)

producers <- data.frame(   
  surname =  c("Spielberg","Scorsese","Hitchcock","Tarantino","Polanski"),    
  nationality = c("US","US","UK","US","Poland"),    
  stringsAsFactors=FALSE)

# Create destination dataframe
movies <- data.frame(    
  surname = c("Spielberg",
              "Scorsese",
              "Hitchcock",
              "Hitchcock",
              "Spielberg",
              "Tarantino",
              "Polanski"),    
  title = c("Super 8",
            "Taxi Driver",
            "Psycho",
            "North by Northwest",
            "Catch Me If You Can",
            "Reservoir Dogs","Chinatown"),                
  stringsAsFactors=FALSE)

# Merge two datasets
m1 <- merge(producers, movies, by.x = "surname")
m1
dim(m1)

colnames(movies)[colnames(movies) == 'surname'] <- 'name'
m2 <- merge(producers, movies, by.x = 'surname', by.y = 'name')
head(m2)
identical(m1, m2)

add_producer <- c('Lucas', 'US')
producers <- rbind(producers, add_producer)
m3 <- merge(producers, movies, by.x = 'surname', by.y = 'name',
            all.x=TRUE)

set.seed(123)
x = rnorm(1000)
ts <- cumsum(x)
diff_ts <- diff(ts)
par(mfrow=c(1,2))

plot(ts, type='l')
plot(diff(ts), type='l')

dt <- cars
length(dt)

x_vec <- seq(45, 55, by=1)
log(x_vec)

speed <- dt$speed
speed
mean(speed)
var(speed)
sd(speed)
head(scale(speed))

square_func <- function(n)
{
  n^2
}

square_func(5)

ls(environment())

library(tibble)
data_frame <- tibble(  
  c1 = rnorm(50, 5, 1.5), 
  c2 = rnorm(50, 5, 1.5),    
  c3 = rnorm(50, 5, 1.5),    
)

normalize <- function(x) {
  nominator <- x-min(x)
  denominator <- max(x)-min(x)
  normalize <- nominator/denominator
  return(normalize)
}
normalize(data_frame$c1)

split_data <- function(df, train = TRUE) {
  length <- nrow(df)
  total_row <- length * 0.8
  split <- 1:total_row
  if (train == TRUE) {
    train_df <- df[split, ]
      return(train_df)
  } else {
    test_df <- df[-split, ]
      return(test_df)
  }
}

train <- split_data(airquality, train = TRUE)
dim(train)

test <- split_data(airquality, train = FALSE)
dim(test)
