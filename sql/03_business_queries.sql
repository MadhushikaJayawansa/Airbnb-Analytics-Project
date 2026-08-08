SELECT 'Fact_Listings', COUNT(*)
FROM Fact_Listings;

SELECT COUNT(*) AS Total_Listings
FROM Fact_Listings;

SELECT AVG(price) AS  Average_Price
FROM Fact_Listings;

-- ==========================================
-- KPI Dashboard
-- ==========================================

SELECT
    COUNT(*) AS Total_Listings,
    AVG(price) AS Average_Price,
    MAX(price) AS Highest_Price,
    MIN(price) AS Lowest_Price,
    SUM(number_of_reviews) AS Total_Reviews,
    AVG(minimum_nights) AS Average_Minimum_Nights,
    AVG(availability_365) AS Average_Availability
FROM Fact_Listings;


-- ==========================================
-- Business Question 3
-- Listings by Neighbourhood Group
-- ==========================================

SELECT
    dl.neighbourhood_group,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Location dl
    ON fl.location_key = dl.location_key
GROUP BY dl.neighbourhood_group
ORDER BY Total_Listings DESC;

-- ==========================================
-- Business Question 4
-- Listings by Room Type 
-- ==========================================
SELECT
    drt.room_type,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_room_Type drt
    ON fl.room_type_key = drt.room_type_key
GROUP BY drt.room_type
ORDER BY Total_Listings DESC;

-- ==========================================
-- Business Question 4
--  Listings by Year
-- ==========================================
SELECT
    dm.year,
    COUNT(*)AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Date dm
     ON fl.date_key =dm.date_key
GROUP BY dm.year
ORDER BY Total_Listings DESC
    
    -- ==========================================
-- Business Question 5
--  Listings by Host
-- ==========================================

SELECT
    dh.host_name,
    COUNT(*)AS Total_Listings
FROM Fact_Listings fl
JOIN DIM_HOST dh
     ON fl.host_key =dh.host_key
GROUP BY dh.host_name
ORDER BY Total_Listings DESC

-- ==========================================
-- Business Question 6
-- Top 10 Hosts by Number of Listings
-- ==========================================

SELECT
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
GROUP BY
    dh.host_id,
    dh.host_name
ORDER BY Total_Listings DESC
LIMIT 10;



-- ==========================================
-- Business Question 7
-- Avarage Prices by Room Type
-- ==========================================

SELECT
    drt.room_type,
    AVG(fl.price) AS Average_Price
FROM Fact_Listings fl
JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key
GROUP BY drt.room_type
ORDER BY Average_Price DESC;

-- ==========================================
-- Business Question 8
-- Average Listing Price by Neighbourhood Group
-- ==========================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.price) AS Average_price
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_price DESC;

-- ===============================================
---- Business Question 9
--Top 10 neighbourhoods by average listing price
-- ===============================================

SELECT
    dl.neighbourhood_group,dl.neighbourhood,
    AVG(fl.price) AS Average_price
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group,
          dl.neighbourhood
ORDER BY Average_price DESC
LIMIT 10;


-- ==================================================
-- Business Question 10
-- Top 10 Neighbourhoods by Number of Listings
-- ==================================================

SELECT
    dl.neighbourhood_group,
    dl.neighbourhood,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Location dl
    ON fl.location_key = dl.location_key
GROUP BY
    dl.neighbourhood_group,
    dl.neighbourhood
ORDER BY Total_Listings DESC
LIMIT 10;

-- ==================================================
-- Business Question 11
-- Average Availability by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.availability_365) AS Average_Avalibility
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_Avalibility DESC
LIMIT 10;

-- ==================================================
-- Business Question 12
-- Average Reviews by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.number_of_reviews) AS Average_reviews
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_reviews DESC;


-- ==================================================
-- Business Question 13
-- Average Minimum Nights by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.minimum_nights) AS Average_nights
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_nights ASC;

-- ==================================================
-- Business Question 14
-- average number of reviews for each room type
-- ==================================================

SELECT
    drt.room_type,
    AVG(fl.number_of_reviews) AS Average_Reviews
FROM  Fact_Listings fl
JOIN  dim_room_type drt
     ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY Average_Reviews;

-- ==================================================
-- Business Question 15
-- average availability for each room type
-- ==================================================

SELECT
    drt.room_type,
    AVG(fl.availability_365) AS Average_Avalibility
FROM  Fact_Listings fl
JOIN  dim_room_type drt
     ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY Average_Avalibility;


-- ==================================================
-- Business Question 16
-- Average minimum stay requirement for each room type
-- ==================================================

SELECT
    drt.room_type,
    AVG(fl.minimum_nights) AS Average_minimum_nights
FROM  Fact_Listings fl
JOIN  dim_room_type drt
     ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY Average_minimum_nights;