# Power BI Report

## Overview

The Airbnb Analytics project uses Power BI to transform the Snowflake star schema into an interactive business intelligence dashboard.

The Power BI report connects directly to the Snowflake `STAR_SCHEMA` and uses the fact and dimension tables created during the data modeling stage.

## Data Source

* **Data Warehouse:** Snowflake
* **Schema:** `STAR_SCHEMA`
* **BI Tool:** Power BI Online
* **License:** Power BI Free
* **Semantic Model:** Airbnb Analytics Semantic Model

## Tables Used

* `FACT_LISTINGS`
* `DIM_HOST`
* `DIM_LOCATION`
* `DIM_ROOM_TYPE`
* `DIM_DATE`

## Executive Overview

The Executive Overview provides a high-level view of Airbnb listing performance in New York City.

### KPIs

* Total Listings
* Average Price
* Total Reviews
* Average Minimum Nights
* Average Availability

### Visualizations

* Listings by Borough
* Listings by Room Type
* Average Price by Borough
* Listings by Year

### Interactive Filters

* Borough
* Room Type
* Year

## Dashboard Purpose

The dashboard is designed to help business users understand listing volume, pricing, room-type distribution, location patterns, availability, and review activity.

## Power BI Workflow

```text
Snowflake STAR_SCHEMA
        ↓
Power BI Semantic Model
        ↓
Power BI Report
        ↓
Interactive Dashboard
```


### 1. Executive Overview

Provides a high-level summary of Airbnb listings using KPI cards, borough and room-type analysis, pricing analysis, and yearly listing trends.

The dashboard shows that the NYC Airbnb marketplace contained 48,884 listings, with an average nightly price of $152.76. Manhattan had the highest listing count (21,660), followed by Brooklyn (20,095). Entire homes and apartments were the most common accommodation type, accounting for 25,407 listings. Across the dataset, listings received approximately 1.14 million reviews, while average availability was around 113 days per year.

### Pricing Analysis

The analysis explores how Airbnb nightly prices vary by borough and room type, alongside listing price ranges and minimum-night requirements. The overall average nightly price was **$152.76**, although prices varied across different listing segments. These comparisons help highlight differences in the pricing structure of the NYC marketplace.

#### Business Recommendation:
 Compare prices within the same borough and room type to identify potential pricing opportunities. Hosts should consider local competition and accommodation characteristics before adjusting their prices.

### Location & Room Analysis

The analysis shows that **Manhattan had the highest number of listings (21,660), followed by Brooklyn (20,095)**. Entire homes and apartments were the most common accommodation type, with **25,407 listings**, followed by 22,319 private rooms and 1,158 shared rooms. These results show that listing supply was concentrated in two boroughs and that entire homes and apartments represented the largest room-type category.

#### Business Recommendation:

 Investigate neighbourhood-level competition and room-type distribution to identify areas where particular accommodation types are less common. These patterns can help guide further market research, although listing counts alone do not establish customer demand.

### Host & Performance Analysis

The analysis compares hosts by listing volume and review activity, while also examining average reviews per listing and availability across room types. The results help identify hosts with large listing portfolios and explore differences in listing activity across accommodation categories. Review counts provide an indication of historical customer engagement, but do not directly measure revenue or profitability.

#### Business Recommendation:

Examine high-volume hosts to understand how their listings are distributed across locations and room types. Compare review activity and availability alongside pricing to identify patterns worth investigating. Additional booking and revenue data would be needed to evaluate actual host performance and profitability.

## Dashboard Screenshots

The completed Power BI dashboard pages are stored in the `screenshots/powerbi/` directory.