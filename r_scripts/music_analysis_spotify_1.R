# spotifyr
# https://www.rcharlie.com/spotifyr/
# https://rdrr.io/github/charlie86/spotifyr/

# 1) Load the required packages

#install.packages('spotifyr')
library(spotifyr)
library(tidyverse)
library(knitr)
library(lubridate)

# 2) Authentication

############## KEEP SECRET ###########################
Sys.setenv(SPOTIFY_CLIENT_ID = '')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '')

######################################################

access_token <- get_spotify_access_token()

############## KEEP SECRET ###########################

# 3) Analysis of musical features for the top 10 most streamed Kenyan artists

# a) Get the artist audio features for all ten musicians

# Use the search_spotify() to get all the artist features
# Then use the get_artist_audio_features() function defaults to "album" 
# so you might want to include "single."

sauti_sol_1 <- get_artist_audio_features('sauti sol', include_groups = c("single", "album"))
nviiri_1 <- get_artist_audio_features('nviiri the storyteller', include_groups = c("single", "album"))
otile_1 <- get_artist_audio_features('otile brown', include_groups = c("single", "album"))
nyashinski_1 <- get_artist_audio_features('nyashinski', include_groups = c("single", "album"))
bensoul_1 <- get_artist_audio_features('bensoul', include_groups = c("single", "album"))
wakadinali_1 <- get_artist_audio_features('wakadinali', include_groups = c("single", "album"))
buruklyn_boyz_1 <- get_artist_audio_features('buruklyn boyz', include_groups = c("single", "album"))
h_art_the_band_1 <- get_artist_audio_features('h_art the band', include_groups = c("single", "album"))
mejja_1 <- get_artist_audio_features('mejja', include_groups = c("single", "album"))
khaligraph_jones_1 <- get_artist_audio_features('khaligraph jones', include_groups = c("single", "album"))

# Combine audio features dataframes

combi_audio_features <- rbind(sauti_sol_1, nviiri_1, otile_1, nyashinski_1, bensoul_1,
                              wakadinali_1, buruklyn_boyz_1, h_art_the_band_1, mejja_1, khaligraph_jones_1)

# Save the dataframe
saveRDS(combi_audio_features, "saved_data/combi_audio_features_1.Rda")

# b) Get the artist's top tracks according to spotify

sauti_sol_2 <- get_artist_top_tracks('4Rj9lQm9oSiMlirgpsM6eo')
nviiri_2 <- get_artist_top_tracks('7xPDTxQrpZPvvI0LzuO73p')
otile_2 <- get_artist_top_tracks('25txWhgJAzekbAaHuDzmwj')
nyashinski_2 <- get_artist_top_tracks('7KY9NaOVRmptl8vlpVomi6')
bensoul_2 <- get_artist_top_tracks('09vo12hHajgG2cZzq0rGmE')
wakadinali_2 <- get_artist_top_tracks('10jefIr7Jj7c0dDJEqRcWK')
buruklyn_boyz_2 <- get_artist_top_tracks('00WWkvpiOhhZNlk2KTqYhX')
h_art_the_band_2 <- get_artist_top_tracks('0m6SCIzf7kP9iylizWmIp1')
mejja_2 <- get_artist_top_tracks('5VnDOE1MEaJ0VOgSypOi3u')
khaligraph_jones_2 <- get_artist_top_tracks('1xxXRVpuEm3X3p1QEm61Az')

# Combine artist top tracks
combi_artist_top_tracks <- rbind(sauti_sol_2, nviiri_2, otile_2, nyashinski_2, bensoul_2,
                                 wakadinali_2, buruklyn_boyz_2, h_art_the_band_2, mejja_2, khaligraph_jones_2)

# Save the dataframe
saveRDS(combi_artist_top_tracks, "saved_data/combi_artist_top_tracks_1.Rda")

# c) Get the artist albums
# When you use get_artist() it gives a list but get_artists provides a dataframe
# with 1 observation

sauti_sol_3 <- get_artists('4Rj9lQm9oSiMlirgpsM6eo')
nviiri_3 <- get_artists('7xPDTxQrpZPvvI0LzuO73p')
otile_3 <- get_artists('25txWhgJAzekbAaHuDzmwj')
nyashinski_3 <- get_artists('7KY9NaOVRmptl8vlpVomi6')
bensoul_3 <- get_artists('09vo12hHajgG2cZzq0rGmE')
wakadinali_3 <- get_artists('10jefIr7Jj7c0dDJEqRcWK')
buruklyn_boyz_3 <- get_artists('00WWkvpiOhhZNlk2KTqYhX')
h_art_the_band_3 <- get_artists('0m6SCIzf7kP9iylizWmIp1')
mejja_3 <- get_artists('5VnDOE1MEaJ0VOgSypOi3u')
khaligraph_jones_3 <- get_artists('1xxXRVpuEm3X3p1QEm61Az')

# 4) Perform EDA of 1st set of characteristics
# a) Look at the key modes

sauti_sol_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

nviiri_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

otile_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

nyashinski_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

bensoul_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

wakadinali_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

buruklyn_boyz_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

h_art_the_band_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

mejja_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

khaligraph_jones_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>%
  kable()

# b) Look at the time signature

sauti_sol_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

nviiri_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

otile_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

nyashinski_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

bensoul_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

wakadinali_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

buruklyn_boyz_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

h_art_the_band_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

mejja_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

khaligraph_jones_1 %>% 
  count(time_signature, sort = TRUE) %>% 
  head(5) %>%
  kable()

# c) Look at the album release dates

sauti_sol_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

nviiri_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

otile_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

nyashinski_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

bensoul_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

wakadinali_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

buruklyn_boyz_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

h_art_the_band_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

mejja_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()

khaligraph_jones_1 %>% 
  count(album_release_year, sort = TRUE) %>% 
  head(5) %>%
  kable()


# 4) Perform EDA of 2nd set of characteristics

# a) Assess the emotions of the various albums using musical characteristics

# Joyplot of the emotional rollercoasters for the various albums

#install.packages("ggjoy")
library(ggjoy) #ggjoy has been deprecated for ggridges
library(ggridges)

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Sauti Sol's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")


nviiri_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Nviiri's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

otile_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Otile Brown's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

nyashinski_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Nyashinski's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

bensoul_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Bensoul's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

wakadinali_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  labs(y = "Album Name") +
  ggtitle("Distribution of Wakadinali's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

buruklyn_boyz_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Buruklyn Boyz's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

h_art_the_band_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of H_art the Band's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

mejja_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Mejja's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

khaligraph_jones_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of Khaligraph's musical positiveness per album", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

# 5) Perform EDA of musical characteristics for 1 artist - Sauti Sol

# a) Assess musical characteristics for Sauti Sol

############### geom_joy() = geom_density_ridges() #######################
# Review: https://wilkelab.org/ggridges/reference/geom_density_ridges.html
# https://cran.r-project.org/web/packages/ggridges/vignettes/introduction.html
# Switch to geom_density_ridges()

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = valence, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of musical positiveness in Sauti Sol's albums", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = danceability, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of danceability in Sauti Sol's albums", subtitle = "Based on danceability pulled from Spotify's Web API with spotifyr")

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = energy, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of intensity and activity in Sauti Sol's albums", subtitle = "Based on energy pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = loudness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of loudness in Sauti Sol's albums", subtitle = "Based on loudness pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = speechiness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the presence of spoken words in Sauti Sol's albums", subtitle = "Based on speechiness pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = acousticness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of acousticness in Sauti Sol's albums", subtitle = "Based on acousticness pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = instrumentalness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the instrumentalness of Sauti Sol's albums", subtitle = "Based on instrumentalness pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = liveness, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the liveness of Sauti Sol's albums", subtitle = "Based on liveness pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = tempo, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Distribution of the tempo of Sauti Sol's albums", subtitle = "Based on tempo pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = duration_ms/60000, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(x = "Duration (min)",
       y = "Album Name") +
  ggtitle("Distribution of the duration of Sauti Sol's albums", subtitle = "Based on duration_ms pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = time_signature, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's time_signature distributions", subtitle = "Based on time_signature pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key distributions", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's mode distributions", subtitle = "Based on mode pulled from Spotify's Web API with spotifyr")


sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key_name distributions", subtitle = "Based on key_name pulled from Spotify's Web API with spotifyr")

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = key_mode, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Blues") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's key_mode distributions", subtitle = "Based on key_mode pulled from Spotify's Web API with spotifyr")

sauti_sol_1 %>%
  group_by(album_name) %>%
  filter(album_type == "album") %>% 
  ggplot(aes(x = mode_name, y = album_name, fill = album_name)) + 
  geom_density_ridges(show.legend = FALSE) + 
  theme_ridges() +
  scale_fill_brewer(palette = "Greens") +
  labs(y = "Album Name") +
  ggtitle("Density plot of Sauti Sol's mode_name distributions", subtitle = "Based on mode_name pulled from Spotify's Web API with spotifyr")

# 6) Most popular tracks on Spotify - Sauti Sol

khaligraph_jones_2 %>%
  select(name, popularity, album.name) %>%
  arrange(desc(popularity)) %>%
  ggplot(aes(x = reorder(name,popularity), y = popularity, fill = album.name)) +
  geom_col() + 
  coord_flip() +
  theme_minimal()


