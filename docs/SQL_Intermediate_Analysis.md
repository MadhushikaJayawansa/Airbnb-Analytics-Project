# Intermediate SQL Analysis

## Phase 6 — Intermediate SQL

This phase focuses on filtering, categorizing, and handling data using intermediate SQL techniques.

### Topics Covered

- WHERE
- HAVING
- DISTINCT
- CASE WHEN
- LIKE
- BETWEEN
- IN
- COALESCE

## Step 1 — WHERE

### Business Question

How many Airbnb listings have a price greater than $300?

### SQL Concept

`WHERE` filters individual rows before aggregation.

### Result

| Metric                     | Value |
|----------------------------|------:|
| Listings with price > $300 | 3,357 |

### Interpretation

There are **3,357 Airbnb listings** in the cleaned dataset with a listing price greater than $300.

This demonstrates how `WHERE` can be used to filter individual records before applying an aggregate function such as `COUNT()`.


## Step 2 — WHERE with AND

### Business Question

How many Airbnb listings have a price greater than $500 and availability greater than 200 days?

### SQL Concept

`AND` allows multiple conditions to be applied within a `WHERE` clause. A row must satisfy **all conditions** to be included.

### Result

| Metric                           | Value  |
|----------------------------------|--------:|
| Listings meeting both conditions | **514** |

### Interpretation

There are **514 listings** with both a price above $500 and availability above 200 days.

## Step 3 — WHERE with OR

### Business Question

How many Airbnb listings have a price greater than $1,000 OR availability greater than 300 days?

### SQL Concept

The `OR` operator allows multiple conditions to be used within a `WHERE` clause.

Unlike `AND`, where all conditions must be true, `OR` returns a row when **at least one condition is true**.

### Conditions

- Price > $1,000
- OR Availability > 300 days

### Result

| Metric                                  | Value     |
|-----------------------------------------|----------:|
| Listings meeting at least one condition | **8,262** |

### Interpretation

There are **8,262 Airbnb listings** that satisfy at least one of the two conditions: either the listing price is greater than $1,000 or its availability is greater than 300 days.

This demonstrates how `OR` can be used to broaden a filter by allowing a row to match any one of multiple conditions.

### Key Learning

- `AND` → all conditions must be true.
- `OR` → at least one condition must be true.



## Step 4 — CASE WHEN

### Business Question

How can Airbnb listings be categorized into different price groups based on their listing price?

### SQL Concept

`CASE WHEN` is used to create conditional logic in SQL.

It allows raw data values to be transformed into meaningful business categories based on specified conditions.

### Price Categories

The listings are divided into three price categories:

| Price Range                   | Category |
|-------------------------------|--------- |
| $100 or less                  | Budget   |
| More than $100 and up to $300 | Moderate |
| More than $300                | Expensive|

## Step 5 — CASE WHEN with GROUP BY

### Business Question

How many Airbnb listings fall into each price category?

### SQL Concept

`CASE WHEN` can be combined with `GROUP BY` and `COUNT()` to create business categories and measure the number of records in each category.

### Result

| Price Category | Total Listings |
|----------------|---------------:|
| Budget         | 23,917         |
| Moderate       | 21,610         |
| Expensive      | 3,357          |
| **Total**      | **48,884**     |

### Interpretation

The largest category is **Budget**, with 23,917 listings, followed by **Moderate** listings with 21,610.

There are 3,357 listings classified as **Expensive**, representing a much smaller portion of the overall dataset.

The category counts total 48,884 listings, which matches the cleaned dataset size.

### Key Learning

`CASE WHEN` can be used with aggregation and grouping to transform raw numerical data into meaningful business categories and analyze the distribution of those categories.

## Step 4.3 — CASE WHEN for Availability Categories

### Business Question

How can Airbnb listings be categorized based on their annual availability?

### SQL Concept

`CASE WHEN` can be used to convert numerical availability values into meaningful business categories.

The listings are divided into three availability groups:

| Availability (Days) | Category            |
|--------------------:|---------------------|
| 0–30 days           | Low Availability    |
| 31–180 days         | Medium Availability |
| 181–365 days        | High Availability   |

