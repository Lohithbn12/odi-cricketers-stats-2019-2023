# Load necessary libraries
library(neuralnet)
library(caret)

# Load your dataset (replace with your actual data loading code)
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project Work\\Men.csv")

# Preprocess the data (replace with your preprocessing code)
# Make sure to normalize/standardize the features

# Split the data into training and testing sets
set.seed(123)
splitIndex <- createDataPartition(data$PLAYERTYPE, p = 0.8, list = FALSE)
train_data <- data[splitIndex, ]
test_data <- data[-splitIndex, ]

# Define the neural network model
nn_model <- neuralnet(PLAYERTYPE ~ RUNS + AVG + STRIKERATE + WICKETS + BOWLINGAVG + CATCHES,
                      data = train_data,
                      hidden = c(5, 3), # Define the number of hidden layers and nodes
                      linear.output = FALSE) # We're performing classification

# Train the neural network
trained_nn <- train(nn_model)

# Predict using the trained model
predicted_labels <- predict(nn_model, test_data)
predicted_classes <- ifelse(predicted_labels > 0.5, "Batsman",
                            ifelse(predicted_labels < -0.5, "Bowler", "All-Rounder"))
predicted_classes



# Evaluate the model
conf_matrix <- confusionMatrix(predicted_classes, test_data$PLAYERTYPE)
accuracy <- conf_matrix$overall["Accuracy"]

# Print the confusion matrix and accuracy
print(conf_matrix)
print(paste("Accuracy:", accuracy))

