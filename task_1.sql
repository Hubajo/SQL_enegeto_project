




CREATE OR REPLACE TABLE TASK_1 AS
SELECT DISTINCT 
		tjhp.branch_code,
		tjhp.branch_name,
		tjhp.payroll_year,
		tjhp.avg_payroll,
		tjhp2.payroll_year AS payroll_next_year,
		tjhp2.avg_payroll AS avg_payroll_next_year,
		round(tjhp2.avg_payroll / tjhp.avg_payroll * 100 - 100, 2) AS diff_by_percentage 
FROM t_josef_hubacek_project_sql_primary_final AS tjhp
LEFT JOIN t_josef_hubacek_project_sql_primary_final AS tjhp2
		ON tjhp.payroll_year = tjhp2.payroll_year - 1
		AND tjhp.branch_code = tjhp2.branch_code 
;
		