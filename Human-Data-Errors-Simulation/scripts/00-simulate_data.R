set.seed(42)

# Step 1: Simulate the initial 900 observations
n_obs_initial <- 900
data_initial <- rnorm(n_obs_initial, mean = 1, sd = 1)

# Step 2: Repeat the first 100 observations to get a total of 1000 observations
n_repeat <- 1000 - n_obs_initial
data <- c(data_initial, rep(data_initial[1:100], times = n_repeat / 100))

# Save simulated dataset as CSV
simulated_data <- data.frame(data)
write.csv(simulated_data, "Human-Data-Errors-Simulation/outputs/data/simulated_data.csv", row.names = FALSE)

