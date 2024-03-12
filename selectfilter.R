library(dplyr) 
PATH <- "https://raw.githubusercontent.com/guru99-edu/R-Programming/master/travel_times.csv"
df <- read.csv(PATH)
glimpse(df)

sum(df$Comments == "")

step_1_df <- select(df, -Comments)
dim(df)
dim(step_1_df)
table(step_1_df$GoingTo)

select_home <- filter(df, GoingTo == "Home")
dim(select_home)

select_work <- filter(df, GoingTo == "GSK")
dim(select_work)

select_home_wed <- filter(df, GoingTo == "Home" &
                            DayOfWeek == "Wednesday")
dim(select_home_wed)
head(select_home_wed)

filter_home_wed <- read.csv(PATH) %>% 
  select(GoingTo, DayOfWeek) %>% 
  filter(GoingTo == "Home", DayOfWeek == "Wednesday")

step_2_df <- step_1_df %>% arrange(GoingTo, Distance)
head(step_2_df)
