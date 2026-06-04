-- This is our clean base table
-- We are fixing everything we found in the audit:
-- 1. Removing duplicate records
-- 2. Removing zero prices
-- 3. Keeping only valid rows

CREATE OR REPLACE VIEW clean_events AS
SELECT DISTINCT        -- this removes duplicates
    event_time,
    event_type,
    product_id,
    category_code,
    brand,
    price,
    user_id,
    user_session
FROM read_csv_auto('data/raw/sample.csv')
WHERE price > 0;       -- this removes zero prices

-- Check how many rows we have after cleaning
SELECT COUNT(*) AS clean_row_count
FROM clean_events;