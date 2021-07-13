

  create or replace view `spotify600k`.`tap_csv`.`stg_tracks`
  OPTIONS()
  as SELECT id AS track_id,
		name AS track_name,
		CAST(popularity AS integer) AS track_popularity,
		CAST(duration_ms AS integer) AS duration_ms,
		CAST(explicit AS boolean) AS explicit ,
		artists,
		id_artists AS artist_id,
		PARSE_DATE('%Y', release_date) AS release_year,
		CAST(danceability AS float64) AS danceability,
		CAST(energy AS float64) AS energy,
		CAST(key AS integer) AS key,
		CAST(loudness AS float64) AS loudness,
		CAST(mode AS integer) AS mode,
		CAST(speechiness AS float64) AS speechiness,
		CAST(acousticness AS float64) AS acousticness,
		CAST(instrumentalness AS float64) AS instrumentalness,
		CAST(liveness AS float64) AS liveness,
		CAST(valence AS float64) AS valence,
		CAST(tempo AS float64) AS tempo,
		CAST(time_signature AS integer) AS time_signature
FROM `spotify600k`.`spotify`.`tracks`;

