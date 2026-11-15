# Global Food Commodity Market Intelligence

An end-to-end data analytics portfolio project exploring four global agricultural commodity benchmarks using Python, MySQL, Microsoft Excel, Power BI, AI-assisted research, and baseline forecasting.

> **Project context:** CFCO (Consolidated Food Co) is an illustrative business case. This is a portfolio demonstration based on historical international benchmark prices; it is not a production system deployed within an actual company.

## Project at a glance

| Item | Description |
|---|---|
| Domain | Agricultural commodities and supply-chain intelligence |
| Commodities | Soybeans, Maize, Thai 5% Broken Rice, US Hard Red Winter (HRW) Wheat |
| Data period | January 2021 – October 2026 |
| Frequency | Monthly |
| Unit | USD per metric tonne |
| Historical observations | 70 per commodity; 280 commodity-month records |
| Forecast horizon | November 2026 – April 2027 |
| Tools | Python, Google Colab, MySQL, Excel, Power BI |

## Business problem

Food procurement and supply-chain teams need a structured way to monitor benchmark prices, compare commodity behaviour, understand historical volatility, and review potential price scenarios. This project turns historical commodity observations into a reproducible analytical workflow and management-oriented outputs.

## Objectives

- Prepare and validate monthly benchmark price data for four commodities.
- Analyse price trends, returns, annual averages, volatility, and historical relationships.
- Store and query the prepared observations in a relational MySQL database.
- Communicate findings through Excel and Power BI dashboards.
- Compare baseline forecasting methods using documented validation procedures.
- Translate quantitative findings into cautious, procurement-oriented observations.

## Workflow

1. **Source and prepare data** – obtain the World Bank Commodity Markets (Pink Sheet) monthly price series; inspect, clean, validate, and reshape the selected observations using Python.
2. **Analyse in Python** – calculate returns, annual averages, normalised comparisons, volatility, and correlations.
3. **Store in MySQL** – maintain commodity reference data, historical facts, staging data, and an analytical view.
4. **Report in Excel** – organise raw data, summary statistics, trends, volatility, comparisons, dashboard, and insights.
5. **Visualise in Power BI** – provide data validation, executive overview, commodity risk analysis, and forecast views.
6. **Research and forecast** – document AI-assisted market research with source checks and evaluate three baseline forecasting approaches.
7. **Communicate business implications** – document findings, limitations, and suggested monitoring actions.

## Selected findings

- Annualised historical volatility (monthly return standard deviation multiplied by √12): **Wheat 21.16%**, **Maize 20.68%**, **Thai 5% Broken Rice 19.64%**, and **Soybeans 17.65%**.
- From January 2021 to October 2026, the endpoint price comparison was **Soybeans −10.59%**, **Maize −3.41%**, **Rice −10.28%**, and **Wheat +9.58%**.
- In the documented three-month rolling-origin evaluation, the Naive method had the lowest average MAPE among the three tested methods: **5.73%**, compared with **7.76%** for Random Forest and **19.80%** for Seasonal Naive.

These are historical, dataset-specific results. Correlation is not causation, and model performance in historical validation does not guarantee future accuracy.

## Forecasting approach and caveats

The project compares Naive, Seasonal Naive, and Random Forest methods. Rolling-origin validation used a 36-month initial training period, three-month evaluation windows, a three-month step, and 11 windows.

The six-month point forecast holds the latest observed October 2026 price constant (Naive baseline). Bootstrap scenario ranges use 10,000 paths resampled from historical monthly returns (random seed 42). These ranges are illustrative simulation ranges, **not calibrated confidence intervals or guaranteed price boundaries**.

## Repository structure

The project is organised into the following working folders:

```text
01_RAW_DATA/
02_PROCESSED_DATA/
03_PYTHON_COLAB/
04_MYSQL_DATABASE/
05_EXCEL_ANALYSIS/
06_POWER_BI/
07_AI_RESEARCH/
08_FORECASTING/
09_REPORTS/
10_DOCUMENTATION/
```

The repository will contain selected reproducible assets and documentation. Large binary files and source workbooks may be linked or documented rather than committed where size, licence, or usability makes that more appropriate.

## Tools and skills demonstrated

- **Python:** data inspection, cleaning, transformation, statistical analysis, visualisation, forecasting evaluation.
- **SQL / MySQL:** relational schema, staging and fact tables, dimension tables, validation queries, views, aggregation.
- **Excel:** analytical worksheets, summaries, comparative analysis, management reporting.
- **Power BI:** data modelling, date table, measures, interactive dashboards and slicers.
- **Business analysis:** problem framing, insight interpretation, risk monitoring considerations, stakeholder documentation.

## Data source and attribution

World Bank, **Commodity Markets – Pink Sheet**, Monthly Prices:  
https://www.worldbank.org/en/research/commodity-markets

The analysis uses selected international benchmark series. These prices are not company purchase prices, supplier quotations, or landed procurement costs. Check the original source workbook and its applicable terms before redistributing source data.

## Important limitations

- The dataset covers January 2021 through October 2026; 2026 is a partial year.
- Each commodity has 70 monthly observations.
- Benchmarks and grades may not match the products purchased by a particular business.
- Freight, insurance, duties, local taxes, currency conversion, supplier premiums, and company-specific costs are not included.
- Historical volatility and price correlations describe the selected sample; price-level correlations can reflect common trends.
- AI-assisted market research is supporting analysis. Verify material factual claims against original, dated sources.
- CFCO is illustrative; this project has not been deployed in a real company's procurement operations.

## How to explore

1. Start with the project overview and final report in `10_DOCUMENTATION/`.
2. Review the data dictionary and methodology to understand fields and calculations.
3. Explore the Python notebook and SQL scripts for the analytical workflow.
4. Open the Excel workbook for worksheet-level analysis.
5. Open the Power BI `.pbix` file in Power BI Desktop to interact with the report.
6. Review the forecasting notebook, model comparison, and rolling-origin results alongside the stated limitations.

## Author

**Aysha Ziya Rasheed**  
GitHub: [@ayshazeexo-arch](https://github.com/ayshazeexo-arch)

*Portfolio project demonstrating competencies relevant to entry-level Data Analyst and Business Analyst roles.*
