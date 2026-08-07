# Star Schema Documentation

## Overview

The Airbnb Analytics project uses a **Star Schema** to organize the data for analytical reporting in Snowflake.

The schema consists of one central **Fact Table** surrounded by four **Dimension Tables**. This design improves query performance, simplifies reporting, and supports Business Intelligence tools such as Power BI.

---

# Star Schema

## Fact Table

### Fact_Listings

The **Fact_Listings** table stores the measurable business data for each Airbnb listing.

### Primary Key

- id (Listing ID)

### Measures

- price
- minimum_nights
- number_of_reviews
- availability_365

### Foreign Keys

- host_key
- location_key
- room_type_key
- date_key

---

# Dimension Tables

## Dim_Host

Stores information about Airbnb hosts.

### Primary Key

- host_key

### Attributes

- host_id
- host_name
- calculated_host_listings_count

---

## Dim_Location

Stores geographical information for each listing.

### Primary Key

- location_key

### Attributes

- neighbourhood_group
- neighbourhood
- latitude
- longitude

---

## Dim_Room_Type

Stores accommodation categories.

### Primary Key

- room_type_key

### Attributes

- room_type

---

## Dim_Date

Stores calendar information derived from the **last_review** date.

### Primary Key

- date_key

### Attributes

- last_review
- year
- quarter
- month
- month_name
- day
- day_name

---

# Star Schema Relationships

| Fact Table       | Dimension Table | Foreign Key   |
|------------------|-----------------|---------------|
| Fact_Listings    | Dim_Host        | host_key      |
| Fact_Listings    | Dim_Location    | location_key  |
| Fact_Listings    | Dim_Room_Type   | room_type_key |
| Fact_Listings    | Dim_Date        | date_key      |

---

# Why a Star Schema?

The Star Schema was chosen because it:

- Separates measurable data from descriptive attributes.
- Improves SQL query performance.
- Simplifies reporting and dashboard creation.
- Reduces data redundancy.
- Supports scalable Business Intelligence solutions.

---

# Benefits for Business Intelligence

Using a Star Schema allows analysts to:

- Analyze listings by neighbourhood.
- Compare room types.
- Evaluate host performance.
- Analyze trends over time.
- Build interactive dashboards in Power BI.
- Write efficient SQL queries in Snowflake.