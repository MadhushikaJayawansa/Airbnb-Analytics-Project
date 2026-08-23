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

### 2. Pricing Analysis

Analyzes pricing differences across room types and boroughs, price ranges, and the relationship between price and minimum-night requirements.


### 3. Location & Room Analysis

Analyzes the geographical distribution of listings, top neighbourhoods, room-type distribution across boroughs, and listing availability.

### 4. Host & Performance Analysis

Analyzes top hosts by listing count and reviews, average reviews per listing by room type, and average availability by room type.

## Dashboard Screenshots

The completed Power BI dashboard pages are stored in the `screenshots/powerbi/` directory.