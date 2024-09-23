#### Preamble ####
# Purpose: Tests for Marriage Lisence data
# Author: Ziqi Zhu
# Date: 19 September 2024
# Contact: ziqi.zhu@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####
data <- read.csv("data/raw_data/simulate.csv")

# Test for negative numbers
data$number_of_marriage |> min() <= 0

# Test for NAs
all(is.na(data$number_of_marriage))
