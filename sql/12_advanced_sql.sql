--======================================================================================
--Step 1.1 — First Subquery

--Business Question
-- Which Airbnb listings have a price higher than the overall average listing price?
--=====================================================================================

SELECT
    id,
    price
FROM Fact_Listings
WHERE price > (
    SELECT AVG(price)
    FROM Fact_Listings 
);


--==============================================================================
--Step-2
--Subquery with COUNT()
-- Business Question
--How many Airbnb listings have a price higher than the overall average listing price?
--============================================================================================

SELECT
    COUNT(*) AS Above_Average_Listings
FROM Fact_Listings
WHERE price > (
    SELECT AVG(price)
    FROM Fact_Listings
);

--==============================================================================
--Step-3
--subquery inside another query
-- Business Question
--Which hosts have more listings than the average number of listings per host?
--===========================================================================================

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
HAVING COUNT(*) > (
    SELECT AVG(Total_Listings)
    FROM (
        SELECT
            host_key,
            COUNT(*) AS Total_Listings
        FROM Fact_Listings
        GROUP BY host_key
    )
)
ORDER BY Total_Listings DESC;

--==============================================================================
--Step-4
--Correlated Subquery
-- Business Question
--Which hosts have at least one listing priced above that host's own average listing price?
--===========================================================================================
SELECT
    fl.id,
    dh.host_id,
    dh.host_name,
    fl.price
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
WHERE fl.price > (
    SELECT AVG(fl2.price)
    FROM Fact_Listings fl2
    WHERE fl2.host_key = fl.host_key
)
ORDER BY fl.price DESC;