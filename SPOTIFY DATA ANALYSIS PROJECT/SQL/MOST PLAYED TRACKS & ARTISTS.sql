-- Music Listening Analysis (Spotify Data)

-- Top 3 most played tracks with aritst names over time
SELECT 
	artist_name, track_name, 
	COUNT(*) AS plays
FROM streaming_history
GROUP BY artist_name, track_name
ORDER BY plays DESC
LIMIT 3

-- Top 3 most played artists over time
SELECT 
	artist_name,
	COUNT(*) AS plays
FROM streaming_history
GROUP BY artist_name
ORDER BY plays DESC
LIMIT 3