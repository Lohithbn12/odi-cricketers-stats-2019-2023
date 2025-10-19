library(dendextend)
library(ggplot2)
library(factoextra)
library(cluster)

cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Asia.csv", header = TRUE)

selected_features <- cricket_data[, c("RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES")]

# Standardize the features
scaled_features <- scale(selected_features)

# Hierarchical clustering
dist_matrix <- dist(scaled_features, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Create a dendrogram
dend <- as.dendrogram(hc)

# Plot the dendrogram in a rectangle form
dend %>% 
  set("branches_k_color", k = 4) %>% # You can change the number of clusters (k) as needed
  plot(main = "Dendrogram of Cricket Players")

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_features, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")

#2) For Bowlers

library(dendextend)
library(ggplot2)
library(factoextra)
library(cluster)

cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Asia.csv", header = TRUE)

selected_features <- cricket_data[, c("WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]

# Standardize the features
scaled_features <- scale(selected_features)

# Hierarchical clustering
dist_matrix <- dist(scaled_features, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Create a dendrogram
dend <- as.dendrogram(hc)

# Plot the dendrogram in a rectangle form
dend %>% 
  set("branches_k_color", k = 4) %>% # You can change the number of clusters (k) as needed
  plot(main = "Dendrogram of Cricket Players")

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_features, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")

#3) For All-Rounders
library(dendextend)
library(ggplot2)
library(factoextra)
library(cluster)

cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\Asia.csv", header = TRUE)

selected_features <- cricket_data[, c("RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES","WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]

# Standardize the features
scaled_features <- scale(selected_features)

# Hierarchical clustering
dist_matrix <- dist(scaled_features, method = "euclidean")
hc <- hclust(dist_matrix, method = "ward.D2")

# Create a dendrogram
dend <- as.dendrogram(hc)

# Plot the dendrogram in a rectangle form
dend %>% 
  set("branches_k_color", k = 4) %>% # You can change the number of clusters (k) as needed
  plot(main = "Dendrogram of Cricket Players")

# Calculate gap statistic using k-means clustering
gap_stat <- clusGap(scaled_features, FUN = kmeans, K.max = 10, B = 100)

# Plot the gap statistic
plot(gap_stat, main = "Gap Statistic Plot for Cricket Player Clustering")
