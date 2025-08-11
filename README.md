# Spotify Listening Trends – Tableau Project

## Overview

This project analyzes my personal Spotify streaming history to uncover insights about listening habits, favorite artists, and time-based trends.  
Using Python for preprocessing, SQL for querying, and Tableau for visualization, I built an interactive dashboard that showcases patterns in my music consumption.

---

## Data Source

- **Spotify Streaming History** – Exported from my personal Spotify account.
- Original JSON files were cleaned and converted to CSV using Python.
- Final dataset fields include:
  - `end_time` – Timestamp of when a track finished playing.
  - `artist_name` – Artist of the track.
  - `track_name` – Track title.
  - `ms_played` – Duration played in milliseconds.
  - `minutes_played` – Converted from `ms_played` for easier aggregation.

---

## Analysis Steps

### 1. Data Cleaning

- Converted JSON to CSV (`json_to_csv.html` Python script).
- Removed incomplete or corrupted records.
- Added calculated field: **minutes_played** (`ms_played / 60000`).
- Stored cleaned data in a SQL database for querying.

### 2. SQL Analysis

**Key SQL scripts:**

- `MOST PLAYED TRACKS & ARTISTS.sql` – Identifies most played tracks and artists.
- `TIME OF DAY HABITS.sql` – Buckets listening habits into:
  - Morning: 5 AM – 11:59 AM
  - Afternoon: 12 PM – 4:59 PM
  - Evening: 5 PM – 11:59 PM
  - Night: 12 AM – 4:59 AM
- `TOP ARTISTS TIME OF DAY.sql` – Finds top artist for each time-of-day category.
- `DAY|MONTH|YEAR TRENDS.sql` – Calculates:
  - Average hours listened per weekday.
  - Average hours listened per month.
  - Yearly total hours listened.

---

## Tableau Dashboard

The dashboard contains:

1. **Top Artists & Tracks** – Sorted by total minutes played.
2. **Listening Time of Day** – Shows average listening habits across four time ranges.
3. **Top Artists per Time of Day** – Displays which artists dominate each time slot.
4. **Listening Trends Over Time** – Visualizes monthly and yearly changes.
5. **Day-of-Week Listening Patterns** – Highlights when listening peaks during the week.

---

## Key Insights

- Identified consistent listening spikes during evenings and afternoons.
- Predominately listen to artists in the Rock category, particularly Heavy Metal & Hard Rock.
- Listening hours peak in winter months and drop slightly in summer.

---

## Tools Used

- **Python** – Data cleaning and transformation.
- **SQL** – Data querying and aggregation.
- **Tableau** – Data visualization and dashboard creation.

---

## How to Use

1. Open the Tableau workbook `SPOTIFY DATA TRENDS.twb`.
2. Explore dashboard filters for:
   - Time ranges
   - Artists
   - Specific months or years
3. Hover over charts for deeper insights.

