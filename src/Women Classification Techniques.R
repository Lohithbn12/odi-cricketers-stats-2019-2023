#Classification Machine Learning Techniques
#1)Random Forest
library(randomForest)
# Load the dataset
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project Work\\Womendata.csv")

# Explore the dataset (optional)
head(cricket_data)

# Splitting the dataset into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- sample(nrow(cricket_data), 0.7 * nrow(cricket_data))
train_data <- cricket_data[train_indices, ]
test_data <- cricket_data[-train_indices, ]
test_data

# Define the Random Forest model
rf_model <- randomForest(
  PLAYERTYPE ~  RUNS + AVG + STRIKERATE + WICKETS + BOWLINGAVG +  BOWLINGSTRIKERATE + CATCHES, 
   data = train_data,
  ntree = 500,          # Number of trees in the forest
  mtry = 3,             # Number of variables randomly sampled as candidates at each split
  importance = TRUE     # Calculate variable importance
)

# View the summary of the Random Forest model
print(rf_model)

# Make predictions on the test set
predictions <- predict(rf_model, newdata = test_data)
predictions

# Evaluate the model's performance
confusion_matrix <- table(predictions, test_data$PLAYERTYPE)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", accuracy))

#2)Multinomial logistic regression 

# Load required libraries
library(dplyr)
library(nnet)
install.packages("ROCR")
library(ROCR)
library(caret)


# Define predictor variables (features) and target variable (label)
predictors <- cricket_data[, c("RUNS", "AVG", "STRIKERATE", "WICKETS", "BOWLINGAVG", "CATCHES")]
target <- cricket_data$PLAYERTYPE

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
predicted_labels1 <- predict(model, newdata = test_data)

# Calculate accuracy
accuracy1 <- mean(predicted_labels1 == test_labels)
accuracy1
cat("Accuracy:", accuracy1, "\n")

# Create confusion matrix
conf_matrix1 <- table(predicted_labels, test_labels)
cat("Confusion Matrix:\n", conf_matrix1, "\n")

#3)Neural Networks
# Load required libraries
library(neuralnet)
library(dplyr)

# Preprocessing: normalize the features
data <- cricket_data 
  
# Define the target categories as numeric labels
# 1: Batsman, 2: Bowler, 3: All-rounder
data$player_type <- as.numeric(factor(data$PLAYERTYPE))

# Split the data into training and testing sets
set.seed(123)
split_index <- sample(1:nrow(data), nrow(data) * 0.8)
train_data <- data[split_index, ]
test_data <- data[-split_index, ]

# Define the neural network model
nn_model <- neuralnet(
  PLAYERTYPE ~ RUNS + AVG + STRIKERATE + WICKETS + BOWLINGAVG + CATCHES,
  data = train_data,
  hidden = c(5, 3),  # You can adjust the hidden layer sizes
  linear.output = FALSE
)

# Make predictions on the test data
predictions <- predict(nn_model, test_data)
predicted_labels2 <- apply(predictions, 1, which.max)

# Evaluate the accuracy
true_labels <- test_data$player_type
accuracy2 <- sum(predicted_labels2 == true_labels) / length(true_labels)
cat("Accuracy2:", accuracy2, "\n")

#4) SVM

# Load the necessary library
library(e1071)

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
predictions3 <- predict(svm_model, test_features)

# Evaluate the accuracy
accuracy3 <- sum(predictions3 == test_labels) / length(test_labels)
cat("Accuracy3:", accuracy)


#5)
# Load required library
library(MASS)

data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project Work\\Womendata.csv")


# Assuming your dataset has columns: runs, batting_avg, strike_rate, wickets, bowling_avg, catches
# You might have more columns depending on your dataset

# Define the features and target variable
features <- data[, c("RUNS", "AVG", "STRIKERATE", "WICKETS", "BOWLINGAVG", "CATCHES")]
target <- data$PLAYERTYPE # Assuming you have a 'player_type' column with values like 'batsman', 'bowler', 'all-rounder'

# Perform Linear Discriminant Analysis (LDA)
lda_model <- lda(features, target)

# Make predictions using the LDA model
predictions4 <- predict(lda_model, features)

# Print the confusion matrix to evaluate the classification performance
confusion_matrix4 <- table(predictions4$class, target)
print(confusion_matrix4)

# You can also use the confusion matrix to calculate accuracy, precision, recall, etc.
accuracy4 <- sum(diag(confusion_matrix4)) / sum(confusion_matrix4)
print(paste("Accuracy:", accuracy4))
