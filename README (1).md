# Global Food Commodity Market Intelligence

**An End-to-End Data Analytics Portfolio Project**

A data analytics project exploring four major agricultural commodities using Python, MySQL, Microsoft Excel, Power BI, AI-assisted market research, and baseline forecasting.

The project demonstrates how historical commodity price data can be transformed into analytical findings, dashboards, forecasting scenarios, and procurement-oriented business insights.

> **Project context:** Consolidated Food Co (CFCO) is an illustrative business case used to frame this project. This is an independent portfolio demonstration based on historical international commodity benchmark prices. It is not a production system deployed within an actual company.

---

## 1. Project Overview

| Category | Details |
|---|---|
| Project Domain | Agricultural Commodities and Supply Chain Intelligence |
| Commodities Analysed | Soybeans, Maize, Thai 5% Broken Rice, US Hard Red Winter Wheat |
| Data Source | World Bank Commodity Markets – Pink Sheet |
| Data Period | January 2021 – October 2026 |
| Data Frequency | Monthly |
| Measurement Unit | USD per metric tonne |
| Historical Observations | 70 observations per commodity |
| Total Records | 280 commodity-month observations |
| Forecast Scenario Period | November 2026 – April 2027 |
| Primary Tools | Python, MySQL, Excel, Power BI |

## 2. Business Problem

Food procurement and supply-chain teams need to monitor commodity price movements, understand historical market behaviour, identify volatility, and assess potential price scenarios.

This project addresses the analytical challenge by developing a structured workflow to:

- Monitor historical commodity price movements.
- Compare price trends across four agricultural commodities.
- Measure historical price volatility and returns.
- Identify relationships between commodity price movements.
- Evaluate baseline forecasting methods.
- Communicate analytical findings through dashboards and management-oriented reports.

## 3. Project Objectives

1. Collect, clean, and validate historical commodity price data.
2. Perform Exploratory Data Analysis (EDA) using Python.
3. Calculate monthly returns, annual averages, volatility, and correlations.
4. Design and implement a relational MySQL database.
5. Develop Excel-based analytical reports and dashboards.
6. Create interactive Power BI dashboards.
7. Maintain AI-assisted commodity market research and risk assessments.
8. Develop and evaluate baseline commodity price forecasting models.
9. Translate analytical findings into procurement-oriented business recommendations.

## 4. Analytical Workflow

The project follows an end-to-end data analytics process:

**Data Source → Data Cleaning → EDA → SQL Database → Excel Analysis → Power BI Dashboard → AI-Assisted Research → Forecasting → Business Insights**

### Tools and Technologies

| Technology | Application |
|---|---|
| Python | Data cleaning, transformation, statistical analysis, visualisation, and forecasting |
| Google Colab | Python notebook development and execution |
| MySQL | Relational database design, data storage, validation, and analytical queries |
| Microsoft Excel | Statistical summaries, commodity comparisons, and management dashboard |
| Power BI | Interactive dashboards, data modelling, measures, and visual reporting |
| AI-Assisted Research | Commodity market research, risk identification, and procurement-oriented analysis |

## 5. Key Analytical Findings

### Historical Annualised Volatility

| Commodity | Annualised Volatility |
|---|---:|
| US HRW Wheat | 21.16% |
| Maize | 20.68% |
| Thai 5% Broken Rice | 19.64% |
| Soybeans | 17.65% |

Wheat recorded the highest historical annualised volatility, while Soybeans recorded the lowest in the selected dataset.

Volatility is calculated using the sample standard deviation of monthly returns multiplied by the square root of 12.

### Endpoint Price Comparison

Percentage change between January 2021 and October 2026:

| Commodity | Price Change |
|---|---:|
| Soybeans | -10.59% |
| Maize | -3.41% |
| Thai Rice | -10.28% |
| US HRW Wheat | +9.58% |

These figures represent changes between two monthly benchmark observations, not company-specific procurement cost changes.

### Forecasting Model Comparison

Three baseline approaches were evaluated:

- Naive Forecast
- Seasonal Naive
- Random Forest

The documented three-month rolling-origin evaluation produced the following average MAPE:

| Forecasting Model | Average MAPE |
|---|---:|
| Naive | 5.73% |
| Random Forest | 7.76% |
| Seasonal Naive | 19.80% |

The Naive model achieved the lowest average MAPE among the three tested models in this evaluation. These results are specific to the historical validation design and do not guarantee future forecasting performance.

## 6. Forecasting Methodology

The forecasting analysis includes:

- Initial 12-month holdout model comparison.
- Rolling-origin model evaluation.
- Naive, Seasonal Naive, and Random Forest methods.
- Model performance comparison using MAPE.
- Six-month baseline price scenarios.
- Bootstrap simulation using 10,000 paths and random seed 42.

The six-month point forecast holds the latest observed October 2026 price constant using a Naive baseline.

The bootstrap simulation ranges are illustrative historical-return scenarios. They are not calibrated confidence intervals, guaranteed price boundaries, or predictions of actual market prices.

## 7. Power BI Dashboard

The Power BI project contains four analytical dashboard pages:

1. Data Validation
2. Executive Dashboard
3. Commodity Risk Analysis
4. Executive Forecast Dashboard

The dashboard provides visual analysis of historical prices, commodity comparisons, volatility, and forecasting scenarios.

**[Open the Power BI Dashboard (.pbix)](06_POWER_BI/CFCO_Global_Food_Intelligence_Dashboard.pbix)**

Open the PBIX file using Power BI Desktop.

## 8. Excel Analysis

The Excel analytical workbook contains the following worksheets:

- Raw_Data
- Commodity_Summary
- Monthly_Trends
- Annual_Analysis
- Volatility_Analysis
- Commodity_Comparison
- Management_Dashboard
- Insights

**[Open the Excel Analysis Workbook](05_EXCEL_ANALYSIS/CFCO_Excel_Analysis.xlsx)**

## 9. AI-Assisted Commodity Market Research

The project includes an AI-assisted commodity market research workbook covering:

- Soybeans
- Maize
- Thai 5% Broken Rice
- US HRW Wheat
- Commodity market developments
- Potential supply-chain risks
- Procurement strategy considerations
- Research source documentation

**[Open the Commodity Market Research Log](07_AI_RESEARCH/CFCO_Commodity_Market_Research_Log.xlsx)**

AI-assisted research is used as supporting analysis. Important market claims should be independently checked against original, dated sources.

## 10. Repository Structure

The public GitHub repository is organised as follows:

```text
global-food-commodity-intelligence/
│
├── README.md
├── .gitignore
│
├── 03_PYTHON_COLAB/
├── 04_MYSQL_DATABASE/
├── 05_EXCEL_ANALYSIS/
├── 06_POWER_BI/
├── 07_AI_RESEARCH/
├── 08_FORECASTING/
│
├── 09_REPORTS/
│   ├── 01_Final_Project_Report.docx
│   └── 01_Final_Project_Report.pdf
│
└── 10_DOCUMENTATION/
    ├── 01_PROJECT_OVERVIEW/
    ├── 02_DATA_DICTIONARY/
    ├── 03_METHODOLOGY/
    ├── 04_BUSINESS_INSIGHTS/
    ├── 05_USER_GUIDE/
    └── 06_INTERVIEW_PREPARATION/
```

The original source workbook and separate raw and processed data folders are not currently included as top-level folders in this public repository.

## 11. Important Project Deliverables

| Deliverable | Repository Location |
|---|---|
| Python Analysis | `03_PYTHON_COLAB/` |
| MySQL Database Scripts | `04_MYSQL_DATABASE/` |
| Excel Analysis Workbook | `05_EXCEL_ANALYSIS/` |
| Power BI Dashboard | `06_POWER_BI/` |
| AI Research Workbook | `07_AI_RESEARCH/` |
| Forecasting Notebook and Results | `08_FORECASTING/` |
| Final Project Report | `09_REPORTS/` |
| Supporting Documentation | `10_DOCUMENTATION/` |

### Key Files

- **[Final Project Report – PDF](09_REPORTS/01_Final_Project_Report.pdf)**
- **[Final Project Report – Word](09_REPORTS/01_Final_Project_Report.docx)**
- **[Executive Summary](10_DOCUMENTATION/01_PROJECT_OVERVIEW/EXECUTIVE%20SUMMARY.docx)**
- **[Forecasting Notebook](08_FORECASTING/CFCO_02_Commodity_Price_Forecasting.ipynb)**
- **[Six-Month Commodity Forecasts](08_FORECASTING/CFCO_Six_Month_Commodity_Forecasts.xlsx)**

## 12. Data Source and Attribution

**World Bank – Commodity Markets (Pink Sheet), Monthly Prices**

https://www.worldbank.org/en/research/commodity-markets

The project uses selected international commodity benchmark series.

These benchmark prices are not company purchase prices, supplier quotations, or landed procurement costs. The original source data and its applicable terms should be checked before redistribution.

## 13. Project Limitations

- The dataset covers January 2021 to October 2026. Therefore, 2026 represents a partial year.
- Each commodity contains 70 monthly observations.
- International benchmark prices may differ from the actual product grades purchased by individual businesses.
- Freight, insurance, import duties, taxes, currency conversion, and supplier premiums are not included.
- Historical volatility and correlations describe the selected sample and do not establish future market behaviour.
- Historical model performance does not guarantee future forecast accuracy.
- AI-assisted market research requires independent source verification.
- CFCO is an illustrative business case; the project has not been deployed in a real company's procurement operations.

## 14. Skills Demonstrated

### Technical Skills

- Python
- SQL and MySQL
- Microsoft Excel
- Power BI
- Exploratory Data Analysis
- Data Cleaning and Transformation
- Statistical Analysis
- Forecasting and Model Evaluation
- Data Visualisation

### Business and Analytical Skills

- Business Problem Understanding
- Data-Driven Decision Making
- Commodity Market Analysis
- Risk Assessment
- Business Insights Development
- Procurement-Oriented Recommendations
- Stakeholder Reporting
- Analytical Documentation

## 15. Author

**Aysha Ziya Rasheed**

GitHub: [@ayshazeexo-arch](https://github.com/ayshazeexo-arch)

**Portfolio Focus:** Data Analyst | Business Analyst

*This project demonstrates practical analytical and business problem-solving skills through an independent end-to-end data analytics portfolio project.*
