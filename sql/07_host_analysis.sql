-- ==================================================
-- Business Question 17
-- Hosts with the Highest Estimated Revenue
-- ==================================================


SELECT
    dh.host_name,
    dh.host_id,
    sum(price*availability_365) AS Estimated_Revenue
FROM Fact_Listings fl
JOIN DIM_HOST dh
       ON fl.host_key = dh.host_key
GROUP BY dh.host_name,dh.host_id
ORDER BY  Estimated_Revenue DESC
limit 10;


-- ==================================================
-- Business Question 18
-- Hosts with the Highest Average Listing Price
-- Minimum 5 Listings
-- ==================================================

SELECT
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings,
    AVG(fl.price) AS Average_Listing_Price
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
GROUP BY
    dh.host_id,
    dh.host_name
HAVING COUNT(*) >= 5
ORDER BY Average_Listing_Price DESC
LIMIT 10;


-- ==================================================
-- Business Question 19
--  Hosts with the Most Reviews
-- ==================================================
SELECT
    dh.host_name,
    dh.host_id,
    sum(number_of_reviews) AS Most_Reviews
FROM Fact_Listings fl
JOIN DIM_HOST dh
       ON fl.host_key = dh.host_key
GROUP BY dh.host_name,dh.host_id
ORDER BY  Most_Reviews DESC
limit 10;