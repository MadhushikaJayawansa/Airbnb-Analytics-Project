-- ===============================================
---- Business Question 9
--Top 10 neighbourhoods by average listing price
-- ===============================================

SELECT
    dl.neighbourhood_group,dl.neighbourhood,
    AVG(fl.price) AS Average_price
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group,
          dl.neighbourhood
ORDER BY Average_price DESC
LIMIT 10;


-- ==================================================
-- Business Question 10
-- Top 10 Neighbourhoods by Number of Listings
-- ==================================================

SELECT
    dl.neighbourhood_group,
    dl.neighbourhood,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Location dl
    ON fl.location_key = dl.location_key
GROUP BY
    dl.neighbourhood_group,
    dl.neighbourhood
ORDER BY Total_Listings DESC
LIMIT 10;

-- ==================================================
-- Business Question 11
-- Average Availability by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.availability_365) AS Average_Avalibility
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_Avalibility DESC
LIMIT 10;

-- ==================================================
-- Business Question 12
-- Average Reviews by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.number_of_reviews) AS Average_reviews
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_reviews DESC;
