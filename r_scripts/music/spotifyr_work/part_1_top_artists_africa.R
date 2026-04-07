# Music Analysis with Spotify (Africa)

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

top_artists_africa_apr_2026 <- c("Sofiya Nzau", "Tems", "Tyla", "Amaarae", "Sherine",
                        "Soolking", "DJ Malvado", "Salif Keita", "ElGrandeToto",
                        "Samara arab", "Nitefreak", "Joshua Baraka", 
                        "Diamond Platnumz", "Mia Guisse", "Alpha Blondy",
                        "Fally Ipupa", "Mulatu Astatke")

top_artists_africa_spotify_data_apr_2026 <- map_dfr(top_artists_africa_apr_2026, function(a){
  
  res <- search_spotify(a, type="artist", limit=1)
  
  data.frame(
    artist = res$name,
    id = res$id,
    popularity = res$popularity,
    followers = res$followers.total
  )
})

write_xlsx(top_artists_africa_spotify_data_apr_2026, "saved_data/top_artists_africa_spotify_data_apr_2026.xlsx")


