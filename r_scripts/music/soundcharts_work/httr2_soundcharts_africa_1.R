# Using httr2 to extract data from Soundcharts API - Africa

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

# 1) Sofiya Nzau Kenya

# Create and perform the request 
response_sofiya_nzau <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/NLRD52339318") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_sofiya_nzau <- response_sofiya_nzau |> 
  resp_body_json()

# Get audio details

audio_features_sofiya_nzau <- data_sofiya_nzau$object$audio

audio_features_sofiya_nzau <- as_tibble(audio_features_sofiya_nzau) |>
  mutate(name = "Sofiya Nzau") |>
  mutate(song = "Mwaki") |>
  relocate(name, song)


# 2) Tems	Nigeria

# Create and perform the request 
response_tems <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USSM12203789") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_tems <- response_tems |> 
  resp_body_json()

# Get audio details

audio_features_tems <- data_tems$object$audio

audio_features_tems <- as_tibble(audio_features_tems) |>
  mutate(name = "Tems") |>
  mutate(song = "WAIT FOR U") |>
  relocate(name, song)



# 3) Tyla	South Africa

# Create and perform the request 
response_tyla <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USSM12305126") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_tyla <- response_tyla |> 
  resp_body_json()

# Get audio details

audio_features_tyla <- data_tyla$object$audio

audio_features_tyla <- as_tibble(audio_features_tyla) |>
  mutate(name = "Tyla") |>
  mutate(song = "Water") |>
  relocate(name, song)



# 4) Amaarae Ghana

# Create and perform the request 
response_amaarae <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/GBUV72200082") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_amaarae <- response_amaarae |> 
  resp_body_json()

# Get audio details

audio_features_amaarae <- data_amaarae$object$audio

audio_features_amaarae <- as_tibble(audio_features_amaarae) |>
  mutate(name = "Amaarae") |>
  mutate(song = "SAD GIRLZ LUV MONEY - Remix") |>
  relocate(name, song)




# 5) Sherine Egypt

# Create and perform the request 
response_sherine <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/EGA071800047") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_sherine <- response_sherine |> 
  resp_body_json()

# Get audio details

audio_features_sherine <- data_sherine$object$audio

audio_features_sherine <- as_tibble(audio_features_sherine) |>
  mutate(name = "Sherine") |>
  mutate(song = "كلام عينيه") |>
  relocate(name, song)



# 6) Soolking	Algeria

# Create and perform the request 
response_soolking <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/FRPZ92324651") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_soolking <- response_soolking |> 
  resp_body_json()

# Get audio details

audio_features_soolking <- data_soolking$object$audio

audio_features_soolking <- as_tibble(audio_features_soolking) |>
  mutate(name = "Soolking") |>
  mutate(song = "Casanova") |>
  relocate(name, song)



# 7) DJ Malvado	Angola

# Create and perform the request 
response_dj_malvado <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/PT7EX2400240") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_dj_malvado <- response_dj_malvado |> 
  resp_body_json()

# Get audio details

audio_features_dj_malvado <- data_dj_malvado$object$audio

audio_features_dj_malvado <- as_tibble(audio_features_dj_malvado) |>
  mutate(name = "DJ Malvado") |>
  mutate(song = "Mussulo") |>
  relocate(name, song)



# 8) Salif Keita	Mali

# Create and perform the request 
response_salif_keita <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/FRUM72400728") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_salif_keita <- response_salif_keita |> 
  resp_body_json()

# Get audio details

audio_features_salif_keita <- data_salif_keita$object$audio

audio_features_salif_keita <- as_tibble(audio_features_salif_keita) |>
  mutate(name = "Salif Keita") |>
  mutate(song = "Yamore (feat. Cesária Evora, Benja (NL) & Franc Fala)") |>
  relocate(name, song)


# 9) ElGrandeToto	Morocco

# Create and perform the request 
response_elgrandetoto <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/ZA34K2000415") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_elgrandetoto <- response_elgrandetoto |> 
  resp_body_json()

# Get audio details

audio_features_elgrandetoto <- data_elgrandetoto$object$audio

audio_features_elgrandetoto <- as_tibble(audio_features_elgrandetoto) |>
  mutate(name = "ElGrandeToto") |>
  mutate(song = "love nwantiti (feat. ElGrande Toto) [North African Remix]") |>
  relocate(name, song)



# 10) Samara	Tunisia

# Create and perform the request 
response_samara <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/TNA0E2200882") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_samara <- response_samara |> 
  resp_body_json()

# Get audio details

audio_features_samara <- data_samara$object$audio

audio_features_samara <- as_tibble(audio_features_samara) |>
  mutate(name = "Samara") |>
  mutate(song = "Galbi") |>
  relocate(name, song)


# 11) Nitefreak	Zimbabwe

# Create and perform the request 
response_nitefreak <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/USZ4V2300268") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_nitefreak <- response_nitefreak |> 
  resp_body_json()

# Get audio details

audio_features_nitefreak <- data_nitefreak$object$audio

audio_features_nitefreak <- as_tibble(audio_features_nitefreak) |>
  mutate(name = "Nitefreak") |>
  mutate(song = "Gorah") |>
  relocate(name, song)



# 12) Joshua Baraka	Uganda

# Create and perform the request 
response_joshua_baraka <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/GBX722530003") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_joshua_baraka <- response_joshua_baraka |> 
  resp_body_json()

# Get audio details

audio_features_joshua_baraka <- data_joshua_baraka$object$audio

audio_features_joshua_baraka <- as_tibble(audio_features_joshua_baraka) |>
  mutate(name = "Joshua Baraka") |>
  mutate(song = "Wrong Places") |>
  relocate(name, song)



# 13) Diamond Platnumz	Tanzania

# Create and perform the request 
response_diamond_platnumz <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/TCAEB1949188") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_diamond_platnumz <- response_diamond_platnumz |> 
  resp_body_json()

# Get audio details

audio_features_diamond_platnumz <- data_diamond_platnumz$object$audio

audio_features_diamond_platnumz <- as_tibble(audio_features_diamond_platnumz) |>
  mutate(name = "Diamond Platnumz") |>
  mutate(song = "Tetema (feat. Diamond Platnumz)") |>
  relocate(name, song)



# 14) Mia Guisse	Senegal

# Create and perform the request 
response_mia_guisse <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/DGA082471335") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_mia_guisse <- response_mia_guisse |> 
  resp_body_json()

# Get audio details

audio_features_mia_guisse <- data_mia_guisse$object$audio

audio_features_mia_guisse <- as_tibble(audio_features_mia_guisse) |>
  mutate(name = "Mia Guisse") |>
  mutate(song = "Confuse") |>
  relocate(name, song)



# 15) Alpha Blondy Ivory Coast

# Create and perform the request 
response_alpha_blondy <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/CIA010700001") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_alpha_blondy <- response_alpha_blondy |> 
  resp_body_json()

# Get audio details

audio_features_alpha_blondy <- data_alpha_blondy$object$audio

audio_features_alpha_blondy <- as_tibble(audio_features_alpha_blondy) |>
  mutate(name = "Alpha Blondy") |>
  mutate(song = "I Wish You Were Here") |>
  relocate(name, song)


# 16) Fally Ipupa Democratic Republic of the Congo

# Create and perform the request 
response_fally_ipupa <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/FR9W11903548") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_fally_ipupa <- response_fally_ipupa |> 
  resp_body_json()

# Get audio details

audio_features_fally_ipupa <- data_fally_ipupa$object$audio

audio_features_fally_ipupa <- as_tibble(audio_features_fally_ipupa) |>
  mutate(name = "Fally Ipupa") |>
  mutate(song = "À Kinshasa (feat. Fally Ipupa)") |>
  relocate(name, song)


# 17) Mulatu Astatke	Ethiopia

# Create and perform the request 
response_mulatu_astatke <- request("https://customer.api.soundcharts.com/api/v2.25/song/by-isrc/DEG930990148") |>
  req_headers(
    'x-app-id' = client_id,
    'x-api-key' = client_secret
  ) |>
  req_perform()

# Parse the JSON response
data_mulatu_astatke <- response_mulatu_astatke |> 
  resp_body_json()

# Get audio details

audio_features_mulatu_astatke <- data_mulatu_astatke$object$audio

audio_features_mulatu_astatke <- as_tibble(audio_features_mulatu_astatke) |>
  mutate(name = "Mulatu Astatke") |>
  mutate(song = "Tezeta") |>
  relocate(name, song)


# Combine all data and save

combi_africa_audio_features <- rbind(audio_features_sofiya_nzau, audio_features_tems,
                                     audio_features_tyla, audio_features_amaarae,
                                     audio_features_sherine, audio_features_soolking,
                                     audio_features_dj_malvado, audio_features_salif_keita,
                                     audio_features_elgrandetoto, audio_features_samara,
                                     audio_features_nitefreak, audio_features_joshua_baraka,
                                     audio_features_diamond_platnumz, audio_features_mia_guisse,
                                     audio_features_alpha_blondy, audio_features_fally_ipupa,
                                     audio_features_mulatu_astatke)

write_xlsx(combi_africa_audio_features, "saved_data/africa_music_audio_features_apr_2026_part_2.xlsx")
