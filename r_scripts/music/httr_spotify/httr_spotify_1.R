


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

client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")


# ===== Helper: Get fresh token =====
get_spotify_token <- function() {
  client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
  client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")
  
  if (client_id == "" || client_secret == "") {
    stop("Spotify Client ID/Secret not found. Set them in .Renviron.")
  }
  
  resp <- request("https://accounts.spotify.com/api/token") %>%
    req_auth_basic(client_id, client_secret) %>%
    req_body_form(grant_type = "client_credentials") %>%
    req_perform()
  
  resp %>% resp_body_json() %>% .$access_token
}

access_token <- get_spotify_token()

# ===== Helper: Perform GET request with token =====
spotify_get <- function(url, query = list()) {
  request(url) %>%
    req_headers(Authorization = paste("Bearer", access_token)) %>%
    req_url_query(!!!query) %>%
    req_perform() %>%
    resp_body_json()
}

# ===== Step 1: Get Artist ID for Sauti Sol =====
artist_id <- spotify_get(
  "https://api.spotify.com/v1/search",
  list(q = "Sauti Sol", type = "artist", limit = 1)
)$artists$items[[1]]$id

# ===== Step 2: Get Albums =====
albums_data <- spotify_get(
  paste0("https://api.spotify.com/v1/artists/", artist_id, "/albums"),
  list(include_groups = "album,single", limit = 50)
)

albums_df <- map_dfr(albums_data$items, function(a) {
  tibble(
    album_name = a$name,
    album_id = a$id,
    release_date = a$release_date,
    total_tracks = a$total_tracks
  )
})

# ===== Step 3: Get Tracks for each Album =====
get_album_tracks <- function(album_id) {
  tr <- spotify_get(
    paste0("https://api.spotify.com/v1/albums/", album_id, "/tracks")
  )
  map_dfr(tr$items, function(t) {
    tibble(track_name = t$name, track_id = t$id)
  })
}

tracks_df <- albums_df %>%
  mutate(tracks = map(album_id, get_album_tracks)) %>%
  unnest(tracks) %>%
  filter(!is.na(track_id) & track_id != "")

# ===== Step 4: Get Audio Features in batches =====
get_audio_features <- function(track_ids) {
  if (length(track_ids) == 0) return(tibble())
  # Batch into <= 100 IDs
  track_ids <- track_ids[!is.na(track_ids) & track_ids != ""]
  resp <- spotify_get(
    "https://api.spotify.com/v1/audio-features",
    list(ids = paste(track_ids, collapse = ","))
  )
  bind_rows(resp$audio_features)
}

audio_features_df <- tracks_df %>%
  mutate(batch = ceiling(row_number() / 100)) %>%
  group_by(batch) %>%
  summarise(features = list(get_audio_features(track_id)), .groups = "drop") %>%
  unnest(features)

# ===== Step 5: Merge Track Info with Features =====
final_df <- tracks_df %>%
  left_join(audio_features_df, by = c("track_id" = "id"))

# ===== Example Output =====
final_df %>%
  select(track_name, album_name, danceability, energy, tempo, valence) %>%
  arrange(desc(danceability))
