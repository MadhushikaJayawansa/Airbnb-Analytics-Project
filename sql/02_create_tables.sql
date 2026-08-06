-- ==========================================
-- Airbnb Analytics Project
-- Create Warehouse
-- ==========================================

CREATE WAREHOUSE AIRBNB_WH
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

USE WAREHOUSE AIRBNB_WH;

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE AIRBNB_ANALYTICS_DB;

USE DATABASE AIRBNB_ANALYTICS_DB;

-- ==========================================
-- Create Schema
-- ==========================================

CREATE SCHEMA STAR_SCHEMA;

USE SCHEMA STAR_SCHEMA;

-- ==========================================
-- Create Dimension Tables
-- ==========================================

CREATE OR REPLACE TABLE Dim_Host (
    host_key INTEGER,
    host_id INTEGER,
    host_name VARCHAR,
    calculated_host_listings_count INTEGER
);
-- ==========================================
-- Create Dim_Location
-- ==========================================

CREATE OR REPLACE TABLE Dim_Location (
    location_key INTEGER,
    neighbourhood_group VARCHAR,
    neighbourhood VARCHAR,
    latitude FLOAT,
    longitude FLOAT
);

-- ==========================================
-- Create Dim_Room_Type
-- ==========================================

CREATE OR REPLACE TABLE Dim_Room_Type (
    room_type_key INTEGER,
    room_type VARCHAR
);

-- ==========================================
-- Create Dim_Date
-- ==========================================

CREATE OR REPLACE TABLE Dim_Date (
    date_key INTEGER,
    last_review DATE,
    day INTEGER,
    month INTEGER,
    month_name VARCHAR,
    quarter INTEGER,
    year INTEGER
);

-- ==========================================
-- Create Fact_Listings
-- ==========================================

CREATE OR REPLACE TABLE Fact_Listings (
    id INTEGER,
    host_key INTEGER,
    location_key INTEGER,
    room_type_key INTEGER,
    date_key INTEGER,
    price INTEGER,
    minimum_nights INTEGER,
    number_of_reviews INTEGER,
    availability_365 INTEGER
);