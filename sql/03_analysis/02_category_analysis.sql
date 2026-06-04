-- Revenue and conversion rate by product category
-- This tells us which categories are most valuable

SELECT
    category_code,
    COUNT(*) FILTER
        (WHERE event_type = 'view')                     AS total_views,
    COUNT(*) FILTER
        (WHERE event_type = 'cart')                     AS total_carts,
    COUNT(*) FILTER
        (WHERE event_type = 'purchase')                 AS total_purchases,
    ROUND(SUM(price) FILTER
        (WHERE event_type = 'purchase'), 2)             AS total_revenue,
    ROUND(AVG(price) FILTER
        (WHERE event_type = 'purchase'), 2)             AS avg_order_value,
    ROUND(COUNT(*) FILTER
        (WHERE event_type = 'purchase') * 100.0 /
        NULLIF(COUNT(*) FILTER
        (WHERE event_type = 'view'), 0), 2)             AS conversion_rate
FROM clean_events
WHERE category_code IS NOT NULL     -- exclude the nulls we flagged earlier
GROUP BY category_code
ORDER BY total_revenue DESC
LIMIT 15;