# Replace 'your_data.csv' with the actual file path
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Womendata.csv")
data
library(randomForest)

# Assuming 'target_variable' is the target variable you're trying to predict
target_variable <- data$PLAYERTYPE

# Selecting features for analysis
features <- data[, c('INNINGS', 'RUNS','OUTS', 'BALLSFACED','STRIKERATE','HIGHEST.SCORE','FIFTIES','HUNDREDS','FOURS','SIXES','DOTPERCENTAGE','WICKETS','ECONOMY','BOWLINGAVG','BOWLINGSTRIKERATE','BOWLINGDOTPERCENTAGE','CATCHES')]

# Fit a Random Forest model
rf_model <- randomForest(features, target_variable, ntree = 100)
rf_model

# Extract feature importance scores
feature_importance <- rf_model$importance
feature_importance

# Plot feature importance
varImpPlot(rf_model, main = "Random Forest Feature Importance")
