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