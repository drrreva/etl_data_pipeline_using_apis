# ETL Data Pipeline Project (Cities, Weather & Flights)

## Project Overview

This project is an end-to-end **ETL (Extract, Transform, Load) pipeline** built in Python.  
It collects data from multiple sources, transforms it into structured formats using Pandas, and loads it into a relational SQL database for further analysis.

The goal is to demonstrate how real-world data engineering pipelines work using:
- Web scraping
- Public APIs
- SQL database design
- Data transformation in Python

---

## Data Sources

### 1. Web Scraping (Wikipedia)
Data extracted from Wikipedia city pages:
- City name
- Country
- Population
- Geographic coordinates (latitude, longitude)

Source pages include:
- Berlin
- Hamburg
- Munich

---

### 2. OpenWeather API
Used to collect **5-day weather forecasts** for each city.

Collected variables:
- Temperature
- Feels like temperature
- Humidity
- Weather condition (Clear, Clouds, Rain, etc.)
- Wind speed
- Probability of precipitation
- Rain / Snow volume (if available)

---

### 3. AeroDataBox API (RapidAPI)
Used to collect **flight arrival data** for major airports.

Collected variables:
- Flight number
- Airline
- Departure airport
- Arrival time
- Aircraft model
- Flight status

---

## Data Pipeline Steps

### 1. Extract
- Scrape city data from Wikipedia
- Request weather data from OpenWeather API
- Request flight data from AeroDataBox API

---

### 2. Transform
- Clean and structure JSON responses
- Parse nested API fields
- Convert timestamps to SQL-compatible format
- Normalize and merge datasets using Pandas
- Create foreign key relationships between tables

---

### 3. Load
Data is stored in a MySQL database (`cities_db`) with the following structure:

- `cities` → city metadata
- `population` → population data
- `coordinates` → latitude & longitude
- `country` → country mapping
- `weather` → weather forecasts
- `flights` → flight arrival data

---

## Database Schema

The relational structure is designed to support analysis:

- `cities (city_id)`
    ↳ linked to:
    - population
    - coordinates
    - country
    - weather
    - flights

---

## Technologies Used

- Python
- Pandas
- Requests
- BeautifulSoup
- SQLAlchemy
- PyMySQL
- MySQL
- OpenWeather API
- AeroDataBox API (RapidAPI)

---

## Key Skills Demonstrated

- Web scraping (HTML parsing with BeautifulSoup)
- REST API integration
- Data cleaning and transformation
- Handling nested JSON structures
- SQL database design (relational modeling)
- ETL pipeline construction
- Error handling and debugging API responses

---

## Challenges & Solutions

### 1. API rate limits
Some requests returned 429 errors.  
→ Solved by reducing calls and testing subsets of airports.

### 2. Missing nested fields (rain/snow)
Not all API responses contained weather layers.  
→ Handled using `.get()` with default values.

---

## How to Run the Project

1. Clone the repository
```bash
git clone <repo-url>

2. Install dependencies
pip install -r requirements.txt

3. Set environment variables (in .env file)
MYSQL_PASSWORD=your_password
OPENWEATHER_KEY=your_key
RAPIDAPI_KEY=your_key

4. Run notebook or script
python main.py

## Future improvements

Automate daily data collection (scheduler/cron job)
Expand to more cities and airports
Add data visualisation dashboard
Build predictive model (e.g., weather vs transport demand)
