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