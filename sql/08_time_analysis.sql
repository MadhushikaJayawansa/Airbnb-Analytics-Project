-- =================================================
-- Business Question 24
-- Estimated Revenue by Year
-- ===============================================
SELECT
   dd.year,
    SUM(fl.price * fl.availability_365) AS Estimated_Revenue
FROM Fact_Listings fl
JOIN  dim_date dd 
       ON fl.date_key = dd.date_key
GROUP BY  dd.year
ORDER BY  Estimated_Revenue ASC;
