# geniusR

## https://info5940.infosci.cornell.edu/notes/text-analysis/hamilton/

#install.packages("geniusr")

library(geniusr)
library(dplyr)
library(tidytext)
library(wordcloud)
library(wordcloud2)
library(ggwordcloud)
library(stopwords)
library(quanteda)
#install.packages("textdata")
library(textdata)


############## KEEP SECRET ###########################

genius_token(force = TRUE)

############## KEEP SECRET ###########################

# Tutorial

learnr::run_tutorial("genius_tutorial", "genius")

# Browse the genius website
browse_genius()

# 1) Get lyrics for top 10 songs on Spotify

################DO THE SAME FOR YOUTUBE ##########################

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

swahili_stopwords <- c("na", "ya", "kwa", "ni", "kwamba", "au", "lakini", "yake", "yangu", "yao", "zake", "hizo", "hizi", "hizo", "hizo", "zao", "zetu", "yoyote", "yote", "hapo", "hata", "pia", "tu", "kweli", "sana", "nyingi", "wengi", "kidogo", "kila")

swahili_stopwords_df <- data.frame(stopword = swahili_stopwords)

sauti_sol_lil_mama_tokenized_tidy <- sauti_sol_lil_mama_tokenized %>%
  anti_join(get_stopwords(source = "snowball")) 

# Top words again
sauti_sol_lil_mama_tokenized_tidy %>%
  count(word, sort = TRUE)

# Create a new dataframe with the top words

sauti_sol_lil_mama_tokenized_tidy_top <- sauti_sol_lil_mama_tokenized_tidy %>%
  group_by(word) %>%
  mutate(count = n()) %>%
  select(word, count) %>%
  distinct() %>%
  ungroup() %>%
  arrange(desc(count)) %>%
  slice_max(count, n = 19)

set.seed(1)
ggplot(sauti_sol_lil_mama_tokenized_tidy_top, aes(label = word, size = count, color = word)) +
  geom_text_wordcloud(shape = "diamond") +
  scale_size_area(max_size = 20) +
  theme_minimal()

# c) Melanin

sauti_sol_melanin_tokenized <- sauti_sol_melanin %>%
  unnest_tokens(word, line)

sauti_sol_melanin_tokenized %>%
  count(word, sort = TRUE)

sauti_sol_melanin_tokenized_tidy <- sauti_sol_melanin_tokenized %>%
  anti_join(get_stopwords(source = "snowball"))

# Top words again
sauti_sol_melanin_tokenized_tidy %>%
  count(word, sort = TRUE)

# Create a new dataframe with the top words

sauti_sol_melanin_tokenized_tidy_top <- sauti_sol_melanin_tokenized_tidy %>%
  group_by(word) %>%
  mutate(count = n()) %>%
  select(word, count) %>%
  distinct() %>%
  ungroup() %>%
  arrange(desc(count)) %>%
  slice_max(count, n = 19)

set.seed(1)
ggplot(sauti_sol_melanin_tokenized_tidy_top, aes(label = word, size = count, color = word)) +
  geom_text_wordcloud(shape = "diamond") +
  scale_size_area(max_size = 20) +
  theme_minimal()

##########library(tm) should have swahili stopwords#############

# Sentiment analysis

############## review with ChatGPT################
