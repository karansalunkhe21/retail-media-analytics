-- Count how many nulls exist in each column
-- This tells us where data is missing
SELECT
    COUNT(*) - COUNT(event_time)        AS null_event_time,
    COUNT(*) - COUNT(event_type)        AS null_event_type,
    COUNT(*) - COUNT(product_id)        AS null_product_id,
    COUNT(*) - COUNT(category_code)     AS null_category_code,
    COUNT(*) - COUNT(brand)             AS null_brand,
    COUNT(*) - COUNT(price)             AS null_price,
    COUNT(*) - COUNT(user_id)           AS null_user_id,
    COUNT(*) - COUNT(user_session)      AS null_user_session
FROM read_csv_auto('data/raw/sample.csv');