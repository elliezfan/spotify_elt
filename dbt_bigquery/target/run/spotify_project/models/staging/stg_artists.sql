

  create or replace view `spotify600k`.`tap_csv`.`stg_artists`
  OPTIONS()
  as SELECT id AS artist_id,
		CASE WHEN followers='' THEN 0
			 ELSE CAST(CAST(followers AS numeric) AS integer)
		END
		AS followers,
		genres,
		CAST(name AS string) AS artist_name,
		CAST(popularity AS integer) AS artist_popularity
FROM `spotify600k`.`spotify`.`artists`;

