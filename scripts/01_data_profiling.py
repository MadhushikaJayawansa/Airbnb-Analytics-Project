import pandas as pd

# Load the Airbnb dataset
df = pd.read_csv("data/raw/AB_NYC_2019.csv")

# Display the first 5 rows
print(df.head())

# Display dataset information
print("\nDataset Information:")
df.info()

# Count missing values
print("\nMissing Values:")
print(df.isnull().sum())

# Count duplicate rows
duplicate_rows = df.duplicated().sum()

print("\nDuplicate Rows:")
print(duplicate_rows)

# Dataset Shape
print("\nDataset Shape:")
print(df.shape)

# Number of rows and columns
print(f"\nTotal Rows: {df.shape[0]}")
print(f"Total Columns: {df.shape[1]}")

print("\nSummary Statistics:")
print(df.describe())