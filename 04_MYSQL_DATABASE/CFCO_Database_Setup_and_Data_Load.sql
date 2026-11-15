/*
PROJECT: CFCO GLOBAL FOOD INTELLIGENCE PLATFORM

DAY 4: MYSQL DATABASE DEVELOPMENT

PURPOSE:
Database creation, table design, commodity master
data insertion, staging data validation and
fact table loading.

DATA PERIOD:
January 2021 - October 2026

COMMODITIES:
Soybeans, Maize, Thai Rice 5%, US HRW Wheat

EXPECTED FACT RECORDS: 280
*/

SELECT VERSION() AS MySQL_Version;

SHOW DATABASES;


CREATE DATABASE cfco_food_intelligence;

USE cfco_food_intelligence;

USE cfco_food_intelligence;

CREATE TABLE dim_commodity (
    commodity_id INT AUTO_INCREMENT PRIMARY KEY,
    commodity_code VARCHAR(40) NOT NULL UNIQUE,
    commodity_name VARCHAR(80) NOT NULL,
    benchmark_description VARCHAR(150),
    unit VARCHAR(20) NOT NULL,
    currency CHAR(3) NOT NULL
);


CREATE TABLE fact_commodity_prices (
    price_date DATE NOT NULL,
    commodity_id INT NOT NULL,
    price_usd_mt DECIMAL(12,3) NOT NULL,

    PRIMARY KEY (price_date, commodity_id),

    CONSTRAINT fk_commodity
    FOREIGN KEY (commodity_id)
    REFERENCES dim_commodity(commodity_id),

    CONSTRAINT chk_positive_price
    CHECK (price_usd_mt > 0)
);

SHOW TABLES;
DESCRIBE dim_commodity;

DESCRIBE fact_commodity_prices;



USE cfco_food_intelligence;

INSERT INTO dim_commodity
(commodity_code, commodity_name, benchmark_description, unit, currency)
VALUES
('SOYBEANS', 'Soybeans', 'World Bank benchmark soybean price', 'MT', 'USD'),

('MAIZE', 'Maize', 'World Bank benchmark maize price', 'MT', 'USD'),

('RICE_THAI_5', 'Rice Thai 5%', 'Thai 5% broken rice benchmark', 'MT', 'USD'),

('WHEAT_US_HRW', 'Wheat US HRW', 'US Hard Red Winter wheat benchmark', 'MT', 'USD');



SELECT *
FROM dim_commodity;


USE cfco_food_intelligence;

CREATE TABLE stg_commodity_prices (
    `Date` DATE NOT NULL,
    commodity_code VARCHAR(40) NOT NULL,
    price_usd_mt DECIMAL(12,3) NOT NULL
);


SELECT COUNT(*) AS total_records
FROM stg_commodity_prices;

SELECT *
FROM stg_commodity_prices
ORDER BY `Date`, commodity_code
LIMIT 10;


SELECT
    commodity_code,
    COUNT(*) AS record_count,
    MIN(`Date`) AS first_date,
    MAX(`Date`) AS last_date
FROM stg_commodity_prices
GROUP BY commodity_code
ORDER BY commodity_code;


SELECT COUNT(*) AS total_records
FROM stg_commodity_prices;


SELECT
    commodity_code,
    COUNT(*) AS total_records,
    MIN(`Date`) AS first_date,
    MAX(`Date`) AS last_date,
    ROUND(AVG(price_usd_mt), 2) AS average_price
FROM stg_commodity_prices
GROUP BY commodity_code
ORDER BY commodity_code;


SELECT *
FROM stg_commodity_prices
WHERE price_usd_mt IS NULL
   OR price_usd_mt <= 0
   OR `Date` IS NULL
   OR commodity_code IS NULL;


SELECT
    `Date`,
    commodity_code,
    COUNT(*) AS duplicate_count
FROM stg_commodity_prices
GROUP BY `Date`, commodity_code
HAVING COUNT(*) > 1;


SELECT DISTINCT s.commodity_code
FROM stg_commodity_prices s
LEFT JOIN dim_commodity d
    ON s.commodity_code = d.commodity_code
WHERE d.commodity_id IS NULL;


SELECT COUNT(*) AS existing_records
FROM fact_commodity_prices;


INSERT INTO fact_commodity_prices
    (price_date, commodity_id, price_usd_mt)

SELECT
    s.`Date`,
    d.commodity_id,
    s.price_usd_mt

FROM stg_commodity_prices s

INNER JOIN dim_commodity d
    ON s.commodity_code = d.commodity_code;


SELECT COUNT(*) AS total_fact_records
FROM fact_commodity_prices;

SELECT *
FROM fact_commodity_prices
ORDER BY price_date, commodity_id
LIMIT 12;


SELECT
    d.commodity_name,
    COUNT(*) AS total_records,
    ROUND(AVG(f.price_usd_mt), 2) AS average_price,
    MIN(f.price_usd_mt) AS minimum_price,
    MAX(f.price_usd_mt) AS maximum_price

FROM fact_commodity_prices f

INNER JOIN dim_commodity d
    ON f.commodity_id = d.commodity_id

GROUP BY d.commodity_id, d.commodity_name

ORDER BY d.commodity_name;


