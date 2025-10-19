# Load required libraries
library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)

# Read the CSV file
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsia.csv", header = TRUE)

# Select the columns for clustering
selected_features <- cricket_data[, c("NAME", "RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES")]

# Remove the player names for clustering
features_for_clustering <- selected_features[, -1]

# Standardize the data
scaled_features <- scale(features_for_clustering)

# Determine the optimal number of clusters using the Elbow method
wss <- vector()
for (i in 1:10) {
  kmeans_model <- kmeans(scaled_features, centers = i)
  wss[i] <- kmeans_model$tot.withinss
}
	
# Plot the Elbow method to find the optimal number of clusters
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")

# Based on the Elbow plot, determine the optimal number of clusters
# Let's say the optimal number is 3, you can adjust this based on the plot
optimal_clusters <- 3

# Perform K-Means clustering
kmeans_result <- kmeans(scaled_features, centers = optimal_clusters)

# Add cluster assignment to the original data
clustered_data <- selected_features
clustered_data$Cluster <- kmeans_result$cluster

# Plot the clusters using a scatter plot
fviz_cluster(kmeans_result, data = scaled_features, geom = "point",
             ellipse.type = "convex", ellipse = TRUE,
             main = "K-Means Clustering of Cricket Players")

# Silhouette plot
silhouette_plot <- silhouette(kmeans_result$cluster, dist(scaled_features))
plot(silhouette_plot, col = 1:optimal_clusters, border = NA)

#2) For Bowlers

# Load required libraries
library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)

# Read the CSV file
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsia.csv", header = TRUE)

# Select the columns for clustering
selected_features <- cricket_data[, c("NAME", "WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]

# Remove the player names for clustering
features_for_clustering <- selected_features[, -1]

# Standardize the data
scaled_features <- scale(features_for_clustering)

# Determine the optimal number of clusters using the Elbow method
wss <- vector()
for (i in 1:10) {
  kmeans_model <- kmeans(scaled_features, centers = i)
  wss[i] <- kmeans_model$tot.withinss
}
	
# Plot the Elbow method to find the optimal number of clusters
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")

# Based on the Elbow plot, determine the optimal number of clusters
# Let's say the optimal number is 3, you can adjust this based on the plot
optimal_clusters <- 3

# Perform K-Means clustering
kmeans_result <- kmeans(scaled_features, centers = optimal_clusters)

# Add cluster assignment to the original data
clustered_data <- selected_features
clustered_data$Cluster <- kmeans_result$cluster

# Plot the clusters using a scatter plot
fviz_cluster(kmeans_result, data = scaled_features, geom = "point",
             ellipse.type = "convex", ellipse = TRUE,
             main = "K-Means Clustering of Cricket Players")

# Silhouette plot
silhouette_plot <- silhouette(kmeans_result$cluster, dist(scaled_features))
plot(silhouette_plot, col = 1:optimal_clusters, border = NA)


#3) For All Rounders

# Load required libraries
library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)

# Read the CSV file
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenAsia.csv", header = TRUE)

# Select the columns for clustering
selected_features <- cricket_data[, c("NAME","RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES", "WICKETS", "BOWLINGSTRIKERATE", "BOWLINGAVG", "BOWLINGINNINGS", "ECONOMY", "BOWLINGDOTPERCENTAGE")]

# Remove the player names for clustering
features_for_clustering <- selected_features[, -1]

# Standardize the data
scaled_features <- scale(features_for_clustering)

# Determine the optimal number of clusters using the Elbow method
wss <- vector()
for (i in 1:10) {
  kmeans_model <- kmeans(scaled_features, centers = i)
  wss[i] <- kmeans_model$tot.withinss
}
	
# Plot the Elbow method to find the optimal number of clusters
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")

# Based on the Elbow plot, determine the optimal number of clusters
# Let's say the optimal number is 3, you can adjust this based on the plot
optimal_clusters <- 3

# Perform K-Means clustering
kmeans_result <- kmeans(scaled_features, centers = optimal_clusters)

# Add cluster assignment to the original data
clustered_data <- selected_features
clustered_data$Cluster <- kmeans_result$cluster

# Plot the clusters using a scatter plot
fviz_cluster(kmeans_result, data = scaled_features, geom = "point",
             ellipse.type = "convex", ellipse = TRUE,
             main = "K-Means Clustering of Cricket Players")


# Silhouette plot
silhouette_plot <- silhouette(kmeans_result$cluster, dist(scaled_features))
plot(silhouette_plot, col = 1:optimal_clusters, border = NA)


