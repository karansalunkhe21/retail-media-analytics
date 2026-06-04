-- Check for price anomalies
-- Zero or negative prices are likely data errors
SELECT
    MIN(price)                                      AS min_price,
    MAX(price)                                      AS max_price,
    ROUND(AVG(price), 2)                            AS avg_price,
    COUNT(*) FILTER (WHERE price = 0)               AS zero_prices,
    COUNT(*) FILTER (WHERE price < 0)               AS negative_prices,
    COUNT(*) FILTER (WHERE price > 1000)            AS high_prices
FROM read_csv_auto('data/raw/sample.csv');