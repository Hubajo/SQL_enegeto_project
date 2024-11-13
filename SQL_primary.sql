
-- Data pro první i druhou tabulku
SELECT 
		MIN(payroll_year),
		MAX(payroll_year)
FROM czechia_payroll AS cp; 

SELECT 
		MIN(date_from),
		MAX(date_from)
FROM czechia_price AS cp;

SELECT 
		MIN(year),
		MAX(year)
FROM economies AS e;

-- Zjištěno od r. 2006 do 2018

-- První tabulka

CREATE OR REPLACE TABLE t_josef_hubacek_project_SQL_primary_final AS
SELECT
		cpay.industry_branch_code AS branch_code,
		cpay.payroll_year AS payroll_year,
		ROUND(AVG(cpay.value),2) AS avg_payroll,
		cpib.name AS branch_name,
		cprc.category_code AS price_code,
		ROUND(AVG(cprc.value), 2) AS avg_price,
		cpcg.name AS category_name
FROM czechia_payroll AS cpay
LEFT JOIN czechia_payroll_industry_branch AS cpib 
		ON cpay.industry_branch_code = cpib.code
LEFT JOIN czechia_price AS cprc
		ON cpay.payroll_year = YEAR(cprc.date_from)
LEFT JOIN czechia_price_category AS cpcg
		ON cprc.category_code = cpcg.code
WHERE cpay.value_type_code = 5958
		AND cpay.unit_code = 200
		AND cpay.calculation_code = 200
		AND cpay.industry_branch_code IS NOT NULL
		AND cpay.payroll_year BETWEEN 2006 AND 2018
GROUP BY branch_code, payroll_year, branch_name, price_code, category_name;




-- Druhá tabulka
 

CREATE OR REPLACE TABLE t_josef_hubacek_project_SQL_secondary_final AS
	SELECT 
		e.country,
		e.year,
		e.GDP,
		e.population,
		e.gini 
	FROM economies AS e 
	JOIN countries AS c 
	ON e.country = c.country 
	WHERE c.continent = 'Europe'
	AND e.year BETWEEN 2006 AND 2018; 






		
		