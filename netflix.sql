-- creation of New Database
CREATE DATABASE netflix;

-- Creating Table
CREATE TABLE netflix_data (
show_id varchar(10),
type varchar(40),
title varchar(40),
director varchar(40),
country varchar(40),
date_added DATE,
release_year int,
rating varchar(10),
duration varchar(10),
listed_in varchar(100)
);
-- This query is used to load local files into the table netflix_data

LOAD DATA LOCAL INFILE 'C:/Users/priya/Downloads/netflix1.csv' INTO TABLE netflix_data
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

-- this code is used to allow local files to get imported in MySQL workbench
SET GLOBAL local_infile=1;

-- Viewing our Dataset
SELECT 
    *
FROM
    netflix_data;

-- Checking for duplicates using our uniqie id col i.e. show_id
SELECT 
    show_id, COUNT(*)
FROM
    netflix_data
GROUP BY show_id
ORDER BY show_id DESC;

-- checking for NULL values across all the columns, if there are any
SELECT 
    COUNT(*)
FROM
    netflix_data
WHERE
    show_id IS NULL AND type IS NULL
        AND title IS NULL
        AND director IS NULL
        AND country IS NULL
        AND date_added IS NULL
        AND release_year IS NULL
        AND rating IS NULL
        AND duration IS NULL
        AND listed_in IS NULL;
-- We can see count is 0 for all the columns, hence there are no NULL values.

-- Hence, we can proceed for Visualizing the data in Tableau.




