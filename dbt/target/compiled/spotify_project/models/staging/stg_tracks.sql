SELECT id AS track_id,
		name AS track_name,
		CAST(popularity AS integer) AS track_popularity,
		CAST(duration_ms AS integer) AS duration_ms,
		CAST(explicit AS boolean) AS explicit ,
		artists,
		id_artists AS artist_id,
		release_date,
		CAST(danceability AS float) AS danceability,
		CAST(energy AS float) AS energy,
		CAST(key AS integer) AS key,
		CAST(loudness AS float) AS loudness,
		CAST(mode AS integer) AS mode,
		CAST(speechiness AS float) AS speechiness,
		CAST(acousticness AS float) AS acousticness,
		CAST(instrumentalness AS float) AS instrumentalness,
		CAST(liveness AS float) AS liveness,
		CAST(valence AS float) AS valence,
		CAST(tempo AS float) AS tempo,
		CAST(time_signature AS integer) AS time_signature
FROM `spotify600k`.`spotify`.`tracks`