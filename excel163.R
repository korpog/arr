values <- c(18,	35,	29,	18,	55,	28,	25,	34,
            50,	19,	44,	35,	25,	52,	20,	42,
            37,	27,	50,	22,	39,	60,	49,	41,
            21,	59,	28,	46,	43,	38,	52,	43,
            48,	32,	20,	51,	23,	28,	21,	30)
summary(values)
m <- mean(values)
s <- sd(values)
var(values)
data_within_1sd <- values[abs(values - m) < s]
data_within_1sd

sd1_left <- m - s
sd1_right <- m + s
sd3_left <- m - 3*s
sd3_right <- m + 3*s

sorted = sort(values)
sorted
tab <- table(values)
tab["50"]

hist1 <- hist(values, freq = TRUE, breaks = c(0, 20, 30, 40, 50, 60))
hist2 <- hist(values, freq = TRUE, breaks = c(15, 25, 35, 45, 55, 64))

barplot(cumsum(hist1$counts))
pie(hist1$counts)

