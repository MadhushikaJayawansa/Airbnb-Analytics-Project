-- ==================================================
-- Business Question 22
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


-- =================================================
-- Business Question 23 
-- Estimated Revenue by Room Type
-- ===============================================

SELECT
   drt.room_type,
    SUM(fl.price * fl.availability_365) AS Estimated_Revenue
FROM Fact_Listings fl
JOIN dim_room_type drt
       ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY  Estimated_Revenue DESC
limit 10;