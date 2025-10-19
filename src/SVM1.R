# Load the necessary library
library(e1071)

# Load the dataset
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Men.csv")

# Split the dataset into features and labels
features <- cricket_data[, c("RUNS", "AVG", "STRIKERATE", "WICKETS", "BOWLINGAVG", "CATCHES")]
labels <- cricket_data$PLAYERTYPE

# Convert labels to factor
labels <- as.factor(labels)

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- sample(1:nrow(cricket_data), 0.7 * nrow(cricket_data))
train_features <- features[train_indices, ]
train_labels <- labels[train_indices]
test_features <- features[-train_indices, ]
test_labels <- labels[-train_indices]

# Train the SVM model
svm_model <- svm(train_labels ~ ., data = train_features, kernel = "linear")

# Predict on the test set
predictions <- predict(svm_model, test_features)

# Evaluate the accuracy
accuracy <- sum(predictions == test_labels) / length(test_labels)
cat("Accuracy:", accuracy)

# You can also visualize the SVM decision boundary if you have only two features
if (ncol(features) == 2) {
  plot(train_features, col = as.numeric(train_labels))
  plot(svm_model, train_features)
}
