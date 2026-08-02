# Data Cleaning Report
--------------------------------------------------------------------------------------------------------------------------
## Project

**Airbnb NYC 2019 Analytics Project**

--------------------------------------------------------------------------------------------------------------------------

# Objective

The objective of data cleaning was to improve the quality, consistency, and reliability of the Airbnb NYC 2019 dataset before data modeling, SQL analysis, and Power BI dashboard development.

The original dataset was profiled to identify data quality issues including incorrect data types, duplicate records, missing values, zero values, and potential outliers. Cleaning decisions were made based on business requirements while preserving meaningful data.

----------------------------------------------------------------------------------------------------------------------------

# Dataset Summary

| Item                    | Value  |
|-------------------------|------: |
| Original Rows           | 48,895 |
| Original Columns        | 16     |
| Duplicate Rows Removed  | 0      |
| Price = 0 Rows Removed  | 10     |
| Final Rows              | 48,885 |
| Final Columns           | 16     |

----------------------------------------------------------------------------------------------------------------------------

# 1. Data Type Conversion

The following columns were converted to their appropriate data types.

| Column                            | Original Type | Converted Type |
|-----------------------------------|---------------|----------------|
| id                                | Text          | Whole Number   |
| host_id                           | Text          | Whole Number   |
| latitude                          | Text          | Decimal        |
| longitude                         | Text          | Decimal        |
| price                             | Text          | Whole Number   |
| minimum_nights                    | Text          | Whole Number   |
| number_of_reviews                 | Text          | Whole Number   |
| last_review                       | Text          | Date           |
| reviews_per_month                 | Text          | Decimal        |
| calculated_host_listing_count     | Text          | Whole Number   |
| availability_365                  | Text          | Whole Number   |

**Reason**

Correct data types are required for accurate calculations, filtering, sorting, SQL queries, and Power BI visualizations.

---------------------------------------------------------------------------------------------------------------------------

2. Duplicate Rows
 
| Item                    | Count  |
|-------------------------|------: |
| Duplicate Rows Found    | 1      |
| Duplicate Rows Removed  | 1      |

**Reason**

Duplicate records can produce incorrect calculations and misleading analytical results.

--------------------------------------------------------------------------------------------------------------------------

# 3. Missing Value Handling

| Column                | Missing Values | Action Taken        | Reason                                                    |
|-----------------------|---------------:|---------------------|-----------------------------------------------------------|
| name                  | 16             | Kept NULL values    | Listing names are not essential for business analysis, and the correct values cannot be inferred.                                                                                     |
| host_name             | 0              | No action required  | No missing values remained after removing invalid records.                                                                                                                            |
| last_review           | 10,051         | Kept NULL values    | Listings with no reviews naturally do not have a review date.                                                                                                                      |
| reviews_per_month     | 0              | No action required | No missing values remained after removing invalid records. |

----------------------------------------------------------------------------------------------------------------------------

# 4. Zero Value Handling

| Column           | Zero Values | Action Taken       | Reason                                                             |
|------------------|-----------: |--------------------|------------------------------------------------------------------  |
| price            | 10          | Removed 10 rows    | Listings with a price of 0 are not suitable for pricing analysis.  |
| minimum_nights   | 0           | No action required | No invalid zero values were found. |
| number_of_reviews| 10051       | Kept               | A value of 0 indicates the listing has not yet received any reviews.                                                                                                                   |
| availability_365 | 17530       | Kept               | A value of 0 indicates the listing was unavailable during the year.                                                                                                                            |
----------------------------------------------------------------------------------------------------------------------------

# 5. Outlier Review

| Column              | Observation             | Action                                                                   |
|---------------------|-------------------------|--------------------------------------------------------------------------|
| price               | Maximum value = 10,000  | Kept for further business analysis because it may represent luxury listings.                                                                                                                  |
| minimum_nights      | Maximum value = 1,250   | Kept for further analysis because extreme values may represent long-term rental policies.                                                                                                           |
| number_of_reviews   | Maximum value = 629     | Kept because highly reviewed listings are valid business records.        |
| availability_365    | Range between 0 and 365 | No action required because values fall within the expected range.        |

---------------------------------------------------------------------------------------------------------------------------

# Final Validation

The cleaned dataset was reviewed to ensure data quality before data modeling.

- Data types were converted successfully.
- No duplicate row was Found.
- Ten records with a price of 0 were removed.
- Missing values in the `name` column were retained because they do not affect business analysis.
- Missing values in the `last_review` column were retained because they correctly represent listings with no reviews.
- The cleaned dataset contains **48,885 rows** and is ready for data modeling, SQL analysis, and Power BI reporting.

----------------------------------------------------------------------------------------------------------------------------

# Conclusion

The Airbnb NYC 2019 dataset has been successfully cleaned and validated. The resulting dataset provides a reliable foundation for designing a star schema, loading data into Snowflake, performing SQL analysis, and building an interactive Power BI dashboard.
