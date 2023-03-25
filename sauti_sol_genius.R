# geniusR



#install.packages("geniusr")

library(geniusr)
library(dplyr)
library(tidytext)

############## KEEP SECRET ###########################

genius_token(force = TRUE)

############## KEEP SECRET ###########################

# get lyrics
aass <- get_lyrics_url(song_lyrics_url = "https://genius.com/H-art-the-band-el-shaddai-lyrics")
  
  get_lyrics_url(artist_name = "Sauti Sol",
                  song_title = "Lazizi") 


album <- get_album(album_id = 337082) 
album_to_df(album)

artist <- get_artist(artist_id = 16775) 
artist_to_df(artist)

get_lyrics_search(artist_name = "Anderson .Paak", song_title = "Come Home")

thingCalledLove <- search_genius(search_term = "I Believe in a Thing Called Love")

search_song("like a rolling stone")

learnr::run_tutorial("genius_tutorial", "genius")

get_artist_df(artist_id = 16751)

song <- get_song(song_id = 3039923)
browse_genius_resource(song)

browse_genius()
