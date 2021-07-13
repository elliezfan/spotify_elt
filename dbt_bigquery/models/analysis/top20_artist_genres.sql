WITH cte1 AS
(
SELECT *,
		DENSE_RANK() OVER (ORDER BY followers desc) AS rnk_followers
FROM {{ref('stg_artists')}}
),
cte2 AS
(
SELECT *
FROM cte1,
	UNNEST(SPLIT(REPLACE(REPLACE(REPLACE(genres,']',''),'[',''),"'",''), ', ')) genre
)
SELECT artist_id,
		artist_name,
		followers,
		artist_popularity,
		genre
FROM cte2
WHERE rnk_followers<=20