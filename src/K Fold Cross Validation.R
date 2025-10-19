# Load required libraries
library(caret)
library(pROC)

# Read in the data
data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss1.csv")

# Set seed for reproducibility
set.seed(123)

# Create training and test datasets
trainIndex <- createDataPartition(data$MATCHRESULT, p = 0.8, list = FALSE)
trainData <- data[trainIndex,]
testData <- data[-trainIndex,]

# Set up K-Fold Cross Validation
control <- trainControl(method = "cv", number = 10, classProbs = TRUE, summaryFunction = twoClassSummary)

# Train the model using K-Fold Cross Validation
model <- train(MATCHRESULT ~ ., data = trainData, method = "glm", trControl = control)

# Make predictions on the test dataset
predictions <- predict(model, testData)

# Calculate the confusion matrix
confusionMatrix(predictions, testData$MATCHRESULT)

# Plot the ROC curve
roc_obj <- roc(testData$MATCHRESULT, predictions)
plot(roc_obj)
auc(roc_obj)