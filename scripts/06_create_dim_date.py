import pandas as pd

# ==========================
# Load Data
# ==========================

df = pd.read_csv(
    "data/processed/Airbnb_Cleaned.csv",
    parse_dates=["last_review"]
)

# ==========================
# Create Date Dimension
# ==========================

dim_date = (
    df[["last_review"]]
    .dropna()                              #Removes blank dates (the listings with no reviews).
    .drop_duplicates()                     #Keeps one row for each unique review date.
    .sort_values("last_review")            #Orders the dates from oldest to newest.
    .reset_index(drop=True)                #Creates clean row numbering.
)

print(dim_date.head())
print(dim_date.shape)

# ==========================
# Create Date Attributes
# ==========================

dim_date["year"] = dim_date["last_review"].dt.year
dim_date["month"] = dim_date["last_review"].dt.month
dim_date["month_name"] = dim_date["last_review"].dt.month_name()
dim_date["quarter"] = "Q" + dim_date["last_review"].dt.quarter.astype(str)
dim_date["day"] = dim_date["last_review"].dt.day

# ==========================
# Create Surrogate Key
# ==========================

dim_date.insert(
    0,
    "date_key",
    range(1, len(dim_date) + 1)
)

# ==========================
# Save Date Dimension
# ==========================

dim_date.to_csv(
    "data/processed/Dim_Date.csv",
    index=False
)

print("Date Dimension created successfully!")
print(dim_date.head())
print(dim_date.shape)