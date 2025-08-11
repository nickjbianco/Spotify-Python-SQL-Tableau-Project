
-- What is the top artist per each time of day?
-- Morning 5:00 – 11:59 AM
-- Afternoon 12:00 – 4:59 PM
-- Evening 5:00 – 11:59 PM
-- Night/Early Morning 12:00 - 4:59 AM

WITH 
	time_buckets AS (
	-- Creates time buckets that reflect the ones above
		SELECT
			artist_name, track_name, 
			minutes_played,
			CASE 
				WHEN EXTRACT(HOUR FROM end_time) BETWEEN 5 AND 11 THEN 'Morning'
				WHEN EXTRACT(HOUR FROM end_time) BETWEEN 12 AND 16 THEN 'Afternoon'
				WHEN EXTRACT(HOUR FROM end_time) BETWEEN 17 AND 23 THEN 'Evening'
				ELSE 'Night'
			END AS time_of_day
		FROM streaming_history
	), 
	artist_sum AS (
	-- Returns the total minutes played per time of day per respective artist
		SELECT 
			time_of_day, artist_name,
			SUM(minutes_played) AS total_mins
		FROM time_buckets
		GROUP BY time_of_day, artist_name

	), 
	top_artists AS (
	-- Returns a list ordering the artists by time of day according to the total minutes I listened to them
		SELECT
			time_of_day, artist_name, 
			ROW_NUMBER() OVER(PARTITION BY time_of_day ORDER BY total_mins DESC) AS top_artist
		FROM artist_sum
	)

	-- Final query that returns the top artists per that time of day based on total mins listened to
	SELECT 
		time_of_day, artist_name 
	FROM top_artists
	WHERE top_artist = 1

