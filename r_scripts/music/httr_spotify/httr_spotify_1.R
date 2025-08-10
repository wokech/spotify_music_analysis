


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

# # Create/Edit the .Renviron
# 
# Sys.setenv(R_ENVIRON_USER = "C:/R_Files/.Renviron")
# 
# #edit_r_environ()
# 
# client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
# client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")

token_resp <- request("https://accounts.spotify.com/api/token") %>%
  req_auth_basic(client_id, client_secret) %>%
  req_body_form(grant_type = "client_credentials") %>%
  req_perform()

access_token <- token_resp %>%
  resp_body_json() %>%
  .$access_token


artist_resp <- request("https://api.spotify.com/v1/search") %>%
  req_headers(Authorization = paste("Bearer", access_token)) %>%
  req_url_query(q = "Sauti Sol", type = "artist", limit = 1) %>%
  req_perform()

artist_data <- artist_resp %>% resp_body_json()
artist_id <- artist_data$artists$items[[1]]$id
artist_id


albums_resp <- request(paste0("https://api.spotify.com/v1/artists/", artist_id, "/albums")) %>%
  req_headers(Authorization = paste("Bearer", access_token)) %>%
  req_url_query(include_groups = "album,single", limit = 50) %>%
  req_perform()

albums_data <- albums_resp %>% resp_body_json()

albums_df <- map_dfr(albums_data$items, function(a) {
  tibble(
    album_name = a$name,
    album_id = a$id,
    release_date = a$release_date,
    total_tracks = a$total_tracks
  )
})
albums_df


get_album_tracks <- function(album_id) {
  resp <- request(paste0("https://api.spotify.com/v1/albums/", album_id, "/tracks")) %>%
    req_headers(Authorization = paste("Bearer", access_token)) %>%
    req_perform()
  
  tracks <- resp %>% resp_body_json()
  
  map_dfr(tracks$items, function(t) {
    tibble(track_name = t$name, track_id = t$id)
  })
}

tracks_df <- albums_df %>%
  mutate(tracks = map(album_id, get_album_tracks)) %>%
  unnest(tracks)

tracks_df


get_audio_features <- function(track_ids) {
  # Spotify API allows up to 100 IDs at once
  resp <- request("https://api.spotify.com/v1/audio-features") %>%
    req_headers(Authorization = paste("Bearer", access_token)) %>%
    req_url_query(ids = paste(track_ids, collapse = ",")) %>%
    req_perform()
  
  features <- resp %>% resp_body_json()
  bind_rows(features$audio_features)
}

audio_features_df <- tracks_df %>%
  mutate(batch = ceiling(row_number() / 100)) %>%
  group_by(batch) %>%
  summarise(features = list(get_audio_features(track_id)), .groups = "drop") %>%
  unnest(features)

audio_features_df


final_df <- tracks_df %>%
  left_join(audio_features_df, by = c("track_id" = "id"))

final_df %>%
  select(track_name, album_name, danceability, energy, tempo, valence) %>%
  arrange(desc(danceability))


