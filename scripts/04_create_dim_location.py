import pandas as pd

# ==========================
# Load Data
# ==========================

df = pd.read_csv("data/processed/Airbnb_Cleaned.csv")

# ==========================
# Create Location Dimension
# ==========================

dim_location = (
    df[
        [
            "neighbourhood_group",
            "neighbourhood",
            "latitude",
            "longitude"
        ]
    ]
    .drop_duplicates(subset=["neighbourhood_group", "neighbourhood"])
    .reset_index(drop=True)
)

# ==========================
# Create Surrogate Key
# ==========================

dim_location.insert(
    0,
    "location_key",
    range(1, len(dim_location) + 1)
)

# ==========================
# Save Dimension
# ==========================

dim_location.to_csv(
    "data/processed/Dim_Location.csv",
    index=False
)

print("Location Dimension created successfully!")
print(dim_location.head())
print(dim_location.shape)