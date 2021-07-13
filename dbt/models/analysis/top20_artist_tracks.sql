WITH cte1 AS
(
SELECT unnest(
			string_to_array(
			REPLACE(REPLACE(artist_id,'[',''),']',''),',')) AS new_artist_id,
		*
FROM {{ref('stg_tracks')}}
),
cte2 AS
(
SELECT *,
		DENSE_RANK() OVER (ORDER BY followers desc) AS rnk_followers
FROM {{ref('stg_artists')}}
)
SELECT c2.artist_id,
		c2.artist_name,
		c2.followers,
		c2.artist_popularity,
		c1.track_id,
		c1.track_name,
		c1.track_popularity,
		c1.release_year,
		c1.explicit,
		c1.danceability,
		c1.energy,
		c1.speechiness,
		c1.acousticness,
		c1.instrumentalness,
		c1.liveness,
		c1.valence
FROM cte1 c1
INNER JOIN cte2 c2
ON c1.new_artist_id LIKE CONCAT('%',c2.artist_id,'%')
WHERE c2.rnk_followers<=20