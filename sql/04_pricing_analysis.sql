-- ===============================================
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