# Load required packages
library(stats)

# Load your data (replace 'your_data.csv' with your actual data file)
data <- read.csv("C:\\Users\\lohithlikith\\Documents\\Lohith B N\\Project work\\MenCluster.csv")

# Perform MANOVA
features <- c("RUNS", "AVG", "STRIKERATE", "BOWLINGAVG", "BOWLINGSTRIKERATE", "BOWLINGDOTPERCENTAGE", "Catches")
manova_result <- manova(cbind(RUNS, AVG, `STRIKERATE`, `BOWLINGAVG`, `BOWLINGSTRIKERATE`, `BOWLINGDOTPERCENTAGE , CATCHES) ~ COUNTRY, data = data)

# Print MANOVA summary
summary(manova_result, test = "Wilks")

# Post-hoc pairwise comparisons (Tukey's HSD)
posthoc_result <- TukeyHSD(manova_result, "Country")
print(posthoc_result)
