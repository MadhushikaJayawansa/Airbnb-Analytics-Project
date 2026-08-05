Airbnb Analytics Project

📖 Project Overview

This project is an end-to-end Business Intelligence and Data Analytics project built using the Airbnb New York City dataset from Kaggle.

The project follows a real-world analytics workflow, transforming raw Airbnb listing data into a dimensional data warehouse (Star Schema) for business reporting and visualization. The cleaned and modeled data will be analyzed using SQL and visualized with Power BI to generate actionable business insights.

-------------------------------------------------------------------------------------------------------

🎯 Business Objectives

The goal of this project is to help Airbnb managers answer business questions such as:

Which neighbourhoods generate the highest average prices?

Which room types are the most popular?

Which hosts manage the most listings?

Which locations have the highest availability?

How do customer reviews change over time?

What factors influence listing performance?

-------------------------------------------------------------------------------------------------------

🛠️ Technologies Used

| Category           | Technology                |
| ------------------ | ------------------------- |
| Programming        | Python (Pandas)           |
| Database           | Snowflake *(coming next)* |
| Query Language     | SQL                       |
| Data Visualization | Power BI *(coming next)*  |
| Version Control    | Git & GitHub              |
| Diagramming        | Draw.io                   |
| Dataset            | Kaggle Airbnb NYC Dataset |

-------------------------------------------------------------------------------------------------------


📂 Project Structure

Airbnb-Analytics-Project/
|
│
├── data/
|   |
│   ├── raw/
|   |
│   └── processed/
|       |
│       ├── Airbnb_Cleaned.csv
|       |
│       ├── Dim_Host.csv
|       |
│       ├── Dim_Location.csv
|       |
│       ├── Dim_Room_Type.csv
|       |
│       ├── Dim_Date.csv
|       |
│       └── Fact_Listings.csv
│
├── diagrams/
│
├── docs/
│   ├── Data_Profiling_Report.md
|   |
│   └── Data_Cleaning_Report.md
│
├── scripts/
|   |
│   ├── 01_data_profiling.py
|   |
│   ├── 02_data_cleaning.py
|   |
│   ├── 03_create_dim_host.py
|   |
│   ├── 04_create_dim_location.py
|   |
│   ├── 05_create_dim_room_type.py
|   |
│   ├── 06_create_dim_date.py
|   |
│   └── 07_create_fact_table.py
│
├── sql/
|
├── powerbi/
|
├── screenshots/
|
├── README.md
|
└── requirements.txt

-------------------------------------------------------------------------------------------------------

🔄 Project Workflow

Business Requirements Analysis

Data Profiling

Data Cleaning

Exploratory Data Validation

Data Modeling

Star Schema Design

Python ETL Pipeline

Snowflake Data Warehouse (Next Phase)

SQL Analytics (Next Phase)

Power BI Dashboard (Next Phase)

-------------------------------------------------------------------------------------------------------

⭐ Star Schema

The dimensional model consists of one fact table and four dimension tables.

Fact Table

Fact_Listings

Dimension Tables

Dim_Host

Dim_Location

Dim_Room_Type

Dim_Date

-------------------------------------------------------------------------------------------------------

📊 Skills Demonstrated

Data Profiling

Data Cleaning

ETL Development with Python

Data Modeling

Star Schema Design

Fact & Dimension Tables

Surrogate Keys

SQL

Snowflake (in progress)

Power BI (in progress)

Git & GitHub

-------------------------------------------------------------------------------------------------------

🚀 Current Progress

| Phase                    | Status           |
| ------------------------ | -----------------|
| Business Requirements    | ✅ Completed    |
| Data Profiling           | ✅ Completed    |
| Data Cleaning            | ✅ Completed    |
| Data Modeling            | ✅ Completed    |
| Star Schema Design       | ✅ Completed    |
| Python ETL Pipeline      | ✅ Completed    |
| Snowflake Data Warehouse | 🔄 In Progress  |
| SQL Analytics            | ⏳ Planned       |
| Power BI Dashboard       | ⏳ Planned       |

-------------------------------------------------------------------------------------------------------

📌 Dataset

Source: Kaggle

Dataset: Airbnb New York City Open Data

Approximately 48,000+ cleaned listings used after data cleaning.

-------------------------------------------------------------------------------------------------------

📈 Future Enhancements

Load the star schema into Snowflake.

Write analytical SQL queries and create reusable views.

Build an interactive Power BI dashboard.

Add dashboard screenshots and documentation.

Automate the ETL pipeline.

-------------------------------------------------------------------------------------------------------