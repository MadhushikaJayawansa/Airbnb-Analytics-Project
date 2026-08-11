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


## Step 6 — CASE WHEN for Availability Categories

### Business Question

How can Airbnb listings be categorized based on their annual availability?

### Result

| Listing Availability | Total Listings |
|----------------------|---------------:|
| Low Availability     | 22,803         |
| Medium Availability  | 11,720         |
| High Availability    | 14,361         |
| **Total**            | **48,884**     |

### Interpretation

The largest group is **Low Availability**, with 22,803 listings. This means a substantial portion of the listings were available for 30 days or fewer during the year.

There were 11,720 listings with **Medium Availability** and 14,361 listings with **High Availability**.

The three categories total 48,884 listings, matching the cleaned Airbnb dataset.

### Key Learning

- `CASE WHEN` can convert numerical values into meaningful business categories.
- Conditions are evaluated from top to bottom.
- `GROUP BY` can be combined with `CASE WHEN` to analyze each category.
- `COUNT(*)` measures the number of listings in each category.
- `ELSE` handles the remaining values after the earlier conditions are evaluated.


## Step 7 — LIKE: Searching Text Patterns

### Business Question

How many Airbnb listings belong to hosts whose name contains "John"?

### SQL Concept

The `LIKE` operator is used to search text values based on a specified pattern.

The `%` wildcard represents zero or more characters.

Using `%John%` searches for "John" anywhere within the host name.

### Result

| Metric                                        | Value   |
|-----------------------------------------------|--------:|
| Listings belonging to hosts containing "John" | **378** |


### Interpretation

There are **378 Airbnb listings** associated with hosts whose names contain the text **"John"**.

The `LIKE` operator allowed the query to search for the text pattern anywhere within the host name.

### Key Learning

- `LIKE` is used for searching text patterns.
- `%` represents zero or more characters.
- `%John%` searches for "John" anywhere within a text value.
- `John%` searches for values that start with "John".
- `%John` searches for values that end with "John".
- `LIKE` is useful when exact text matching is not required.

## Step 8 — BETWEEN

### Business Question

How many Airbnb listings have a price between $100 and $300?

### SQL Concept

`BETWEEN` is used to filter values within a specified range.

The `BETWEEN` operator is **inclusive**, meaning the boundary values are included.

### Result

| Metric                                | Value      |
|---------------------------------------|-----------:|
| Listings priced between $100 and $300 | **23,661** |

### Interpretation

There are **23,661 Airbnb listings** with a price between **$100 and $300**.

The `BETWEEN` operator includes both boundary values, meaning listings priced at exactly **$100** and exactly **$300** are included in the result.

### Key Learning

- `BETWEEN` is used to filter values within a range.
- `BETWEEN` includes both the lower and upper boundaries.
- `price BETWEEN 100 AND 300` is equivalent to `price >= 100 AND price <= 300`.
- `BETWEEN` can be used with numerical values, dates, and other ordered values.
- It provides a simpler and more readable alternative to using two comparison conditions with `AND`.


## Step 9 — IN

### Business Question

How many Airbnb listings are either Private Room or Shared Room?

### SQL Concept

The `IN` operator is used to filter records that match any value from a specified list.

It provides a cleaner alternative to writing multiple `OR` conditions.

### Result

| Metric                          | Value      |
|---------------------------------|-----------:|
| Private or Shared Room Listings | **23,477** |

### Interpretation

There are **23,477 Airbnb listings** that are either **Private room** or **Shared room**.

The `IN` operator allowed multiple specific room-type values to be filtered within a single `WHERE` condition.

### Key Learning

- `IN` is used to filter records that match any value from a specified list.
- `IN ('Private room', 'Shared room')` is a shorter alternative to using multiple `OR` conditions.
- `IN` is useful when filtering multiple known categories or values.
- `IN` can be used with text, numbers, and other comparable values.

## Step 10 — COALESCE

### Business Question

How can missing host names be replaced with a default value such as "Unknown Host"?

### SQL Concept

`COALESCE()` is used to handle `NULL` values in SQL.

It returns the first non-NULL value from the values provided.

For example:

```sql
COALESCE(host_name, 'Unknown Host')

### Result

The query returns the host ID and host name.

For any host where host_name is NULL, the result displays:

Unknown Host

Since the Airbnb dataset was cleaned before loading into Snowflake and missing host_name values were handled during the data-cleaning stage, there may be no "Unknown Host" values in the current result.

### Interpretation

COALESCE() provides a way to replace missing values with a meaningful default value.

This is useful when preparing data for business reporting because NULL values can make dashboards, reports, and analysis harder to interpret.

In this Airbnb project, "Unknown Host" can be used as a fallback value if missing host names are present.

### Key Learning
COALESCE() is used to handle NULL values.

It returns the first non-NULL value provided.

COALESCE(column, 'Default Value') replaces NULL values with the specified default.

It is useful for data cleaning and reporting.

COALESCE() helps prevent missing values from appearing as blank or NULL in reports and dashboards.