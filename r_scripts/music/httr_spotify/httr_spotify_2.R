# Spotify Audio Features Downloader using httr2
# This script retrieves audio features for multiple tracks from Spotify Web API

library(httr2)
library(jsonlite)
library(dplyr)
library(purrr)

# Configuration - Get credentials from environment variables
get_spotify_credentials <- function() {
  client_id <- Sys.getenv("SPOTIFY_CLIENT_ID")
  client_secret <- Sys.getenv("SPOTIFY_CLIENT_SECRET")
  
  if (client_id == "") {
    stop("SPOTIFY_CLIENT_ID environment variable is not set.\n",
         "Set it using: Sys.setenv(SPOTIFY_CLIENT_ID = 'your_client_id')\n",
         "Or add it to your .Renviron file: SPOTIFY_CLIENT_ID=your_client_id")
  }
  
  if (client_secret == "") {
    stop("SPOTIFY_CLIENT_SECRET environment variable is not set.\n",
         "Set it using: Sys.setenv(SPOTIFY_CLIENT_SECRET = 'your_client_secret')\n",
         "Or add it to your .Renviron file: SPOTIFY_CLIENT_SECRET=your_client_secret")
  }
  
  return(list(
    client_id = client_id,
    client_secret = client_secret
  ))
}

#' Get Spotify Access Token using Client Credentials Flow
#' @return Access token string
get_spotify_token <- function() {
  token_url <- "https://accounts.spotify.com/api/token"
  
  # Create credentials string for Basic Auth
  credentials <- base64enc::base64encode(charToRaw(paste0(SPOTIFY_CLIENT_ID, ":", SPOTIFY_CLIENT_SECRET)))
  
  response <- request(token_url) |>
    req_method("POST") |>
    req_headers(
      "Authorization" = paste("Basic", credentials),
      "Content-Type" = "application/x-www-form-urlencoded"
    ) |>
    req_body_raw("grant_type=client_credentials", "application/x-www-form-urlencoded") |>
    req_perform()
  
  if (resp_status(response) != 200) {
    stop("Failed to get access token: ", resp_status(response))
  }
  
  token_data <- resp_body_json(response)
  return(token_data$access_token)
}

#' Get audio features for multiple tracks
#' @param track_ids Vector of Spotify track IDs (max 100)
#' @param access_token Spotify access token
#' @return Data frame with audio features
get_audio_features <- function(track_ids, access_token) {
  
  # Validate input
  if (length(track_ids) == 0) {
    stop("At least one track ID is required")
  }
  
  if (length(track_ids) > 100) {
    warning("Maximum 100 track IDs allowed. Taking first 100.")
    track_ids <- track_ids[1:100]
  }
  
  # Remove any empty or NA values
  track_ids <- track_ids[!is.na(track_ids) & track_ids != ""]
  
  if (length(track_ids) == 0) {
    stop("No valid track IDs provided")
  }
  
  # Create comma-separated string of IDs
  ids_string <- paste(track_ids, collapse = ",")
  
  # Build API request
  base_url <- "https://api.spotify.com/v1/audio-features"
  
  response <- request(base_url) |>
    req_url_query(ids = ids_string) |>
    req_headers(
      "Authorization" = paste("Bearer", access_token),
      "Content-Type" = "application/json"
    ) |>
    req_perform()
  
  # Check response status
  if (resp_status(response) != 200) {
    error_body <- tryCatch(resp_body_json(response), error = function(e) NULL)
    if (!is.null(error_body) && !is.null(error_body$error)) {
      stop("API Error: ", error_body$error$message, " (Status: ", resp_status(response), ")")
    } else {
      stop("API request failed with status: ", resp_status(response))
    }
  }
  
  # Parse response
  features_data <- resp_body_json(response)
  
  if (is.null(features_data$audio_features)) {
    stop("No audio_features found in response")
  }
  
  # Convert to data frame
  features_df <- map_dfr(features_data$audio_features, function(track) {
    if (is.null(track)) {
      # Handle null entries (tracks not found)
      return(data.frame(
        id = NA,
        acousticness = NA,
        danceability = NA,
        energy = NA,
        instrumentalness = NA,
        key = NA,
        liveness = NA,
        loudness = NA,
        mode = NA,
        speechiness = NA,
        tempo = NA,
        time_signature = NA,
        valence = NA,
        duration_ms = NA,
        analysis_url = NA,
        track_href = NA,
        uri = NA,
        type = NA,
        stringsAsFactors = FALSE
      ))
    }
    
    # Convert to data frame, handling any missing fields
    data.frame(
      id = track$id %||% NA,
      acousticness = track$acousticness %||% NA,
      danceability = track$danceability %||% NA,
      energy = track$energy %||% NA,
      instrumentalness = track$instrumentalness %||% NA,
      key = track$key %||% NA,
      liveness = track$liveness %||% NA,
      loudness = track$loudness %||% NA,
      mode = track$mode %||% NA,
      speechiness = track$speechiness %||% NA,
      tempo = track$tempo %||% NA,
      time_signature = track$time_signature %||% NA,
      valence = track$valence %||% NA,
      duration_ms = track$duration_ms %||% NA,
      analysis_url = track$analysis_url %||% NA,
      track_href = track$track_href %||% NA,
      uri = track$uri %||% NA,
      type = track$type %||% NA,
      stringsAsFactors = FALSE
    )
  })
  
  return(features_df)
}

#' Get audio features for large number of tracks (handles batching)
#' @param track_ids Vector of Spotify track IDs
#' @param access_token Spotify access token
#' @param batch_size Number of tracks per API call (max 100)
#' @param delay_seconds Delay between API calls to avoid rate limiting
#' @return Data frame with audio features for all tracks
get_audio_features_batch <- function(track_ids, access_token, batch_size = 100, delay_seconds = 0.1) {
  
  # Remove duplicates and invalid IDs
  track_ids <- unique(track_ids[!is.na(track_ids) & track_ids != ""])
  
  if (length(track_ids) == 0) {
    stop("No valid track IDs provided")
  }
  
  # Split into batches
  batches <- split(track_ids, ceiling(seq_along(track_ids) / batch_size))
  
  cat("Processing", length(track_ids), "tracks in", length(batches), "batches...\n")
  
  # Process each batch
  all_features <- map_dfr(seq_along(batches), function(i) {
    cat("Processing batch", i, "of", length(batches), "...\n")
    
    batch_features <- get_audio_features(batches[[i]], access_token)
    
    # Add delay between requests to avoid rate limiting
    if (i < length(batches) && delay_seconds > 0) {
      Sys.sleep(delay_seconds)
    }
    
    return(batch_features)
  })
  
  cat("Completed! Retrieved features for", nrow(all_features), "tracks.\n")
  return(all_features)
}

#' Extract track IDs from Spotify URIs or URLs
#' @param spotify_identifiers Vector of Spotify URIs, URLs, or track IDs
#' @return Vector of clean track IDs
extract_track_ids <- function(spotify_identifiers) {
  # Handle different Spotify identifier formats
  track_ids <- map_chr(spotify_identifiers, function(identifier) {
    if (is.na(identifier) || identifier == "") {
      return(NA)
    }
    
    # If it's already a track ID (22 character alphanumeric string)
    if (grepl("^[a-zA-Z0-9]{22}$", identifier)) {
      return(identifier)
    }
    
    # Extract from Spotify URI (spotify:track:ID)
    if (grepl("^spotify:track:", identifier)) {
      return(gsub("^spotify:track:", "", identifier))
    }
    
    # Extract from Spotify URL
    if (grepl("spotify\\.com/track/", identifier)) {
      extracted <- regmatches(identifier, regexpr("track/[a-zA-Z0-9]{22}", identifier))
      if (length(extracted) > 0) {
        return(gsub("track/", "", extracted))
      }
    }
    
    return(NA)
  })
  
  return(track_ids)
}

# Example usage and helper function
#' Main function to download audio features
#' @param track_identifiers Vector of Spotify track IDs, URIs, or URLs
#' @param batch_size Number of tracks per API call (max 100)
#' @param delay_seconds Delay between API calls
#' @return Data frame with audio features
download_spotify_audio_features <- function(track_identifiers, batch_size = 100, delay_seconds = 0.1) {
  
  # Get access token
  cat("Getting Spotify access token...\n")
  access_token <- get_spotify_token()
  
  # Extract clean track IDs
  cat("Extracting track IDs...\n")
  track_ids <- extract_track_ids(track_identifiers)
  
  # Remove any failed extractions
  valid_ids <- track_ids[!is.na(track_ids)]
  
  if (length(valid_ids) == 0) {
    stop("No valid track IDs found in input")
  }
  
  if (length(valid_ids) < length(track_identifiers)) {
    cat("Warning:", length(track_identifiers) - length(valid_ids), "invalid identifiers were skipped.\n")
  }
  
  # Get audio features
  features <- get_audio_features_batch(valid_ids, access_token, batch_size, delay_seconds)
  
  return(features)
}

# Example usage:

# Set your Spotify credentials (do this once per session)
Sys.setenv(SPOTIFY_CLIENT_ID = "your_client_id_here")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "your_client_secret_here")

# Example track IDs/URIs/URLs
example_tracks <- c(
  "7ouMYWpwJ422jRcDASZB7P",  # Track ID
  "spotify:track:4VqPOruhp5EdPBeR92t6lQ",  # Spotify URI
  "https://open.spotify.com/track/2takcwOaAZWiXQijPHIx7B",  # Spotify URL
  "1301WleyT98MSxVHPZCA6M"   # Another Track ID
)

# Download audio features
audio_features <- download_spotify_audio_features(example_tracks)

# View the results
print(audio_features)

# Save to CSV if desired
write.csv(audio_features, "spotify_audio_features.csv", row.names = FALSE)