#练习题

注：14题之前都是sql92标准

1 将员工姓名按照首字母排序并且写出姓名长度
```sql
SELECT LENGTH(last_name), SUBSTR(last_name, 1, 1) AS init FROM employees ORDER BY init
```
2 查询公司员工工资最大值，最小值，平均，总和
```sql
SELECT MAX(salary) 最大工资, MIN(salary) 最小工资, AVG(salary) 平均, SUM(salary) 总和 FROM employees
```
3 入职时间最大和最小相差的天数
```sql
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) 差值 FROM employees
```
4 部门编号是90的员工个数

```sql
SELECT COUNT(*) FROM employees WHERE department_id = 90;
```

5 查询各个工种的最大工资，并按照工种升序

6 查询各个管理者手下员工的最低工资，不能低于6000，没有管理者的不算在内

7 查询所有部门的编号，员工数量和平均工资，按照平均工资降序

8 显示所有员工姓名，部门号和部门名称
```sql
SELECT e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
```

9 查询90号部门的员工job_id和部门的location_id

```sql
SELECT e.job_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_id = 90
```
10 查询所有有奖金员工的名字，部门名，地点，城市

```sql
SELECT e.last_name, l.city, d.department_name
FROM employees e, locations l, departments d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.commission_pct IS NOT NULL
```
11 选择city在Toronto的员工的名字和部门名
```sql
SELECT e.last_name, t1.tdn
FROM employees e,
(SELECT d.department_name tdn, d.department_id tdi
FROM departments d, locations l
WHERE d.location_id = l.location_id
AND l.city = 'Toronto') t1
WHERE e.department_id = t1.tdi
```

12 查询每个工种，每个部门的部门名，工种名以及最低工资
```sql
SELECT t1.job_title,t1.department_name,MIN(te)
FROM
(SELECT j.job_title, d.department_name,e.salary te
FROM jobs j, departments d, employees e
WHERE j.job_id = e.job_id
AND e.department_id = d.department_id) t1
GROUP BY t1.job_title,t1.department_name
```

13 查询每个国家下部门数大于2的国家编号
```sql
SELECT COUNT(*) c, t1.tcid
FROM
(SELECT d.department_id, l.country_id tcid
FROM departments d, locations l
WHERE d.location_id = l.location_id) t1
GROUP BY t1.tcid
HAVING c > 2
```
14 查询编号>3的女神的男朋友信息，如果没有用null填充
```sql
SELECT * FROM
beauty LEFT JOIN boys
ON beauty.`boyfriend_id` = boys.`id`
WHERE beauty.`id` > 3
```

15 查询哪个城市没有部门
```sql
SELECT city FROM
locations l LEFT JOIN departments d
ON l.`location_id` = d.`location_id`
WHERE d.`department_id` IS NULL
```

16 查询部门名为SAL或者IT的员工信息
```sql
SELECT d.`department_name`, e.last_name
FROM departments d JOIN employees e
ON d.`department_id` = e.department_id
WHERE d.`department_name`IN( 'SAL','IT')
```
