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

# top_artists_carib_spotify_data_apr_2026 <- read_excel("saved_data/top_artists_carib_spotify_data_apr_2026.xlsx") |>
#   clean_names()
# top_artist_carib_metrics_1_apr_2026 <- read_excel("saved_data/top_artist_carib_metrics_1_apr_2026.xlsx") |>
#   clean_names()

# carib_music_data_apr_2026 <- top_artists_carib_spotify_data_apr_2026 |>
#   inner_join(top_artist_carib_metrics_1_apr_2026)

# write_xlsx(carib_music_data_apr_2026, "saved_data/carib_music_data_apr_2026.xlsx")

# Load merged data

carib_music_data_apr_2026 <- read_xlsx("saved_data/carib_music_data_apr_2026.xlsx")



