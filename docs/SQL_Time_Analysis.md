# Airbnb Time Analysis 

## Overview

This analysis examines Airbnb listing activity and review-related patterns over time using the `Fact_Listings` and `Dim_Date` tables.

The analysis focuses on:
- Review activity by month
- Listings by quarter
- Average listing price by year
- Average reviews by year

> **Data Note:** The `Dim_Date` table is based on the `last_review` field from the original Airbnb dataset. Therefore, time-based results describe listings according to their last recorded review date. They should not be interpreted as exact booking or review-event dates.



## Time Analysis — Business Question 1

How many reviews were received in each month and month?
(top 5)
## Results

| YEAR | MONTH | TOTAL  REVIEWS |
| ---- | ----- | -------------- |
| 2019 | 6     | 619567         |
| 2019 | 7     | 243262         |
| 2019 | 5     | 86465          |
| 2019 | 4     | 24828          |
| 2019 | 1     | 20750          |
| 2018 | 12    | 13245          |
| 2019 | 3     | 11307          |
| 2018 | 10    | 8964           |
| 2018 | 9     | 8322           |
| 2018 | 11    | 7709           |


2019 dominates the dataset, particularly June 2019.

June 2019 has 619,567 total recorded reviews associated with listings whose last review occurred that month.

July 2019 has 243,262.

May 2019 has 86,465.

Earlier years have dramatically smaller totals.

This reflects the much larger volume of recent review activity/listings in the dataset.

## Executive Summary

The time analysis shows that review activity is heavily concentrated in the most recent years of the dataset, particularly 2019. June 2019 records the highest total number of reviews associated with listings, with 619,567 reviews, followed by July 2019 with 243,262 and May 2019 with 86,465. Review volumes decrease substantially in earlier years, indicating strong growth in listing activity and customer engagement over time.

## Business Recommendation

Airbnb should focus on understanding the factors contributing to the strong level of customer engagement in 2019. Management could investigate listing growth, market expansion, pricing strategies, and host activity during this period to identify successful patterns. Monthly review trends can also help identify periods of higher customer engagement and support future marketing and marketplace planning.



## Time Analysis — Business Question 2

 Listings by Quarter

## Executive Summary

The analysis shows a significant increase in the number of listings associated with last recorded reviews over time. The highest activity occurred in Q2 2019, with 17,747 listings, followed by Q3 2019 with 4,725 listings and Q1 2019 with 2,730 listings.

Earlier years had considerably fewer listings associated with last-review dates, indicating that recent years account for a much larger share of the dataset's observed activity.

Note: These results represent listings grouped by their last_review quarter. They do not represent newly created listings during each quarter. Also, 2019 is a partial year in the dataset.

## Business Recommendation

Airbnb could monitor quarterly listing activity to identify periods of increased marketplace engagement and use these patterns to support capacity planning and marketing decisions. Management should also combine quarterly trends with neighbourhood, room type, pricing, and host data to understand the factors driving changes in marketplace activity.

## Time Analysis — Business Question 3

Average Listing Price by Year

## Executive Summary

The analysis shows that Airbnb listing prices fluctuated considerably between 2011 and 2019. The highest average listing price was recorded in 2013 at approximately $256.21, while the lowest was recorded in 2017 at approximately $135.46.

Following the decline from 2013 to 2017, the average listing price increased slightly in 2018 and 2019, reaching approximately $141.82 in 2019. Overall, the results suggest that Airbnb listing prices changed over time rather than following a consistent upward or downward trend.

Note: 2019 is a partial year in the dataset, so its average price should not be directly compared with complete years without considering the incomplete observation period.

## Business Recommendation

Airbnb could monitor annual pricing trends to identify periods of significant price changes and investigate the factors influencing them, such as neighbourhood, room type, availability, and host characteristics.

Management could use these insights to support pricing strategies and identify markets where pricing conditions may provide opportunities for hosts and the platform.


## Time Analysis — Business Question 4
 Average Reviews by Year

## Executive Summary

The analysis shows that the average number of reviews per listing changed over the period 2011–2019. Average reviews declined from 8.71 in 2011 to a low of 4.14 in 2015, before increasing steadily from 2016 onward.

The strongest increase occurred in 2019, when listings had an average of 40.21 reviews, compared with 11.96 in 2018. This indicates substantially higher review activity associated with listings whose last recorded review occurred in the later years of the dataset.

Note: The analysis is based on the last_review date. Therefore, the results represent the average total reviews of listings grouped by their last-review year, rather than the number of new reviews received during each year. 2019 is also a partial year.

## Business Recommendation

Airbnb could monitor changes in review activity to identify periods of stronger customer engagement and marketplace activity. The company could further investigate whether the increase in average reviews is associated with factors such as listing location, room type, price, availability, or host activity.

These insights could help Airbnb identify high-engagement segments and develop strategies to improve guest and host engagement across the marketplace.