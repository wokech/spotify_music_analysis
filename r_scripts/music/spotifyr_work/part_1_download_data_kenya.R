# Music Analysis with Spotify (Kenya)

# Part 1: Download the required datasets for analysis

# William Okech

# spotifyr
# https://www.rcharlie.com/spotifyr/
# https://rdrr.io/github/charlie86/spotifyr/

# 1) Load the required packages

#install.packages('spotifyr')
library(spotifyr)
library(tidyverse)
library(knitr)
library(lubridate)
#install.packages("ggjoy")
library(ggjoy) #ggjoy has been deprecated for ggridges
library(ggridges)

# 2) Authentication

############## KEEP SECRET ###########################
# Stored in Renviron
Sys.getenv("SPOTIFY_CLIENT_ID")
Sys.getenv("SPOTIFY_CLIENT_SECRET")

######################################################

access_token <- get_spotify_access_token()

############## KEEP SECRET ###########################

# 3) Identify the artists and get the artist audio features

###################################################################
###### Use the search_spotify() to get all the artist features ####
###################################################################

# Artists include:
# 1) Sauti Sol
# 2) Nviiri
# 3) Otile Brown
# 4) Nyashinski
# 5) Bensoul
# 6) Wakadinali
# 7) Buruklyn Boyz
# 8) H-Art The Band
# 9) Mejja
# 10) Khaligraph Jones

# a) Get the artist audio features for all ten musicians

#########GET ARTIST AUDIO FEATURES IS NO LONGER WORKING#############

# Then use the get_artist_audio_features() function defaults to "album" 
# so you might want to include "single."

# DATA IS STORED IN RDS

# sauti_sol_1 <- get_artist_audio_features('sauti sol', include_groups = c("single", "album"))
# nviiri_1 <- get_artist_audio_features('nviiri the storyteller', include_groups = c("single", "album"))
# otile_1 <- get_artist_audio_features('otile brown', include_groups = c("single", "album"))
# nyashinski_1 <- get_artist_audio_features('nyashinski', include_groups = c("single", "album"))
# bensoul_1 <- get_artist_audio_features('bensoul', include_groups = c("single", "album"))
# wakadinali_1 <- get_artist_audio_features('wakadinali', include_groups = c("single", "album"))
# buruklyn_boyz_1 <- get_artist_audio_features('buruklyn boyz', include_groups = c("single", "album"))
# h_art_the_band_1 <- get_artist_audio_features('h_art the band', include_groups = c("single", "album"))
# mejja_1 <- get_artist_audio_features('mejja', include_groups = c("single", "album"))
# khaligraph_jones_1 <- get_artist_audio_features('khaligraph jones', include_groups = c("single", "album"))

# Combine audio features dataframes

# combi_audio_features <- rbind(sauti_sol_1, nviiri_1, otile_1, nyashinski_1, bensoul_1,
#                              wakadinali_1, buruklyn_boyz_1, h_art_the_band_1, mejja_1, khaligraph_jones_1)

# Save the dataframe
# saveRDS(combi_audio_features, "saved_data/combi_audio_features_1.RDS")

# b) Get the artist's top tracks according to spotify

# DATA IS STORED IN RDS

# sauti_sol_2 <- get_artist_top_tracks('4Rj9lQm9oSiMlirgpsM6eo')
# nviiri_2 <- get_artist_top_tracks('7xPDTxQrpZPvvI0LzuO73p')
# otile_2 <- get_artist_top_tracks('25txWhgJAzekbAaHuDzmwj')
# nyashinski_2 <- get_artist_top_tracks('7KY9NaOVRmptl8vlpVomi6')
# bensoul_2 <- get_artist_top_tracks('09vo12hHajgG2cZzq0rGmE')
# wakadinali_2 <- get_artist_top_tracks('10jefIr7Jj7c0dDJEqRcWK')
# buruklyn_boyz_2 <- get_artist_top_tracks('00WWkvpiOhhZNlk2KTqYhX')
# h_art_the_band_2 <- get_artist_top_tracks('0m6SCIzf7kP9iylizWmIp1')
# mejja_2 <- get_artist_top_tracks('5VnDOE1MEaJ0VOgSypOi3u')
# khaligraph_jones_2 <- get_artist_top_tracks('1xxXRVpuEm3X3p1QEm61Az')

# # Combine artist top tracks
# combi_artist_top_tracks <- rbind(sauti_sol_2, nviiri_2, otile_2, nyashinski_2, bensoul_2,
#                                  wakadinali_2, buruklyn_boyz_2, h_art_the_band_2, mejja_2, khaligraph_jones_2)

# # Save the dataframe
# saveRDS(combi_artist_top_tracks, "saved_data/combi_artist_top_tracks_1.RDS")

# c) Get the artist albums
# When you use get_artist() it gives a list but get_artists provides a dataframe
# with 1 observation

# sauti_sol_3 <- get_artists('4Rj9lQm9oSiMlirgpsM6eo')
# nviiri_3 <- get_artists('7xPDTxQrpZPvvI0LzuO73p')
# otile_3 <- get_artists('25txWhgJAzekbAaHuDzmwj')
# nyashinski_3 <- get_artists('7KY9NaOVRmptl8vlpVomi6')
# bensoul_3 <- get_artists('09vo12hHajgG2cZzq0rGmE')
# wakadinali_3 <- get_artists('10jefIr7Jj7c0dDJEqRcWK')
# buruklyn_boyz_3 <- get_artists('00WWkvpiOhhZNlk2KTqYhX')
# h_art_the_band_3 <- get_artists('0m6SCIzf7kP9iylizWmIp1')
# mejja_3 <- get_artists('5VnDOE1MEaJ0VOgSypOi3u')
# khaligraph_jones_3 <- get_artists('1xxXRVpuEm3X3p1QEm61Az')

# Combine artist albums and followers
# combi_artist_album_follower <- rbind(sauti_sol_3, nviiri_3, otile_3, nyashinski_3, bensoul_3,
#                                  wakadinali_3, buruklyn_boyz_3, h_art_the_band_3, mejja_3, khaligraph_jones_3)

# Save the dataframe
# saveRDS(combi_artist_album_follower, "saved_data/combi_artist_album_follower_1.RDS")