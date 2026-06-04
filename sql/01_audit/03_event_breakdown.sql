-- How many of each event type do we have?
-- This shows us the user journey funnel
SELECT
    event_type,
    COUNT(*)                                        AS total_events,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM read_csv_auto('data/raw/sample.csv')
GROUP BY event_type
ORDER BY total_events DESC;