CREATE OR REPLACE TABLE TASK_2 AS
SELECT 
		tjhp.payroll_year,
		AVG(tjhp.avg_payroll) AS avg_payroll,
		tjhp.category_name,
		AVG(tjhp.avg_price) AS avg_price,
		ROUND(AVG(tjhp.avg_payroll) / AVG(tjhp.avg_price)) AS purchase_power
FROM t_josef_hubacek_project_sql_primary_final AS tjhp
WHERE 
		tjhp.payroll_year IN (2006, 2018)
		AND tjhp.price_code IN (111301, 114201)
		AND tjhp.branch_code IS NOT NULL 
GROUP BY tjhp.payroll_year, tjhp.category_name; 






