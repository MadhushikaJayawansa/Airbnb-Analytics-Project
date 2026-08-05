import pandas as pd

# ==========================
# Load Data
# ==========================

fact = pd.read_csv(
    "data/processed/Airbnb_Cleaned.csv",
    parse_dates=["last_review"]
)

dim_host = pd.read_csv("data/processed/Dim_Host.csv")
dim_location = pd.read_csv("data/processed/Dim_Location.csv")
dim_room_type = pd.read_csv("data/processed/Dim_Room_Type.csv")
dim_date = pd.read_csv(
    "data/processed/Dim_Date.csv",
    parse_dates=["last_review"]
)

print(fact.shape)
print(dim_host.shape)
print(dim_location.shape)
print(dim_room_type.shape)
print(dim_date.shape)

# ==========================
# Merge with Host Dimension
# ==========================

fact = fact.merge(
    dim_host[["host_id", "host_key"]],
    on="host_id",
    how="left"
)

print(fact.head())
print(fact.shape)

# ==========================
# Merge with Location Dimension
# ==========================

fact = fact.merge(
    dim_location[
        [
            "location_key",
            "neighbourhood_group",
            "neighbourhood"
        ]
    ],
    on=["neighbourhood_group", "neighbourhood"],
    how="left"
)

print(fact.shape)
print(fact.head())

# ==========================
# Merge with Room Type Dimension
# ==========================

fact = fact.merge(
    dim_room_type,
    on="room_type",
    how="left"
)

print(fact.shape)
print(fact.head())

# ==========================
# Merge with Date Dimension
# ==========================

fact = fact.merge(
    dim_date[["date_key", "last_review"]],
    on="last_review",
    how="left"
)

print(fact.shape)
print(fact.head())

# ==========================
# Keep Only Fact Table Columns
# ==========================

fact = fact[
    [
        "id",
        "host_key",
        "location_key",
        "room_type_key",
        "date_key",
        "price",
        "minimum_nights",
        "number_of_reviews",
        "availability_365"
    ]
]

print(fact.head())
print(fact.shape)


# ==========================
# Save Fact Table
# ==========================

fact.to_csv(
    "data/processed/Fact_Listings.csv",
    index=False
)

print("Fact Table created successfully!")