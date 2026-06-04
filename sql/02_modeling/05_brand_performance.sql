-- How is each brand performing?
-- Views, purchases, revenue and conversion rate by brand

CREATE OR REPLACE VIEW brand_performance AS
SELECT
    brand,
    COUNT(*) FILTER 
        (WHERE event_type = 'view')         AS total_views,
    COUNT(*) FILTER 
        (WHERE event_type = 'cart')         AS total_carts,
    COUNT(*) FILTER 
        (WHERE event_type = 'purchase')     AS total_purchases,
    ROUND(SUM(price) FILTER 
        (WHERE event_type = 'purchase'), 2) AS total_revenue,
    ROUND(AVG(price) FILTER 
        (WHERE event_type = 'purchase'), 2) AS avg_order_value,
    ROUND(COUNT(*) FILTER 
        (WHERE event_type = 'purchase') * 100.0 / 
        NULLIF(COUNT(*) FILTER 
        (WHERE event_type = 'view'), 0), 2) AS conversion_rate
FROM clean_events
WHERE brand IS NOT NULL        -- exclude null brands we flagged earlier
GROUP BY brand
ORDER BY total_revenue DESC
LIMIT 15;

SELECT * FROM brand_performance;