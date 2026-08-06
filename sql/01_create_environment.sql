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