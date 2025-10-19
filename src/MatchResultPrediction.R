#1) KNN Prediction 
# Load required libraries
library(class)
library(pROC)

# Read in the data
data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss.csv")

# Set the seed for reproducibility
set.seed(123)

# Split the data into training and test sets
train_index <- sample(1:nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Define the predictor variables and the outcome variable
predictors <- c("TOSS", "BATTINGFIRST", "HOME")
outcome <- "MATCHRESULT"

# Scale the predictor variables
train_data[predictors] <- scale(train_data[predictors])
test_data[predictors] <- scale(test_data[predictors])

# Use KNN to make predictions on the test set
knn_predictions <- knn(train_data[predictors], test_data[predictors], train_data[[outcome]], k=3)

# Convert predictions to a numeric variable
knn_predictions_numeric <- as.numeric(knn_predictions)

# Create an ROC plot
roc_obj1 <- roc(test_data[[outcome]], knn_predictions_numeric)
plot(roc_obj1)

#2) Naive Bayes

# Load necessary libraries
library(e1071)
library(pROC)

# Split the data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Train a Naive Bayes model on the training data
model <- naiveBayes(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = train_data)

# Make predictions on the test data
predictions1 <- predict(model, test_data)

# Convert predictions to a numeric variable
predictions_numeric1 <- as.numeric(predictions1)

# Generate a ROC plot to evaluate the performance of the model
roc_obj2 <- roc(test_data$MATCHRESULT, predictions_numeric1)
plot(roc_obj2)

#3) SVM
# Load necessary libraries
library(e1071)   # For SVM
library(caret)   # For data preprocessing

# Load required libraries
library(e1071)
library(pROC)

# Split the data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train the SVM model
svm_model <- svm(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = train_data, kernel = "radial")

# Make predictions on the test set
predictions2 <- predict(svm_model, test_data)
predictions2

# Convert predictions to a numeric variable
predictions_numeric2 <- as.numeric(predictions2)

# Generate a ROC plot using the numeric predictions
roc_obj3 <- roc(test_data$MATCHRESULT, predictions_numeric2)
plot(roc_obj3)

# Interpretation: The closer the ROC curve is to the top left corner of the plot, the better the model is at predicting the outcome of a cricket match.

#4) Neural Networks

# Load necessary libraries
library(neuralnet)
library(ROCR)

# Split data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Normalize the data
maxs <- apply(train_data, 2, max)
mins <- apply(train_data, 2, min)
scaled_train_data <- as.data.frame(scale(train_data, center = mins, scale = maxs - mins))
scaled_test_data <- as.data.frame(scale(test_data, center = mins, scale = maxs - mins))

# Define the formula for the neural network
formula <- MATCHRESULT ~ TOSS + BATTINGFIRST + HOME

# Train the neural network
nn <- neuralnet(formula, data = scaled_train_data, hidden = c(5, 3), linear.output = FALSE)

# Make predictions on the test set
predictions <- compute(nn, scaled_test_data[,c("TOSS", "BATTINGFIRST", "HOME")])
predictions <- predictions$net.result

# Convert predictions to binary outcome
predictions[predictions > 0.5] <- 1
predictions[predictions <= 0.5] <- 0

# Plot ROC curve
pred <- prediction(predictions, scaled_test_data$MATCHRESULT)
perf <- performance(pred,"tpr","fpr")
plot(perf)
abline(0,1)

#5) Random Forest

# Load necessary libraries
library(randomForest)
library(pROC)

# Split the data into training and test sets
set.seed(123)
train_index <- sample(nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Train the Random Forest model
rf_model <- randomForest(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data=train_data, ntree=500)

# Make predictions on the test set
predictions3 <- predict(rf_model, test_data)

# Generate the ROC plot
roc_obj4 <- roc(test_data$MATCHRESULT, predictions3)
plot(roc_obj4)

#The interpretation of the ROC plot will depend on its shape. A ROC curve that lies close to the diagonal line indicates that the model is not performing well, while a curve that lies further away from the diagonal line indicates better performance. The area under the ROC curve (AUC) can also be used as a measure of model performance, with larger values indicating better performance.

#6) Logistic Regression

# Load necessary libraries
library(tidyverse)
library(caret)
library(pROC)

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
roc_obj5 <- roc(test$MATCHRESULT, pred)
plot(roc_obj5)

# Calculate AUC
auc(roc_obj5)

plot(roc_obj1)
plot(roc_obj2)
plot(roc_obj3)
plot(perf)
plot(roc_obj4)
plot(roc_obj5)


plot(roc_obj1,col="red",main="ROC CURVES")
plot(roc_obj2,add=TRUE,col="blue")
plot(roc_obj3,add=TRUE,col="green")
plot(roc_obj4,add=TRUE,col="purple")
plot(roc_obj5,add=TRUE,col="yellow")
legend("bottomright", legend = c("roc_obj1", "roc_obj2", "roc_obj3", "roc_obj4","roc_obj5"), fill = c("red", "blue", "green", "orange", "purple"))

auc(roc_obj1)
auc(roc_obj2)
auc(roc_obj3)
auc(roc_obj4)
auc(roc_obj5)