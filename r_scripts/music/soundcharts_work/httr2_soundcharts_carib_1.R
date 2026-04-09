# Using httr2 to extract data from Soundcharts API - Africa

# Load packages and libraries

# install.packages("httr2")
# install.packages("dplyr")
# install.packages("purrr")
# install.packages("jsonlite")
# install.packages("usethis")

library(httr2)
library(dplyr)
library(purrr)
library(jsonlite)
library(usethis)
library(tidyverse)

# Create/Edit the .Renviron
# edit_r_environ()

client_id <- Sys.getenv("SOUNDCHARTS_CLIENT_ID")
client_secret <- Sys.getenv("SOUNDCHARTS_CLIENT_SECRET")

# 1) Sofiya - Nzau Mwaki

# Create and perform the request 
response <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/NLRD52339318") %>%
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) %>%
  req_perform()

# Parse the JSON response
data <- response %>% 
  resp_body_json()

# Get audio details

audio_features <- data$object$audio

as_tibble(audio_features)


