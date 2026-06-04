-- Find users who made more than one purchase
-- These are our most valuable customers

SELECT
    user_id,
    COUNT(*)                    AS total_purchases,
    ROUND(SUM(price), 2)        AS total_spent,
    ROUND(AVG(price), 2)        AS avg_order_value,
    MIN(event_time)             AS first_purchase,
    MAX(event_time)             AS last_purchase
FROM clean_events
WHERE event_type = 'purchase'
GROUP BY user_id
HAVING COUNT(*) > 1            -- only users with more than 1 purchase
ORDER BY total_purchases DESC;