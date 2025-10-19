# Load necessary libraries
library(e1071)   # For SVM
library(caret)   # For data preprocessing

# Load the dataset

data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss.csv")



# Data preprocessing
# Convert categorical variables to factors
data$TOSS <- as.factor(data$TOSS)
data$BATTINGFIRST <- as.factor(data$BATTINGFIRST)
data$HOME <- as.factor(data$HOME)
data$MATCHRESULT <- as.factor(data$MATCHRESULT)

# Splitting the data into training and testing sets
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(data$MATCHRESULT, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Training the SVM model
svm_model <- svm(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = trainData)

# Making predictions on the test set
predictions <- predict(svm_model, newdata = testData)
predictions





# Load required libraries
library(e1071)
library(pROC)

# Read in the data
data <- read.csv("men_cricket_data.csv")

# Split the data into training and test sets
set.seed(123)
train_index <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train the SVM model
svm_model <- svm(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data = train_data, kernel = "radial")

# Make predictions on the test set
predictions <- predict(svm_model, test_data)
predictions

# Convert predictions to a numeric variable
predictions_numeric <- as.numeric(predictions)

# Generate a ROC plot using the numeric predictions
roc_obj <- roc(test_data$MATCHRESULT, predictions_numeric)
plot(roc_obj)





# Interpretation: The closer the ROC curve is to the top left corner of the plot, the better the model is at predicting the outcome of a cricket match.
