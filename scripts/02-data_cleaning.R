#### Preamble ####
# Purpose: Cleans the raw plane data recorded
# Author: Ziqi Zhu
# Date: 19 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Extract year and month from the OCCURRENCE_DATE column
data <- raw_data %>%
  mutate(year_month = floor_date(OCCURRENCE_DATE, "month"))

# Count the total number of occurrences for each month
monthly_counts <- data %>%
  group_by(year_month) %>%
  summarise(total_occurrences = n())

# Select unique places from LOCATION_TYPE and count for each places
location_counts <- data %>%
  group_by(LOCATION_TYPE) %>%
  summarise(total_occurrences = n()) %>%
  arrange(desc(total_occurrences))

# Select all bias type columns for later use
bias_columns <- c("AGE_BIAS", "MENTAL_OR_PHYSICAL_DISABILITY", "RACE_BIAS", 
                  "ETHNICITY_BIAS", "LANGUAGE_BIAS", "RELIGION_BIAS", 
                  "SEXUAL_ORIENTATION_BIAS", "GENDER_BIAS")

# Create a new column for counting each bias, replacing 'None' with NA for easier processing
data_bias <- data %>%
  mutate(across(all_of(bias_columns), ~ ifelse(. %in% c("None", "NO"), NA, .)))

# Count the number of occurrences of each bias type of different years
bias_counts <- data_bias %>%
  group_by(OCCURRENCE_YEAR) %>%
  summarise(across(all_of(bias_columns), ~ sum(!is.na(.), na.rm = TRUE)))



#### Save data ####
write_csv(monthly_counts, "data/analysis_data/monthly_data.csv")
write_csv(location_counts, "data/analysis_data/location_data.csv")
write_csv(bias_counts, "data/analysis_data/bias_type_data.csv")
