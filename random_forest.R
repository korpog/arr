library(dplyr)
library(caret)
library(e1071)
data_train <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/train.csv")
glimpse(data_train)
data_test <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv") 
glimpse(data_test)
unique(data_test$Embarked)

trControl <- trainControl(method = "cv",
                          number = 10,
                          search = "grid")

set.seed(1234)
rf_default <- train(Survived~.,
                    data = data_train,
                    method = "rf",
                    metric = "Accuracy",
                    trControl = trControl)
print(rf_default)