# Beyonce Music Analysis 1
# WO

library(spotifyr)
library(dplyr)
library(ggplot2)

# Authenticate
client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")
access_token <- get_spotify_access_token()

###Audio Features is always an issue!!!!

# 1. Get artist features 
artist_name <- "Beyoncé"
artist_features <- get_artist_audio_features(artist_name)

# 2. Discography summary
artist_summary <- artist_features %>%
  group_by(album_name) %>%
  summarise(avg_popularity = mean(popularity),
            avg_danceability = mean(danceability),
            release_year = min(as.numeric(substr(album_release_date, 1, 4))))

# 3. Plot trends
ggplot(artist_summary, aes(x = release_year, y = avg_danceability)) +
  geom_line() +
  geom_point() +
  labs(title = paste("Danceability Over Time for", artist_name))
