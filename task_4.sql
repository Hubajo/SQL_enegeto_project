
CREATE OR REPLACE TABLE task_4 AS
SELECT DISTINCT
		tjhp.payroll_year AS year,
		tjhp2.payroll_year AS next_year,
		ROUND (AVG(tjhp2.avg_price) / AVG(tjhp.avg_price) * 100 - 100, 2) AS price_diff_percentage,
		ROUND (AVG(tjhp2.avg_payroll) / AVG(tjhp.avg_payroll) * 100 - 100, 2) AS payroll_diff_percentage
FROM t_josef_hubacek_project_sql_primary_final AS tjhp
LEFT JOIN t_josef_hubacek_project_sql_primary_final AS tjhp2
		ON tjhp.payroll_year = tjhp2.payroll_year - 1
		AND tjhp.price_code = tjhp2.price_code 
GROUP BY tjhp.payroll_year;










