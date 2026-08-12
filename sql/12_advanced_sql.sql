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
--Step-1.2
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
--Step-1.3
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



--======================================================
--Step 2.1 — First CTE
--Business Question
--Which hosts manage the most Airbnb listings?
--=======================================================

WITH host_summary AS (
    SELECT
        host_key,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings
    GROUP BY host_key
)
SELECT *
FROM host_summary
ORDER BY Total_Listings DESC;


--====================================================================
--Step 2.2 — CTE + Dimension Join
--Business Question
--Which hosts manage the most listings, including their host names?
--===================================================================

WITH host_summary AS (
    SELECT
        host_key,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings
    GROUP BY host_key
)
SELECT
    dh.host_id,
    dh.host_name,
    hs.Total_Listings
FROM host_summary hs
JOIN Dim_Host dh
    ON hs.host_key = dh.host_key
ORDER BY hs.Total_Listings DESC;

--============================================================================================
-- Step 2.3 — Multiple CTEs
-- Business Question
-- How can host listing counts and average reviews be combined into a single analytical result?
--==============================================================================================

WITH host_listings AS (
    SELECT
        host_key,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings
    GROUP BY host_key
),
host_reviews AS (
    SELECT
        host_key,
        AVG(number_of_reviews) AS Average_Reviews
    FROM Fact_Listings
    GROUP BY host_key
)
SELECT *
FROM host_listings
JOIN host_reviews
    ON host_listings.host_key = host_reviews.host_key;


--=====================================================================================================
--Step 2.4 — CTE with a Business Filter
-- Business Question
--Which hosts manage at least 5 listings and have an average of more than 50 reviews per listing?
--======================================================================================================

WITH host_performance AS (
    SELECT
        host_key,
        COUNT(*) AS Total_Listings,
        AVG(number_of_reviews) AS Average_Reviews
    FROM Fact_Listings
    GROUP BY host_key
)
SELECT
    host_key,
    Total_Listings,
    Average_Reviews
FROM host_performance
WHERE Total_Listings >= 5
  AND Average_Reviews > 50
ORDER BY Average_Reviews DESC;

--===================================================================
-- Phase 7 — Step Step 3.1 — Create  First View
--Business Question
--Can we create a reusable view showing the performance of each host?
--=====================================================================

CREATE OR REPLACE VIEW vw_host_performance AS
SELECT
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings,
    AVG(fl.price) AS Average_Price,
    SUM(fl.number_of_reviews) AS Total_Reviews,
    AVG(fl.availability_365) AS Average_Availability
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
GROUP BY
Selection deleted

    dh.host_id,
    dh.host_name;

SELECT *
FROM vw_host_performance
ORDER BY Total_Listings DESC;
--LIMIT 10;

--===================================================================
-- Phase 7 — Step Step 3.2 — Querying a View
--Business Question
--Which hosts have more than 20 listings?
--=====================================================================
SELECT
    host_id,
    host_name,
    Total_Listings,
    Average_Price,
    Total_Reviews
FROM vw_host_performance
WHERE Total_Listings > 20
ORDER BY Total_Listings DESC;