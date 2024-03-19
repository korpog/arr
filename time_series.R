ts(1:10, frequency = 12, start = 1990)

tsData <- EuStockMarkets[, 1]
decomposedRes <- decompose(tsData, type = "mult")
plot(decomposedRes)
stlRes <- stl(tsData, s.window = "periodic")

laggedTS <- lag(tsData, 3)

library(DataCombine)
my_df <- as.data.frame(tsData)
my_df <- slide(my_df, "x", NewVar = "xLag1", slideBy = -1)
my_df <- slide(my_df, "x", NewVar = "xLead1", slideBy = 1)
head(my_df)

acf_res <- acf(AirPassengers)
pacf_res <- pacf(AirPassengers)
ccf_res <- ccf(mdeaths, fdeaths, ylab="cross-correlation")
head(ccf_res[[1]])

tr_model <- lm(JohnsonJohnson ~ c(1:length(JohnsonJohnson)))
plot(resid(tr_model), type="l")

library(forecast)
ts.stl <- stl(TS, "periodic")
ts.sa <- seasadj(ts.stl)
plot(AirPassengers, type="l")
plot(ts.sa, type="l")
seasonplot(ts.sa, 12, col=rainbow(12), year.labels=TRUE,
           main="Seasonal plot: Airpassengers")