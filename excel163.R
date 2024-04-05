age <- c(18,	35,	29,	18,	55,	28,	25,	34,
            50,	19,	44,	35,	25,	52,	20,	42,
            37,	27,	50,	22,	39,	60,	49,	41,
            21,	59,	28,	46,	43,	38,	52,	43,
            48,	32,	20,	51,	23,	28,	21,	30)
summary(age)
m <- mean(age)
s <- sd(age)
var(age)
age_ranges <- cut(age, breaks = c(0, 20, 30, 40, 50, 60),
                  labels = c("[0-20]", "[21-30]", "[31-40]", "[41-50]", "[51-60]"))
age_counts <- table(age_ranges)
pie(age_counts, labels = paste(names(age_counts)))

barplot(age_counts)
barplot(cumsum(age_counts))

plot(cumsum(age_counts), type='l')




data_within_1sd <- age[abs(age - m) < s]
data_within_1sd

sd1_left <- m - s
sd1_right <- m + s
sd3_left <- m - 3*s
sd3_right <- m + 3*s

sorted = sort(age)
sorted
tab <- table(age)
tab["50"]

hist1 <- hist(age, freq = TRUE, breaks = c(0, 20, 30, 40, 50, 60))
hist2 <- hist(age, freq = TRUE, breaks = c(15, 25, 35, 45, 55, 64))

barplot(cumsum(hist1$counts))
pie(hist1$counts)

