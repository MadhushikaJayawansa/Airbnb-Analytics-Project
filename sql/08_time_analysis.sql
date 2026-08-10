-- ======================================
-- Time Analysis — Business Question 1
-- Total Reviews by Last Review Year and Month
-- =======================================

SELECT
   dd.year,dd.month,
    SUM(fl.number_of_reviews) AS Total_Reviews
FROM Fact_Listings fl
JOIN  dim_date dd 
       ON fl.date_key = dd.date_key
GROUP BY  dd.month,dd.year
ORDER BY  Total_Reviews DESC;

-- ======================================
-- Time Analysis — Business Question 2
-- Listings by Quarter
-- ======================================

SELECT
    dd.year,
    dd.quarter,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Date dd
    ON fl.date_key = dd.date_key
GROUP BY
    dd.year,
    dd.quarter
ORDER BY
    dd.year,
    dd.quarter;

-- =========================================
-- Time Analysis — Business Question 3
-- Average Listing Price by Year
-- ========================================

SELECT
    dd.year,
    AVG(fl.price) AS Average_Price
FROM Fact_Listings fl
JOIN Dim_Date dd
    ON fl.date_key = dd.date_key
GROUP BY
    dd.year
ORDER BY
    dd.year;

-- ========================================
-- Time Analysis — Business Question 4
-- Average Reviews by Year
-- ======================================

SELECT
    dd.year,
    AVG(fl.number_of_reviews) AS Average_Reviews
FROM Fact_Listings fl
JOIN Dim_Date dd
    ON fl.date_key = dd.date_key
GROUP BY
    dd.year
ORDER BY
    dd.year;