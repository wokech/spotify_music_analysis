# Lyric Analysis

# Install packages
install.packages("genius")

# Load libraries
library(genius)
library(tidyverse)

# Load the tutorial
install.packages("learnr")
library(learnr)
learnr::run_tutorial("genius_tutorial", "genius")

# Whole Albums (genius_album() - returns a tidy data frame with 
# three columns = title, track_n, text)

live_die_afrika <- genius_album(artist = "Sauti Sol", album = "Live and Die in Afrika")

live_die_afrika

# Multiple Albums/Songs

# Example with 2 different artists and albums
artist_albums <- tribble(
  ~artist, ~album,
  "Lecrae", "Blessings",
  "KB", "Die Rich"
)

# Multiple songs
artist_albums %>%
  add_genius(artist, album, type = "lyrics")

# Multiple albums
artist_albums %>%
  add_genius(artist, album, type = "album")

# Albums and Songs
artist_albums %>%
  add_genius(artist, album, type)

# Song Lyrics
sauti_sol <- genius_lyrics(artist = "Sauti Sol", song = "Sura Yako")

sauti_sol

# Album Lyrics

bethel <- genius_album("Bethel", "No Longer Slaves")

bethel

# Tracklists

genius_tracklist(artist = "Bethel", album = "No Longer Slaves") 

# Multiple songs

three_songs <- tribble(
  ~ artist, ~ title,
  "Bethel", "No Longer Slaves",
  "Lecrae", "Anomaly",
  "Kierra Sheard", "Free"
)

song_lyrics <- three_songs %>% 
  add_genius(artist, title, type = "lyrics")

song_lyrics %>% 
  count(artist)

# Album Lyrics

albums <- tribble(
  ~ artist, ~ title,
  "Bethel", "No Longer Slaves",
  "Lecrae", "Anomaly",
  "Kierra Sheard", "Free"
)

album_lyrics <- albums %>% 
  add_genius(artist, title, type = "album")

album_lyrics

# Albums and Songs

song_album <- tribble(
  ~ artist, ~ title, ~ type,
  "Bethel", "No Longer Slaves", "lyrics",
  "Lecrae", "Anomaly", "lyrics",
  "Kierra Sheard", "Free", "album"
)

mixed_lyrics <- song_album %>% 
  add_genius(artist, title, type)

mixed_lyrics

# Self-similarity index

tik_tok <- genius_lyrics(artist = "Sauti Sol", song = "Melanin")
tik_tok
tt_self_sim <- calc_self_sim(tik_tok, lyric, output = "tidy")

tt_self_sim

tt_self_sim %>% 
  ggplot(aes(x = x_id, y = y_id, fill = identical)) +
  geom_tile() +
  scale_fill_manual(values = c("white", "black")) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank()) +
  scale_y_continuous(trans = "reverse") +
  labs(title = "____", subtitle = "Self-similarity matrix", x = "", y = "", 
       caption = "____")
