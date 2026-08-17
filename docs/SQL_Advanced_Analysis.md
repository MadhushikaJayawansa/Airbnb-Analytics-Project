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


## Step 4.6 — Running Total

### Business Question

How do Airbnb reviews accumulate over time?

### SQL Concept

A Running Total is a cumulative calculation that continuously adds the current value to all previous values.

Window Functions can be used to calculate running totals without collapsing the original summary rows.

In this analysis, annual review totals are calculated first using a CTE. A Window Function is then used to calculate the cumulative number of reviews over the years.

### Result

| Year | Total Reviews | Running Total Reviews |
| ---: | ------------: | --------------------: |
| 2011 |            61 |                    61 |
| 2012 |           178 |                   239 |
| 2013 |           242 |                   481 |
| 2014 |           932 |                 1,413 |
| 2015 |         5,762 |                 7,175 |
| 2016 |        16,182 |                23,357 |
| 2017 |        28,522 |                51,879 |
| 2018 |        72,355 |               124,234 |
| 2019 |     1,013,394 |             1,137,628 |

## Interpretation

The running total shows the cumulative number of reviews recorded in the Airbnb dataset over time.

Review activity increased substantially in the later years. By the end of 2018, the cumulative number of reviews had reached 124,234.

In 2019, the dataset recorded 1,013,394 reviews, bringing the cumulative total to 1,137,628.

The final running total matches the overall project KPI for total reviews

## Key Learning

A running total can be calculated using a Window Function.

SUM() OVER (ORDER BY ...) creates a cumulative calculation.

A CTE can first aggregate data before applying a Window Function.

ORDER BY year determines the sequence in which values are accumulated.

Running totals are useful for time-series analysis, cumulative KPIs, and business dashboards.


## Step 4.7.1 — Basic LAG()

### Business Question

How many reviews were recorded in the previous year?

### SQL Concept

`LAG()` is a Window Function that allows the current row to access a value from a previous row.

It is commonly used for:

- Year-over-year analysis
- Month-over-month analysis
- Comparing current and previous periods
- Calculating changes between periods

### Result

| Year | Total Reviews | Previous Year Reviews |
| ---: | ------------: | --------------------: |
| 2011 |            61 |                  NULL |
| 2012 |           178 |                    61 |
| 2013 |           242 |                   178 |
| 2014 |           932 |                   242 |
| 2015 |         5,762 |                   932 |
| 2016 |        16,182 |                 5,762 |
| 2017 |        28,522 |                16,182 |
| 2018 |        72,355 |                28,522 |
| 2019 |     1,013,394 |                72,355 |

## Interpretation

LAG() successfully retrieves the review total from the previous year.

The first year, 2011, has no previous year in the dataset, so its previous-year value is NULL.

For example, 2019 recorded 1,013,394 reviews, while the previous year, 2018, recorded 72,355 reviews.

## Key Learning

LAG() retrieves a value from a previous row.

ORDER BY determines what "previous" means.

The first row normally returns NULL because there is no previous row.

LAG() is useful for period-over-period comparisons.

## Step 4.7.2 — Year-over-Year Difference

### Business Question

How much did the total number of Airbnb reviews increase or decrease compared with the previous year?

### SQL Concept

`LAG()` can be combined with arithmetic calculations to compare the current period with the previous period.

The year-over-year change is calculated as:

Current Year Reviews - Previous Year Reviews

### Result

| Year | Total Reviews | Previous Year Reviews | Review Change |
| ---: | ------------: | --------------------: | ------------: |
| 2011 |            61 |                  NULL |          NULL |
| 2012 |           178 |                    61 |           117 |
| 2013 |           242 |                   178 |            64 |
| 2014 |           932 |                   242 |           690 |
| 2015 |         5,762 |                   932 |         4,830 |
| 2016 |        16,182 |                 5,762 |        10,420 |
| 2017 |        28,522 |                16,182 |        12,340 |
| 2018 |        72,355 |                28,522 |        43,833 |
| 2019 |     1,013,394 |                72,355 |       941,039 |

## Interpretation

The analysis shows that Airbnb review activity increased substantially over time.

The largest year-over-year increase occurred in 2019, when reviews increased by 941,039 compared with 2018.

Review growth also accelerated in earlier years, increasing by 43,833 reviews in 2018 compared with 2017.

The first year, 2011, has no previous-year value, so the comparison returns NULL.

## Key Learning

LAG() can retrieve the previous period's value.

The previous value can be used in arithmetic calculations.

Year-over-year analysis can be created using Window Functions.

LAG() is useful for identifying increases and decreases over time.

CTEs can make multi-stage analytical queries easier to understand and maintain.

## Step 4.7.3 — Year-over-Year Growth %

### Business Question

What percentage did Airbnb reviews increase or decrease compared with the previous year?

### SQL Concept

Year-over-Year (YoY) Growth measures the percentage change between the current year's value and the previous year's value.

The formula is:

YoY Growth % =
(Current Year Value - Previous Year Value)
÷ Previous Year Value × 100

`LAG()` is used to retrieve the previous year's review total.

### Result

| Year | Total Reviews | Previous Year Reviews | Review Change | YoY Growth % |
| ---: | ------------: | --------------------: | ------------: | -----------: |
| 2011 |            61 |                  NULL |          NULL |         NULL |
| 2012 |           178 |                    61 |           117 |      191.80% |
| 2013 |           242 |                   178 |            64 |       35.96% |
| 2014 |           932 |                   242 |           690 |      285.12% |
| 2015 |         5,762 |                   932 |         4,830 |      518.24% |
| 2016 |        16,182 |                 5,762 |        10,420 |      180.84% |
| 2017 |        28,522 |                16,182 |        12,340 |       76.26% |
| 2018 |        72,355 |                28,522 |        43,833 |      153.68% |
| 2019 |     1,013,394 |                72,355 |       941,039 |    1,300.59% |

## Interpretation

The analysis shows strong year-over-year growth in review activity throughout the dataset.

The largest percentage increase occurred in 2019, when total reviews increased by 941,039, representing 1,300.59% growth compared with 2018.

The growth rate was also particularly high in 2015, at 518.24%, while 2017 recorded the lowest positive growth rate at 76.26% among the years with a previous-year comparison.

The first year, 2011, has no previous year in the dataset, so its YoY growth is NULL.

## Business Consideration

The very large 2019 increase should be interpreted carefully. This dataset represents Airbnb NYC listings and contains review dates over a historical period. Therefore, the result should be treated as a dataset-level observation, rather than automatically concluding that Airbnb's overall business grew by 1,300.59%.

## Key Learning
YoY Growth measures percentage change between periods.

LAG() can retrieve the previous period's value.

Window Functions can support business growth analysis.

NULLIF() helps prevent division-by-zero errors.

ROUND() controls the number of decimal places.

YoY percentage analysis is commonly used in business dashboards and performance reporting.

## Step 4.8 — LEAD()

### Business Question

How many Airbnb reviews were recorded in the following year?

### SQL Concept

`LEAD()` is a Window Function that allows the current row to access a value from a subsequent row.

It is useful for:

- Comparing current and future periods
- Forecasting-style analysis
- Identifying changes between consecutive periods
- Time-series analysis

`LAG()` looks backward, while `LEAD()` looks forward.

### Result

| Year | Total Reviews | Next Year Reviews |
| ---: | ------------: | ----------------: |
| 2011 |            61 |               178 |
| 2012 |           178 |               242 |
| 2013 |           242 |               932 |
| 2014 |           932 |             5,762 |
| 2015 |         5,762 |            16,182 |
| 2016 |        16,182 |            28,522 |
| 2017 |        28,522 |            72,355 |
| 2018 |        72,355 |         1,013,394 |
| 2019 |     1,013,394 |              NULL |

## Interpretation

LEAD() successfully retrieves the review total from the following year.

For example, the 2018 row shows 72,355 reviews for 2018 and 1,013,394 reviews for the following year, 2019.

The 2019 value is NULL because the dataset does not contain a following year.

## Key Learning
LEAD() retrieves a value from a subsequent row.

LAG() looks backward, while LEAD() looks forward.

ORDER BY determines the sequence of rows.

LEAD() is useful for time-series and period-to-period analysis.


## Step 4.9.1 — FIRST_VALUE()

### Business Question

How does each year's total review count compare with the first year in the dataset?

### SQL Concept

`FIRST_VALUE()` is a Window Function that returns the first value within the specified window.

In this analysis, the data is ordered by year, so the first value is the total number of reviews recorded in 2011.

The first-year review total is therefore used as a baseline for every year.

### Result

| Year | Total Reviews | First Year Reviews |
| ---: | ------------: | -----------------: |
| 2011 |            61 |                 61 |
| 2012 |           178 |                 61 |
| 2013 |           242 |                 61 |
| 2014 |           932 |                 61 |
| 2015 |         5,762 |                 61 |
| 2016 |        16,182 |                 61 |
| 2017 |        28,522 |                 61 |
| 2018 |        72,355 |                 61 |
| 2019 |     1,013,394 |                 61 |

## Interpretation

FIRST_VALUE() identifies the first year's review total and uses it as a reference value for every year.

The first year in the dataset is 2011, with 61 reviews. Therefore, every row contains 61 in the First_Year_Reviews column.

This creates a consistent baseline that can be used to compare changes in review activity over the entire period.

## Key Learning
FIRST_VALUE() returns the first value in a Window Function's ordered window.

ORDER BY determines which row is considered first.

The first value can be used as a fixed baseline for comparison.

FIRST_VALUE() is useful for trend analysis and comparing current performance against an initial period.


## Step 4.9.2 — LAST_VALUE()

### Business Question

How does each year's total review count compare with the final year in the dataset?

### SQL Concept

`LAST_VALUE()` is a Window Function that returns the last value within a specified window.

In this analysis, the data is ordered chronologically, so the final value is the total number of reviews recorded in 2019.

A complete window frame is explicitly defined so that `LAST_VALUE()` can access the final row of the entire dataset.

### Result

| Year | Total Reviews | Final Year Reviews |
| ---: | ------------: | -----------------: |
| 2011 |            61 |          1,013,394 |
| 2012 |           178 |          1,013,394 |
| 2013 |           242 |          1,013,394 |
| 2014 |           932 |          1,013,394 |
| 2015 |         5,762 |          1,013,394 |
| 2016 |        16,182 |          1,013,394 |
| 2017 |        28,522 |          1,013,394 |
| 2018 |        72,355 |          1,013,394 |
| 2019 |     1,013,394 |          1,013,394 |

## Interpretation

The query identifies the total review count for the final year of the dataset and makes that value available for every year.

The final year is 2019, with 1,013,394 reviews.

Therefore, every row contains 1,013,394 in the Final_Year_Reviews column.

This creates a fixed endpoint that can be used to compare earlier years with the final year.

## Key Learning
LAST_VALUE() returns the last value within a Window Function's frame.

ORDER BY determines the order of the rows.

Window frames control which rows are included in the calculation.

UNBOUNDED PRECEDING starts the frame from the first row.

UNBOUNDED FOLLOWING extends the frame to the final row.

LAST_VALUE() can be useful for comparing historical values with a final-period benchmark.

## Step 4.10 — Top 3 Hosts Within Each Borough

### Business Question

Who are the top 3 Airbnb hosts in each borough based on the number of listings they manage?

### SQL Concept

This analysis combines several SQL concepts:

- JOIN
- GROUP BY
- COUNT()
- CTEs
- ROW_NUMBER()
- PARTITION BY
- ORDER BY
- Filtering ranked results

`ROW_NUMBER()` is used with `PARTITION BY borough` so that host rankings restart from 1 within each borough.

### Result
| Borough       |   Host ID | Host Name    | Total Listings | Host Rank |
| ------------- | --------: | ------------ | -------------: | --------: |
| Bronx         |    310670 | Vie          |             13 |         1 |
| Bronx         |  23878336 | Armando      |             10 |         2 |
| Bronx         |  30509656 | Orit         |              8 |         3 |
| Brooklyn      |   7503643 | Vida         |             52 |         1 |
| Brooklyn      |  26377263 | Stat         |             35 |         2 |
| Brooklyn      | 119669058 | Melissa      |             34 |         3 |
| Manhattan     | 219517861 | Sonder (NYC) |            327 |         1 |
| Manhattan     | 107434423 | Blueground   |            230 |         2 |
| Manhattan     |  30283594 | Kara         |            121 |         3 |
| Queens        | 137358866 | Kazuya       |             79 |         1 |
| Queens        |  19303369 | Hiroki       |             29 |         2 |
| Queens        | 242962235 | Yuval        |             23 |         3 |
| Staten Island | 104812805 | Amarjit S    |              8 |         1 |
| Staten Island | 137999892 | Simranjeet   |              7 |         2 |
| Staten Island |  50756378 | Nina         |              7 |         3 |


## Interpretation

The analysis identifies the three hosts with the highest number of listings within each borough.

Manhattan has the highest concentration among the top hosts. Sonder (NYC) manages 327 listings, followed by Blueground with 230 and Kara with 121.

In Brooklyn, Vida is the leading host with 52 listings, while Kazuya leads Queens with 79 listings.

The top hosts in the Bronx and Staten Island manage substantially fewer listings than the leading hosts in Manhattan, Brooklyn, and Queens.

## Business Insight

The results indicate that listing concentration varies considerably by borough.

Manhattan has particularly high host concentration, with Sonder (NYC) managing a large portfolio of listings. These high-volume hosts could be important targets for account management, performance monitoring, or business relationship strategies.

## Key Learning

PARTITION BY creates separate groups for Window Function calculations.

ROW_NUMBER() can rank records within each group.

A CTE can separate aggregation from ranking logic.

Ranked results can be filtered using an outer query.

This pattern is useful for Top-N business analysis.

Combining aggregation and Window Functions allows complex business questions to be answered efficiently.

## Step 4.11 — Final Business Analysis Using RANK()

### Business Question

Who are the top Airbnb hosts in each borough based on the number of listings they manage, including hosts who are tied?

### SQL Concept

This analysis combines:

- JOIN
- GROUP BY
- COUNT()
- CTEs
- RANK()
- PARTITION BY
- ORDER BY
- Filtering ranked results

Unlike `ROW_NUMBER()`, the `RANK()` function assigns the same rank to records with equal values.

### Result

| Borough       |   Host ID | Host Name    | Total Listings | Host Rank |
| ------------- | --------: | ------------ | -------------: | --------: |
| Bronx         |    310670 | Vie          |             13 |         1 |
| Bronx         |  23878336 | Armando      |             10 |         2 |
| Bronx         |  35783912 | Pi & Leo     |              8 |         3 |
| Bronx         |  30509656 | Orit         |              8 |         3 |
| Brooklyn      |   7503643 | Vida         |             52 |         1 |
| Brooklyn      |  26377263 | Stat         |             35 |         2 |
| Brooklyn      | 119669058 | Melissa      |             34 |         3 |
| Manhattan     | 219517861 | Sonder (NYC) |            327 |         1 |
| Manhattan     | 107434423 | Blueground   |            230 |         2 |
| Manhattan     |  30283594 | Kara         |            121 |         3 |
| Queens        | 137358866 | Kazuya       |             79 |         1 |
| Queens        |  19303369 | Hiroki       |             29 |         2 |
| Queens        | 242962235 | Yuval        |             23 |         3 |
| Staten Island | 104812805 | Amarjit S    |              8 |         1 |
| Staten Island | 137999892 | Simranjeet   |              7 |         2 |
| Staten Island | 104927746 | Amardeep     |              7 |         2 |
| Staten Island |  50756378 | Nina         |              7 |         2 |


## Interpretation

The analysis identifies the highest-ranking hosts within each borough while preserving ties.

In the Bronx, Pi & Leo and Orit both manage 8 listings and therefore receive the same rank of 3.

In Staten Island, Simranjeet, Amardeep, and Nina each manage 7 listings and therefore all receive Rank 2.

As a result, the query returns 17 rows rather than exactly 15 rows. This is expected because tied hosts are retained.

## Business Insight

Using RANK() provides a fairer representation when multiple hosts have the same number of listings.

For business reporting, this can be useful when identifying leading hosts without arbitrarily excluding a host simply because another host has the same performance value.

Manhattan continues to show the strongest concentration of listings among the top hosts, with Sonder (NYC) managing 327 listings.

## Key Learning
RANK() assigns the same rank to tied values.

PARTITION BY creates an independent ranking within each borough.

ROW_NUMBER() and RANK() behave differently when values are tied.

Filtering with WHERE Host_Rank <= 3 can return more than three records per group when ties occur.

CTEs make complex multi-stage business analysis easier to structure.

Window Functions are useful for real-world Top-N and ranking analysis.


## Phase 08

## Step 08.2.1 — Conditional Average by Borough
## Business Question

What is the average price of Budget, Moderate, and Expensive listings in each borough?

## Result

| Borough       | Budget Avg | Moderate Avg | Expensive Avg |
| ------------- | ---------: | -----------: | ------------: |
| Bronx         |      59.49 |       150.67 |        567.54 |
| Brooklyn      |      65.98 |       165.36 |        617.76 |
| Manhattan     |  **75.31** |   **181.57** |        616.74 |
| Queens        |      62.98 |       160.53 |    **668.47** |
| Staten Island |      62.04 |       166.52 |  **1,281.75** |

## Key findings

Manhattan has the highest average Budget price: 75.31.

Manhattan also has the highest Moderate average: 181.57.

Queens has the highest Expensive average among the larger boroughs: 668.47.

Staten Island shows a very high Expensive average of 1,281.75, but remember it has only 8 expensive 
listings, so a small number of high-priced listings can heavily influence the average.

This demonstrates why we shouldn't interpret an average without considering the number of observations behind it.

## Key learning

CASE
 ↓
AVG()
 ↓
GROUP BY
 ↓
JOIN
 ↓
Business interpretation


## Step 08.2.2 — Conditional Average by Room Type is complete

## Business Question

How does average pricing differ between Budget, Moderate, and Expensive listings for each room type?

## Results

| Room Type       | Budget Avg | Moderate Avg | Expensive Avg |
| --------------- | ---------: | -----------: | ------------: |
| Entire home/apt |      84.97 |       179.24 |        601.56 |
| Private room    |      64.71 |       149.40 |    **774.06** |
| Shared room     |      48.60 |       162.83 |        617.04 |

## Business interpretation

Entire home/apt has the highest Budget average: 84.97.

Entire home/apt also has the highest Moderate average: 179.24.

Private rooms have the highest Expensive average: 774.06.

Shared rooms have the lowest Budget average: 48.60.

The large Expensive average for Private rooms is interesting, but we should always consider the number of listings behind the average before drawing strong conclusions.

## Key learning

CASE
 ↓
AVG()
 ↓
GROUP BY
 ↓
JOIN


## Step 08.3 — Hosts with Many Listings and High Average Prices

## Business Question

## Which hosts have at least 10 listings and an average listing price above $200?

## Results 

The query identifies 35 hosts who satisfy both conditions:

At least 10 listings

Average price above $200

| Host       | Listings |   Avg. Price |
| ---------- | -------: | -----------: |
| Sally      |       12 | **3,091.42** |
| Henry      |       11 | **1,772.73** |
| Jessica    |       11 | **1,350.00** |
| Chayla     |       12 |   **828.17** |
| Red Awning |       49 |   **720.29** |
| Bluebird   |       18 |   **577.39** |
| Blueground |      232 |   **303.15** |

## Business Insight

Sally has the highest average price (3,091.42) but only 12 listings.

Blueground, on the other hand, has 232 listings with an average price of 303.15.

That shows why looking at both volume and price is more useful than looking at either metric alone.

For example:

A host can have a very high average price but relatively few listings, while another host can operate a much larger portfolio at a lower average price.

## Step 08.3.1 — HAVING with Conditional Aggregation

## Business Question

## Which boroughs have at least 10,000 listings AND more than 30% of their listings are Budget listings?

## Results 

The query returned 2 boroughs that met both conditions:

At least 10,000 listings

More than 30% Budget listings

| Borough   | Total Listings | Budget Listings | Budget % |
| --------- | -------------: | --------------: | -------: |
| Brooklyn  |         20,095 |          11,762 |   58.53% |
| Manhattan |         21,660 |           6,920 |   31.95% |

## Interpretation

Brooklyn and Manhattan are the only boroughs that satisfy both criteria.

Brooklyn has a much higher proportion of Budget listings (58.53%) compared with Manhattan (31.95%). Manhattan has slightly more total listings, but its listings are more concentrated in the Moderate and Expensive categories.

## Business Insight

Brooklyn represents a larger budget-oriented market, while Manhattan has a more premium pricing structure.

For Airbnb management, this suggests that:

Brooklyn may provide stronger opportunities for customers seeking affordable accommodation.
Manhattan may have greater potential for premium-priced listings.
Pricing and marketing strategies could therefore be tailored by borough rather than applying the same strategy across New York City.
Key Learning

This query demonstrates how HAVING can filter groups based on multiple aggregated business conditions.

The analytical process is:

GROUP BY
    ↓
Calculate aggregate metrics
    ↓
HAVING filters the groups
    ↓
Business insight


## Step 08.4.1 — CTE: Calculate Listings per Host

### Business Question

How many listings does each host have?

### SQL Concept

Common Table Expression (CTE)

### Purpose

Create an intermediate result that calculates the total number of listings associated with each host. This result will be used as the first stage of a multiple-CTE analysis.

### Result

The query returned 37,455 rows.

The first 10 results were:

| HOST_ID   | HOST_NAME         | TOTAL_LISTINGS |
| --------- | ----------------- | -------------: |
| 219517861 | Sonder (NYC)      |            327 |
| 107434423 | Blueground        |            232 |
| 30283594  | Kara              |            121 |
| 137358866 | Kazuya            |            103 |
| 12243051  | Sonder            |             96 |
| 16098958  | Jeremy & Laura    |             96 |
| 61391963  | Corporate Housing |             91 |
| 22541573  | Ken               |             87 |
| 200380610 | Pranjal           |             65 |
| 7503643   | Vida              |             52 |

## Interpretation

The CTE calculates the number of listings associated with each host and produces an intermediate host-level dataset.

The results show that some hosts manage significantly more listings than others. Sonder (NYC) has the highest number of listings in the displayed results with 327, followed by Blueground with 232 and Kara with 121.

## Business Insight

A small number of hosts appear to manage a large number of Airbnb listings. This indicates that listing activity is not evenly distributed across hosts.

Identifying high-volume hosts can help Airbnb management understand host concentration and identify hosts who may have a significant impact on the overall marketplace.

## Key Learning

A CTE allows a complex SQL problem to be divided into smaller logical steps.

In this step:

Fact_Listings + Dim_Host
↓
GROUP BY host
↓
host_listing_counts CTE
↓
Host-level listing analysis

This CTE will become the input for the next stage of the multiple-CTE analysis.


## Step 08.4.2 — CTE 2: Calculate Average Listings per Host is complete.

### Business Question

What is the average number of listings managed by a host?

## Results

| Metric                    |      Result |
| ------------------------- | ----------: |
| Average listings per host | **1.30514** |

## Interpretation

On average, each host manages approximately 1.31 listings.

This is quite low compared with the high-volume hosts we saw earlier. For example:

Sonder (NYC) → 327 listings
Blueground → 232 listings
Kara → 121 listings

This tells us that the host distribution is highly uneven: many hosts manage only one or a few listings, while a small number manage very large portfolios.

## Business Insight

This is useful for Airbnb management because it highlights host concentration.

A small group of high-volume hosts may have a disproportionate influence on:

Listing supply
Pricing
Availability
Customer reviews
Overall marketplace performance

## Step 08.4.3 — Multiple CTEs is complete.

1,515 hosts have more listings than the average host.

Average host listing count = 1.31 listings

The top hosts are well above that benchmark.

## Result

| Host              | Total Listings | Average Host Listings |
| ----------------- | -------------: | --------------------: |
| Sonder (NYC)      |            327 |                  1.31 |
| Blueground        |            232 |                  1.31 |
| Kara              |            121 |                  1.31 |
| Kazuya            |            103 |                  1.31 |
| Jeremy & Laura    |             96 |                  1.31 |
| Sonder            |             96 |                  1.31 |
| Corporate Housing |             91 |                  1.31 |
| Ken               |             87 |                  1.31 |
| Pranjal           |             65 |                  1.31 |
| Vida              |             52 |                  1.31 |

## Interpretation

The average host manages only 1.31 listings, while 1,515 hosts manage more than this average.

The difference between the average and the largest host portfolios is substantial. For example, Sonder (NYC) manages 327 listings, which is far above the average.

This indicates that the distribution of listings across hosts is highly uneven.

## Business Insight

A relatively small group of hosts manages a significant number of listings. These high-volume hosts may have a greater influence on:

Overall listing supply
Pricing patterns
Availability
Customer reviews
Marketplace performance

For Airbnb management, these hosts could be considered key or high-volume hosts and may deserve separate monitoring or targeted relationship strategies.

## Key Learning

This step demonstrates the real power of multiple CTEs.

## Step 08.5 — Host Performance Classification

### Step 08.5.1 — Calculate Reviews per Listing

### Business Question

How efficiently are hosts generating reviews relative to the number of listings they manage?

## Result

The query returned 37,455 hosts.

The top 10 hosts by reviews per listing are:

| Host           | Listings | Total Reviews | Reviews / Listing |
| -------------- | -------: | ------------: | ----------------: |
| Dona           |        2 |         1,205 |        **602.50** |
| Jj             |        3 |         1,798 |        **599.33** |
| Carol          |        1 |           540 |        **540.00** |
| Asa            |        1 |           488 |        **488.00** |
| Wanda          |        1 |           480 |        **480.00** |
| Maya           |        5 |         2,273 |        **454.60** |
| Lloyd          |        1 |           454 |        **454.00** |
| Agnes          |        2 |           897 |        **448.50** |
| Dennis & Naoko |        1 |           441 |        **441.00** |
| Miss Dy        |        1 |           434 |        **434.00** |


## Interpretation

The results show that some hosts generate a very high number of reviews relative to the number of listings they manage.

For example, Dona has only 2 listings but 1,205 total reviews, producing 602.5 reviews per listing.

However, notice that several of the highest values come from hosts with only 1–3 listings. So a high reviews-per-listing value doesn't necessarily mean the host is the most important host overall.

This is an important analytical lesson:

A metric needs context.

We should consider both volume and efficiency, rather than relying on one metric alone.

## Business Insight

Hosts with high reviews per listing may represent listings with strong customer engagement or long-established properties.

However, Airbnb management should distinguish between:

High-volume hosts → many listings
High-engagement hosts → many reviews per listing
High-volume + high-engagement hosts → potentially the strongest performers

That last category is what we'll work toward.


## Step 08.5.2 — CASE Performance Classification

## Result

The first 10 hosts are all classified as High because their reviews per listing are well above

| Host           | Listings | Reviews | Reviews / Listing | Category |
| -------------- | -------: | ------: | ----------------: | -------- |
| Dona           |        2 |   1,205 |            602.50 | High     |
| Jj             |        3 |   1,798 |            599.33 | High     |
| Carol          |        1 |     540 |            540.00 | High     |
| Asa            |        1 |     488 |            488.00 | High     |
| Wanda          |        1 |     480 |            480.00 | High     |
| Maya           |        5 |   2,273 |            454.60 | High     |
| Lloyd          |        1 |     454 |            454.00 | High     |
| Agnes          |        2 |     897 |            448.50 | High     |
| Dennis & Naoko |        1 |     441 |            441.00 | High     |
| Miss Dy        |        1 |     434 |            434.00 | High     |

## Interpretation

The CASE statement successfully converts the numerical Reviews per Listing metric into a business-friendly classification:

Reviews per Listing
       ↓
   CASE
       ↓
High / Medium / Low

This makes the results much easier for a business user to understand than looking at raw numerical values alone.

## Business Insight

The classification can help Airbnb management segment hosts based on review engagement per listing.

However, we should be careful: a host with only one listing and 540 reviews can appear "High" even though they operate a very small portfolio.

Therefore, performance category should be considered together with listing volume when making business decisions.

## Key Learning

You combined:

COUNT()
SUM()
Calculated metrics
NULLIF()
CASE
GROUP BY
JOIN

## Step 08.5.3 — Count Hosts by Performance Category

## Results

| Performance Category | Total Hosts |      Share |
| -------------------- | ----------: | ---------: |
| Low                  |      32,233 | **86.06%** |
| Medium               |       3,093 |  **8.26%** |
| High                 |       2,129 |  **5.68%** |
| **Total**            |  **37,455** |   **100%** |

## Interpretation

The majority of hosts (86.06%) fall into the Low category based on reviews per listing.

Only 5.68% of hosts are classified as High, while 8.26% are Medium.

This shows that high review engagement is concentrated among a relatively small group of hosts.

## Business Insight

This suggests that Airbnb management could focus on the 2,129 High-performance hosts as a distinct group.

They could be analyzed further to understand what characteristics contribute to their stronger review engagement, such as:

Number of listings
Room type
Borough
Average price
Availability
Minimum nights

At the same time, the large Low-performance group (32,233 hosts) could be investigated to identify opportunities to improve guest engagement and reviews.

Important: Our High/Medium/Low thresholds (100 and 50 reviews per listing) are analytical thresholds we chose for this exercise, not official Airbnb performance standards.

## Key Learning

This step combines several important analytical SQL techniques:

Fact + Dimension
    ↓
GROUP BY
      ↓
Calculate KPI
      ↓
CASE classification
      ↓
CTE
      ↓
GROUP BY classification
      ↓
Business summary

## Step 08.6 — Analytical Comparison

## Business Question

## Which boroughs have an average listing price above the overall NYC average price?

## Step 08.6.1 — Calculate the Overall Average Price

## Result

Overall NYC Average Price = $152.76

This will be our benchmark for the next steps.

## Interpretation

The average listing price across all 48,884 listings is $152.76.

We'll now compare each borough's average price against this benchmark to identify which areas are priced above or below the NYC-wide average.

## Business Insight

The overall average gives Airbnb management a useful market benchmark.

Instead of simply saying:

"Manhattan has an average price of $X."

we can ask the more meaningful business question:

"Is Manhattan's average price higher or lower than the NYC market average?"

That's the core idea behind analytical comparison.

## Key Learning

Overall business metric
        ↓
     Benchmark
        ↓
Compare individual groups
        ↓
Above / Below benchmark

## Step 08.6.2 — Calculate Borough Average Prices is complete

## Results 

| Borough       | Total Listings | Average Price |
| ------------- | -------------: | ------------: |
| Manhattan     |         21,660 |    **196.88** |
| Brooklyn      |         20,095 |    **124.44** |
| Staten Island |            373 |    **114.81** |
| Queens        |          5,666 |     **99.52** |
| Bronx         |          1,090 |     **87.58** |

## Interpretation

There is a clear difference in average pricing across boroughs.

Manhattan has the highest average price at $196.88.
Brooklyn is second at $124.44.
Staten Island averages $114.81.
Queens averages $99.52.
Bronx has the lowest average at $87.58.

Manhattan's average is notably higher than the other boroughs, which will be important when we compare each borough against the overall NYC benchmark of $152.76.

## Business Insight

The results suggest that location has a strong relationship with Airbnb pricing.

Manhattan's substantially higher average price may indicate stronger demand and/or a greater concentration of premium listings. Meanwhile, Queens and the Bronx offer lower average prices, potentially representing more budget-oriented markets.

For Airbnb management, this means pricing strategies should be location-specific rather than uniform across NYC.

## Step 08.6.3 — Compare Boroughs Against the NYC Average is complete

## Results

| Borough       | Avg. Price | NYC Avg. |  Difference | Position |
| ------------- | ---------: | -------: | ----------: | -------- |
| Manhattan     |    $196.88 |  $152.76 | **+$44.13** | Above    |
| Brooklyn      |    $124.44 |  $152.76 | **−$28.32** | Below    |
| Staten Island |    $114.81 |  $152.76 | **−$37.94** | Below    |
| Queens        |     $99.52 |  $152.76 | **−$53.24** | Below    |
| Bronx         |     $87.58 |  $152.76 | **−$65.18** | Below    |

## Interpretation

Manhattan is the only borough with an average listing price above the overall NYC average.

Its average price is $44.13 higher than the NYC benchmark.

The Bronx has the largest negative difference, with an average price $65.18 below the NYC average.

## Business Insight

The results indicate a strong geographical pricing difference within the Airbnb NYC marketplace.

Manhattan represents the premium-priced market.

Brooklyn is below the NYC average despite having a large listing base.

Queens and the Bronx represent considerably lower-priced markets.

Staten Island also falls below the city-wide benchmark, although its smaller listing volume means its average should be interpreted with more caution.

For Airbnb management, this supports using borough-specific pricing and marketing strategies rather than treating NYC as one uniform market.

## Key Learning

This is an important analytical SQL pattern:

Overall benchmark
       ↓
Group-level metric
       ↓
Calculate difference
       ↓
CASE classification
       ↓
Business interpretation


## Step 08.7 — Analytical Ranking

## Business Question

## Which boroughs are furthest above or below the NYC average?

## Step 08.7.1 — Rank Boroughs by Price Difference

## Results

| Rank | Borough       | Avg. Price | NYC Avg. |  Difference |
| ---: | ------------- | ---------: | -------: | ----------: |
|    1 | Manhattan     |    $196.88 |  $152.76 | **+$44.13** |
|    2 | Brooklyn      |    $124.44 |  $152.76 | **−$28.32** |
|    3 | Staten Island |    $114.81 |  $152.76 | **−$37.94** |
|    4 | Queens        |     $99.52 |  $152.76 | **−$53.24** |
|    5 | Bronx         |     $87.58 |  $152.76 | **−$65.18** |


## Interpretation

Manhattan ranks #1 because it is the only borough above the NYC-wide average.

The Bronx ranks #5, with the largest negative difference from the overall benchmark.

The ranking therefore provides a clearer picture than average price alone: it shows each borough's relative market position.

## Business Insight

Manhattan has the strongest premium pricing position, averaging $44.13 above the NYC benchmark.

The Bronx is the furthest below the market benchmark at $65.18 below.

This could help Airbnb managers:

Identify premium markets.

Identify more price-sensitive markets.

Develop borough-specific pricing strategies.

Compare future pricing performance against the NYC benchmark.

## Key Learning

You've now combined several advanced SQL concepts:

CTE
 ↓
GROUP BY
 ↓
Aggregate KPI
 ↓
Overall benchmark
 ↓
Difference calculation
 ↓
RANK() window function
 ↓
Business ranking

## Step 08.7.2 — Rank + Business Position

## Business Question

## How should we classify each borough based on its position relative to the NYC average?

| Rank | Borough       | Avg. Price | Difference vs NYC Avg. | Business Position |
| ---: | ------------- | ---------: | ---------------------: | ----------------- |
|    1 | Manhattan     |    $196.88 |            **+$44.13** | **Premium**       |
|    2 | Brooklyn      |    $124.44 |            **−$28.32** | **Below Market**  |
|    3 | Staten Island |    $114.81 |            **−$37.94** | **Below Market**  |
|    4 | Queens        |     $99.52 |            **−$53.24** | **Below Market**  |
|    5 | Bronx         |     $87.58 |            **−$65.18** | **Below Market**  |

## Interpretation

The classification is working correctly:

Manhattan is the only borough classified as Premium.

Brooklyn, Staten Island, Queens, and Bronx are classified as Below Market.

None fall into the Near Market Average category because none are within ±$20 of the NYC average.

## Business Insight

The analysis shows a strong pricing gap between Manhattan and the other boroughs.

Manhattan's average listing price is $44.13 above the NYC benchmark, making it the clear premium market.

The Bronx is at the opposite end, with an average price $65.18 below the NYC benchmark.

For Airbnb management, this suggests:

Pricing strategy should be differentiated by borough.

A premium strategy may be more appropriate for Manhattan, while the other boroughs may require more competitive pricing or value-focused positioning.

## Key Learning

This step combines several Phase 08 concepts:

Multiple CTEs
      ↓
Aggregate metrics
      ↓
Overall benchmark
      ↓
Difference calculation
      ↓
RANK()
      ↓
CASE classification
      ↓
Business positioning


## Step 08.8 — Advanced HAVING + Business KPI

## Business Question

 ## Which boroughs have both a large listing base and an average price above a business-defined threshold?

## Step 08.8.1 — Apply Multiple Conditions with HAVING

## Results

| Borough   | Listings | Avg Price |
| --------- | -------: | --------: |
| Manhattan |   21,660 |   $196.88 |
| Brooklyn  |   20,095 |   $124.44 |


## Business Insight

Both Manhattan and Brooklyn have a sufficiently large listing base (≥5,000 listings) and an average price of at least $100.

Queens is excluded because although it has 5,666 listings, its average price of $99.52 is just below the $100 threshold.

This is a good example of why multiple HAVING conditions are useful: a borough must satisfy both scale and pricing requirements.


## Step 08.8.2 — Create a Business KPI from the Qualified Boroughs

## Business Question

## What percentage of all NYC listings are located in qualifying boroughs?

## Results 

| KPI                 |      Value |
| ------------------- | ---------: |
| Qualified Listings  | **41,755** |
| Total NYC Listings  | **48,884** |
| Qualified Listing % | **85.42%** |

## Interpretation

The two qualifying boroughs—Manhattan and Brooklyn—contain 41,755 listings, representing 85.42% of all NYC listings in your cleaned dataset.

That is a significant finding: although only 2 of 5 boroughs meet both business conditions, they account for more than 85% of the marketplace listings.

## Business Insight

This suggests that Manhattan and Brooklyn are the dominant markets under our selected criteria:

At least 5,000 listings
Average price of at least $100

Together, they represent 85.42% of listing supply.

For management, these two boroughs could therefore be treated as priority markets when analyzing pricing, supply, availability, and host performance.


## Step 08.8.3 — Add a Business Classification to the KPI

## Business Question

## Is the qualified-market share large enough to be considered a dominant portion of the NYC marketplace

| Metric                  |       Result |
| ----------------------- | -----------: |
| Qualified Listings      |   **41,755** |
| Total NYC Listings      |   **48,884** |
| Qualified Listing Share |   **85.42%** |
| Market Coverage         | **Dominant** |

## Business Insight 

The qualifying markets—Manhattan and Brooklyn—represent 85.42% of all listings in the cleaned dataset.

Although only 2 of the 5 boroughs meet both criteria, they contain the overwhelming majority of the marketplace supply.

This suggests that, under our defined criteria, Manhattan and Brooklyn should be considered priority markets for further pricing, host, availability, and performance analysis.

### SQL Concepts Practiced

- `HAVING`
- Multiple aggregate conditions
- CTEs
- `CROSS JOIN`
- `SUM()`
- `COUNT()`
- `AVG()`
- Percentage calculations
- `CASE`
- Business KPI creation

## Step 08.9 — Complex Business Metrics
## Business Question
## Which boroughs have the strongest combination of listing supply and guest engagement?

## Step 08.9.1 — Calculate Borough Listing & Review Shares

## Results

| Borough       | Listings | Reviews | Listing Share | Review Share |
| ------------- | -------: | ------: | ------------: | -----------: |
| Manhattan     |   21,660 | 454,569 |        44.31% |       39.96% |
| Brooklyn      |   20,095 | 486,252 |        41.11% |       42.74% |
| Queens        |    5,666 | 156,950 |        11.59% |       13.80% |
| Bronx         |    1,090 |  28,316 |         2.23% |        2.49% |
| Staten Island |      373 |  11,541 |         0.76% |        1.01% |

## Compare Review Share − Listing Share:

| Borough       | Listing Share | Review Share |   Difference |
| ------------- | ------------: | -----------: | -----------: |
| Manhattan     |        44.31% |       39.96% | **−4.35 pp** |
| Brooklyn      |        41.11% |       42.74% | **+1.63 pp** |
| Queens        |        11.59% |       13.80% | **+2.21 pp** |
| Bronx         |         2.23% |        2.49% | **+0.26 pp** |
| Staten Island |         0.76% |        1.01% | **+0.25 pp** |

This gives  an interesting business perspective:

Manhattan has a larger share of listings than reviews.
Brooklyn and Queens generate a larger share of reviews than their share of listings.
Queens has the largest positive gap: +2.21 percentage points.

## Step 08.9.2 — Calculate the Market Strength Score

## Results 

| Rank* | Borough       | Listing Share | Review Share | Market Strength |
| ----: | ------------- | ------------: | -----------: | --------------: |
|     1 | Manhattan     |        44.31% |       39.96% |       **42.13** |
|     2 | Brooklyn      |        41.11% |       42.74% |       **41.93** |
|     3 | Queens        |        11.59% |       13.80% |       **12.69** |
|     4 | Bronx         |         2.23% |        2.49% |        **2.36** |
|     5 | Staten Island |         0.76% |        1.01% |        **0.89** |

Manhattan and Brooklyn are extremely close.

Manhattan: 42.13
Brooklyn: 41.93
Difference: only 0.20 points

But there's an interesting difference underneath:

Manhattan has the largest listing share: 44.31%.
Brooklyn has a higher review share than listing share: 42.74% vs 41.11%.

That means Brooklyn's review contribution is slightly stronger relative to its supply.

## Business Insight

The combined KPI confirms that Manhattan and Brooklyn dominate the NYC Airbnb marketplace in terms of both supply and review activity.

However, the score also shows why looking at only one metric can be misleading:

Manhattan leads in listing supply, while Brooklyn leads in review share relative to its listing share.

This could indicate stronger guest engagement relative to available supply in Brooklyn.

## Step 08.9.3 — Rank Boroughs by Market Strength
## Business Question
## Which boroughs have the strongest overall marketplace position when listing supply and review activity are considered together?

## Results
| Rank | Borough       | Market Strength Score |
| ---: | ------------- | --------------------: |
|    1 | Manhattan     |             **42.13** |
|    2 | Brooklyn      |             **41.93** |
|    3 | Queens        |             **12.69** |
|    4 | Bronx         |              **2.36** |
|    5 | Staten Island |              **0.89** |

## Business Insight

Manhattan ranks #1, but Brooklyn is extremely close, only 0.20 points behind.

This is particularly interesting because their strengths are slightly different:

Manhattan: highest listing share (44.31%)
Brooklyn: highest review share (42.74%) relative to its listing base
Queens: a distant third, but its review share (13.80%) is higher than its listing share (11.59%)

So the composite KPI shows that Manhattan dominates in overall marketplace scale, while Brooklyn demonstrates relatively strong guest engagement.


## Step 08.10 — Advanced CTE Analysis
## Business Question
## Which boroughs have strong guest engagement relative to their listing supply, and how does their average price compare with the NYC market?

## Step 08.10.1 — Calculate Borough Performance Metrics

## Results 

| Borough       | Listings | Reviews | Avg. Price | Reviews / Listing |
| ------------- | -------: | ------: | ---------: | ----------------: |
| Staten Island |      373 |  11,541 |    $114.81 |         **30.94** |
| Queens        |    5,666 | 156,950 |     $99.52 |         **27.70** |
| Bronx         |    1,090 |  28,316 |     $87.58 |         **25.98** |
| Brooklyn      |   20,095 | 486,252 |    $124.44 |         **24.20** |
| Manhattan     |   21,660 | 454,569 |    $196.88 |         **20.99** |

The borough with the largest marketplace isn't necessarily the borough with the highest guest engagement per listing.

Staten Island has the highest reviews per listing:

30.94 reviews per listing

while Manhattan has the lowest:

20.99 reviews per listing

This is exactly why we're doing advanced CTE analysis—combining metrics can reveal things that simple totals hide.


## Step 08.10.2 — Create the NYC Benchmark CTE
## Business Question
## How does each borough's review engagement compare with the NYC-wide average reviews per listing?

## Results 

| Borough       | Reviews / Listing | NYC Reviews / Listing |
| ------------- | ----------------: | --------------------: |
| Staten Island |             30.94 |                 23.27 |
| Queens        |             27.70 |                 23.27 |
| Bronx         |             25.98 |                 23.27 |
| Brooklyn      |             24.20 |                 23.27 |
| Manhattan     |             20.99 |                 23.27 |

The NYC benchmark is:

23.27 reviews per listing

Compared with that:

Staten Island: 30.94 → above benchmark
Queens: 27.70 → above benchmark
Bronx: 25.98 → above benchmark
Brooklyn: 24.20 → above benchmark
Manhattan: 20.99 → below benchmark

This is already an interesting business finding: Manhattan has the highest average price but the lowest reviews-per-listing among the five boroughs.

## Step 08.10.3 — Difference from NYC Engagement Benchmark

## Results 

| Borough       | Reviews/Listing | NYC Benchmark | Difference |
| ------------- | --------------: | ------------: | ---------: |
| Staten Island |           30.94 |         23.27 |  **+7.67** |
| Queens        |           27.70 |         23.27 |  **+4.43** |
| Bronx         |           25.98 |         23.27 |  **+2.71** |
| Brooklyn      |           24.20 |         23.27 |  **+0.93** |
| Manhattan     |           20.99 |         23.27 |  **−2.29** |

usiness Insight

This gives us a much better picture of guest engagement relative to marketplace supply:

Staten Island is furthest above the NYC benchmark.
Queens also has substantially higher engagement.
Brooklyn is slightly above the NYC benchmark.
Manhattan is the only borough below the NYC benchmark.

Notice the interesting contrast:

Manhattan has the highest average price ($196.88), but the lowest reviews per listing (20.99).

That doesn't mean Manhattan is performing poorly—it simply means its review activity per listing is lower relative to the NYC-wide benchmark.

## Step 08.10.4 — Classify Borough Engagement
## Business Question
## Which boroughs have high, average, or low guest engagement compared with the NYC benchmark?

| Borough       | Reviews / Listing | Difference | Engagement Category    |
| ------------- | ----------------: | ---------: | ---------------------- |
| Staten Island |             30.94 |      +7.67 | **High Engagement**    |
| Queens        |             27.70 |      +4.43 | **High Engagement**    |
| Bronx         |             25.98 |      +2.71 | **Average Engagement** |
| Brooklyn      |             24.20 |      +0.93 | **Average Engagement** |
| Manhattan     |             20.99 |      −2.29 | **Low Engagement**     |

## siness Insight

The most interesting finding is the contrast between price and engagement:

Manhattan has the highest average price at $196.88, but its reviews per listing are below the NYC benchmark.
Staten Island has the highest engagement at 30.94 reviews per listing, despite having a much lower average price of $114.81.
Queens also shows strong engagement at 27.70 reviews per listing.
Brooklyn is slightly above the NYC benchmark, while also having a very large listing base.

This demonstrates why Airbnb management shouldn't evaluate a market using price alone.

A higher-priced market isn't automatically the most engaged market.


## Step 08.10.5 — Summarize Engagement Categories
## Business Question
## How many boroughs fall into each engagement category?

| Engagement Category    | Boroughs | Listings | Reviews |
| ---------------------- | -------: | -------: | ------: |
| **High Engagement**    |        2 |    6,039 | 168,491 |
| **Average Engagement** |        2 |   21,185 | 514,568 |
| **Low Engagement**     |        1 |   21,660 | 454,569 |

## Business Insight

The key finding is interesting:

High Engagement: only 2 boroughs, but they contain 6,039 listings and 168,491 reviews.
Average Engagement: 2 boroughs contain 21,185 listings, making this the largest group outside the low-engagement market.
Low Engagement: only Manhattan, but it contains 21,660 listings and 454,569 reviews.

So "Low Engagement" does not mean low total reviews.

It means Manhattan has fewer reviews per listing relative to the NYC benchmark.

That's an important analytical distinction.

Manhattan has enormous marketplace scale, but its review engagement per listing is below the NYC average.

## SQL Concepts Practiced

- Multiple CTEs
- `CROSS JOIN`
- Aggregate functions
- Calculated metrics
- Benchmark comparison
- `CASE`
- Multi-level CTE analysis
- `GROUP BY`
- Business classification

## Step 08.11.3 — Two-Dimensional Business Classification
## Business Question
## How should each borough be positioned based on price and guest engagement relative to NYC?

## Results

| Borough           | Price vs NYC | Engagement vs NYC | Business Position            |
| ----------------- | -----------: | ----------------: | ---------------------------- |
| **Manhattan**     |      +$44.13 |             −2.29 | **Premium & Low Engagement** |
| **Brooklyn**      |      −$28.32 |             +0.93 | **Value & High Engagement**  |
| **Staten Island** |      −$37.94 |             +7.67 | **Value & High Engagement**  |
| **Queens**        |      −$53.24 |             +4.43 | **Value & High Engagement**  |
| **Bronx**         |      −$65.18 |             +2.71 | **Value & High Engagement**  |

## Business Insight

This gives us a strong two-dimensional view of the NYC Airbnb market:

Manhattan is the only premium-priced borough, but its engagement is below the NYC benchmark.
Brooklyn combines a lower-than-average price with above-average engagement.
Staten Island has the strongest engagement difference (+7.67) while remaining below the NYC average price.
Queens also offers relatively low prices with strong engagement.
Bronx has the lowest average price ($87.58) while still exceeding the NYC engagement benchmark.

The important business takeaway is:

Lower-priced boroughs are not necessarily lower-performing. Several lower-priced markets show stronger guest engagement than Manhattan.

## Step 08.11.4 — Summarize Business Positions
## Business Question
## How many listings and reviews belong to each business-position category?

## Results

| Business Position            | Boroughs | Listings | Reviews |
| ---------------------------- | -------: | -------: | ------: |
| **Value & High Engagement**  |        4 |   27,224 | 683,059 |
| **Premium & Low Engagement** |        1 |   21,660 | 454,569 |

## Business Insight

This is a particularly strong finding for your project:

4 out of 5 boroughs fall into Value & High Engagement, representing:

27,224 listings
683,059 reviews

Meanwhile, Manhattan alone represents:

21,660 listings
454,569 reviews
Premium pricing
Below-NYC engagement per listing

So the NYC Airbnb market can broadly be viewed as:

A large value-oriented market with strong guest engagement, alongside a large premium market concentrated in Manhattan.


## Step 08.12.2 — Calculate the Combined Performance Score
## Business Question
## Which borough has the strongest overall performance when considering listing scale, guest engagement, and price?

## Results 

| Borough           | Listing Rank | Engagement Rank | Price Rank | Combined Score |
| ----------------- | -----------: | --------------: | ---------: | -------------: |
| **Manhattan**     |            1 |               5 |          1 |          **7** |
| **Brooklyn**      |            2 |               4 |          2 |          **8** |
| **Staten Island** |            5 |               1 |          3 |          **9** |
| **Queens**        |            3 |               2 |          4 |          **9** |
| **Bronx**         |            4 |               3 |          5 |         **12** |

## Business insight

Manhattan has the best combined score (7) because it ranks #1 in both listing volume and price, even though it ranks last in engagement.

Brooklyn is #2 overall (8) and is much more balanced across the three dimensions.

Staten Island and Queens tie at 9, but for very different reasons:

Staten Island → strongest engagement, smallest listing supply
Queens → strong engagement with a much larger listing base

This is exactly why combining several rankings is useful.