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