# Load required packages
library(stats)

# Load your data (replace 'your_data.csv' with your actual data file)
cricket_data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\WomenCluster.csv")

# Columns to include in the MANOVA analysis
variables <- c("RUNS", "AVG", "STRIKERATE", "WICKETS", "BOWLINGAVG", "BOWLINGSTRIKERATE", "BOWLINGDOTPERCENTAGE", "CATCHES")

# Perform MANOVA
manova_result <- manova(as.matrix(cricket_data[, variables]) ~ COUNTRY, data = cricket_data)
manova_result


# Perform one-way ANOVA
anova_result <- aov(WICKETS ~ COUNTRY, data = cricket_data)

# Summarize ANOVA results
summary(anova_result)