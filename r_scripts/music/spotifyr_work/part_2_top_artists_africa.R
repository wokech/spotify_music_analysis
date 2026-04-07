# Music Analysis with Spotify (Africa) - Part 2

# Data: SongStats / SocialBlade / Soundcharts

library(spotifyr)
library(purrr)
library(dplyr)
library(tidyverse)
library(readxl)
library(writexl)
library(janitor)

# Load and merge the required datasets

# top_artists_africa_spotify_data_apr_2026 <- read_excel("saved_data/top_artists_africa_spotify_data_apr_2026.xlsx") %>%
#   clean_names()
# top_artist_africa_metrics_1_apr_2026 <- read_excel("saved_data/top_artist_africa_metrics_1_apr_2026.xlsx") %>%
#   clean_names()

# africa_music_data_apr_2026 <- top_artists_africa_spotify_data_apr_2026 |>
#   inner_join(top_artist_africa_metrics_1_apr_2026)

# write_xlsx(africa_music_data_apr_2026, "saved_data/africa_music_data_apr_2026.xlsx")

# Load merged data

africa_music_data_apr_2026 <- read_xlsx("saved_data/africa_music_data_apr_2026.xlsx")



