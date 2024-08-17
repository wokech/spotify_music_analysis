# Nigerian Music - Afrobeats

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

# 3) Analysis of musical features for the top 10 most streamed Kenyan artists

# a) Get the artist audio features for all ten musicians

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
# 
# # Combine audio features dataframes
# 
# combi_audio_features_naija <- rbind(rema_1, burna_boy_1, ckay_1, wizkid_1, fireboy_1,
#                               omah_lay_1, ayra_starr_1, asake_1, tems_1,
#                               yemi_alade_1, davido_1, mr_eazi_1)
# 
# # Save the dataframe
# saveRDS(combi_audio_features_naija, "saved_data/combi_audio_features_naija.RDS")

# Load the required dataframe
combi_audio_features_naija <- readRDS("saved_data/combi_audio_features_naija.RDS")

# b) Get the artist's top tracks according to spotify

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

# # # Combine artist top tracks
# combi_artist_top_tracks_naija <- rbind(rema_2, burna_boy_2, ckay_2, wizkid_2, fireboy_2, 
#                                        omah_lay_2, ayra_starr_2, asake_2, tems_2,
#                                        yemi_alade_2, davido_2, mr_eazi_2)
# 
# # Save the dataframe
# saveRDS(combi_artist_top_tracks_naija, "saved_data/combi_artist_top_tracks_naija.RDS")

# # Load the dataframe
combi_artist_top_tracks_naija <- readRDS("saved_data/combi_artist_top_tracks_naija.RDS")

# c) Get the artist albums
# When you use get_artist() it gives a list but get_artists provides a dataframe
# with 1 observation

# rema_3 <- get_artists('46pWGuE3dSwY3bMMXGBvVS')
# burna_boy_3 <- get_artists('3wcj11K77LjEY1PkEazffa')
# ckay_3 <- get_artists('048LktY5zMnakWq7PTtFrz')
# wizkid_3 <- get_artists('3tVQdUvClmAT7URs9V3rsp')
# fireboy_3 <- get_artists('75VKfyoBlkmrJFDqo1o2VY')
# omah_lay_3 <- get_artists('5yOvAmpIR7hVxiS6Ls5DPO')
# ayra_starr_3 <- get_artists('3ZpEKRjHaHANcpk10u6Ntq')
# asake_3 <- get_artists('3a1tBryiczPAZpgoZN9Rzg')
# tems_3 <- get_artists('687cZJR45JO7jhk1LHIbgq')
# yemi_alade_3 <- get_artists('7fKO99ryLDo8VocdtVvwZW')
# davido_3 <- get_artists('0Y3agQaa6g2r0YmHPOO9rh')
# mr_eazi_3 <- get_artists('4TAoP0f9OuWZUesao43xUW')

# # Combine artist albums and followers
# combi_artist_album_follower_naija <- rbind(rema_3, burna_boy_3, ckay_3, wizkid_3, fireboy_3, 
#                                            omah_lay_3, ayra_starr_3, asake_3, tems_3,
#                                            yemi_alade_3, davido_3, mr_eazi_3)
# 
# # Save the dataframe
# saveRDS(combi_artist_album_follower_naija, "saved_data/combi_artist_album_follower_naija.RDS")

# # Load the dataframe
combi_artist_album_follower <- readRDS("saved_data/combi_artist_album_follower_1.RDS")

# 4) Perform EDA of 1st set of characteristics
# a) Look at the key modes

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

# b) Look at the time signature


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()


# c) Look at the album release dates

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()


# 5) Perform EDA of 2nd set of characteristics

# a) Assess the emotions of the various albums using musical characteristics

# Joyplot of the emotional rollercoasters for the various albums

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Rema's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")


# 6) Perform EDA of musical characteristics for 1 artist - Rema

# a) Assess musical characteristics for Rema

############### geom_joy() = geom_density_ridges() #######################
# Review: https://wilkelab.org/ggridges/reference/geom_density_ridges.html
# https://cran.r-project.org/web/packages/ggridges/vignettes/introduction.html
# Switch to geom_density_ridges()

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of musical positiveness in Rema's albums", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = danceability, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of danceability in Rema's albums", subtitle = "Based on danceability pulled from Spotify's Web API with spotifyr")

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = energy, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of intensity and activity in Rema's albums", subtitle = "Based on energy pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = loudness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of loudness in Rema's albums", subtitle = "Based on loudness pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = speechiness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the presence of spoken words in Rema's albums", subtitle = "Based on speechiness pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = acousticness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of acousticness in Rema's albums", subtitle = "Based on acousticness pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = instrumentalness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the instrumentalness of Rema's albums", subtitle = "Based on instrumentalness pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = liveness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the liveness of Rema's albums", subtitle = "Based on liveness pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = tempo, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the tempo of Rema's albums", subtitle = "Based on tempo pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = duration_ms/60000, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(x = "Duration (min)",
       y = "Album Name") +
  ggtitle("Distribution of the duration of Rema's albums", subtitle = "Based on duration_ms pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = time_signature, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's time_signature distributions", subtitle = "Based on time_signature pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's key distributions", subtitle = "Based on key distributions pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's mode distributions", subtitle = "Based on mode pulled from Spotify's Web API with spotifyr")


combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's key_name distributions", subtitle = "Based on key_name pulled from Spotify's Web API with spotifyr")

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's key_mode distributions", subtitle = "Based on key_mode pulled from Spotify's Web API with spotifyr")

combi_audio_features_naija |> 
  filter(artist_name == "Rema") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Greens") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Rema's mode_name distributions", subtitle = "Based on mode_name pulled from Spotify's Web API with spotifyr")

# 6) Most popular tracks on Spotify - Rema

combi_artist_top_tracks_naija |> 
  filter(combi_artist_top_tracks[[16]][[1]][3] == "Rema") %>%
  filter(album.name %in% c("Rave & Roses", "HEIS")) %>%
  select(name, popularity, album.name) %>%
  arrange(desc(popularity)) %>%
  ggplot(aes(x = reorder(name,popularity), y = popularity, fill = album.name)) +
  geom_col() + 
  coord_flip() +
  theme_minimal()

# 7) Artist Followers

combi_artist_album_follower_naija |> 
  select(name, popularity, followers.total) %>%
  arrange(desc(popularity)) %>%
  ggplot(aes(x = reorder(name,popularity), y = popularity)) +
  geom_col() + 
  coord_flip() +
  theme_minimal()

combi_artist_album_follower_naija |> 
  select(name, popularity, followers.total) %>%
  arrange(desc(followers.total)) %>%
  ggplot(aes(x = reorder(name, followers.total), y = followers.total)) +
  geom_col() + 
  coord_flip() +
  theme_minimal()
