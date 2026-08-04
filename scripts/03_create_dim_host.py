import pandas as pd

# Load the cleaned dataset
df = pd.read_csv("data/processed/Airbnb_Cleaned.csv")

print(df.head())

# Create Host Dimension
dim_host = df[
    ["host_id", "host_name", "calculated_host_listings_count"]
].drop_duplicates(subset=["host_id"])

print(dim_host.head())

print(dim_host.shape)

# Create surrogate key
dim_host = dim_host.reset_index(drop=True)

dim_host.insert(0, "host_key", range(1, len(dim_host) + 1))

# Save Host Dimension
dim_host.to_csv("data/processed/Dim_Host.csv", index=False)

print("\nHost Dimension created successfully!")
print(dim_host.head())