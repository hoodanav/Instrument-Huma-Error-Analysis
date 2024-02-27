#### Preamble ####
# Purpose: Cleans the simulated data we created 
# Author: Navya Hooda
# Date: Feb 26, 2024
# Contact: navya.hooda@mail.utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)

# Read in the simulated dataset
simulated_data <- read.csv("Human-Data-Errors-Simulation/outputs/data/simulated_data.csv")

# Apply the cleaning process to the simulated dataset
cleaned_data <- simulated_data


# Change half of the negative values to positive
neg_indices_cleaned <- which(cleaned_data < 0)
neg_indices_sampled <- sample(neg_indices_cleaned, size = length(neg_indices_cleaned) / 2)
cleaned_data[neg_indices_sampled, ] <- abs(cleaned_data[neg_indices_sampled, ])

# Change decimal place for values between 1 and 1.1
# Change decimal place for values between 1 and 1.1
dec_indices_cleaned <- (cleaned_data >= 1) & (cleaned_data <= 1.1)
cleaned_data[dec_indices_cleaned] <- cleaned_data[dec_indices_cleaned] - 1 + 0.1


# Calculate mean of cleaned dataset
mean_cleaned <- mean(cleaned_data)

# Determine if mean is greater than 0
is_mean_greater_than_zero <- mean_cleaned > 0

print(paste("Mean of cleaned dataset:", mean_cleaned))
print(paste("Is the mean greater than 0?", is_mean_greater_than_zero))

# Save cleaned dataset as CSV
write.csv(cleaned_data, "Human-Data-Errors-Simulation/outputs/data/cleaned_data.csv", row.names = FALSE)
