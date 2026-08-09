-- ==================================================
-- Business Question 21
-- Estimated Revenue by Borough
-- ==================================================

SELECT
   dl.neighbourhood_group,
    sum(price*availability_365) AS Estimated_Revenue
FROM Fact_Listings fl
JOIN dim_location dl
       ON fl.location_key = dl.location_key
GROUP BY dl.neighbourhood_group
ORDER BY  Estimated_Revenue DESC
limit 10;