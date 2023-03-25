# geniusR

#install.packages("geniusr")

library(geniusr)
library(dplyr)
library(tidytext)
library(wordcloud)
library(ggwordcloud)


############## KEEP SECRET ###########################

genius_token(force = TRUE)

############## KEEP SECRET ###########################

# Tutorial

learnr::run_tutorial("genius_tutorial", "genius")

# Browse the genius website
browse_genius()

# 1) Get lyrics for top 10 songs

# a) Download the lyrics

sauti_sol_lil_mama <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-lil-mama-lyrics")
sauti_sol_melanin <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-melanin-lyrics")
sauti_sol_afrikan_star <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-afrikan-star-lyrics")
sauti_sol_short_n_sweet <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-short-n-sweet-lyrics")
sauti_sol_suzanna <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-suzanna-lyrics")
sauti_sol_insecure <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-insecure-lyrics")
sauti_sol_my_everything <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-my-everything-lyrics")
sauti_sol_sura_yako <- get_lyrics_url(song_lyrics_url = "https://genius.com/Sauti-sol-sura-yako-lyrics")
sauti_sol_africa <- get_lyrics_url(song_lyrics_url = "https://genius.com/Yemi-alade-africa-lyrics")
sauti_sol_oversized_t_shirt <- get_lyrics_url(song_lyrics_url = "https://genius.com/Matata-oversized-t-shirt-lyrics")

# b) Lil Mama

sauti_sol_lil_mama_tokenized <- sauti_sol_lil_mama %>%
  unnest_tokens(word, line)

sauti_sol_lil_mama_tokenized %>%
  count(word, sort = TRUE)

sauti_sol_lil_mama_tokenized_tidy <- sauti_sol_lil_mama_tokenized %>%
  anti_join(stop_words)

# Top words again
sauti_sol_lil_mama_tokenized_tidy %>%
  count(word, sort = TRUE)

# Create a new dataframe with the top words

sauti_sol_lil_mama_tokenized_tidy_top <- sauti_sol_lil_mama_tokenized_tidy %>%
  group_by(word) %>%
  mutate(count = n()) %>%
  select(word, count) %>%
  distinct()

wordcloud(sauti_sol_lil_mama_tokenized_tidy_top$word, sauti_sol_lil_mama_tokenized_tidy_top$count,
          min.freq = 2,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
