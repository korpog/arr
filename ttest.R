set.seed(123)
sugar_cookie <- rnorm(30, mean=9.99, sd=0.04)
head(sugar_cookie)
t.test(sugar_cookie, mu=10)

set.seed(123)
sales_before <- rnorm(7, mean=50000, sd=50)
sales_after <- rnorm(7, mean=50075, sd=50)
t.test(sales_before, sales_after, var.equal=TRUE)