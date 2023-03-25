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

# a) Get the artist audio features

sauti_sol_1 <- get_artist_audio_features('sauti sol')

sauti_sol_1 %>% 
  count(key_mode, sort = TRUE) %>% 
  head(5) %>% 
  kable()

# Joyplot of the emotional rollercoasters that are Joy Division’s albums

#install.packages("ggjoy")
library(ggjoy)
library(ggridges)

ggplot(sauti_sol_1, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Joy Division's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")


