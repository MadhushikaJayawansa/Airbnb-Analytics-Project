# Star Schema Design

## Fact Table

### Fact_Listings

The Fact_Listings table stores the measurable information for each Airbnb listing.

### Primary Key

- listing_id

### Measures

- price
- minimum_nights
- availability_365
- number_of_reviews
- reviews_per_month

### Foreign Keys

- host_id
- location_id
- room_type_id
- review_id
