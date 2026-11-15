USE cfco_food_intelligence;

-- Commodity price summary

SELECT
    d.commodity_name,
    COUNT(*) AS total_months,
    ROUND(AVG(f.price_usd_mt), 2) AS average_price,
    ROUND(MIN(f.price_usd_mt), 2) AS minimum_price,
    ROUND(MAX(f.price_usd_mt), 2) AS maximum_price

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id

GROUP BY d.commodity_id, d.commodity_name

ORDER BY average_price DESC;

-- Find the latest commodity prices
SELECT
    d.commodity_name,
    f.price_date,
    f.price_usd_mt AS latest_price_usd_mt

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id

WHERE f.price_date = (
    SELECT MAX(price_date)
    FROM fact_commodity_prices
)

ORDER BY f.price_usd_mt DESC;

-- Annual average price analysis

SELECT
    YEAR(f.price_date) AS analysis_year,
    d.commodity_name,
    ROUND(AVG(f.price_usd_mt), 2) AS annual_average_price

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id

GROUP BY
    YEAR(f.price_date),
    d.commodity_id,
    d.commodity_name

ORDER BY
    analysis_year,
    d.commodity_name;

-- Month-on-month price movement

SELECT
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
                ),
                0
            ) - 1
        ) * 100,
        2
    ) AS monthly_change_pct

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id

ORDER BY d.commodity_name, f.price_date;

-- Identify the highest-priced month for each commodity

WITH ranked_prices AS (
    SELECT
        d.commodity_name,
        f.price_date,
        f.price_usd_mt,

        ROW_NUMBER() OVER (
            PARTITION BY f.commodity_id
            ORDER BY f.price_usd_mt DESC, f.price_date
        ) AS price_rank

    FROM fact_commodity_prices f

    INNER JOIN dim_commodity d
        ON f.commodity_id = d.commodity_id
)

SELECT
    commodity_name,
    price_date,
    price_usd_mt AS highest_price
FROM ranked_prices
WHERE price_rank = 1
ORDER BY highest_price DESC;

