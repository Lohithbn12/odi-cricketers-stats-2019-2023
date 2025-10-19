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
knn_predictions <- as.numeric(knn_predictions)

# Calculate the accuracy of the predictions
accuracy <- mean(knn_predictions == test_data[[outcome]])
cat("Accuracy:", accuracy)

# Create an ROC plot
roc_obj <- roc(test_data[[outcome]], knn_predictions)
plot(roc_obj)
