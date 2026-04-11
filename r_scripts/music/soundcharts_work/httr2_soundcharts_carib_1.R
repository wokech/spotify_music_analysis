# Using httr2 to extract data from Soundcharts API - Carib

####DO NOT RERUN IF COMPLETE############

# Load packages and libraries

# install.packages("httr2")
# install.packages("dplyr")
# install.packages("purrr")
# install.packages("jsonlite")
# install.packages("usethis")

library(httr2)
library(dplyr)
library(purrr)
library(jsonlite)
library(usethis)
library(tidyverse)
library(readxl)
library(writexl)

# Create/Edit the .Renviron
# edit_r_environ()

client_id <- Sys.getenv("SOUNDCHARTS_CLIENT_ID")
client_secret <- Sys.getenv("SOUNDCHARTS_CLIENT_SECRET")

# 1) Gente De Zona Cuba

# Create and perform the request 
response_gente_de_zona <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/GBUM71400955") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_gente_de_zona <- response_gente_de_zona |> 
  resp_body_json()

# Get audio details

audio_features_gente_de_zona <- data_gente_de_zona$object$audio

audio_features_gente_de_zona <- as_tibble(audio_features_gente_de_zona) |>
  mutate(name = "Gente De Zona") |>
  mutate(song = "Bailando") |>
  relocate(name, song)



# 2) El Alfa	Dominican Republic

# Create and perform the request 
response_el_alfa <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QM7281884731") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_el_alfa <- response_el_alfa |> 
  resp_body_json()

# Get audio details

audio_features_el_alfa <- data_el_alfa$object$audio

audio_features_el_alfa <- as_tibble(audio_features_el_alfa) |>
  mutate(name = "El Alfa") |>
  mutate(song = "La Romana (feat. El Alfa)") |>
  relocate(name, song)


# 3) Machel Montano	Trinidad and Tobago

# Create and perform the request 
response_machel_montano <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QMUY41500016") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_machel_montano <- response_machel_montano |> 
  resp_body_json()

# Get audio details

audio_features_machel_montano <- data_machel_montano$object$audio

audio_features_machel_montano <- as_tibble(audio_features_machel_montano) |>
  mutate(name = "Machel Montano") |>
  mutate(song = "All My Love (remix)") |>
  relocate(name, song)



# 4) Major Lazer Jamaica

# Create and perform the request 
response_major_lazer <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QMUY41500008") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_major_lazer <- response_major_lazer |> 
  resp_body_json()

# Get audio details

audio_features_major_lazer <- data_major_lazer$object$audio

audio_features_major_lazer <- as_tibble(audio_features_major_lazer) |>
  mutate(name = "Major Lazer") |>
  mutate(song = "Lean On") |>
  relocate(name, song)



# 5) Au/Ra Antigua and Barbuda

# Create and perform the request 
response_au_ra <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/NOG841806010") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_au_ra <- response_au_ra |> 
  resp_body_json()

# Get audio details

audio_features_au_ra <- data_au_ra$object$audio

audio_features_au_ra <- as_tibble(audio_features_au_ra) |>
  mutate(name = "Au/Ra") |>
  mutate(song = "Darkside") |>
  relocate(name, song)



# 6) Baha Men	Bahamas

# Create and perform the request 
response_baha_men <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USSC90000001") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_baha_men <- response_baha_men |> 
  resp_body_json()

# Get audio details

audio_features_baha_men <- data_baha_men$object$audio

audio_features_baha_men <- as_tibble(audio_features_baha_men) |>
  mutate(name = "Baha Men") |>
  mutate(song = "Who Let the Dogs Out") |>
  relocate(name, song)



# 7) Amanda Reifer Barbados

# Create and perform the request 
response_amanda_reifer <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USUM72208965") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_amanda_reifer <- response_amanda_reifer |> 
  resp_body_json()

# Get audio details

audio_features_amanda_reifer <- data_amanda_reifer$object$audio

audio_features_amanda_reifer <- as_tibble(audio_features_amanda_reifer) |>
  mutate(name = "Amanda Reifer") |>
  mutate(song = "Die Hard") |>
  relocate(name, song)



# 8) Sui Uzi Belize

# Create and perform the request 
response_sui_uzi <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QZK6Q2035375") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_sui_uzi <- response_sui_uzi |> 
  resp_body_json()

# Get audio details

audio_features_sui_uzi <- data_sui_uzi$object$audio

audio_features_sui_uzi <- as_tibble(audio_features_sui_uzi) |>
  mutate(name = "Sui Uzi") |>
  mutate(song = "Feel Me") |>
  relocate(name, song)


# 9) Sagcy Dominica

# Create and perform the request 
response_sagcy <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QZDA62014656") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_sagcy <- response_sagcy |> 
  resp_body_json()

# Get audio details

audio_features_sagcy <- data_sagcy$object$audio

audio_features_sagcy <- as_tibble(audio_features_sagcy) |>
  mutate(name = "Sagcy") |>
  mutate(song = "Te Fuiste") |>
  relocate(name, song)



# 10) Mighty Sparrow	Grenada

# Create and perform the request 
response_mighty_sparrow <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/NLHR50914165") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_mighty_sparrow <- response_mighty_sparrow |> 
  resp_body_json()

# Get audio details

audio_features_mighty_sparrow <- data_mighty_sparrow$object$audio

audio_features_mighty_sparrow <- as_tibble(audio_features_mighty_sparrow) |>
  mutate(name = "Mighty Sparrow") |>
  mutate(song = "Only a Fool") |>
  relocate(name, song)


# 11) SAINt JHN	Guyana

# Create and perform the request 
response_saint_jhn <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/RUB421901499") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_saint_jhn <- response_saint_jhn |> 
  resp_body_json()

# Get audio details

audio_features_saint_jhn <- data_saint_jhn$object$audio

audio_features_saint_jhn <- as_tibble(audio_features_saint_jhn) |>
  mutate(name = "SAINt JHN") |>
  mutate(song = "Roses - Imanbek Remix") |>
  relocate(name, song)



# 12) Michaël Brun	Haiti

# Create and perform the request 
response_michael_brun <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USUM71804825") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_michael_brun <- response_michael_brun |> 
  resp_body_json()

# Get audio details

audio_features_michael_brun <- data_michael_brun$object$audio

audio_features_michael_brun <- as_tibble(audio_features_michael_brun) |>
  mutate(name = "Michaël Brun") |>
  mutate(song = "Positivo") |>
  relocate(name, song)



# 13) Byron Messia	St Kitts and Nevis

# Create and perform the request 
response_byron_messia <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QZFZ22348066") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_byron_messia <- response_byron_messia |> 
  resp_body_json()

# Get audio details

audio_features_byron_messia <- data_byron_messia$object$audio

audio_features_byron_messia <- as_tibble(audio_features_byron_messia) |>
  mutate(name = "Byron Messia") |>
  mutate(song = "Talibans") |>
  relocate(name, song)



# 14) Crocadile	St Lucia

# Create and perform the request 
response_crocadile <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/QZK6N1955548") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_crocadile <- response_crocadile |> 
  resp_body_json()

# Get audio details

audio_features_crocadile <- data_crocadile$object$audio

audio_features_crocadile <- as_tibble(audio_features_crocadile) |>
  mutate(name = "Crocadile") |>
  mutate(song = "Rincing Target") |>
  relocate(name, song)



# 15) Kevin Lyttle	St Vincent and the Grenadines

# Create and perform the request 
response_kevin_lyttle <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USAT20400415") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_kevin_lyttle <- response_kevin_lyttle |> 
  resp_body_json()

# Get audio details

audio_features_kevin_lyttle <- data_kevin_lyttle$object$audio

audio_features_kevin_lyttle <- as_tibble(audio_features_kevin_lyttle) |>
  mutate(name = "Kevin Lyttle") |>
  mutate(song = "Turn Me On") |>
  relocate(name, song)



# 16) Jairzinho	Suriname

# Create and perform the request 
response_jairzinho <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/TCACX1714065") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_jairzinho <- response_jairzinho |> 
  resp_body_json()

# Get audio details

audio_features_jairzinho <- data_jairzinho$object$audio

audio_features_jairzinho <- as_tibble(audio_features_jairzinho) |>
  mutate(name = "Jairzinho") |>
  mutate(song = "Tempo") |>
  relocate(name, song)





# Combine all data and save

combi_carib_audio_features <- rbind(audio_features_gente_de_zona, audio_features_el_alfa,
                                     audio_features_machel_montano, audio_features_major_lazer,
                                     audio_features_au_ra, audio_features_baha_men, 
                                     audio_features_amanda_reifer, audio_features_sui_uzi,
                                     audio_features_sagcy, audio_features_mighty_sparrow,
                                     audio_features_saint_jhn, audio_features_michael_brun,
                                     audio_features_byron_messia, audio_features_crocadile,
                                     audio_features_kevin_lyttle, audio_features_jairzinho)

write_xlsx(combi_carib_audio_features, "saved_data/carib_music_audio_features_apr_2026_part_2.xlsx")


