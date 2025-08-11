-- Music Listening Analysis (Spotify Data)

WITH 
-- CTE that converts the Spotify given text date value to timestamp with TZ
timestamp_data AS (
	SELECT
		artist_name, track_name, 
		ms_played, minutes_played, 
	  	TO_TIMESTAMP(end_time, 'YYYY-MM-DD HH24:MI') AS end_time_ts
	FROM streaming_history
),
-- CTE that returns the total amount of hours listened to per date and weekday
daily_listening AS (
  	SELECT
	    DATE(end_time_ts) AS listen_date,
	    TO_CHAR(end_time_ts, 'Day') AS weekday,
	    ROUND(SUM(minutes_played) / 60.0, 2) AS hours_listened
  	FROM timestamp_data
  	GROUP BY listen_date, weekday
),
-- CTE that returns the total amount of hours listened to per date and month
monthly_listening AS (
	  SELECT
	  	DATE(end_time_ts) AS listen_date,
	    TO_CHAR(end_time_ts, 'Month') AS month,
	    ROUND(SUM(minutes_played) / 60.0, 2) AS hours_listened
	  FROM timestamp_data
	  GROUP BY listen_date, month
)

-- Listening time by year
SELECT 
	 EXTRACT(YEAR FROM end_time_ts) AS year, 
	 ROUND(SUM(minutes_played)/60, 2) AS total_hours_listened
FROM timestamp_data
GROUP BY year
ORDER BY SUM(minutes_played)/60 DESC

-- Returns the average hours of music listened to per month
SELECT
  TRIM(month) AS month,
  ROUND(AVG(hours_listened), 2) AS avg_hours_listened
FROM monthly_listening
GROUP BY month
ORDER BY avg_hours_listened DESC

-- Returns the average hours of music listened to per weekday
SELECT
  TRIM(weekday) AS day,
  ROUND(AVG(hours_listened), 2) AS avg_hours_listened
FROM daily_listening
GROUP BY day
ORDER BY avg_hours_listened DESC









