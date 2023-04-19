# Exploring the Spotify API with R
# By Mia Smith (https://msmith7161.github.io/what-is-speechiness/)

library(dplyr)
library(spotifyr)
library(plotly)
library(ggplot2)

# 1st get a Spotify API Key
# 2nd create a client ID and Secret

######## THIS IS THE BEST WAY TO IMPLEMENT THE SPOTIFY R ##########

id <- ''
secret <- ''
Sys.setenv(SPOTIFY_CLIENT_ID = id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
access_token <- get_spotify_access_token()

# In this study we will compare the Top 50 playlist 
# from four different countries (Taiwan, France, Bolivia, and the U.S.)

# Manually added the songs from the four Top 50 playlists to 
# new playlists in my own account

# Use the get_user_playlists, get_playlist_tracks, 
# and get_track_audio_features functions and your own Spotify id 
# to retrieve data about all the songs on the playlists

my_id <- 'wokech'
my_plists <- get_user_playlists(my_id)

my_plists2 <- my_plists %>%
  filter(playlist_name %in% c('Taiwan Top 50', 'France Top 50', 'Bolivia Top 50', 'U.S. Top 50'))

tracks <- get_playlist_tracks(my_plists2)
features <- get_track_audio_features(tracks)

# Do a left_join to join the two tables (playlist tracks and track features) 
# by the "track_uri" column

tracks2 <- tracks%>%
  left_join(features, by="track_uri")



