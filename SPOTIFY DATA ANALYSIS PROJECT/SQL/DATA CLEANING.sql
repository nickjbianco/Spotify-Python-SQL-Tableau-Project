-- Creates table to match with CSV converted from JSON file via python from Spotify
CREATE TABLE streaming_history (
  end_time TEXT,
  artist_name TEXT,
  track_name TEXT,
  ms_played INTEGER
)

-- Imports the CSV into PostgreSQL
COPY streaming_history(end_time, artist_name, track_name, ms_played)
FROM '/Users/nickbianco/All_StreamingHistory_music.csv'
DELIMITER ','
CSV HEADER

-- Adds a minutes played column to the table since ms_played represents milliseconds 
ALTER TABLE streaming_history
ADD COLUMN minutes_played NUMERIC

-- Takes the milliseconds and converts them to minutes for the new added column
UPDATE streaming_history
SET minutes_played = ROUND(ms_played / 60000.0, 2)
