
library(dplyr)
library(ggplot2)

data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenCluster.csv")

num_clusters <- 3  # Change this value as per your required
features_for_clustering <- data %>% select(INNINGS,RUNS,OUTS,AVG,STRIKERATE,FIFTIES,HUNDREDS,FOURS,SIXES,DOTPERCENTAGE)

# Perform k-means clustering
kmeans_result <- kmeans(features_for_clustering, centers = num_clusters)

# Add cluster information back to the original dataset
data$Cluster <- kmeans_result$cluster

# Step 4: Create scatter plots
# Replace 'x_feature' and 'y_feature' with the features you want to plot on the x-axis and y-axis
x_feature <- "AVG"
y_feature <- "STRIKERATE"

# Create the scatter plot
ggplot(data, aes_string(x = x_feature, y = y_feature, color = "factor(Cluster)")) +
  geom_point(size=3) +
  labs(x = x_feature, y = y_feature, color = "Cluster") +
  theme_minimal()

# Interpretation : From the Scatter plot,We can see that the characteristics of each cluster to interpret the results. 
 you might find that one cluster represents high-performing players, another cluster might include moderate-performing players, 
and a third cluster could have lower-performing players in batting performance data

















