-- Creating the database

CREATE DATABASE toman_bike_data

USE toman_bike_data


-- Populating the database with tables and columns

SELECT * FROM bike_share_yr_0;
SELECT * FROM bike_share_yr_1;


-- Joining the two tables with UNION

SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1;


-- Joining the above tables with cost tables using cte and LEFT JOIN, and selecting the relevant columns.

WITH cte AS(
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)

SELECT 
	dteday,
	season,
	cte.yr,
	weekday,
	hr,
	rider_type,
	riders,
	price,
	COGS,
	riders * price AS revenue,
	riders * price - COGS * riders AS profit 
FROM cte
LEFT JOIN cost_table	
	ON cte.yr = cost_table.yr;

-- Now Creating Dashboard in Power BI