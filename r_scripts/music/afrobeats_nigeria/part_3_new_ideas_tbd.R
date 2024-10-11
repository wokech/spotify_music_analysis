# Individual track analysis

a <- get_track_audio_features('1s7oOCT8vauUh01PbJD6ps')

b <- get_track_audio_analysis('1s7oOCT8vauUh01PbJD6ps')


# Artist audio features for all 12 Nigerian Afrobeat musicians
combi_audio_features_naija <- readRDS("saved_data/combi_audio_features_naija.RDS")

# Artist top tracks for all 12 Nigerian Afrobeat musicians
combi_artist_top_tracks_naija <- readRDS("saved_data/combi_artist_top_tracks_naija.RDS")
