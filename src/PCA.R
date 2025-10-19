library(tidyverse)
female_data =read.csv("C:\\Users\\lohithlikith\\Downloads\\women.csv")
male_data=read.csv("C:\\Users\\lohithlikith\\Downloads\\Men.csv")

# Preprocess data
data_scaled <- scale(male_data)

# Apply PCA
pca_results <- prcomp(data_scaled)

# Print summary of PCA results
summary(pca_results)