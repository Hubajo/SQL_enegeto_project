CREATE OR REPLACE TABLE task_3 AS
WITH basic AS(
SELECT
		tjhp.payroll_year,
		tjhp.price_code,
		tjhp.category_name,
		tjhp.avg_price,
		LAG(tjhp.avg_price) OVER
		(PARTITION BY tjhp.category_name ORDER BY tjhp.payroll_year) AS lag_price
FROM t_josef_hubacek_project_sql_primary_final AS tjhp)
SELECT 
		category_name,
		ROUND((SUM(avg_price - lag_price) / avg_price) * 100, 1) AS growth_perc
FROM basic
GROUP BY category_name
ORDER BY growth_perc;

























