# Load necessary libraries
library(tidyverse)
library(caret)
library(pROC)

# Read in the data
data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss.csv")

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$MATCHRESULT, p = 0.8, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

# Fit logistic regression model
fit <- glm(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = train, family = binomial())

# Make predictions on test set
pred <- predict(fit, newdata = test, type = "response")

# Generate ROC curve
roc_obj <- roc(test$MATCHRESULT, pred)
plot(roc_obj)

# Calculate AUC
auc(roc_obj)
