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

