# Load necessary libraries
library(randomForest)
library(pROC)

# Read in the data
data = read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Mentoss.csv")

# Split the data into training and test sets
set.seed(123)
train_index <- sample(nrow(data), 0.7*nrow(data))
train_data <- data[train_index,]
test_data <- data[-train_index,]

# Train the Random Forest model
rf_model <- randomForest(MATCHRESULT ~ TOSS + BATTINGFIRST + HOME, data=train_data, ntree=500)

# Make predictions on the test set
predictions <- predict(rf_model, test_data)

# Generate the ROC plot
roc_obj <- roc(test_data$MATCHRESULT, predictions)
plot(roc_obj)

#The interpretation of the ROC plot will depend on its shape. A ROC curve that lies close to the diagonal line indicates that the model is not performing well, while a curve that lies further away from the diagonal line indicates better performance. The area under the ROC curve (AUC) can also be used as a measure of model performance, with larger values indicating better performance.