# Load required libraries
library(dplyr)
library(nnet)
install.packages("ROCR")
library(ROCR)
library(caret)

# Load the dataset
cricket_df = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project Work\\Men.csv")


# Data preprocessing
# ...

# Define predictor variables (features) and target variable (label)
predictors <- cricket_df[, c("RUNS", "AVG", "STRIKERATE", "WICKETS", "BOWLINGAVG", "CATCHES")]
target <- cricket_df$PLAYERTYPE

# Create training and testing datasets
set.seed(123)  # For reproducibility
train_indices <- createDataPartition(target, p = 0.7, list = FALSE)
train_data <- predictors[train_indices, ]
test_data <- predictors[-train_indices, ]
train_labels <- target[train_indices]
test_labels <- target[-train_indices]

# Train the multinomial logistic regression model
model <- multinom(label ~ ., data = data.frame(label = train_labels, train_data))

# Predict labels for the test set
predicted_labels <- predict(model, newdata = test_data)

# Calculate accuracy
accuracy <- mean(predicted_labels == test_labels)
accuracy
cat("Accuracy:", accuracy, "\n")

# Create confusion matrix
conf_matrix <- table(predicted_labels, test_labels)
cat("Confusion Matrix:\n", conf_matrix, "\n")

# Calculate ROC plot-like features
probabilities <- predict(model, newdata = test_data, type = "probs")
all_class_probs <- as.numeric(probabilities)
rocr_pred <- prediction(all_class_probs, test_labels)

# Calculate ROC curve and AUC for each class
roc_obj <- performance(rocr_pred, "tpr", "fpr")
auc_scores <- sapply(roc_obj, function(x) {
  auc(x@x.values[[1]], x@y.values[[1]])
})

# Plot ROC curves
plot(roc_obj[[1]], col = "blue", main = "ROC Curves for Classes", xlab = "False Positive Rate", ylab = "True Positive Rate")
for (i in 2:length(roc_obj)) {
  lines(roc_obj[[i]], col = rainbow(length(roc_obj))[-1][i - 1])
}

# Print AUC scores
cat("AUC Scores:", auc_scores, "\n")

