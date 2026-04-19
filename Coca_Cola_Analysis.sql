CREATE TABLE Coca_Cola_Finance(
             Category VARCHAR(225),
            Amount_USD_Millions INT,
            Fiscal_Year INT);

SELECT * FROM coca_cola_finance;
             
WITH Financials AS (
    SELECT 
        fiscal_year,
        MAX(CASE WHEN category = 'NET OPERATING REVENUES' THEN amount_usd_millions END) AS revenue,
        MAX(CASE WHEN category = 'GROSS PROFIT' THEN amount_usd_millions END) AS gross_profit
    FROM Coca_Cola_Finance
    GROUP BY fiscal_year
)
SELECT 
    fiscal_year,
    revenue,
    gross_profit,
    ROUND((gross_profit * 100.0 / revenue), 2) AS margin_percentage
FROM Financials
ORDER BY fiscal_year DESC;

