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

# Test on real data
data <- read.csv("data/raw_data/raw_data.csv")

# Test if there are entries that have no bias type
bias_columns <- c("AGE_BIAS", "RACE_BIAS", "RELIGION_BIAS", 
                  "ETHNICITY_BIAS", "SEXUAL_ORIENTATION_BIAS", 
                  "GENDER_BIAS", "LANGUAGE_BIAS", "MENTAL_OR_PHYSICAL_DISABILITY")

# Use `apply` to check if all bias columns are "None" or "No"
data <- data %>%
  mutate(all_bias_none_or_no = apply(select(., all_of(bias_columns)), 1, 
                                     function(x) all(x %in% c("None", "No"))))
print(sum(data$all_bias_none_or_no))

# Test if there's entry with NA LOCATION_TYPE
num_na_location <- sum(is.na(data$LOCATION_TYPE))
print(num_na_location)


