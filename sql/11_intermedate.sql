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