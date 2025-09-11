# Music Analysis with Spotify
# Part 2: Assess popularity and followers
# Genre: Afrobeats / Nigeria
# William Okech

# Notes

# spotifyr
# https://www.rcharlie.com/spotifyr/
# https://rdrr.io/github/charlie86/spotifyr

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

# 1) Load the required packages

#install.packages('spotifyr')
library(spotifyr)
library(tidyverse)
library(knitr)
library(lubridate)
#install.packages("ggjoy")
library(ggjoy) #ggjoy has been deprecated for ggridges
library(ggridges)
library(scales)

# 2) Authentication

############## KEEP SECRET ###########################
# Stored in Renviron
Sys.getenv("SPOTIFY_CLIENT_ID")
Sys.getenv("SPOTIFY_CLIENT_SECRET")

######################################################

access_token <- get_spotify_access_token()

############## KEEP SECRET ###########################

# 3) Load the previously saved data from Part 1

# The 12 Nigerian Afrobeat musicians albums and followers
combi_artist_album_follower_naija <- readRDS("saved_data/combi_artist_album_follower_naija.RDS")


# 4) EDA Plots for Analysis

# a) Artist Popularity on Spotify

combi_artist_album_follower_naija |> 
  select(name, popularity, followers.total) %>%
  arrange(desc(popularity)) %>%
  ggplot(aes(x = reorder(name,popularity), y = popularity)) +
  geom_col(fill = "skyblue") + 
  geom_text(aes(label = popularity, y = popularity-0.1),  
            hjust = 1,                           
            color = "black",                        
            size = 8) +  
  coord_flip() +
  theme_classic() +
  labs(x = "",
       y = "Popularity",
       title = "Popularity of selected Afrobeats musicians",
       subtitle = "Dataset compiled from Spotify in August 2024",
       caption = "Data Source: Spotify") +
  scale_y_continuous(breaks = seq(0, 100, by = 10),
                     minor_breaks = seq(0, 100, by = 10),
                     expand = expansion(mult = c(0, 0.1))) +
  theme(axis.title.x = element_text(size = 25),
        axis.title.y = element_text(size = 25),
        axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25),
        axis.ticks.length.x = unit(0.2, "cm"),  # Lengthen the ticks
        axis.ticks.minor.x = element_line(color = "black", size = 2),  # Show minor ticks
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(family="Helvetica", face="bold", size = 35, hjust = 0, vjust=0.5),
        plot.subtitle = element_text(family="Helvetica", size = 25),
        plot.caption = element_text(family = "Helvetica",size = 25, face = "bold", hjust = -0.45, vjust = 1),
        plot.background = element_rect(fill = "bisque1", colour = "bisque1"),
        panel.background = element_rect(fill = "bisque1", colour = "bisque1"),
        plot.title.position = 'plot',
        legend.title = element_blank(),
        legend.position = "none") 

#ggsave("images/afrobeats_nigeria/popularity_1.png", width = 12, height = 12, dpi = 300)

# b) Artist Follower Numbers on Spotify

combi_artist_album_follower_naija |> 
  select(name, popularity, followers.total) %>%
  mutate(followers.total.millions = followers.total/1000000) |>
  arrange(desc(followers.total.millions)) %>%
  ggplot(aes(x = reorder(name, followers.total.millions), y = followers.total.millions)) +
  geom_col(fill = "skyblue") + 
  geom_text(aes(label = round(followers.total.millions,2), y = followers.total.millions),  
            hjust = 0,                           
            color = "black",                        
            size = 8) +
  coord_flip() +
  theme_classic() +
  labs(x = "",
       y = "Followers (millions)",
       title = "Selected Afrobeats musicians and their\nfollower counts",
       subtitle = "Dataset compiled from Spotify in August 2024",
       caption = "Data Source: Spotify") +
  scale_y_continuous(labels = scales::comma,
                     breaks = seq(0, 12, by = 2),
                     minor_breaks = seq(0, 12, by = 1),
                     expand = expansion(mult = c(0, 0.1))) + # Keep labels within plot area
  theme(axis.title.x = element_text(size = 25),
        axis.title.y = element_text(size = 25),
        axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25),
        axis.ticks.length.x = unit(0.2, "cm"),  # Lengthen the ticks
        axis.ticks.minor.x = element_line(color = "black", size = 2),  # Show minor ticks
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        plot.title = element_text(family="Helvetica", face="bold", size = 35, hjust = 0, vjust=0.5),
        plot.subtitle = element_text(family="Helvetica", size = 25),
        plot.caption = element_text(family = "Helvetica",size = 25, face = "bold", hjust = -0.45, vjust = 1),
        plot.background = element_rect(fill = "bisque1", colour = "bisque1"),
        panel.background = element_rect(fill = "bisque1", colour = "bisque1"),
        plot.title.position = 'plot',
        legend.title = element_blank(),
        legend.position = "none") 

#ggsave("images/afrobeats_nigeria/followers_1.png", width = 12, height = 12, dpi = 300)

