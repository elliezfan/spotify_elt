SELECT id AS artist_id,
		CASE WHEN followers='' THEN 0
			 ELSE CAST(CAST(followers AS numeric) AS integer)
		END
		AS followers,
		genres,
		CAST(name AS varchar) AS artist_name,
		CAST(popularity AS integer) AS artist_popularity
FROM {{source('spotify_project','artists')}}