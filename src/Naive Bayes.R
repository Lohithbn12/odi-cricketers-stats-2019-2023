# Load necessary libraries
library(e1071)
library(pROC)

# Read in the data from a CSV file
data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss.csv")

# Split the data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Train a Naive Bayes model on the training data
model <- naiveBayes(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = train_data)

# Convert predictions to a numeric variable
predictions_numeric <- as.numeric(predictions)

# Make predictions on the test data
predictions <- predict(model, test_data)

# Generate a ROC plot to evaluate the performance of the model
roc_obj <- roc(test_data$MATCHRESULT, predictions)
plot(roc_obj)
