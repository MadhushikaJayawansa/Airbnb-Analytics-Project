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