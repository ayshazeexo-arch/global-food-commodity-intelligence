-- Created a reusable SQL analytical view

USE cfco_food_intelligence;

CREATE OR REPLACE VIEW vw_commodity_monthly_analysis AS

SELECT
    d.commodity_id,
    d.commodity_name,
    f.price_date,
    f.price_usd_mt,

    LAG(f.price_usd_mt) OVER (
        PARTITION BY f.commodity_id
        ORDER BY f.price_date
    ) AS previous_month_price,

    ROUND(
        (
            f.price_usd_mt /
            NULLIF(
                LAG(f.price_usd_mt) OVER (
                    PARTITION BY f.commodity_id
                    ORDER BY f.price_date
                ), 0
            ) - 1
        ) * 100,
        2
    ) AS monthly_change_pct

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id;


SELECT *
FROM vw_commodity_monthly_analysis
ORDER BY commodity_name, price_date
LIMIT 20;


SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT commodity_id) AS total_commodities,
    MIN(price_date) AS first_date,
    MAX(price_date) AS last_date
FROM vw_commodity_monthly_analysis;


SHOW TABLES;
