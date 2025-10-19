library(e1071)
library(ggplot2)

odi_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Men.csv")

set.seed(123)  # For reproducibility
train_index <- sample(1:nrow(odi_data), 0.7 * nrow(odi_data)) # 70% for training
train_data <- odi_data[train_index, ]
test_data <- odi_data[-train_index, ]

svm_model <- svm(RUNS ~ AVG + STRIKERATE + FOURS + SIXES + DOTPERCENTAGE, data = train_data, kernel = "linear", cost = 1)

predictions <- predict(svm_model, newdata = test_data)
predictions

accuracy <- sum(predictions == test_data$RUNS) / nrow(test_data)
accuracy
print(paste("Accuracy:", accuracy))

library(ggplot2)

ggplot(odi_data, aes(x = NAME, y = RUNS)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Runs Scored by Men's ODI Cricket Players", x = "Player Name", y = "Runs")