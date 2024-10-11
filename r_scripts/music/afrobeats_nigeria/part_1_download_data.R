# Music Analysis with Spotify
# Part 1: Download the required datasets for analysis
# Genre: Afrobeats / Nigeria
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

# 3) Analysis of musical features for 12 of the most popular Nigerian artists

# Artists include:
# 1) Rema
# 2) Burna Boy
# 3) CKay
# 4) Wizkid
# 5) Fireboy DML
# 6) Omah Lay
# 7) Ayra Starr
# 8) Asake
# 9) Tems
# 10) Yemi Alade
# 11) Davido
# 12) Mr Eazi
# 13) Ruger
# 14) Tiwa Savage
# 15) Joeboy
# 16) Kizz Daniel
# 17) Adekunle Gold
# 18) Patoranking
# 19) Pheelz
# 20) Olamide

# a) Get the artist audio features for all 20 musicians

# Use the search_spotify() to get all the artist features
# Then use the get_artist_audio_features() function defaults to "album" 
# so you might want to include "single."

# DATA IS STORED IN RDS

# rema_1 <- get_artist_audio_features('rema', include_groups = c("single", "album"))
# burna_boy_1 <- get_artist_audio_features('burna boy', include_groups = c("single", "album"))
# ckay_1 <- get_artist_audio_features('ckay', include_groups = c("single", "album"))
# wizkid_1 <- get_artist_audio_features('wizkid', include_groups = c("single", "album"))
# fireboy_1 <- get_artist_audio_features('fireboy dml', include_groups = c("single", "album"))
# omah_lay_1 <- get_artist_audio_features('omah lay', include_groups = c("single", "album"))
# ayra_starr_1 <- get_artist_audio_features('ayra starr', include_groups = c("single", "album"))
# asake_1 <- get_artist_audio_features('asake', include_groups = c("single", "album"))
# tems_1 <- get_artist_audio_features('tems', include_groups = c("single", "album"))
# yemi_alade_1 <- get_artist_audio_features('yemi alade', include_groups = c("single", "album"))
# davido_1 <- get_artist_audio_features('davido', include_groups = c("single", "album"))
# mr_eazi_1 <- get_artist_audio_features('mr eazi', include_groups = c("single", "album"))
# ruger_1 <- get_artist_audio_features('ruger', include_groups = c("single", "album"))
# tiwa_savage_1 <- get_artist_audio_features('tiwa savage', include_groups = c("single", "album"))
# joeboy_1 <- get_artist_audio_features('joeboy', include_groups = c("single", "album"))
# kizz_daniel_1 <- get_artist_audio_features('kizz daniel', include_groups = c("single", "album"))
# adekunle_gold_1 <- get_artist_audio_features('adekunle gold', include_groups = c("single", "album"))
# patoranking_1 <- get_artist_audio_features('patoranking', include_groups = c("single", "album"))
# pheelz_1 <- get_artist_audio_features('pheelz', include_groups = c("single", "album"))
# olamide_1 <- get_artist_audio_features('olamide', include_groups = c("single", "album"))

# # Combine audio features dataframes
# 
# combi_audio_features_naija <- rbind(rema_1, burna_boy_1, ckay_1, wizkid_1, fireboy_1,
#                               omah_lay_1, ayra_starr_1, asake_1, tems_1,
#                               yemi_alade_1, davido_1, mr_eazi_1,
#                               ruger_1, tiwa_savage_1, joeboy_1,
#                               kizz_daniel_1, adekunle_gold_1, patoranking_1,
#                               pheelz_1, olamide_1)
# 
# # Save the dataframe
# saveRDS(combi_audio_features_naija, "saved_data/combi_audio_features_naija.RDS")

# b) Get the 20 artist's top tracks according to spotify

# Artists include:
# 1) Rema
# 2) Burna Boy
# 3) CKay
# 4) Wizkid
# 5) Fireboy DML
# 6) Omah Lay
# 7) Ayra Starr
# 8) Asake
# 9) Tems
# 10) Yemi Alade
# 11) Davido
# 12) Mr Eazi
# 13) Ruger
# 14) Tiwa Savage
# 15) Joeboy
# 16) Kizz Daniel
# 17) Adekunle Gold
# 18) Patoranking
# 19) Pheelz
# 20) Olamide

# DATA IS STORED IN RDS

rema_2 <- get_artist_top_tracks('46pWGuE3dSwY3bMMXGBvVS')
burna_boy_2 <- get_artist_top_tracks('3wcj11K77LjEY1PkEazffa')
ckay_2 <- get_artist_top_tracks('048LktY5zMnakWq7PTtFrz')
wizkid_2 <- get_artist_top_tracks('3tVQdUvClmAT7URs9V3rsp')
fireboy_2 <- get_artist_top_tracks('75VKfyoBlkmrJFDqo1o2VY')
omah_lay_2 <- get_artist_top_tracks('5yOvAmpIR7hVxiS6Ls5DPO')
ayra_starr_2 <- get_artist_top_tracks('3ZpEKRjHaHANcpk10u6Ntq')
asake_2 <- get_artist_top_tracks('3a1tBryiczPAZpgoZN9Rzg')
tems_2 <- get_artist_top_tracks('687cZJR45JO7jhk1LHIbgq')
yemi_alade_2 <- get_artist_top_tracks('7fKO99ryLDo8VocdtVvwZW')
davido_2 <- get_artist_top_tracks('0Y3agQaa6g2r0YmHPOO9rh')
mr_eazi_2 <- get_artist_top_tracks('4TAoP0f9OuWZUesao43xUW')
ruger_2 <- get_artist_top_tracks('0a1SidMjD8D6EHvJph4n2H')
tiwa_savage_2 <- get_artist_top_tracks('1hNaHKp2Za5YdOAG0WnRbc')
joeboy_2 <- get_artist_top_tracks('1XavfPKBpNjkOfxHINlMHF')
kizz_daniel_2 <- get_artist_top_tracks('1X6cBGnXpEpN7CmflLKmLV')
adekunle_gold_2 <- get_artist_top_tracks('2IK173RXLiCSQ8fhDlAb3s')
patoranking_2 <- get_artist_top_tracks('2hKQc001G7ggs3ZyxMdkGq')
pheelz_2 <- get_artist_top_tracks('5Jv1MsZBh0sqokFq7pU8Xg')
olamide_2 <- get_artist_top_tracks('4ovtyvs7j1jSmwhkBGHqSr')

# # Combine artist top tracks
combi_artist_top_tracks_naija <- rbind(rema_2, burna_boy_2, ckay_2, wizkid_2, fireboy_2,
                                       omah_lay_2, ayra_starr_2, asake_2, tems_2,
                                       yemi_alade_2, davido_2, mr_eazi_2,
                                       ruger_2, tiwa_savage_2, joeboy_2,
                                       kizz_daniel_2, adekunle_gold_2, patoranking_2,
                                       pheelz_2, olamide_2)

# Save the dataframe
saveRDS(combi_artist_top_tracks_naija, "saved_data/combi_artist_top_tracks_naija.RDS")

# c) Get the 20 artist's albums and followers

# When you use get_artist() it gives a list but get_artists provides a dataframe
# with 1 observation

# Artists include:
# 1) Rema
# 2) Burna Boy
# 3) CKay
# 4) Wizkid
# 5) Fireboy DML
# 6) Omah Lay
# 7) Ayra Starr
# 8) Asake
# 9) Tems
# 10) Yemi Alade
# 11) Davido
# 12) Mr Eazi
# 13) Ruger
# 14) Tiwa Savage
# 15) Joeboy
# 16) Kizz Daniel
# 17) Adekunle Gold
# 18) Patoranking
# 19) Pheelz
# 20) Olamide

rema_3 <- get_artists('46pWGuE3dSwY3bMMXGBvVS')
burna_boy_3 <- get_artists('3wcj11K77LjEY1PkEazffa')
ckay_3 <- get_artists('048LktY5zMnakWq7PTtFrz')
wizkid_3 <- get_artists('3tVQdUvClmAT7URs9V3rsp')
fireboy_3 <- get_artists('75VKfyoBlkmrJFDqo1o2VY')
omah_lay_3 <- get_artists('5yOvAmpIR7hVxiS6Ls5DPO')
ayra_starr_3 <- get_artists('3ZpEKRjHaHANcpk10u6Ntq')
asake_3 <- get_artists('3a1tBryiczPAZpgoZN9Rzg')
tems_3 <- get_artists('687cZJR45JO7jhk1LHIbgq')
yemi_alade_3 <- get_artists('7fKO99ryLDo8VocdtVvwZW')
davido_3 <- get_artists('0Y3agQaa6g2r0YmHPOO9rh')
mr_eazi_3 <- get_artists('4TAoP0f9OuWZUesao43xUW')
ruger_3 <- get_artists('0a1SidMjD8D6EHvJph4n2H')
tiwa_savage_3 <- get_artists('1hNaHKp2Za5YdOAG0WnRbc')
joeboy_3 <- get_artists('1XavfPKBpNjkOfxHINlMHF')
kizz_daniel_3 <- get_artists('1X6cBGnXpEpN7CmflLKmLV')
adekunle_gold_3 <- get_artists('2IK173RXLiCSQ8fhDlAb3s')
patoranking_3 <- get_artists('2hKQc001G7ggs3ZyxMdkGq')
pheelz_3 <- get_artists('5Jv1MsZBh0sqokFq7pU8Xg')
olamide_3 <- get_artists('4ovtyvs7j1jSmwhkBGHqSr')

# Combine artist albums and followers
combi_artist_album_follower_naija <- rbind(rema_3, burna_boy_3, ckay_3, wizkid_3, fireboy_3,
                                           omah_lay_3, ayra_starr_3, asake_3, tems_3,
                                           yemi_alade_3, davido_3, mr_eazi_3,
                                           ruger_3, tiwa_savage_3, joeboy_3,
                                           kizz_daniel_3, adekunle_gold_3, patoranking_3,
                                           pheelz_3, olamide_3)

# Save the dataframe
saveRDS(combi_artist_album_follower_naija, "saved_data/combi_artist_album_follower_naija.RDS")
