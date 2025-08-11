-- Cleaned data by converting end_time (text) to a timestamp with timezone of EST to avoid repetitive CTE code
ALTER TABLE streaming_history
ALTER COLUMN end_time TYPE TIMESTAMPTZ
USING TO_TIMESTAMP(end_time, 'YYYY-MM-DD HH24:MI') AT TIME ZONE 'America/New_York';

-- Do you listen more in the morning, afternoon or night? 
-- Morning 5:00 – 11:59 AM
-- Afternoon 12:00 – 4:59 PM
-- Evening 5:00 – 11:59 PM
-- Night/Early Morning 12:00 - 4:59 AM
SELECT
	ROUND(SUM(minutes_played)/60, 2) AS total_hours, 
	CASE 
		WHEN EXTRACT(HOUR FROM end_time) BETWEEN 5 AND 11 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM end_time) BETWEEN 12 AND 16 THEN 'Afternoon'
		WHEN EXTRACT(HOUR FROM end_time) BETWEEN 17 AND 23 THEN 'Evening'
		ELSE 'Night'
	END AS time_of_day
FROM streaming_history
GROUP BY time_of_day
ORDER BY total_hours DESC


