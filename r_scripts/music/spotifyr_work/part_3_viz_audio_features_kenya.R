# Kenyan Music

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

# 3) Load the required data

# Audio Features
combi_audio_features_kenya <- readRDS("saved_data/combi_audio_features_1.RDS")

# Top Tracks
combi_artist_top_tracks_kenya <- readRDS("saved_data/combi_artist_top_tracks_1.RDS")

# # Popularity and Followers
combi_artist_album_follower_kenya_kenya <- readRDS("saved_data/combi_artist_album_follower_1.RDS")

# 4) Perform EDA of 1st set of characteristics

# a) Look at the key modes

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

# b) Look at the time signature

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

# c) Look at the album release dates

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

# 5) Perform EDA of 2nd set of characteristics

# a) Assess the emotions of the various albums using musical characteristics

# Joyplot of the emotional rollercoasters for the various albums

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Sauti Sol's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

# 6) Perform EDA of musical characteristics for 1 artist - Sauti Sol

# a) Assess musical characteristics for Sauti Sol

############### geom_joy() = geom_density_ridges() #######################
# Review: https://wilkelab.org/ggridges/reference/geom_density_ridges.html
# https://cran.r-project.org/web/packages/ggridges/vignettes/introduction.html
# Switch to geom_density_ridges()

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of musical positiveness in Sauti Sol's albums", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = danceability, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of danceability in Sauti Sol's albums", subtitle = "Based on danceability pulled from Spotify's Web API with spotifyr")

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = energy, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of intensity and activity in Sauti Sol's albums", subtitle = "Based on energy pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = loudness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of loudness in Sauti Sol's albums", subtitle = "Based on loudness pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = speechiness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the presence of spoken words in Sauti Sol's albums", subtitle = "Based on speechiness pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = acousticness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of acousticness in Sauti Sol's albums", subtitle = "Based on acousticness pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = instrumentalness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the instrumentalness of Sauti Sol's albums", subtitle = "Based on instrumentalness pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = liveness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the liveness of Sauti Sol's albums", subtitle = "Based on liveness pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = tempo, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the tempo of Sauti Sol's albums", subtitle = "Based on tempo pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = duration_ms/60000, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(x = "Duration (min)",
       y = "Album Name") +
  ggtitle("Distribution of the duration of Sauti Sol's albums", subtitle = "Based on duration_ms pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = time_signature, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's time_signature distributions", subtitle = "Based on time_signature pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key distributions", subtitle = "Based on key distributions pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's mode distributions", subtitle = "Based on mode pulled from Spotify's Web API with spotifyr")


combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key_name distributions", subtitle = "Based on key_name pulled from Spotify's Web API with spotifyr")

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key_mode distributions", subtitle = "Based on key_mode pulled from Spotify's Web API with spotifyr")

combi_audio_features_kenya |> 
  filter(artist_name == "Sauti Sol") %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Greens") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's mode_name distributions", subtitle = "Based on mode_name pulled from Spotify's Web API with spotifyr")

# # 6) Most popular tracks on Spotify - Sauti Sol - Needs update
# 
combi_artist_top_tracks_kenya |>
  filter(combi_artist_top_tracks_kenya[[16]][[1]][3] == "Sauti Sol") %>%
  filter(album.name %in% c("Afrikan Sauce", "Midnight Train")) %>%
  select(name, popularity, album.name) %>%
  arrange(desc(popularity)) %>%
  ggplot(aes(x = reorder(name,popularity), y = popularity, fill = album.name)) +
  geom_col() +
  coord_flip() +
  theme_minimal()

