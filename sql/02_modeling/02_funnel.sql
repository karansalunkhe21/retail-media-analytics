-- This view shows us the conversion funnel
-- How many users viewed, added to cart, and purchased
-- This is a core KPI for any retail media network

CREATE OR REPLACE VIEW funnel_metrics AS
SELECT
    event_type,
    COUNT(DISTINCT user_id)         AS unique_users,
    COUNT(DISTINCT user_session)    AS unique_sessions,
    COUNT(*)                        AS total_events
FROM clean_events
GROUP BY event_type
ORDER BY total_events DESC;

-- View the results
SELECT * FROM funnel_metrics;