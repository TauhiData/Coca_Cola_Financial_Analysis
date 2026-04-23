#  Coca-Cola Financial Performance Analysis (2009–2018)

##  Project Objective
The goal of this project was to analyze a decade of Coca-Cola's financial data to identify long-term profitability trends. I transformed unstructured data from historical corporate filings into a structured format to calculate and visualize **Gross Profit Margins** using SQL and Excel.

##  Tech Stack & Skills
* **Data Cleaning:** Microsoft Excel (Standardizing messy PDF data, Unpivoting tables).
* **Database Management:** SQL (PostgreSQL/MySQL).
* **Advanced SQL Concepts:** Common Table Expressions (CTEs), Joins, Aggregate Functions, and Case Statements.
* **Business Intelligence:** Financial Ratio Analysis (Profitability & Efficiency).

## The Data Process (ETL)
### 1. Extraction & Cleaning (Excel)
Raw data was sourced from Coca-Cola’s 10-K annual reports. I used Excel to:
* Convert "Wide" format data into a "Long" format for database compatibility.
* Standardize fiscal years and currency values (USD Millions).
* Handle missing values and inconsistent naming conventions across the 10-year span.
### 2. Analysis (SQL)
I imported the cleaned dataset into a relational database to perform deep-dive analysis. 
**Key Query Logic:**
* Used **CTEs** to organize temporary result sets for multi-step calculations.
* Applied the formula: `(Gross Profit / Total Revenue) * 100` to derive annual margins.
 Key Insights
* **Margin Resilience:** Coca-Cola demonstrated strong brand power, maintaining a Gross Profit Margin above **60%** for most of the decade.
* **2012 Anomaly:** Identified a sharp dip in 2012 margins. Further investigation suggested this was driven by global spikes in raw material costs (aluminum and sugar) and major structural refranchising shifts.
* **Post-2015 Recovery:** The data shows a steady upward trend in efficiency following 2015, indicating successful cost-cutting and portfolio optimization.
## Sample SQL Code
```sql
WITH Financials AS (
    SELECT 
        Fiscal_Year,
        Total_Revenue,
        Gross_Profit
    FROM coca_cola_data
)
SELECT 
    Fiscal_Year,
    ROUND((Gross_Profit / Total_Revenue) * 100, 2) AS Margin_Percentage
FROM Financials
ORDER BY Fiscal_Year DESC;
