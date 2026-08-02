# Data Profiling Report

## Dataset Information

| Item         | Value           |
| ------------ | --------------- |
| Dataset Name | Airbnb NYC 2019 |
| Source       | Kaggle          |
| Rows         | 48,895          |
| Columns      | 16              |
| File Format  | CSV             |


## Data Types

| Column                           | Current Data Type | Expected Data Type | Status        |
| -----------                      | ----------------- | ------------------ | -----------   |
| id                               | Text              | Integer            |  Incorrect    |
| name                             | Text              | Text               | Correct       |
| last_review                      | Text              | Date               |  Incorrect    |
| latitude                         | Text              | Decimal            |  Incorrect    |
| host_id                          | Text              | Integer            | Incorrect     |
| host_name                        | Text              | Text               | Correct       |
| neighbourhood_group              | Text              | Text               | Correct       |
| neighbourhood                    | Text              | Text               | Correct       |
| latitude                         | Text              | Decimal            | Incorrect     |
| longitude                        | Text              | Decimal            | Incorrect     |
| room_type                        | Text              | Text               | Correct       |
| price                            | Text              | Integer            | Incorrect     |
| minimum_nights                   | Text              | Integer            | Incorrect     |
| number_of_reviews                | Text              | Integer            | Incorrect     |
| last_review                      | Text              | Date               | Incorrect     |
| reviews_per_month                | Text              | Decimal            | Incorrect     |
| calculated_host_listing_count    | Text              | Integer            | Incorrect     |
| availability_365                 | Text              | Integer            | Incorrect     |

## Missing Values & Zero Values

| Column                        | Missing Values |           Zero Values | Observation                                                       |
| ----------------------------- | -------------: | --------------------: | ----------------------------------------------------------------- |
| id                            |              0 |                     0 | No missing or zero values found.                                  |
| name                          |             19 |                   N/A | A small number of listing names are missing.                      |
| host_id                       |              0 |                     0 | No missing or zero values found.                                  |
| host_name                     |             21 |                   N/A | A small number of host names are missing.                         |
| neighbourhood_group           |              0 |                   N/A | No missing values found.                                          |
| neighbourhood                 |              0 |                   N/A | No missing values found.                                          |
| latitude                      |              0 |                     0 | No missing values found.                                          |
| longitude                     |              0 |                     0 | No missing values found.                                          |
| room_type                     |              0 |                   N/A | No missing values found.                                          |
| price                         |              0 |                    11 | No missing values. Zero-price listings require investigation.     |
| minimum_nights                |             10 |                    0  | No missing values. Zero values should be investigated.            |
| number_of_reviews             |              0 |                 10051 | Zero values indicate listings with no reviews.                    |
| last_review                   |           10051|                   N/A | Missing values are expected for listings with no reviews.         |
| reviews_per_month             |           10051|                     0 | Missing values are associated with listings that have no reviews. |
| calculated_host_listing_count |              0 |                     0 | No missing values found.                                          |
| availability_365              |              0 |                 17533 | Zero indicates listings unavailable during the year.              |

## Duplicate Rows

| Check                    | Result                                     |
|------------------------- |--------------------------------------------|
| Duplicate Rows Found     | Yes                                        |
| Number of Duplicate Rows | 1                                          |
| Action                   | Remove duplicate rows during data cleaning |

## Outliers

| Column         | Min   | Max   | Observation                                                                                                                            |
| -------------- | --:   | --:   | -------------------------------------------------------------------------------------------------------------------------------------- |
| Price          |0      |10000  | Wide price range. A minimum value of 0 and maximum value of 10,000 may indicate potential outliers that require further investigation. |
| Minimum Nights |1      |1250   |Most stays are expected to be much shorter. A maximum of 1,250 nights appears unusually high and should be reviewed.                    |
| Reviews        |0      |629    |Review counts vary considerably. A maximum of 629 reviews is high but may represent a very popular listing.                             |
| Availability   |0      |365    |Values fall within the expected range (0–365 days). No obvious outliers based on the valid range.                                       |

## Initial Findings

- The dataset contains **48,895 rows** and **16 columns**.
- Several columns were imported with incorrect data types and require conversion before analysis.
- Missing values were identified in the `name`, `host_name`, `last_review`, and `reviews_per_month` columns.
- One duplicate row was identified in the dataset.
- Zero values were found in several numeric columns. Some are valid business values (such as `number_of_reviews` and `availability_365`), while others (such as `price = 0`) require further investigation.
- Potential outliers were identified in the `price` and `minimum_nights` columns due to unusually high maximum values.

## Next Step

Proceed with data cleaning.
