# Load required libraries
library(dplyr)
library(stats)
library(FactoMineR)
library(vegan)

# Load the data
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Asia.csv")

# Load required libraries
library(dplyr)
library(FactoMineR)
library(vegan)

# Extract the relevant columns for analysis
features <- data[, c("RUNS", "AVG", "STRIKERATE", "BOWLINGAVG", "BOWLINGSTRIKERATE", "BOWLINGDOTPERCENTAGE", "CATCHES")]

# Perform PCA for feature reduction
pca_result <- PCA(features, graph = FALSE)

# Extract the first two principal components
reduced_features <- pca_result$ind$coord[, c(1, 2)]

# Add back player and country information to the reduced features
reduced_data <- cbind(data[, c("NAME", "COUNTRY")], reduced_features)

# Perform MANOVA using vegan package
manova_result <- adonis2(features ~ COUNTRY, data = reduced_data)

# Print the MANOVA results
print(manova_result)

# Plot the reduced features
plot(reduced_features, col = as.integer(reduced_data$COUNTRY), pch = 19, xlab = "PC1", ylab = "PC2")
legend("topright", legend = unique(reduced_data$Country), col = 1:length(unique(reduced_data$Country)), pch = 19)








