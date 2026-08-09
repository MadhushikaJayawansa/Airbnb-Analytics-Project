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