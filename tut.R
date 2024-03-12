x <- 5
y <- 3
x & y

v1 <- c(1,2,4)
v2 <- c(3,5,7)
(v1+v2)[1:2]

b = c(1:5)
b>2
b[(b>2)]
# modulo
10%%4

m_1 <- matrix(1:12, nrow=3, ncol=4)
m_1 <- cbind(m_1, c(15:18))
m_1 <- rbind(m_1, c(18:22))
m_1
m_1[1:2, 1:2]

colors <- c('blue', 'red', 'yellow', 'green', 'yellow')
factor_colors <- factor(colors)
factor_colors

day_vector <- c('evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening')
factor_day <- factor(day_vector, order = TRUE, levels =c('morning', 'midday', 'afternoon', 'evening', 'midnight'))
summary(factor_day)

dataset <- mtcars
class(dataset$mpg)