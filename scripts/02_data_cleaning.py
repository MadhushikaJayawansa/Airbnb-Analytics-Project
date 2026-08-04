import pandas as pd

# Load the raw Airbnb dataset
df = pd.read_csv("data/raw/AB_NYC_2019.csv")

print("Original Dataset Shape:")
print(df.shape)

# Check missing values before cleaning
print("\nMissing Values Before Cleaning:")
print(df.isnull().sum())

# Remove listings with a price of 0
df = df[df["price"] > 0]

print("\nDataset Shape After Removing Price = 0:")
print(df.shape)

# Replace missing host names
df["host_name"] = df["host_name"].fillna("Unknown")

# Replace missing listing names
df["name"] = df["name"].fillna("Unknown")

# Replace missing reviews per month with 0
df["reviews_per_month"] = df["reviews_per_month"].fillna(0)

print("\nMissing Values After Cleaning:")
print(df.isnull().sum())

# Convert last_review to datetime
df["last_review"] = pd.to_datetime(df["last_review"])

print("\nData Types After Cleaning:")
print(df.dtypes)

df["last_review"] = pd.to_datetime(df["last_review"])
print(df.dtypes)

# Save the cleaned dataset
df.to_csv("data/processed/Airbnb_Cleaned.csv", index=False)

print("\nCleaned dataset saved successfully!")