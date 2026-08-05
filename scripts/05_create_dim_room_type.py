import pandas as pd

# ==========================
# Load Data
# ==========================

df = pd.read_csv("data/processed/Airbnb_Cleaned.csv")

# ==========================
# Create Room Type Dimension
# ==========================

dim_room_type = (
    df[
        ["room_type"]
    ]
    .drop_duplicates()
    .reset_index(drop=True)
)

# ==========================
# Create Surrogate Key
# ==========================

dim_room_type.insert(
    0,
    "room_type_key",
    range(1, len(dim_room_type) + 1)
)

# ==========================
# Save Dimension
# ==========================

dim_room_type.to_csv(
    "data/processed/Dim_Room_Type.csv",
    index=False
)

print("Room Type Dimension created successfully!")
print(dim_room_type)
print(dim_room_type.shape)