-- ==================================================
-- Business Question 13
-- Average Minimum Nights by Borough
-- ==================================================

SELECT
    dl.neighbourhood_group,
    AVG(fl.minimum_nights) AS Average_nights
FROM  Fact_Listings fl
JOIN  DIM_LOCATION dl
     ON fl.location_key = dl.location_key
GROUP BY  dl.neighbourhood_group
ORDER BY Average_nights ASC;

-- ==================================================
-- Business Question 14
-- average number of reviews for each room type
-- ==================================================

SELECT
    drt.room_type,
    AVG(fl.number_of_reviews) AS Average_Reviews
FROM  Fact_Listings fl
JOIN  dim_room_type drt
     ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY Average_Reviews;

-- ==================================================
-- Business Question 15
-- average availability for each room type
-- ==================================================

SELECT
    drt.room_type,
    AVG(fl.availability_365) AS Average_Avalibility
FROM  Fact_Listings fl
JOIN  dim_room_type drt
     ON fl.room_type_key = drt.room_type_key
GROUP BY  drt.room_type
ORDER BY Average_Avalibility;
