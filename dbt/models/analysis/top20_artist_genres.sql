WITH cte1 AS
(
SELECT *,
		DENSE_RANK() OVER (ORDER BY followers desc) AS rnk_followers
FROM {{ref('stg_artists')}}
),
cte2 AS
(
SELECT artist_id,
		artist_name,
		followers,
		artist_popularity,
		rnk_followers,
		REPLACE(
			UNNEST(
				string_to_array(
					REPLACE(
						REPLACE(genres,'[',''),
					']',''),
				', '))
			, '''', '') AS genres
FROM cte1
)
SELECT artist_id,
		artist_name,
		followers,
		artist_popularity,
		CAST(genres AS VARCHAR) AS genres
FROM cte2
WHERE rnk_followers<=20