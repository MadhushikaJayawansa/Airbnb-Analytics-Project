Airbnb Analytics Project

📖 Project Overview

This project is an end-to-end Business Intelligence and Data Analytics project built using the Airbnb New York City dataset from Kaggle.

The project follows a real-world analytics workflow, transforming raw Airbnb listing data into a cleaned and dimensional Star Schema, loading the modeled data into Snowflake, analyzing the data using SQL, and building an interactive Power BI dashboard for business reporting and visualization.

The project demonstrates the complete journey from raw data to business insights:

Raw Airbnb Dataset
        ↓
Data Profiling
        ↓
Data Cleaning
        ↓
Data Modeling
        ↓
Star Schema
        ↓
Python ETL
        ↓
Snowflake Data Warehouse
        ↓
SQL Analytics
        ↓
Power BI Semantic Model
        ↓
Interactive Dashboard

---------------------------------------------------------------------------------------------------

🎯 Business Objectives

The goal of this project is to help Airbnb managers understand listing performance and answer key business questions such as:

Which neighbourhoods have the highest number of listings?
Which boroughs have the highest average prices?
Which room types are most common?
Which hosts manage the most listings?
Which hosts receive the most reviews?
Which locations have the highest availability?
How are listings distributed across price ranges?
How do listing volumes change over time?
How do room types vary across different boroughs?

---------------------------------------------------------------------------------------------------

🛠️ Technologies Used

Category	Technology
Programming	Python, Pandas
Database / Data Warehouse	Snowflake
Query Language	SQL
Data Visualization	Power BI Online
Semantic Model	Power BI Semantic Model
Version Control	Git & GitHub
Diagramming	Draw.io
Dataset	Kaggle Airbnb NYC Dataset

---------------------------------------------------------------------------------------------------

📂 Project Structure
Airbnb-Analytics-Project/
│
├── data/
│   ├── raw/
│   │
│   └── processed/
│       ├── Airbnb_Cleaned.csv
│       ├── Dim_Host.csv
│       ├── Dim_Location.csv
│       ├── Dim_Room_Type.csv
│       ├── Dim_Date.csv
│       └── Fact_Listings.csv
│
├── diagrams/
│
├── docs/
│   ├── Business_Requirements.md
│   ├── Data_Profiling_Report.md
│   └── Data_Cleaning_Report.md
│
├── scripts/
│   ├── 01_data_profiling.py
│   ├── 02_data_cleaning.py
│   ├── 03_create_dim_host.py
│   ├── 04_create_dim_location.py
│   ├── 05_create_dim_room_type.py
│   ├── 06_create_dim_date.py
│   └── 07_create_fact_table.py
│
├── sql/
│   ├── 01_create_environment.sql
│   ├── 02_create_tables.sql
│   ├── 03_business_queries.sql
│   ├── 04_pricing_analysis.sql
│   ├── 05_location_analysis.sql
│   ├── 06_room_type_analysis.sql
│   ├── 07_host_analysis.sql
│   ├── 08_time_analysis.sql
│   ├── 09_view.sql
│   └── 10_revenue_analysis.sql
│
├── powerbi/
│   └── Power_BI_Report.md
│
├── screenshots/
│   └── powerbi/
│       ├── executive_overview.png
│       ├── pricing_analysis.png
│       ├── location_room_analysis.png
│       └── host_performance_analysis.png
│
├── README.md
│
└── requirements.txt

---------------------------------------------------------------------------------------------------

🔄 Project Workflow
1. Business Requirements Analysis

Defined the business objectives, stakeholders, business questions, KPIs, and analytical requirements.

2. Data Profiling

Inspected the raw dataset to understand:

Data types
Missing values
Duplicate records
Minimum and maximum values
Potential outliers
Data quality issues
3. Data Cleaning

Performed data cleaning using Python and Pandas, including:

Removing invalid records where price was 0
Handling missing values
Converting date fields to appropriate date types
Cleaning descriptive fields
Validating duplicate records
Preparing data for dimensional modeling
4. Data Modeling

Designed a dimensional data model using a Star Schema.

5. Python ETL Pipeline

Created Python scripts to generate the dimension and fact tables from the cleaned Airbnb dataset.

6. Snowflake Data Warehouse

Loaded the dimensional model into Snowflake and created the required database environment, schemas, tables, and analytical structures.

7. SQL Analytics

Developed SQL queries for:

Business analysis
Pricing analysis
Location analysis
Room-type analysis
Host analysis
Time-based analysis
Revenue analysis
Reusable analytical views
8. Power BI

Connected Power BI Online to Snowflake and created the Airbnb Analytics Semantic Model.

Built an interactive multi-page dashboard for business reporting.

---------------------------------------------------------------------------------------------------

⭐ Star Schema

The dimensional model consists of one fact table and four dimension tables.

Fact Table

Fact_Listings

Contains listing-level measures including:

Price
Minimum nights
Number of reviews
Availability
Foreign keys to dimensions
Dimension Tables

Dim_Host

Contains host-related information and surrogate host keys.

Dim_Location

Contains borough and neighbourhood information.

Dim_Room_Type

Contains Airbnb room-type categories.

Dim_Date

Contains date-related attributes used for time-based analysis.

Model Structure
                    Dim_Host
                       │
                       │
                       ▼
Dim_Location ───► Fact_Listings ◄─── Dim_Room_Type
                       ▲
                       │
                       │
                    Dim_Date
---------------------------------------------------------------------------------------------------

📊 Key KPIs

The Executive Overview dashboard contains the following key performance indicators:

KPI	Result

Total Listings	        48,884

Average Price	        $152.76

Total Reviews	        1,137,628

Average Minimum Nights	7.03

Average Availability	112.78 days

Additional dataset statistics:

Metric	        Result

Lowest Price	$10

Highest Price	$10,000

---------------------------------------------------------------------------------------------------

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

---------------------------------------------------------------------------------------------------

📈 Power BI Dashboard

The Power BI report contains four analytical pages.

1. Executive Overview

Provides a high-level view of Airbnb listing performance.

KPIs
Total Listings
Average Price
Total Reviews
Average Minimum Nights
Average Availability
Visualizations
Listings by Borough
Listings by Room Type
Average Price by Borough
Listings by Year
Filters
Borough
Room Type
Year

---------------------------------------------------------------------------------------------------

2. Pricing Analysis

Analyzes Airbnb pricing patterns across different segments.

Visualizations
Average Price by Room Type
Average Price by Borough
Listings by Price Range
Price vs. Minimum Nights
Filters
Room Type
Borough

---------------------------------------------------------------------------------------------------

3. Location & Room Analysis

Analyzes the geographic and room-type distribution of Airbnb listings.

Visualizations
Top 10 Neighbourhoods by Listings
Listings by Borough
Room Type Distribution by Borough
Average Availability by Borough
Filter
Room Type

---------------------------------------------------------------------------------------------------

4. Host & Performance Analysis

Analyzes host activity and listing performance.

Visualizations
Top 10 Hosts by Number of Listings
Top 10 Hosts by Total Reviews
Average Reviews per Listing by Room Type
Average Availability by Room Type

---------------------------------------------------------------------------------------------------

💡 Key Analytical Findings

The analysis identified several important patterns in the Airbnb NYC dataset.

Listing Distribution

Manhattan and Brooklyn contain the majority of Airbnb listings.

Manhattan: 21,660
Brooklyn: 20,095
Queens: 5,666
Bronx: 1,090
Staten Island: 373
Room Type Distribution

The largest room-type category is:

Entire home/apt — 25,407 listings

followed by:

Private room — 22,319 listings

and:

Shared room — 1,158 listings

Host Activity

The host analysis identifies the most active hosts based on listing volume and total reviews.

Examples from the SQL analysis include:

Michael — 417 listings
David — 403 listings
Availability

The average listing availability across the cleaned dataset is approximately:

112.78 days per year

---------------------------------------------------------------------------------------------------

📸 Dashboard Screenshots

Screenshots of the completed Power BI dashboard are available in:

screenshots/powerbi/

Dashboard pages include:

Executive Overview
Pricing Analysis
Location & Room Analysis
Host & Performance Analysis

--------------------------------------------------------------------------------------------------

📚 Documentation

Detailed project documentation is available in the docs/ directory.

Business Requirements

Defines the business objectives, stakeholders, business questions, and KPIs.

Data Profiling Report

Documents the initial data-quality assessment and profiling process.

Data Cleaning Report

Documents the cleaning, transformation, and validation process.

Power BI Report Documentation

Documents the Snowflake-to-Power BI workflow, semantic model, dashboard pages, and visualizations.

--------------------------------------------------------------------------------------------------

📊 SQL Analysis

The sql/ directory contains analytical SQL scripts covering:

Business queries
Pricing analysis
Location analysis
Room-type analysis
Host analysis
Time analysis
Views
Revenue analysis

---------------------------------------------------------------------------------------------------

🧠 Skills Demonstrated

Business Requirements Analysis

Data Profiling

Data Cleaning

Exploratory Data Analysis

Python

Pandas

ETL Development

Data Modeling

Star Schema Design

Fact & Dimension Tables

Surrogate Keys

SQL

Snowflake

Business Intelligence

Power BI

Semantic Modeling

Dashboard Design

KPI Development

Git

GitHub

--------------------------------------------------------------------------------------------------

🚀 Project Status

Phase	                      Status        
                                                 
Business Requirements  	    ✅ Completed   
                                            
Data Profiling	            ✅ Completed

Data Cleaning	            ✅ Completed

Data Modeling	            ✅ Completed

Star Schema Design    	    ✅ Completed

Python ETL Pipeline	        ✅ Completed

Snowflake Data Warehouse    ✅ Completed

SQL Analytics	            ✅ Completed

Power BI Semantic Model	    ✅ Completed

Power BI Dashboard	        ✅ Completed

GitHub Documentation	    ✅ Completed

--------------------------------------------------------------------------------------------------

📌 Dataset

Source: Kaggle

Dataset: Airbnb New York City Open Data

After data cleaning, the project contains:

48,884 valid Airbnb listings

The cleaned dataset was transformed into a dimensional model consisting of a fact table and four dimension tables.

---------------------------------------------------------------------------------------------------
