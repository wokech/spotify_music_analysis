library(tidyverse)
library(here)
library(spotifyr)
library(purrr)
library(knitr)
library(ggridges)
library(ggjoy)
library(plotly) 
library(jsonlite)
library(lubridate)
library(gghighlight)

## Set up 
Sys.setenv(SPOTIFY_CLIENT_ID = '', 
           SPOTIFY_CLIENT_SECRET = '')

access_token <- get_spotify_access_token()

harry_styles <- get_artist_audio_features('harry styles')
joy <- get_artist_audio_features('joy division')
