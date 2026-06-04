
SELECT
    COUNT(*)                                    AS total_rows,
    MIN(event_time)                             AS earliest_event,
    MAX(event_time)                             AS latest_event,
    COUNT(DISTINCT user_id)                     AS unique_users,
    COUNT(DISTINCT user_session)                AS unique_sessions,
    COUNT(DISTINCT product_id)                  AS unique_products
FROM read_csv_auto('data/raw/sample.csv');