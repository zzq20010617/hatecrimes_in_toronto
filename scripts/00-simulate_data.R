#### Preamble ####
# Purpose: Simulates number of hate crime happen for each month from 2018-2023
# Author: Ziqi Zhu
# Date: 22 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None


#### Workspace setup ####

#### Simulate data ####

# Set seed for reproducibility
set.seed(617)

# Define the time period (months from 2018 to 2023)
start_year <- 2018
end_year <- 2023
dates <- seq(as.Date(paste(start_year, "01-01", sep = "-")), as.Date(paste(end_year, "12-31", sep = "-")), by = "month")

# Define the average number of hate crimes per month (lambda for Poisson distribution)
# You can adjust the lambda to simulate more or fewer crimes
lambda <- 5  # average number of crimes per month

# Simulate the number of hate crimes per month using Poisson distribution
hate_crimes <- rpois(length(dates), lambda)

# Create a data frame to store the results
simulated_data <- data.frame(
  Month = format(dates, "%Y-%m"),  # Extract year-month for easier reading
  HateCrimes = hate_crimes
)

#write csv
write.csv(simulated_data, "data/raw_data/simulated.csv", row.names = FALSE)

