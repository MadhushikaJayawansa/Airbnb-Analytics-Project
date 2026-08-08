# SQL Business Analysis

## Project Overview

This document contains the SQL business analysis performed on the Airbnb New York dataset using Snowflake.

The purpose of this analysis is to answer real-world business questions using SQL and provide business insights that can support decision-making.

---
## Objectives

The objectives of this SQL analysis are to:

- Measure key Airbnb business performance indicators (KPIs).
- Analyze listing distribution across neighbourhoods and room types.
- Identify high-volume Airbnb hosts.
- Evaluate pricing trends across room types and neighbourhood groups.
- Generate business insights to support strategic decision-making.


---

# Business Question 1

## Question

How many Airbnb listings are available after data cleaning?

### SQL Concept
- COUNT()

### Result

| KPI            | Value              |
|----------------|-------------------:|
| Total Listings | 48,884             |

### Business Insight

The cleaned dataset contains **48,884 active Airbnb listings**, which will be used for all business analysis.

### Business Recommendation

The dataset provides a sufficient number of listings for reliable business reporting and dashboard creation.

---

# Business Question 2

## Question

What are the overall business KPIs for Airbnb listings?

### SQL Concepts

- COUNT()
- AVG()
- MAX()
- MIN()
- SUM()

### Results

| KPI                     | Value     |
|-------------------------|----------:|
| Total Listings          | 48,884    |
| Average Price           | 152.76    |
| Highest Price           | 10,000    |
| Lowest Price            | 10        |
| Total Reviews           | 1,137,628 |
| Average Minimum Nights  | 7.03      |
| Average Availability    | 112.78    |

### Executive Summary

The Airbnb dataset contains nearly **49,000 listings** with an average listing price of **$152.76**.

The highest recorded listing price is **$10,000**, while the minimum valid listing price is **$10** after removing invalid zero-priced listings.

Listings receive over **1.1 million customer reviews**, indicating strong customer engagement.

### Business Recommendation

Management should further investigate extremely high-priced listings to determine whether they represent luxury properties or pricing outliers.

---

# Business Question 3

## Question

How many listings are available in each neighbourhood group?

### SQL Concepts

- JOIN
- GROUP BY
- COUNT()

### Results

| Neighbourhood Group | Total Listings  |
|-------------------- |----------------:|
| Manhattan           | 21,660          |
| Brooklyn            | 20,095          |
| Queens              | 5,666           |
| Bronx               | 1,090           |
| Staten Island       | 373             |

### Executive Summary

Manhattan has the highest number of Airbnb listings, followed closely by Brooklyn.

Queens contains significantly fewer listings, while the Bronx and Staten Island contribute only a small portion of the total inventory.

### Business Recommendation

Marketing and operational resources should primarily focus on Manhattan and Brooklyn because they represent the largest Airbnb markets.

---

# Business Question 4

## Question

How many listings exist for each room type?

### SQL Concepts

- JOIN
- GROUP BY
- COUNT()

### Results

| Room Type       | Total Listings |
|-----------------|---------------:|
| Entire home/apt | 25,407         |
| Private room    | 22,319         |
| Shared room     | 1,158          |

### Executive Summary

Entire homes/apartments are the most common Airbnb listing type, followed by private rooms.

Shared rooms represent only a very small percentage of the marketplace.

### Business Recommendation

Airbnb should continue promoting entire homes and private rooms, as these categories represent nearly all available listings.

---

# Business Question 5

## Question

How many listings are available by year?

### SQL Concepts

- JOIN
- GROUP BY
- COUNT()

### Results


| Year | Total Listings |
|------|---------------:|
|YEAR  |TOTAL_LISTINGS  |
|2019  |25202           |
|2018  |6048            |
|2017  |3204            |
|2016  |2707            |
|2015  |1393            |
|2014  |199             |
|2013  |48              |
|2012  |25              |
|2011  |7               |


### Executive Summary

The analysis of Airbnb listings by last review year shows that 2019 recorded the highest listing activity, with 25,202 listings, representing the majority of the dataset. Listing activity decreases significantly in earlier years, with only a small number of listings receiving reviews before 2015.

This trend indicates that Airbnb experienced substantial growth in New York over time, with customer review activity increasing rapidly and reaching its highest level in 2019.

### Business Recommendation

The results suggest that Airbnb should focus on understanding the factors that contributed to the high level of listing activity and customer engagement in 2019. Identifying successful pricing strategies, marketing campaigns, or market conditions from this period may help improve future business performance.

Additionally, year-over-year trend analysis can help management monitor changes in customer demand, evaluate market growth, and support strategic planning for future expansion.

---

# Business Question 6

## Question

Who are the Top 10 Airbnb hosts with the highest number of listings?

### SQL Concepts

- JOIN
- GROUP BY
- COUNT()
- ORDER BY
- LIMIT

### Results

|HOST_ID	  |HOST_NAME	          |TOTAL_LISTINGS  |
|           |                     |               |
|219517861	|Sonder (NYC)	        |327             |
|107434423	|Blueground	          |232             |
|30283594	  |Kara	                |121             |
|137358866	|Kazuya	              |103             |
|16098958	  |Jeremy & Laura	      |96              |
|12243051	  |Sonder	              |96              |
|61391963	  |Corporate Housing    |91              |
|22541573	  |Ken	                |87              |
|200380610	|Pranjal	            |65              |
|1475015	  |Mike	                |52              |



### Executive Summary

The analysis identifies the Top 10 Airbnb hosts based on the total number of active listings. Sonder (NYC) is the largest host in the dataset with 327 listings, followed by Blueground with 232 listings. Several other hosts, including Kara, Kazuya, and Jeremy & Laura, also manage a substantial number of properties.

The results indicate that while many Airbnb listings are owned by individual hosts, a small number of hosts manage a significantly larger portfolio of properties, suggesting the presence of professional property management companies and commercial hosting operations within the Airbnb marketplace.

### Business Recommendation

Airbnb should consider developing dedicated programs and support services for high-volume hosts, as they contribute a significant portion of the platform's available listings. Building strong relationships with these hosts may help improve listing quality, operational efficiency, and long-term platform growth.

At the same time, Airbnb should continue supporting individual hosts to maintain a diverse marketplace and encourage healthy competition between professional property managers and independent hosts.

---

# Business Question 7

## Question

What is the average listing price for each room type?

### SQL Concepts

- JOIN
- GROUP BY
- AVG()

### Results

|ROOM_TYPE	       |AVERAGE_PRICE  |
|Entire home/apt   | 211.810918    |
|Private room	     | 89.809131     |
|Shared room	     | 70.248705     |



### Executive Summary

The analysis compares the average listing price across different Airbnb room types. Entire homes/apartments have the highest average listing price at $211.81, making them the premium accommodation option on the platform. Private rooms have an average price of $89.81, while shared rooms are the most affordable, with an average price of $70.25.

The results show a clear pricing difference between room types, with entire homes/apartments costing more than twice the average price of private rooms and approximately three times the average price of shared rooms.

### Business Recommendation

Airbnb can use these insights to tailor pricing and marketing strategies for different customer segments. Entire homes/apartments should be promoted to families, business travelers, and groups seeking privacy and additional space, while private rooms and shared rooms can be marketed as affordable options for solo travelers, students, and budget-conscious guests.

Hosts can also use this information to benchmark their pricing against the average price of similar room types and adjust their rates to remain competitive within the marketplace.

---

# Business Question 8

## Question

Which neighbourhood group has the highest average listing price?

### SQL Concepts

- JOIN
- GROUP BY
- AVG()

### Results

| Neighbourhood Group | Average Price |
|-------------------- |--------------:|
| Manhattan           | 196.88        |
| Brooklyn            | 124.44        |
| Staten Island       | 114.81        |
| Queens              | 99.52         |
| Bronx               | 87.58         |

### Executive Summary

Manhattan has the highest average Airbnb listing price, making it the premium Airbnb market in New York City.

Brooklyn ranks second, while the Bronx has the most affordable average listing prices.

### Business Recommendation

Airbnb can position Manhattan listings as premium accommodations while promoting the Bronx and Queens as affordable travel options for budget-conscious guests.

---

# Business Question 9

## Question

Which neighbourhoods have the highest average Airbnb listing prices?

### Results

| Rank | Neighbourhood Group | Neighbourhood     | Average Price |
| ---: | ------------------- | ----------------- | ------------: |
|    1 | Staten Island       | Fort Wadsworth    |   **$800.00** |
|    2 | Staten Island       | Woodrow           |   **$700.00** |
|    3 | Manhattan           | Tribeca           |   **$490.64** |
|    4 | Brooklyn            | Sea Gate          |   **$487.86** |
|    5 | Bronx               | Riverdale         |   **$442.09** |
|    6 | Staten Island       | Prince's Bay      |   **$409.50** |
|    7 | Manhattan           | Battery Park City |   **$367.56** |
|    8 | Manhattan           | Flatiron District |   **$341.93** |
|    9 | Staten Island       | Randall Manor     |   **$336.00** |
|   10 | Manhattan           | NoHo              |   **$295.72** |

### Executive Summary

The analysis identifies the top 10 New York City neighbourhoods based on average Airbnb listing price. Fort Wadsworth in Staten Island has the highest average listing price at $800, followed by Woodrow in Staten Island at $700.

Among the top 10 neighbourhoods, several premium locations are found in Manhattan, including Tribeca ($490.64), Battery Park City ($367.56), Flatiron District ($341.93), and NoHo ($295.72). Other high-priced neighbourhoods include Sea Gate in Brooklyn ($487.86) and Riverdale in the Bronx ($442.09).

The results demonstrate that high-value Airbnb listings are not limited to Manhattan and can also occur in individual neighbourhoods across other boroughs.


### Business Recommendation

Airbnb and hosts can use neighbourhood-level pricing analysis to identify potential premium pricing markets and develop location-specific pricing strategies.

However, neighbourhoods with exceptionally high average prices should be investigated alongside their number of listings before making pricing or investment decisions. A high average price based on only a small number of listings may not represent the broader market.

Therefore, management should combine average price with listing volume when identifying attractive premium neighbourhoods.



## Business Question 10

## Question

Which  Top 10 neighbourhood  has the  Number of listing 

## Results

| Rank | Neighbourhood Group | Neighbourhood      | Total Listings |
| ---: | ------------------- | ------------------ | -------------: |
|    1 | Brooklyn            | Williamsburg       |      **3,919** |
|    2 | Brooklyn            | Bedford-Stuyvesant |      **3,710** |
|    3 | Manhattan           | Harlem             |      **2,658** |
|    4 | Brooklyn            | Bushwick           |      **2,462** |
|    5 | Manhattan           | Upper West Side    |      **1,971** |
|    6 | Manhattan           | Hell's Kitchen     |      **1,958** |
|    7 | Manhattan           | East Village       |      **1,853** |
|    8 | Manhattan           | Upper East Side    |      **1,798** |
|    9 | Brooklyn            | Crown Heights      |      **1,564** |
|   10 | Manhattan           | Midtown            |      **1,545** |

## Executive Summary

The analysis shows that Williamsburg, Brooklyn has the largest Airbnb listing inventory, with 3,919 listings, followed by Bedford-Stuyvesant with 3,710 listings.

Brooklyn accounts for 4 of the top 10 neighbourhoods, while Manhattan accounts for 6. This indicates that Airbnb inventory is highly concentrated in established neighbourhoods across these two major boroughs.

Williamsburg and Bedford-Stuyvesant stand out as particularly important Airbnb markets because they have substantially more listings than most other individual neighbourhoods.

## Business Recommendation

Airbnb should prioritize Williamsburg, Bedford-Stuyvesant, Harlem, and other high-inventory neighbourhoods when planning marketplace operations, host support, and localized marketing campaigns.

However, high listing volume does not necessarily mean high profitability. Airbnb should combine listing volume with average price, reviews, and availability to identify neighbourhoods that offer the strongest overall business opportunities.









# Skills Demonstrated

Throughout this SQL analysis, the following SQL concepts were applied:

- SELECT
- FROM
- COUNT()
- AVG()
- SUM()
- MIN()
- MAX()
- INNER JOIN
- GROUP BY
- ORDER BY
- LIMIT
- Business KPI Analysis
- Business Insight Generation
- Data Interpretation

---

# Conclusion

This SQL business analysis demonstrates how Snowflake can be used to transform raw Airbnb data into meaningful business insights.

The analysis provides decision-makers with valuable information about listing distribution, pricing patterns, host activity, and neighbourhood performance.

These insights form the foundation for the Power BI dashboard developed in the next phase of the project.
