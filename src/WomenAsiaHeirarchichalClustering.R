
#1) For Batsmans
# Load required libraries
library(cluster)
library(factoextra)
library(dplyr)
library(dendextend)

# Load the dataset (replace 'your_data.csv' with the actual file path)
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsiaBatsmans.csv")

selected_data <- data[, c("NAME", "RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES")]

# Standardize the data
scaled_data <- scale(selected_data[, -1]) # Exclude the PlayerName column

# Perform hierarchical clustering using Ward's method
dist_matrix <- dist(scaled_data, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Plot the dendrogram with rectangle clusters
plot(hc, hang = -1, labels = data$NAME, main = "Hierarchical Clustering Dendrogram")
rect.hclust(hc, k = 5, border = "red") # Adjust k as needed

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_data, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")

#2) For Bowlers
# Load required libraries
library(cluster)
library(factoextra)
library(dplyr)
library(dendextend)

# Load the dataset (replace 'your_data.csv' with the actual file path)
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsiaBowlers.csv")

# Select relevant features for clustering
selected_data <- data[, c("NAME", "WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", 
                              "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]
# Standardize the data
scaled_data <- scale(selected_data[, -1]) # Exclude the PlayerName column

# Perform hierarchical clustering using Ward's method
dist_matrix <- dist(scaled_data, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Plot the dendrogram with rectangle clusters
plot(hc, hang = -1, labels = data$NAME, main = "Hierarchical Clustering Dendrogram")
rect.hclust(hc, k = 5, border = "red") # Adjust k as needed

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_data, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")

#3) For All rounders
# Load required libraries
library(cluster)
library(factoextra)
library(dplyr)
library(dendextend)

# Load the dataset (replace 'your_data.csv' with the actual file path)
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsiaAllRounders.csv")

# Select relevant features for clustering
selected_data <- data[, c("NAME", "RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES","WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", 
                              "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]
# Standardize the data
scaled_data <- scale(selected_data[, -1]) # Exclude the PlayerName column

# Perform hierarchical clustering using Ward's method
dist_matrix <- dist(scaled_data, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Plot the dendrogram with rectangle clusters
plot(hc, hang = -1, labels = data$NAME, main = "Hierarchical Clustering Dendrogram")
rect.hclust(hc, k = 5, border = "red") # Adjust k as needed

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_data, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")

