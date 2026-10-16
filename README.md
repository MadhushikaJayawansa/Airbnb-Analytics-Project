
# Airbnb Analytics & Business Intelligence Project

 Airbnb marketplace in New York City managers need data-driven insights to understand pricing differences, identify high-demand locations, evaluate listing performance, and explore opportunities to improve their business strategy.

This project addresses these questions by analyzing the Airbnb NYC 2019 dataset and transforming raw listing data into actionable business insights using Python, Snowflake, SQL, and Power BI.

##
## 🎯Business Problem & Goals

The project explores Airbnb listing data to answer key business questions around:

Listing distribution across NYC boroughs and neighbourhoods

Pricing patterns by location and room type

Room type distribution and availability

Host activity and review performance

Trends in listing activity and availability

The objective was to build a structured data solution that could support business-oriented analysis and interactive reporting.


##
## 🛠 Technologies 


| Category               |  Technologies    |
| --------------------   |  ------------    | 
| Programming            |  Python          | 
| Data Manipulation      |  Pandas          |
| Data Warehouse         |  Snowflake       | 
| Query Language         |  SQL             |
| Business Intelligence  |  Power BI Online | 
| Version Control        |  Git & GitHub    |



##
## 📈 Dashboard Preview

#### Executive Overview – Overall marketplace KPIs and listing distribution

<img src="./screenshots/powerbi/executive_overview.png">
 
### Executive Overview

The dashboard shows that the NYC Airbnb marketplace contained **48,884 listings**, with an average nightly price of **$152.76**. Manhattan had the highest listing count (21,660), followed by Brooklyn (20,095). Entire homes and apartments were the most common accommodation type, accounting for 25,407 listings. Across the dataset, listings received approximately 1.14 million reviews, while average availability was around 113 days per year.


#### Explore Other Dashboard Pages

The report includes three additional pages for more detailed analysis:

<a href="screenshots/powerbi/pricing_analysis.PNG">Pricing Analysis</a>– Explores price differences across boroughs and room types, listing price ranges, and the relationship between price and minimum-night requirements.


<a href="screenshots/powerbi/location_room_analysis.PNG">Location & Room Analysis</a> – Examines listing concentration across neighbourhoods and boroughs, room type distribution, and average availability.

<a href="screenshots/powerbi/host_performance_analysis.PNG">Host & Performance Analysis </a> – Explores host listing activity, review performance, and availability patterns across room types.

#### <a href="powerbi/Power_bi_Report.md">Explore results</a>, what they suggest, and a business recommendation  

#### <a href="powerbi/Airbnb Analytics Dashboard.pbix">View Power BI Dashboard</a>

### Business Recommendation:

Manhattan and Brooklyn are key markets to investigate further because they contain most of the listings. Comparing prices, room types, and availability within these boroughs could help identify potential opportunities for pricing and market positioning.

##
## Project Documentation

📖 Detailed Project Walkthrough: <a href="https://medium.com/@jayawansa123s/building-an-end-to-end-airbnb-analytics-solution-with-python-snowflake-sql-and-power-bi-f2ad4544a234
">Read the Medium Article</a>


Repository Structure
```text
Airbnb-Analytics-Project/
│
├── data/                 # Raw and processed datasets
├── docs/                 # Project documentation
├── diagrams/             # Data model diagrams
├── sql/                  # SQL scripts and analysis
├── powerbi/              # Power BI resources
├── screenshots/          # Dashboard screenshots
└── README.md             # Project overview
```


##
## 🗃️ Dataset

Source: Kaggle – Airbnb NYC 2019

Original size: 48,895 rows × 16 columns

Final analytical dataset: 48,884 listings

The dataset contains listing, host, location, room type, pricing, review, availability, and date-related information.

