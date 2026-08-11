-- ==========================================
-- Phase 6 — Intermediate SQL
-- Step 1 — WHERE
-- ==========================================

-- Business Question:
-- How many Airbnb listings have a price greater than $300?

SELECT
    COUNT(*) AS Expensive_Listings
FROM Fact_Listings
WHERE price > 300;

-- ==========================================
-- Step 2 — WHERE with AND
-- ==========================================
-- Business Question

-- How many Airbnb listings have a price greater than $500 AND availability greater than 200 days?

SELECT
COUNT(*) AS Expensive_Listings
FROM Fact_Listings
WHERE price > 500
AND availability_365>200;

-- ==========================================
-- Step 3 — WHERE with OR
-- ==========================================

-- Business Question:
-- How many Airbnb listings have a price greater than $1,000
-- OR availability greater than 300 days?

SELECT
    COUNT(*) AS Expensive_Listings
FROM Fact_Listings
WHERE price > 1000
   OR availability_365 > 300;

   -- ==========================================
-- Step 4 — CASE WHEN   
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How can we categorize Airbnb listings into Budget, Moderate, and Expensive based on price?
-- ===============================================================================================

   SELECT
    price,
    CASE
        WHEN price <= 100 THEN 'Budget'
        WHEN price > 100 AND price <= 300 THEN 'Moderate'
        ELSE 'Expensive'
    END AS Price_Category
FROM Fact_Listings;

-- ==========================================
-- Step 5 —  CASE WHEN with GROUP BY 
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How many Airbnb listings are in each price category?
-- ===============================================================================================

SELECT
    CASE
        WHEN price <= 100 THEN 'Budget'
        WHEN price > 100 AND price <= 300 THEN 'Moderate'
        ELSE 'Expensive'
    END AS Price_Category,
    COUNT(*) AS Total_Listings
FROM Fact_Listings
GROUP BY
    CASE
        WHEN price <= 100 THEN 'Budget'
        WHEN price > 100 AND price <= 300 THEN 'Moderate'
        ELSE 'Expensive'
    END
ORDER BY Total_Listings DESC;



-- ==========================================
-- Step 6 —  CASE WHEN for Availability Categories
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How can Airbnb listings be categorized based on their annual availability?
-- ===============================================================================================

SELECT
    CASE
        WHEN availability_365 <= 30
            THEN 'Low Availability'

        WHEN availability_365 <= 180
            THEN 'Medium Availability'

        ELSE 'High Availability'
    END AS Listing_Availability,

    COUNT(*) AS Total_Listings

FROM Fact_Listings

GROUP BY
    CASE
        WHEN availability_365 <= 30
            THEN 'Low Availability'

        WHEN availability_365 <= 180
            THEN 'Medium Availability'

        ELSE 'High Availability'
    END

ORDER BY Total_Listings DESC;


-- ==========================================
-- Step 7 — LIKE: Searching Text Patterns
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How many Airbnb listings belong to hosts whose name contains "John"?
-- ===============================================================================================

SELECT
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
WHERE dh.host_name LIKE '%John%';


-- ==========================================
-- Step 8 — Use BETWEEN 
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How many listings have a price between $100 and $300?
-- ===============================================================================================

SELECT
    COUNT(*) AS Total_Listings
FROM Fact_Listings
WHERE Price BETWEEN 100 AND 300;

-- WHERE Price >= 100
--   AND Price <= 300


-- ==========================================
-- Step 9 — IN 
-- ==========================================

-- ===============================================================================================
-- Business Question
-- How many Airbnb listings are either Private Room or Shared Room??
-- ===============================================================================================

SELECT
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key
WHERE drt.room_type IN ('Private room', 
'Shared room');

-- ==========================================
-- Step 10 — COALESCE 
-- ==========================================

-- =====================================================================
-- Business Question
-- How can we replace missing host names with "Unknown Host"
-- =====================================================================

SELECT
    host_id,
    COALESCE(host_name, 'Unknown Host') AS Host_Name
FROM Dim_Host;
