DROP DATABASE IF EXISTS cities_db;
CREATE DATABASE cities_db;
USE cities_db;

CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) UNIQUE
);

CREATE TABLE population (
    population_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    population INT,
    year_retrieved INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE coordinates (
    coord_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    latitude FLOAT,
    longitude FLOAT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    country VARCHAR(100),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE weather (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    datetime DATETIME,
    temp FLOAT,
    feels_like FLOAT,
    humidity INT,
    weather VARCHAR(50),
    wind_speed FLOAT,
    pop FLOAT,
    rain_3h FLOAT,
    snow_3h FLOAT,
    retrieved_at DATETIME,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

/*
SELECT c.city,
       p.population,
       p.
       co.latitude,
       co.longitude,
       ctr.country
FROM cities c
JOIN population p USING(city_id)
JOIN coordinates co USING(city_id)
JOIN country ctr USING(city_id)