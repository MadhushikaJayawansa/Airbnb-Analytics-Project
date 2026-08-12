## Step 1.1 — Subquery: Listings Above Average Price

### Business Question

Which Airbnb listings have a price higher than the overall average listing price?

### SQL Concept

A subquery is a query placed inside another SQL query.

In this example, the inner query calculates the overall average listing price. The outer query then uses that result to identify listings priced above the average.


The query identified 14,879 Airbnb listings with prices higher than the overall average listing price.

The average price is calculated dynamically by the subquery rather than being manually entered into the main query.

## Key Learning
A subquery is a query nested inside another SQL query.

The inner query is executed to produce a value used by the outer query.

Subqueries can make analysis dynamic because values such as averages do not need to be calculated and entered manually.

This technique is useful when comparing individual records against an overall benchmark.


## Step 1.2 — Subquery with COUNT()

### Business Question

How many Airbnb listings have a price higher than the overall average listing price?

### Interpretation

There are 14,879 Airbnb listings priced higher than the overall average listing price.

The subquery dynamically calculates the overall average price, while the outer query counts the listings whose price is greater than that benchmark.

Key Learning
A subquery can calculate a value used by the main query.

COUNT(*) can be used with a subquery to produce a single business KPI.

Subqueries allow comparisons against dynamically calculated benchmarks.

The average price does not need to be manually entered into the query.



## Step 1.3 — Subquery with Aggregation

### Business Question

Which hosts have more listings than the average number of listings per host?

### SQL Concept

A subquery can be used with aggregated results to create a dynamic business benchmark.

The inner query calculates the number of listings for each host. The outer part of the subquery calculates the average number of listings per host. The main query then identifies hosts whose listing count is greater than this average.

### Result

The average number of listings per host was approximately 1.5153 listings.

Therefore, the query returns hosts with more than 1.5153 listings, meaning hosts with at least two listings.

|   Host ID | Host Name      | Total Listings |
| --------: | -------------- | -------------: |
| 219517861 | Sonder (NYC)   |            327 |
| 107434423 | Blueground     |            232 |
|  30283594 | Kara           |            121 |
| 137358866 | Kazuya         |            103 |
|  12243051 | Sonder         |             96 |
|  16098958 | Jeremy & Laura |             96 |

## Interpretation

The analysis shows that most hosts have relatively few listings, while a smaller group of hosts manages significantly more properties than the average.

Sonder (NYC) has the highest number of listings in the result, with 327 listings, followed by Blueground with 232 listings.

These hosts may represent larger-scale or professional property operators rather than individual hosts.

## Key Learning
Subqueries can be used with aggregate functions.

A nested query can calculate a benchmark dynamically.

GROUP BY can be used inside a subquery to calculate results for each group.

The outer query can compare grouped results against the calculated benchmark.

This pattern is useful for identifying above-average business performance.


## Step 1.4 — Correlated Subquery

### Business Question

Which Airbnb listings have a price higher than the average listing price of their own host?

### SQL Concept

A correlated subquery is a subquery that depends on the current row of the outer query.

Unlike a standard subquery that produces one result independently, a correlated subquery refers back to a value from the outer query.

In this example, the subquery calculates the average price for the same host as the current listing.

### Result

| Metric                                           |     Value |
| ------------------------------------------------ | --------: |
| Listings priced above their host's average price | **1,662** |

### Top Results

|       ID |   Host ID | Host Name | Price |
| -------: | --------: | --------- | ----: |
|  2953058 |   1177497 | Jessica   | 8,000 |
| 22779726 | 156158778 | Sally     | 7,703 |
| 34895693 | 262534951 | Sandra    | 7,500 |
| 33998396 |   3750764 | Kevin     | 6,800 |
| 22780103 | 156158778 | Sally     | 6,419 |
| 33397385 |  16105313 | Debra     | 5,100 |

### Interpretation

The query identified 1,662 listings whose prices are higher than the average price of listings managed by their respective hosts.

This provides a host-specific pricing comparison rather than comparing every listing against the overall Airbnb average.

### Key Learning

A correlated subquery references a column from the outer query.
The subquery is evaluated in relation to the current outer row.
fl2.host_key = fl.host_key connects the inner query to the current host.
Correlated subqueries are useful for comparing individual records against a group-specific benchmark.
They are more advanced than standard independent subqueries because the inner query depends on the outer query.


## Step 2.1 — CTE: Host Listing Summary

### Business Question

Which hosts manage the most Airbnb listings?

### SQL Concept

A CTE (Common Table Expression) creates a temporary named result set that can be used by the main query.

A CTE begins with the `WITH` keyword.

In this analysis, the CTE first calculates the total number of listings for each host. The main query then uses the CTE to sort the hosts by their listing count.

### Result

The CTE produced 37,455 host groups.

### Top Results

| Host Key | Total Listings |
| -------: | -------------: |
|    30563 |            327 |
|    21708 |            232 |
|     8393 |            121 |
|    26732 |            103 |
|    25206 |             96 |
|     4421 |             96 |

## Interpretation

The analysis shows that most hosts manage a relatively small number of listings, while a smaller number of hosts manage many properties.

The top host in the result manages 327 listings, followed by hosts managing 232 and 121 listings.

## Key Learning

A CTE is created using the WITH keyword.

A CTE gives a complex query a temporary, readable result set.

The CTE can contain aggregation such as COUNT() and GROUP BY.

The main query can then use the CTE as if it were a temporary table.

CTEs make complex SQL easier to read, organize, and maintain.


## Step 2.2 — CTE with Dimension Join

### Business Question

Which hosts manage the most Airbnb listings, including their host names?

### SQL Concept

A CTE can be combined with dimension tables to create a readable analytical query.

The CTE first summarizes the number of listings for each host. The main query then joins this summary to `Dim_Host` to retrieve the host ID and host name.

### Result

The query returned 37,455 host groups.

### Top Results 

|   Host ID | Host Name      | Total Listings |
| --------: | -------------- | -------------: |
| 219517861 | Sonder (NYC)   |            327 |
| 107434423 | Blueground     |            232 |
|  30283594 | Kara           |            121 |
| 137358866 | Kazuya         |            103 |
|  16098958 | Jeremy & Laura |             96 |
|  12243051 | Sonder         |             96 |

## Interpretation

The analysis identifies the hosts managing the largest number of Airbnb listings.

Sonder (NYC) manages the highest number of listings with 327, followed by Blueground with 232 listings.

Joining the CTE with Dim_Host makes the result more useful for business reporting because the surrogate host_key is replaced with meaningful host information.

## Key Learning

CTEs can be joined with dimension tables.

A CTE can perform aggregation before the main query.

Star-schema keys can be used to connect fact and dimension tables.

CTEs help separate data preparation from final presentation.

This approach is useful for creating readable analytical queries.

## Step 2.3 — Multiple CTEs

### Business Question

How can host listing counts and average reviews be combined into a single analytical result?

### SQL Concept

Multiple CTEs can be defined within the same SQL statement by separating them with commas.

In this analysis:

- The first CTE calculates the total number of listings for each host.
- The second CTE calculates the average number of reviews for each host.
- The final query joins both CTEs using `host_key`.

### Result

The query returned 37,455 host-level records.

### Top Results

| Host Key | Total Listings | Average Reviews |
| -------: | -------------: | --------------: |
|        5 |              1 |               9 |
|       25 |              1 |               0 |
|       28 |              1 |              29 |
|       29 |              3 |          175.33 |
|       45 |              2 |           69.50 |
|       62 |              2 |             261 |
|       71 |              1 |             142 |
|       84 |              1 |              24 |
|      100 |              1 |              19 |
|       59 |              2 |           13.50 |

## Interpretation

The combined result provides two important host-level measures: the number of listings managed by each host and the average number of reviews received by those listings.

For example, host 62 manages 2 listings and has an average of 261 reviews per listing, while host 29 manages 3 listings with an average of approximately 175.33 reviews.

Combining multiple CTEs allows different analytical calculations to be prepared separately and then brought together for comparison.

## Key Learning

Multiple CTEs can be used in a single SQL query.

CTEs are separated using commas.

Each CTE can perform a different calculation.

Multiple CTEs can be joined using a common key.

This approach makes complex analytical SQL easier to organize and understand.


## Step 2.4 — CTE with Business Filters

### Business Question

Which hosts manage at least 5 listings and have an average of more than 50 reviews per listing?

### SQL Concept

A CTE can be used to calculate business metrics first and then filter those calculated metrics in the main query.

In this analysis, the CTE calculates:

- Total listings per host
- Average reviews per listing

The main query then filters hosts based on both measures.

### Result

The query returned 83 hosts that meet both business conditions:

At least 5 listings
More than 50 average reviews per listing

### Top Results

| Host Key | Total Listings | Average Reviews |
| -------: | -------------: | --------------: |
|     8004 |              5 |           454.6 |
|     6116 |              5 |           403.4 |
|     8583 |              7 |          259.71 |
|     8608 |              5 |           231.4 |
|    17225 |              5 |           230.8 |
|    12422 |              6 |          204.83 |
|     9852 |              5 |           202.6 |
|     7612 |             11 |          179.18 |
|    22616 |              6 |          175.33 |
|     8345 |             13 |          169.62 |


## Interpretation

The analysis identified 83 hosts that combine a relatively large portfolio with strong review activity.

These hosts manage at least 5 listings while averaging more than 50 reviews per listing. This can indicate hosts with both a meaningful property portfolio and strong customer engagement.

Host 8004 has the highest average reviews among the filtered results, with 454.6 reviews per listing across 5 listings.

## Key Learning

A CTE can calculate multiple business metrics before filtering.

The main query can filter the calculated CTE columns.

Multiple conditions can be combined using AND.

CTEs are useful for creating readable business-performance analysis.

This pattern is useful when business rules depend on calculated metrics rather than raw columns.


## Step 3.1 — Creating a Host Performance View

### Business Question

Can we create a reusable view showing the performance of each Airbnb host?

### SQL Concept

A SQL View is a saved query that behaves like a virtual table.

Views allow frequently used analytical logic to be saved and reused without rewriting the complete SQL query each time.

In this analysis, a host performance view was created using the `Fact_Listings` fact table and `Dim_Host` dimension.

### Result

The view contains 37,455 host-level records.

### Sample Results

| Host Name    | Total Listings | Average Price | Total Reviews | Average Availability |
| ------------ | -------------: | ------------: | ------------: | -------------------: |
| Sonder (NYC) |            327 |        253.20 |         1,281 |               301.49 |
| Blueground   |            232 |        303.15 |            29 |               253.81 |
| Kara         |            121 |        277.53 |            65 |               313.42 |
| Kazuya       |            103 |         43.83 |            87 |               196.48 |
| Sonder       |             96 |        213.03 |            43 |               276.61 |

## Interpretation

The view provides a reusable host-level performance dataset containing listing volume, average price, total reviews, and average availability.

For example, Sonder (NYC) manages the largest number of listings in the sample with 327 listings, while Blueground has a higher average price of approximately $303.15.

## Key Learning

A View is a saved SQL query that behaves like a virtual table.

CREATE OR REPLACE VIEW creates or updates a view.

Views can combine fact and dimension tables.

Aggregated business metrics can be stored in a reusable analytical view.

Views reduce the need to repeatedly write complex SQL.

Views are useful as a clean data layer for reporting and BI tools such as Power BI.

## Step 3.2 — Querying a View

### Business Question

Which hosts have more than 20 Airbnb listings?

### SQL Concept

Once a View has been created, it can be queried like a regular table.

The `vw_host_performance` view already contains host-level metrics such as total listings, average price, and total reviews. Therefore, additional filtering can be performed directly on the view without repeating the original joins and aggregation logic.

### Result

The query returned 38 hosts with more than 20 listings.

### Sample Results

## Step 3.2 — Querying a View

### Business Question

Which hosts have more than 20 Airbnb listings?

### SQL Concept

Once a View has been created, it can be queried like a regular table.

The `vw_host_performance` view already contains host-level metrics such as total listings, average price, and total reviews. Therefore, additional filtering can be performed directly on the view without repeating the original joins and aggregation logic.

### Result

The query returned 38 hosts with more than 20 listings.

### Sample Results

| Host Name      | Total Listings | Average Price | Total Reviews |
| -------------- | -------------: | ------------: | ------------: |
| Sonder (NYC)   |            327 |        253.20 |         1,281 |
| Blueground     |            232 |        303.15 |            29 |
| Kara           |            121 |        277.53 |            65 |
| Kazuya         |            103 |         43.83 |            87 |
| Sonder         |             96 |        213.03 |            43 |
| Jeremy & Laura |             96 |        208.96 |           138 |

## Interpretation

The analysis identified 38 hosts managing more than 20 listings.

Sonder (NYC) manages the largest portfolio with 327 listings, followed by Blueground with 232 listings.

The results also show that a large number of listings does not necessarily mean a host has a high number of reviews. For example, Blueground manages 232 listings but has only 29 total reviews in this dataset.

## Key Learning

A View can be queried like a regular table.

WHERE can be applied directly to View columns.

Views prevent repeated complex joins and aggregations.

Views make analytical SQL shorter and easier to maintain.

Views can provide a clean data layer for BI reporting.

## Step 3.3 — Business-Focused View: Borough and Room Type Performance

### Business Question

How does Airbnb listing performance vary by borough and room type?

### SQL Concept

A business-focused View can combine multiple dimensions and fact-table measures into a reusable analytical dataset.

In this analysis, `Dim_Location` provides the borough, `Dim_Room_Type` provides the room type, and `Fact_Listings` provides the listing measures.

### Result

The view returned 15 borough and room-type combinations.

| Borough   | Room Type       | Total Listings | Average Price | Total Reviews | Average Availability |
| --------- | --------------- | -------------: | ------------: | ------------: | -------------------: |
| Manhattan | Entire home/apt |         13,198 |        249.26 |       235,147 |               117.15 |
| Brooklyn  | Private room    |         10,126 |         76.55 |       213,341 |                99.91 |
| Brooklyn  | Entire home/apt |          9,558 |        178.35 |       267,125 |                97.21 |
| Manhattan | Private room    |          7,982 |        116.78 |       209,150 |               101.85 |
| Queens    | Private room    |          3,372 |         71.76 |        93,561 |               149.22 |

## Interpretation

The analysis shows clear differences in listing performance across boroughs and room types.

Manhattan has the highest number of Entire home/apt listings with 13,198 listings and an average price of approximately $249.26.

Brooklyn has the largest number of Private room listings with 10,126 listings and an average price of approximately $76.55.

Brooklyn Entire home/apt listings generate the highest total reviews among the combinations shown, with 267,125 reviews.

## Key Learning

Views can combine multiple dimension tables with a fact table.

Business-focused Views can provide reusable datasets for reporting and dashboards.

Aggregation can be performed across multiple dimensions.

A single View can contain multiple business metrics.

Views are useful for creating a clean analytical layer between Snowflake and BI tools such as Power BI.


## Step 4.1 — ROW_NUMBER()

### Business Question

What are the Airbnb listings ranked by price from highest to lowest?

### SQL Concept

`ROW_NUMBER()` is a Window Function that assigns a unique sequential number to each row based on a specified order.

Unlike `RANK()`, `ROW_NUMBER()` does not assign the same rank to rows with equal values.

### Result

The query assigned a unique price rank to every listing.

## Sample Results

|       ID | Price | Price Rank |
| -------: | ----: | ---------: |
| 13894339 | 10000 |          1 |
| 22436899 | 10000 |          2 |
|  7003697 | 10000 |          3 |
|  9528920 |  9999 |          4 |
| 31340283 |  9999 |          5 |
|  4737930 |  9999 |          6 |
| 23377410 |  8500 |          7 |
|  2953058 |  8000 |          8 |
| 22779726 |  7703 |          9 |
| 33007610 |  7500 |         10 |

Interpretation

The analysis ranks Airbnb listings according to their price.

The three most expensive listings each have a price of 10,000. However, because ROW_NUMBER() assigns a unique number to every row, they receive different ranks: 1, 2, and 3.

Similarly, the three listings priced at 9,999 receive ranks 4, 5, and 6.

## Key Learning

ROW_NUMBER() is a Window Function.

It assigns a unique sequential number to every row.

The OVER() clause defines how the rows are processed.

ORDER BY inside OVER() determines the ranking order.

Rows with equal values still receive different row numbers

## Step 4.2 — RANK()

### Business Question

How can Airbnb listings be ranked by price while giving the same rank to listings with the same price?

### SQL Concept

`RANK()` is a Window Function that assigns the same rank to rows with equal values.

Unlike `ROW_NUMBER()`, duplicate values receive the same rank. However, gaps appear in the ranking after tied values.

### Result

The query ranked listings from highest to lowest price.

### Sample results

|       ID | Price | Price Rank |
| -------: | ----: | ---------: |
| 13894339 | 10000 |          1 |
| 22436899 | 10000 |          1 |
|  7003697 | 10000 |          1 |
|  9528920 |  9999 |          4 |
| 31340283 |  9999 |          4 |
|  4737930 |  9999 |          4 |
| 23377410 |  8500 |          7 |
|  2953058 |  8000 |          8 |
| 22779726 |  7703 |          9 |

## Interpretation

Listings with the same price receive the same rank.

The three listings priced at 10,000 all receive rank 1. Because three rows occupy rank 1, the next price, 9,999, receives rank 4.

Similarly, the three listings priced at 9,999 all receive rank 4, causing the next rank to be 7.

## Key Learning

RANK() assigns the same rank to tied values.

Tied rows create gaps in subsequent rankings.

RANK() is useful when equal values should share the same position.

RANK() differs from ROW_NUMBER(), which always assigns unique numbers.


## Step 4.3 — DENSE_RANK()

### Business Question

How can Airbnb listings with the same price receive the same rank without creating gaps in the ranking?

### SQL Concept

`DENSE_RANK()` is a Window Function that assigns the same rank to rows with equal values while keeping the ranking consecutive.

Unlike `RANK()`, `DENSE_RANK()` does not create gaps after tied values.

### Result

|       ID | Price | Price Rank |
| -------: | ----: | ---------: |
| 13894339 | 10000 |          1 |
| 22436899 | 10000 |          1 |
|  7003697 | 10000 |          1 |
|  9528920 |  9999 |          2 |
| 31340283 |  9999 |          2 |
|  4737930 |  9999 |          2 |
| 23377410 |  8500 |          3 |
|  2953058 |  8000 |          4 |
| 22779726 |  7703 |          5 |
| 33007610 |  7500 |          6 |

## Interpretation

The three listings with a price of 10,000 all receive rank 1.

The three listings with a price of 9,999 all receive rank 2.

Unlike RANK(), the ranking does not skip from 1 to 4. The next distinct price receives the next consecutive rank.

## Key Learning

Key Learning
DENSE_RANK() gives tied values the same rank.
Unlike RANK(), it does not create gaps.
DENSE_RANK() ranks distinct values consecutively.
ROW_NUMBER(), RANK(), and DENSE_RANK() are useful for different ranking requirements.


## Step 4.4 — PARTITION BY

### Business Question

What are the most expensive Airbnb listings within each room type?

### SQL Concept

`PARTITION BY` divides the data into separate groups before applying a Window Function.

Instead of ranking all listings together, the ranking is restarted for each room type.

In this analysis, listings are partitioned into:

- Entire home/apt
- Private room
- Shared room

The `ROW_NUMBER()` function then ranks listings by price within each room type.

### Result

The ranking is calculated separately for each room type.

### Sample Results

|       ID | Room Type       | Price | Price Rank |
| -------: | --------------- | ----: | ---------: |
| 13894339 | Entire home/apt | 10000 |          1 |
| 22436899 | Entire home/apt | 10000 |          2 |
|  4737930 | Entire home/apt |  9999 |          3 |
| 31340283 | Entire home/apt |  9999 |          4 |
| 23377410 | Entire home/apt |  8500 |          5 |
|  2953058 | Entire home/apt |  8000 |          6 |
| 22779726 | Entire home/apt |  7703 |          7 |
| 33007610 | Entire home/apt |  7500 |          8 |
| 33998396 | Entire home/apt |  6800 |          9 |
|  2271504 | Entire home/apt |  6500 |         10 |

## Interpretation

The query ranks listings by price separately within each room type.

The ranking starts from 1 for each room type rather than continuing across the entire dataset.

For example, the most expensive Entire home/apt listing receives rank 1. When the query reaches Private room, the ranking starts again at 1 for that group.

## Key Learning

PARTITION BY divides data into groups for a Window Function.

The Window Function is calculated independently within each group.

Ranking restarts for every partition.

PARTITION BY is different from GROUP BY.

GROUP BY combines rows into summary rows, while PARTITION BY keeps the original rows and performs 
calculations across them.

PARTITION BY is extremely useful for group-level rankings and comparisons.


## Step 4.5 — Top N Within Each Group

### Business Question

What are the top 3 most expensive Airbnb listings within each room type?

### SQL Concept

Window Functions can be combined with `PARTITION BY` to rank records within groups.

A CTE is then used to filter the ranked results.

The query:

1. Partitions listings by room type.
2. Ranks listings by price within each room type.
3. Filters the results to the top 3 listings in each group.

### Result

The query returned 9 listings:

3 Entire home/apt listings
3 Private room listings
3 Shared room listings

|       ID | Room Type       | Price | Price Rank |
| -------: | --------------- | ----: | ---------: |
| 13894339 | Entire home/apt | 10000 |          1 |
| 22436899 | Entire home/apt | 10000 |          2 |
|  4737930 | Entire home/apt |  9999 |          3 |
|  7003697 | Private room    | 10000 |          1 |
|  9528920 | Private room    |  9999 |          2 |
| 34895693 | Private room    |  7500 |          3 |
| 11234747 | Shared room     |  1800 |          1 |
| 23169146 | Shared room     |  1250 |          2 |
|  2230982 | Shared room     |  1000 |          3 |

## Interpretation

The analysis identifies the three most expensive listings within each room type rather than ranking all listings together.

Entire home/apt and Private room categories both contain listings priced at 10,000, while the highest-priced Shared room listing is 1,800.

This demonstrates how Window Functions can be used to answer category-specific Top N business questions.

## Key Learning
PARTITION BY allows rankings to restart within each group.

ROW_NUMBER() can be used to identify Top N records.

A CTE can store the ranked results.

The outer query can filter the Window Function result.

The Top N Within Group pattern is commonly used in business intelligence and data analysis.