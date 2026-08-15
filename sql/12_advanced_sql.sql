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


--===================================================================
-- Phase 7 — Step 3.3: Creating a Business-Focused View
--Business Question
--How does listing performance vary by borough and room type?
--=====================================================================

CREATE OR REPLACE VIEW vw_borough_room_performance AS
SELECT
    dl.neighbourhood_group AS Borough,
    drt.room_type AS Room_Type,
    COUNT(*) AS Total_Listings,
    AVG(fl.price) AS Average_Price,
    SUM(fl.number_of_reviews) AS Total_Reviews,
    AVG(fl.availability_365) AS Average_Availability
FROM Fact_Listings fl
JOIN Dim_Location dl
    ON fl.location_key = dl.location_key
JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key
GROUP BY
    dl.neighbourhood_group,
    drt.room_type;

SELECT *
FROM vw_borough_room_performance
ORDER BY Total_Listings DESC;


--===================================================================
-- Phase 7 — Step 4: Window Functions
--Step 4.1 — ROW_NUMBER()
--Business Question
--What are the top Airbnb listings ranked by price?
--=====================================================================

SELECT
    id,
    price,
    ROW_NUMBER() OVER (
        ORDER BY price DESC
    ) AS Price_Rank
FROM Fact_Listings
ORDER BY price DESC;

--===================================================================
-- Phase 7 — Step 4: Window Functions
-- Step 4.2: `RANK()`
--Business Question
--How can Airbnb listings be ranked by price while giving the same rank to listings with the same price?
--=====================================================================
SELECT
    id,
    price,
    RANK() OVER (
        ORDER BY price DESC
    ) AS Price_Rank
FROM Fact_Listings
ORDER BY price DESC;

--===================================================================
-- Phase 7 — Step 4: Window Functions
-- Step 4.3 — `DENSE_RANK()`
--Business Question
--How can Airbnb listings be ranked by price while giving the same rank to listings with the same price?
--=====================================================================

SELECT
    id,
    price,
    DENSE_RANK() OVER (
        ORDER BY price DESC
    ) AS Price_Rank
FROM Fact_Listings
ORDER BY price DESC;


--===================================================================
-- Phase 7 — Step 4: Window Functions
-- Step 4.4 — `PARTITION BY`
--Business Question
--What are the most expensive listings within each room type?
--=====================================================================
SELECT
    fl.id,
    drt.room_type,
    fl.price,
    ROW_NUMBER() OVER (
        PARTITION BY drt.room_type
        ORDER BY fl.price DESC
    ) AS Price_Rank
FROM Fact_Listings fl
JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key
ORDER BY
    drt.room_type,
    Price_Rank;

--===================================================================
-- Phase 7 — Step 4: Window Functions
--  Step 4.5 — Top N Within Each Group
--Business Question
--What are the top 3 most expensive listings within each room type?*
--=====================================================================
WITH ranked_listings AS (
    SELECT
        fl.id,
        drt.room_type,
        fl.price,
        ROW_NUMBER() OVER (
            PARTITION BY drt.room_type
            ORDER BY fl.price DESC
        ) AS Price_Rank
    FROM Fact_Listings fl
    JOIN Dim_Room_Type drt
        ON fl.room_type_key = drt.room_type_key
)
SELECT
    id,
    room_type,
    price,
    Price_Rank
FROM ranked_listings
WHERE Price_Rank <= 3
ORDER BY
    room_type,
    Price_Rank;


--===================================================================
-- Phase 7 — Step 4.6: Running Total.
--  Step 4.6 — cumulative total up to each year
--How do Airbnb reviews accumulate over time?
--What are the top 3 most expensive listings within each room type?*
--=====================================================================

SELECT
    dd.year,
    SUM(fl.number_of_reviews) AS Total_Reviews
FROM Fact_Listings fl
JOIN Dim_Date dd
    ON fl.date_key = dd.date_key
GROUP BY
    dd.year
ORDER BY
    dd.year;

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY
        dd.year
)
SELECT
    year,
    Total_Reviews,
    SUM(Total_Reviews) OVER (
        ORDER BY year
    ) AS Running_Total_Reviews
FROM yearly_reviews
ORDER BY
    year;

--============================================================
-- Phase 7 — Step 4.7.1 — Basic LAG()
--  Step 4.6 — cumulative total up to each year
-- Business Question
--How many reviews were recorded in the previous year?
--============================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
)
SELECT
    year,
    Total_Reviews,
    LAG(Total_Reviews) OVER (
        ORDER BY year
    ) AS Previous_Year_Reviews
FROM yearly_reviews
ORDER BY year;

--================================================================================
--Phase 7 —  Step 4.7.2 — Year-over-Year Difference
-- tep 4.6 — cumulative total up to each year
--Business Question
--How much did total reviews increase or decrease compared with the previous year?
--=================================================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
),
review_comparison AS (
    SELECT
        year,
        Total_Reviews,
        LAG(Total_Reviews) OVER (
            ORDER BY year
        ) AS Previous_Year_Reviews
    FROM yearly_reviews
)
SELECT
    year,
    Total_Reviews,
    Previous_Year_Reviews,
    Total_Reviews - Previous_Year_Reviews AS Review_Change
FROM review_comparison
ORDER BY year;

--================================================================================
--Phase 7 —  Step 4.7.2 — Year-over-Year Difference
-- Year-over-Year Growth %
--Business Question
--What percentage did Airbnb reviews increase or decrease compared with the previous year?
--=================================================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
),
review_comparison AS (
    SELECT
        year,
        Total_Reviews,
        LAG(Total_Reviews) OVER (
            ORDER BY year
        ) AS Previous_Year_Reviews
    FROM yearly_reviews
)
SELECT
    year,
    Total_Reviews,
    Previous_Year_Reviews,
    Total_Reviews - Previous_Year_Reviews AS Review_Change,
    ROUND(
        (Total_Reviews - Previous_Year_Reviews)
        / NULLIF(Previous_Year_Reviews, 0) * 100,
        2
    ) AS YoY_Growth_Percent
FROM review_comparison
ORDER BY year;

--================================================================================
--Phase 7 — Step 4.8 — LEAD()
--Business Question
--How many reviews were recorded in the following year?
--=================================================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
)
SELECT
    year,
    Total_Reviews,
    LEAD(Total_Reviews) OVER (
        ORDER BY year
    ) AS Next_Year_Reviews
FROM yearly_reviews
ORDER BY year;

--================================================================================
--Phase 7 — Step 4.9: FIRST_VALUE().
--Step 4.9.1 — Basic FIRST_VALUE()
--Business Question
--How does each year's total review count compare with the first year in the dataset?
--=================================================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
)
SELECT
    year,
    Total_Reviews,
    FIRST_VALUE(Total_Reviews) OVER (
        ORDER BY year
    ) AS First_Year_Reviews
FROM yearly_reviews
ORDER BY year;

--=================================================================================================
--Phase 7 — Step 4.9.2: LAST_VALUE()
--Step 4.9.2 — LAST_VALUE()
--Business Question
--How does each year's review total compare with the final year's review total in the dataset?
--================================================================================================

WITH yearly_reviews AS (
    SELECT
        dd.year,
        SUM(fl.number_of_reviews) AS Total_Reviews
    FROM Fact_Listings fl
    JOIN Dim_Date dd
        ON fl.date_key = dd.date_key
    GROUP BY dd.year
)
SELECT
    year,
    Total_Reviews,
    LAST_VALUE(Total_Reviews) OVER (
        ORDER BY year
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Final_Year_Reviews
FROM yearly_reviews
ORDER BY year;

--=================================================================================================
--Phase 7 — Step 4.10 — Window Function + Business Analysis.
--Step 4.10 — Top Hosts Within Each Borough
--================================================================================================

--=========================================================================
--Step 4.10.1 — First, calculate listings by host and borough
--Business Question
--Who are the top Airbnb hosts by number of listings within each borough?
--=========================================================================

SELECT
    dl.neighbourhood_group AS Borough,
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings
FROM Fact_Listings fl
JOIN Dim_Host dh
    ON fl.host_key = dh.host_key
JOIN Dim_Location dl
    ON fl.location_key = dl.location_key
GROUP BY
    dl.neighbourhood_group,
    dh.host_id,
    dh.host_name
ORDER BY
    Borough,
    Total_Listings DESC;

--=========================================================================
--Step 4.10.2 — Rank Hosts Within Each Borough
--=========================================================================

WITH host_borough_listings AS (
    SELECT
        dl.neighbourhood_group AS Borough,
        dh.host_id,
        dh.host_name,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    JOIN Dim_Location dl
        ON fl.location_key = dl.location_key
    GROUP BY
        dl.neighbourhood_group,
        dh.host_id,
        dh.host_name
)
SELECT
    borough,
    host_id,
    host_name,
    Total_Listings,
    ROW_NUMBER() OVER (
        PARTITION BY borough
        ORDER BY Total_Listings DESC
    ) AS Host_Rank
FROM host_borough_listings
ORDER BY
    borough,
    Host_Rank;

    --=========================================================================
--Step 4.10.3 — Top 3 Hosts per Borough
--Business Question
--Who are the top 3 Airbnb hosts in each borough based on the number of listings they manage?
--=========================================================================

WITH host_borough_listings AS (
    SELECT
        dl.neighbourhood_group AS Borough,
        dh.host_id,
        dh.host_name,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    JOIN Dim_Location dl
        ON fl.location_key = dl.location_key
    GROUP BY
        dl.neighbourhood_group,
        dh.host_id,
        dh.host_name
),
ranked_hosts AS (
    SELECT
        borough,
        host_id,
        host_name,
        Total_Listings,
        ROW_NUMBER() OVER (
            PARTITION BY borough
            ORDER BY Total_Listings DESC
        ) AS Host_Rank
    FROM host_borough_listings
)
SELECT
    borough,
    host_id,
    host_name,
    Total_Listings,
    Host_Rank
FROM ranked_hosts
WHERE Host_Rank <= 3
ORDER BY
    borough,
    Host_Rank;

--===========================================================================================
--Step 4.11.1 — Create the ranked host analysis
--Business Question
--Who are the top 3 hosts in each borough based on total listings, including tied hosts?
--==========================================================================================

WITH host_borough_listings AS (
    SELECT
        dl.neighbourhood_group AS Borough,
        dh.host_id,
        dh.host_name,
        COUNT(*) AS Total_Listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    JOIN Dim_Location dl
        ON fl.location_key = dl.location_key
    GROUP BY
        dl.neighbourhood_group,
        dh.host_id,
        dh.host_name
),
ranked_hosts AS (
    SELECT
        borough,
        host_id,
        host_name,
        Total_Listings,
        RANK() OVER (
            PARTITION BY borough
            ORDER BY Total_Listings DESC
        ) AS Host_Rank
    FROM host_borough_listings
)
SELECT
    borough,
    host_id,
    host_name,
    Total_Listings,
    Host_Rank
FROM ranked_hosts
WHERE Host_Rank <= 3
ORDER BY
    borough,
    Host_Rank,
    Total_Listings DESC;



--===========================================================================================
--Phase 08
--Step 08.1.1 — Conditional Aggregation by Borough
--Business Question
--How many Airbnb listings fall into each pricing category?
--==========================================================================================
SELECT
    COUNT(*) AS Total_Listings,

    SUM(
        CASE
            WHEN price <= 100 THEN 1
            ELSE 0
        END
    ) AS Budget_Listings,

    SUM(
        CASE
            WHEN price > 100 AND price <= 300 THEN 1
            ELSE 0
        END
    ) AS Moderate_Listings,

    SUM(
        CASE
            WHEN price > 300 THEN 1
            ELSE 0
        END
    ) AS Expensive_Listings

FROM Fact_Listings;

--===========================================================================================
--Phase 08
--Step 08.1.2 — Conditional Percentage by Borough
--Business Question
--What percentage of each borough's listings are Budget, Moderate, and Expensive?
--==========================================================================================

SELECT
    dl.neighbourhood_group AS Borough,

    COUNT(*) AS Total_Listings,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN fl.price <= 100 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS Budget_Percent,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN fl.price > 100 AND fl.price <= 300 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS Moderate_Percent,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN fl.price > 300 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS Expensive_Percent

FROM Fact_Listings fl

JOIN Dim_Location dl
    ON fl.location_key = dl.location_key

GROUP BY
    dl.neighbourhood_group

ORDER BY
    Borough;

--===========================================================================================
--Phase 08
--Step 08.1.3 — Conditional Aggregation + HAVING
--Business Question
--Which boroughs have more than 500 expensive listings?
--==========================================================================================

SELECT
    dl.neighbourhood_group AS Borough,

    COUNT(*) AS Total_Listings,

    SUM(
        CASE
            WHEN fl.price > 300 THEN 1
            ELSE 0
        END
    ) AS Expensive_Listings

FROM Fact_Listings fl

JOIN Dim_Location dl
    ON fl.location_key = dl.location_key

GROUP BY
    dl.neighbourhood_group

HAVING
    SUM(
        CASE
            WHEN fl.price > 300 THEN 1
            ELSE 0
        END
    ) > 500

ORDER BY
    Expensive_Listings DESC;

--===========================================================================================
--Phase 08
--Step 08.1.4 — Conditional Aggregation by Room Type
--Business Question
--How many Budget, Moderate, and Expensive listings exist for each room type?
--==========================================================================================

SELECT
    drt.room_type AS Room_Type,

    COUNT(*) AS Total_Listings,

    SUM(
        CASE
            WHEN fl.price <= 100 THEN 1
            ELSE 0
        END
    ) AS Budget_Listings,

    SUM(
        CASE
            WHEN fl.price > 100 AND fl.price <= 300 THEN 1
            ELSE 0
        END
    ) AS Moderate_Listings,

    SUM(
        CASE
            WHEN fl.price > 300 THEN 1
            ELSE 0
        END
    ) AS Expensive_Listings

FROM Fact_Listings fl

JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key

GROUP BY
    drt.room_type

ORDER BY
    Total_Listings DESC;


--===========================================================================================
--Phase 08
--Step 08.2 — Conditional Average Price
--Business Question
--What is the average price of Budget, Moderate, and Expensive listings?
--==========================================================================================

SELECT
    ROUND(
        AVG(
            CASE
                WHEN price <= 100 THEN price
            END
        ), 2
    ) AS Budget_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN price > 100 AND price <= 300 THEN price
            END
        ), 2
    ) AS Moderate_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN price > 300 THEN price
            END
        ), 2
    ) AS Expensive_Average_Price

FROM Fact_Listings;

--===========================================================================================
--Phase 08
--08.2.1 — Conditional Average by Borough
--Business Question
--What is the average price of Budget, Moderate, and Expensive listings in each borough?
--==========================================================================================

SELECT
    dl.neighbourhood_group AS Borough,

    ROUND(
        AVG(
            CASE
                WHEN fl.price <= 100 THEN fl.price
            END
        ), 2
    ) AS Budget_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN fl.price > 100 AND fl.price <= 300 THEN fl.price
            END
        ), 2
    ) AS Moderate_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN fl.price > 300 THEN fl.price
            END
        ), 2
    ) AS Expensive_Average_Price

FROM Fact_Listings fl

JOIN Dim_Location dl
    ON fl.location_key = dl.location_key

GROUP BY
    dl.neighbourhood_group

ORDER BY
    Borough;

--===========================================================================================
--Phase 08
--Step 08.2.2 — Conditional Average by Room Type
--Business Question
--How does average pricing differ between Budget, Moderate, and Expensive listings for each room type?
--==========================================================================================

SELECT
    drt.room_type AS Room_Type,

    ROUND(
        AVG(
            CASE
                WHEN fl.price <= 100 THEN fl.price
            END
        ), 2
    ) AS Budget_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN fl.price > 100 AND fl.price <= 300 THEN fl.price
            END
        ), 2
    ) AS Moderate_Average_Price,

    ROUND(
        AVG(
            CASE
                WHEN fl.price > 300 THEN fl.price
            END
        ), 2
    ) AS Expensive_Average_Price

FROM Fact_Listings fl

JOIN Dim_Room_Type drt
    ON fl.room_type_key = drt.room_type_key

GROUP BY
    drt.room_type

ORDER BY
    Room_Type;


--===========================================================================================
--Phase 08
--Step 08.3 — Hosts with Many Listings and High Average Prices
--Business Question
--Which hosts have at least 10 listings and an average listing price above $200?
--==========================================================================================

SELECT
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings,
    ROUND(AVG(fl.price), 2) AS Average_Price

FROM Fact_Listings fl

JOIN Dim_Host dh
    ON fl.host_key = dh.host_key

GROUP BY
    dh.host_id,
    dh.host_name

HAVING
    COUNT(*) >= 10
    AND AVG(fl.price) > 200

ORDER BY
    Average_Price DESC;


--===========================================================================================
--Phase 08
--Step 08.3 — Hosts with Many Listings and High Average Prices
--Business Question
--Which hosts have at least 10 listings and an average listing price above $200?
--==========================================================================================

SELECT
    dh.host_id,
    dh.host_name,
    COUNT(*) AS Total_Listings,
    ROUND(AVG(fl.price), 2) AS Average_Price

FROM Fact_Listings fl

JOIN Dim_Host dh
    ON fl.host_key = dh.host_key

GROUP BY
    dh.host_id,
    dh.host_name

HAVING
    COUNT(*) >= 10
    AND AVG(fl.price) > 200

ORDER BY
    Average_Price DESC;


--===========================================================================================
--Phase 08
--Step 08.3.1 — HAVING with Conditional Aggregation
--Business Question
--Which boroughs have at least 10,000 listings AND more than 30% of their listings are Budget listings?
--==========================================================================================
SELECT
    dl.neighbourhood_group AS Borough,

    COUNT(*) AS Total_Listings,

    SUM(
        CASE
            WHEN fl.price <= 100 THEN 1
            ELSE 0
        END
    ) AS Budget_Listings,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN fl.price <= 100 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS Budget_Percent

FROM Fact_Listings fl

JOIN Dim_Location dl
    ON fl.location_key = dl.location_key

GROUP BY
    dl.neighbourhood_group

HAVING
    COUNT(*) >= 10000
    AND
    100.0 * SUM(
        CASE
            WHEN fl.price <= 100 THEN 1
            ELSE 0
        END
    ) / COUNT(*) > 30

ORDER BY
    Budget_Percent DESC;

--===========================================================================================
--Step 08.4 — Multiple CTEs
--Business Question
--Which hosts have more listings than the average host?
--==========================================================================================

WITH host_listing_counts AS (
    SELECT
        dh.host_id,
        dh.host_name,
        COUNT(*) AS total_listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    GROUP BY
        dh.host_id,
        dh.host_name
)

SELECT *
FROM host_listing_counts
ORDER BY total_listings DESC;

--===========================================================================================
--Step 08.4 — Multiple CTEs
--=============================================================================
--Step 08.4.1 — CTE 1: Calculate Listings per Host
--Business Question
--Which hosts have more listings than the average host?
--==========================================================================================

WITH host_listing_counts AS (
    SELECT
        dh.host_id,
        dh.host_name,
        COUNT(*) AS total_listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    GROUP BY
        dh.host_id,
        dh.host_name
)

SELECT *
FROM host_listing_counts
ORDER BY total_listings DESC;

--=============================================================================
--Step 08.4.2 — CTE 2: Calculate Average Listings per Host
--Business Question
--What is the average number of listings managed by a host?
--============================================================================

WITH host_listing_counts AS (
    SELECT
        dh.host_id,
        dh.host_name,
        COUNT(*) AS total_listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    GROUP BY
        dh.host_id,
        dh.host_name
),

average_host_listings AS (
    SELECT
        AVG(total_listings) AS average_listings_per_host
    FROM host_listing_counts
)

SELECT *
FROM average_host_listings;


--=============================================================================
--Step 08.4.3 — Multiple CTEs: Hosts Above Average
--Business Question
--Which hosts have more listings than the average host?
--============================================================================

WITH host_listing_counts AS (
    SELECT
        dh.host_id,
        dh.host_name,
        COUNT(*) AS total_listings
    FROM Fact_Listings fl
    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key
    GROUP BY
        dh.host_id,
        dh.host_name
),

average_host_listings AS (
    SELECT
        AVG(total_listings) AS average_listings_per_host
    FROM host_listing_counts
)

SELECT
    hlc.host_id,
    hlc.host_name,
    hlc.total_listings,
    ROUND(ahl.average_listings_per_host, 2) AS average_listings_per_host
FROM host_listing_counts hlc
CROSS JOIN average_host_listings ahl
WHERE hlc.total_listings > ahl.average_listings_per_host
ORDER BY
    hlc.total_listings DESC;


--===========================================================================================
--Step 08.5 — Host Performance Classification
--==========================================================================================
===============================================================================================
--Step 08.5.1 — Calculate Reviews per Listing
--Business Question
--How efficiently are hosts generating reviews relative to the number of listings they manage?
--============================================================================================

SELECT
    dh.host_id,
    dh.host_name,

    COUNT(*) AS total_listings,

    SUM(fl.number_of_reviews) AS total_reviews,

    ROUND(
        SUM(fl.number_of_reviews) / NULLIF(COUNT(*), 0),
        2
    ) AS reviews_per_listing

FROM Fact_Listings fl

JOIN Dim_Host dh
    ON fl.host_key = dh.host_key

GROUP BY
    dh.host_id,
    dh.host_name

ORDER BY
    reviews_per_listing DESC;

--=============================================================================================
--Step 08.5.2 — CASE Performance Classification
--Business Question
--How can we classify hosts based on reviews per listing?
--============================================================================================

SELECT
    dh.host_id,
    dh.host_name,

    COUNT(*) AS total_listings,

    SUM(fl.number_of_reviews) AS total_reviews,

    ROUND(
        SUM(fl.number_of_reviews) / NULLIF(COUNT(*), 0),
        2
    ) AS reviews_per_listing,

    CASE
        WHEN SUM(fl.number_of_reviews) / NULLIF(COUNT(*), 0) >= 100
            THEN 'High'

        WHEN SUM(fl.number_of_reviews) / NULLIF(COUNT(*), 0) >= 50
            THEN 'Medium'

        ELSE 'Low'
    END AS performance_category

FROM Fact_Listings fl

JOIN Dim_Host dh
    ON fl.host_key = dh.host_key

GROUP BY
    dh.host_id,
    dh.host_name

ORDER BY
    reviews_per_listing DESC;



--=============================================================================================
--Step 08.5.3 — Count Hosts by Performance Category
--Business Question
--How many hosts are classified as High, Medium, and Low performers?
--============================================================================================

WITH host_performance AS (
    SELECT
        dh.host_id,
        dh.host_name,

        COUNT(*) AS total_listings,

        SUM(fl.number_of_reviews) AS total_reviews,

        SUM(fl.number_of_reviews)
            / NULLIF(COUNT(*), 0) AS reviews_per_listing,

        CASE
            WHEN SUM(fl.number_of_reviews)
                 / NULLIF(COUNT(*), 0) >= 100
                THEN 'High'

            WHEN SUM(fl.number_of_reviews)
                 / NULLIF(COUNT(*), 0) >= 50
                THEN 'Medium'

            ELSE 'Low'
        END AS performance_category

    FROM Fact_Listings fl

    JOIN Dim_Host dh
        ON fl.host_key = dh.host_key

    GROUP BY
        dh.host_id,
        dh.host_name
)

SELECT
    performance_category,
    COUNT(*) AS total_hosts
FROM host_performance
GROUP BY
    performance_category
ORDER BY
    total_hosts DESC;

--=============================================================================================
--Step 08.6 — Analytical Comparison
--Business Question
--Which boroughs have an average listing price above the overall NYC average price?
--============================================================================================

--============================================================================================
--Step 08.6.1 — Calculate the Overall Average Price
--===========================================================================================

SELECT
    ROUND(AVG(price), 2) AS overall_average_price
FROM Fact_Listings;