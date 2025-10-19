# Load required libraries
library(dplyr)
library(cluster)
library(factoextra)
library(ggplot2)

# Read the CSV file
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\MenbatsmansAsia.csv", header = TRUE)

# Select the columns for clustering
features <- cricket_data[, c("RUNS", "STRIKERATE", "AVG", "INNINGS", "FOURS", "SIXES", "DOTPERCENTAGE", "HUNDREDS", "FIFTIES")]

# Perform scaling on the features
scaled_features <- scale(features)

# Determine the optimal number of clusters using the Elbow method
wss <- c()
for (i in 1:10) {
  kmeans_result <- kmeans(scaled_features, centers = i)
  wss[i] <- kmeans_result$tot.withinss
}

# Plot the Elbow method to choose the optimal number of clusters
plot(1:10, wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")
abline(v = which.min(wss), col = "red", lty = 2)

# Choose the optimal number of clusters (e.g., let's say it's 4 based on the Elbow plot)
optimal_k <- 4

# Perform K-Means clustering
kmeans_result <- kmeans(scaled_features, centers = optimal_k)

# Add cluster assignments to the original data
cricket_data$Cluster <- as.factor(kmeans_result$cluster)

# Scatter plot
plot_data <- as.data.frame(cbind(Player = cricket_data$NAME, Cluster = cricket_data$Cluster))
plot_data$Cluster <- as.factor(plot_data$Cluster)
plot_data$Player <- as.character(plot_data$Player)

# Scatter plot
plot_data %>% 
  ggplot(aes(x = Player, y = Cluster, color = Cluster)) +
  geom_point(size = 3) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Player", y = "Cluster") +
  ggtitle("K-Means Clustering of Cricket Players") +
  scale_color_discrete(name = "Cluster")

# Silhouette plot
silhouette <- silhouette(kmeans_result$cluster, dist(scaled_features))
fviz_silhouette(silhouette)

# Interpretation:
# - The scatter plot shows how players are grouped into clusters based on their cricket statistics.
# - Each point on the scatter plot represents a player, and the color indicates the cluster.
# - Players in the same cluster are similar in terms of their cricket statistics.
# - Silhouette plot measures the quality of the clustering. Higher silhouette values indicate better separation between clusters.
# - Interpret the silhouette plot: Higher average silhouette width suggests that the clusters are well-separated.
