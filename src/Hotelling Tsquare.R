

# Load the data
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Aus&NZ.csv")

# Load required libraries
library(readr)
library(dplyr)
library(FactoMineR)
library(Hotelling)

# Read the CSV file
cricket_data <- read_csv("men_odi_cricket_data.csv")

# Select relevant columns
selected_features <- cricket_data %>%
  select(COUNTRY, RUNS, AVG, STRIKERATE, BOWLINGAVG, BOWLINGSTRIKERATE, BOWLINGDOTPERCENTAGE, CATCHES)

# Remove rows with missing values
selected_features <- na.omit(selected_features)

# Perform PCA for feature reduction
pca_result <- PCA(selected_features[, -1], graph = FALSE)

# Access the reduced features from PCA
reduced_features <- as.data.frame(pca_result$ind$coord[, 1:2])  # Use the first two principal components

# Combine the reduced features with the 'Country' column
reduced_features <- cbind(Country = selected_features$Country, reduced_features)

# Perform Hotelling T^2 test
countries <- unique(reduced_features$Country)
hotelling_results <- data.frame()

for (country in countries) {
  country_data <- reduced_features %>%
    filter(Country == country)
  
  hotelling_test <- hotelling.test(country_data[, -1])
  hotelling_results <- rbind(hotelling_results, data.frame(Country = country, hotelling_test))
}

# Interpretation
threshold <- qf(0.95, 2, nrow(selected_features) - 1)  # 95% confidence level

significant_countries <- hotelling_results %>%
  filter(p.value < threshold)

cat("Significantly different countries based on Hotelling T^2 test:")
print(significant_countries$Country)
