-- Break down activity by hour of the day
-- This tells us when users are most active and when they buy

SELECT
    HOUR(event_time)                                    AS hour_of_day,
    COUNT(*) FILTER 
        (WHERE event_type = 'view')                     AS views,
    COUNT(*) FILTER 
        (WHERE event_type = 'cart')                     AS carts,
    COUNT(*) FILTER 
        (WHERE event_type = 'purchase')                 AS purchases,
    ROUND(SUM(price) FILTER 
        (WHERE event_type = 'purchase'), 2)             AS revenue,
    ROUND(COUNT(*) FILTER 
        (WHERE event_type = 'purchase') * 100.0 /
        NULLIF(COUNT(*) FILTER 
        (WHERE event_type = 'view'), 0), 2)             AS conversion_rate
FROM clean_events
GROUP BY hour_of_day
ORDER BY hour_of_day;