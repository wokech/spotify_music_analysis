# Tutorial

# Your favorite songs/artists

get_my_top_artists_or_tracks(type = 'artists', time_range = 'medium_term', limit = 5,authorization = access_token) %>% 
  select(name, genres) %>% 
  rowwise %>% 
  mutate(genres = paste(genres, collapse = ', ')) %>% 
  ungroup

# Your recently played songs

get_my_recently_played(limit = 5, authorization = access_token) %>% 
  mutate(artist.name = map_chr(track.artists, function(x) x$name[1]),
         played_at = as_datetime(played_at)) %>% 
  select(track.name, artist.name, track.album.name, played_at)

# Analyzing a playlist

my_id <- 'your user ID here'
my_playlists <- get_user_playlists(my_id,authorization = access_token)
my_playlists2 <- my_playlists %>%
  filter(name %in% c('Your Top Songs 2019'))
tracks <- get_playlist_tracks(my_playlists2$id)
features <- get_track_audio_features(tracks$track.id)
tracks2 <- tracks %>%
  left_join(features, by=c('track.id' = 'id'))

tolerance = 0.05
tracks2 %>%
  filter((energy>mean(energy)-tolerance)&(energy<mean(energy)+tolerance)&
           (valence>mean(valence)-tolerance)&(valence<mean(valence)+tolerance)&
           (track.popularity/100>mean(track.popularity/100)-tolerance)&(track.popularity/100<mean(track.popularity/100)+tolerance)) %>%
  mutate(artist.name = map_chr(track.album.artists, function(x) x$name[1])) %>% 
  select(artist.name,track.name,energy,valence,track.popularity) %>%
  bind_rows(data.frame(artist.name = '---average---',track.name = '---average---',energy=mean(tracks2$energy),valence=mean(tracks2$valence),track.popularity=mean(tracks2$track.popularity))) %>%
  arrange(energy) %>% kable() %>% 
  kable_styling("striped", full_width = F, position = "left")%>% 
  row_spec(row = 2, color = "black",bold = TRUE)

# A deeper analysis of the whole catalog of an artist

ggplot(foo, aes(x = energy,y=fct_rev(album_release_year))) + 
  geom_density_ridges(scale = 2, size = 0.1, rel_min_height = 0.03,quantile_lines=TRUE,quantiles=2) +
  theme_ridges()+
  scale_y_discrete(labels=c('Concrete and Gold - 2017','Sonic Highways - 2014','Wasting Light - 2011','Echoes, Silence, Patience & Grace - 2007','In Your Honor - 2005','One By One - 2002', 'There Is Nothing Left To Lose - 1999','The Colour And The Shape - 1997','Foo Fighters - 1995'))+ 
  scale_x_continuous( expand = c(0, 0)) +
  labs(title= "Foo Fighters energy by album",subtitle = "Based on data from Spotify", y="Album", x = "Energy")

foo %>% 
  arrange(-energy) %>% 
  select(track_name, album, energy) %>% 
  head(10) %>% 
  kable() %>% 
  kable_styling("striped", full_width = F, position = "left") %>% 
  row_spec(row = c(1), color = "black",bold = TRUE)

# Analysis of a specific album

foo %>% 
  arrange(track_number) %>% 
  filter(album_name == 'The Colour And The Shape') %>% 
  select(track_name,track_number,energy,valence,tempo) %>% 
  mutate(
    energy = cell_spec(energy, "html", bold = ifelse(energy == max(energy), TRUE, FALSE)),
    valence = cell_spec(valence, "html", bold = ifelse(valence == max(valence), TRUE, FALSE))
  ) %>%
  kable(format = 'html',escape=F) %>% 
  kable_styling("striped", full_width = F, position = "left",bootstrap_options = c("striped", "hover", "condensed", "responsive"))


