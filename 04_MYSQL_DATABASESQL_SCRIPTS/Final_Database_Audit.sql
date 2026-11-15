
USE cfco_food_intelligence;

SHOW FULL TABLES;

SELECT
    commodity_id,
    commodity_code,
    commodity_name,
    unit,
    currency
FROM dim_commodity
ORDER BY commodity_id;


SELECT
    d.commodity_name,
    COUNT(*) AS total_records,
    MIN(f.price_date) AS first_date,
    MAX(f.price_date) AS last_date,
    ROUND(AVG(f.price_usd_mt), 2) AS average_price
FROM fact_commodity_prices f
JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id
GROUP BY d.commodity_id, d.commodity_name
ORDER BY d.commodity_name;


SELECT
    (SELECT COUNT(*) FROM dim_commodity) AS commodity_count,
    (SELECT COUNT(*) FROM fact_commodity_prices) AS fact_records,
    (SELECT COUNT(*) FROM stg_commodity_prices) AS staging_records,
    (SELECT COUNT(*) FROM vw_commodity_monthly_analysis) AS view_records;

