#分组查询

相关需求：查询每个部门的平均工资

select 分组函数， 列（要求出现在group by 后面）from 表名 where 筛选 group by 列

SELECT AVG(salary), department_id  FROM employees GROUP BY department_id

案例1 查询邮箱中包含a字符的，每个部门平均工资

SELECT AVG(salary), department_id FROM employees WHERE email LIKE '%a%' GROUP BY department_id

案例2 查询有奖金的每个部门领导手下员工的最高工资

SELECT MAX(salary), manager_id  FROM employees WHERE commission_pct IS NOT NULL GROUP BY manager_id

案例3 哪个部门的员工个数大于2

`SELECT COUNT(*) num, department_id id FROM employees GROUP BY department_id HAVING COUNT(*) > 2`

案例4  每个工种有奖金的员工最高工资>12000的工种编号和最高工资

SELECT job_id, MAX(salary) FROM employees WHERE commission_pct IS NOT NULL GROUP BY job_id HAVING MAX(salary) > 12000

案例5 查询领导编号>102的每个领导手下的最低工资>5000的领导编号


按表达式分组

按照员工姓名长度分组

`SELECT COUNT(*) FROM employees GROUP BY LENGTH(last_name) `


按照多个字段分组

案例：查询每个部门每个工种的平均工资，按照大小显示

SELECT AVG(salary), job_id, department_id FROM employees GROUP BY  department_id, job_id ORDER BY AVG(salary) DESC
