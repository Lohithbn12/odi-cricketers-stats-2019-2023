library(cricketr)
library(stats)

womenODI=read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WoMenCluster.csv")

womenODI <- as.data.frame(womenODI)

selected_data <- womenODI[, c("NAME", "AVG", "STRIKERATE")]

# Remove rows with missing values
selected_data <- na.omit(selected_data)

# Select only the numerical columns for clustering
num_data <- selected_data[, c("AVG","STRIKERATE")]

# Perform hierarchical clustering using complete linkage
hc <- hclust(dist(num_data), method = "complete")


# Plot the dendrogram
plot(hc, main = "Dendrogram for Men's ODI Players", xlab = "Players", sub = "", cex = 0.9)