#### Preamble ####
# Purpose: Tests for Marriage Lisence data
# Author: Ziqi Zhu
# Date: 19 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None


#### Workspace setup ####

#### Test data ####
data <- read.csv("data/raw_data/simulated.csv")

# Test for negative numbers
data$HateCrimes |> min() >= 0

# Test for NAs
all(is.na(data$HateCrimes))
