# Music Analysis with Spotify (Caribbean)

# Data: SongStats / SocialBlade / Soundcharts

# List of Artists and Data Extraction

library(spotifyr)
library(purrr)
library(dplyr)
library(tidyverse)
library(readxl)
library(writexl)

#NEED TO FIGURE OUT HOW TO GET THE CORRECT ARTIST#

# Top Artists

top_artists_carib_apr_2026 <- c("Gente de Zona", "El Alfa", "Machel Montano", 
                                "Major Lazer", "Au/Ra", "Baha Men", "Amanda Reifer",
                                "Sui Uzi", "Sagcy", "Mighty Sparrow", "SAINt JHN",
                                "Michael Brun", "Byron Messia", "Crocadile",
                                "Kevin Lyttle", "Jairzinho")

top_artists_carib_spotify_data_apr_2026 <- map_dfr(top_artists_carib_apr_2026, function(a){
  
  res <- search_spotify(a, type="artist", limit=1)
  
  data.frame(
    artist = res$name,
    id = res$id,
    popularity = res$popularity,
    followers = res$followers.total
  )
})

write_xl(top_artists_carib_spotify_data_apr_2026, "saved_data/top_artists_carib_spotify_data_apr_2026.xlsx")


