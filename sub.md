#子查询

#### where 或者 having后面

标量子查询

案例1 谁的工资比Abel高
```sql
SELECT * FROM employees
WHERE employees.`salary` >(
SELECT salary FROM employees
WHERE last_name = 'Abel'
)
```

案例2 返回job_id和141号员工相同，工资比143员工高的员工信息
```sql
SELECT * FROM employees e
WHERE e.job_id = (
	SELECT job_id FROM employees
	WHERE employees.employee_id = 141
)
AND e.salary > (
	SELECT salary FROM employees
	WHERE employees.employee_id = 143
)
```
案例3 返回公司工资最少的员工的Last_name,salry
```sql
SELECT salary, last_name FROM
employees e
WHERE e.salary = (
	SELECT MIN(salary) FROM employees
)
```

案例4 查询最低工资大于50号部门最低工资的部门id和其最低工资
```sql
SELECT MIN(salary) s, d.`department_id` FROM
employees e LEFT JOIN
departments d
ON e.department_id = d.`department_id`
GROUP BY e.department_id
HAVING s > (
	SELECT MIN(salary)
	FROM employees e
	WHERE e.`department_id` = 50
)
```

列子查询：子查询结果是一列多行

案例1 返回location_id是1400或者1700部门中所有员工

```sql
SELECT last_name
FROM employees e
WHERE e.department_id IN
(
	SELECT distinct d.department_id
	FROM departments d
	WHERE d.location_id IN (1400,1700)
)
```

案例2 返回其他部门中比job_id为‘IT_PROG’部门任一工资低的员工姓名和工资

```sql
SELECT last_name, salary
FROM employees
WHERE salary < ANY(
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG'
)
```
案例3 返回其他部门中比job_id为‘IT_PROG’部门所有员工工资低姓名和工资

```sql
SELECT last_name, salary
FROM employees
WHERE salary < ALL(
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG'
```

行子查询

子查询结果是多行多列

案例1 查询员工编号最小并且工资最高的员工信息
```sql
SELECT * FROM employees
WHERE (employee_id, salary) = (
	SELECT MIN(employee_id), MAX(salary)
	FROM employees
)
```

select 后面出现的子查询

案例1 查询每个部门的员工个数
```sql
SELECT d.*,(
	SELECT COUNT(*)
	FROM employees e
	WHERE e.department_id = d.`department_id`
) c FROM departments d;
```
