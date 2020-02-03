#连接查询

涉及到多个表时候， 直接这么来，相当于两个表元素两两组合，很暴力，叫做笛卡尔乘积
```sql
SELECT * FROM beauty , boys
```

等值连接

案例1：男女对应关系
```sql
select NAME, boyName from boys, beauty
where beauty.boyfriend_id = boys.id;
```
案例2：员工和对应部门名
```sql
SELECT first_name, department_name FROM employees, departments WHERE employees.department_id = departments.department_id
```
案例3 员工号，工种号，工种名
```sql
SELECT t1.first_name, t2.job_title FROM employees t1, jobs t2
WHERE t1.job_id = t2.job_id
```
案例4 加筛选 查询有奖金的员工名，部门名

```sql
SELECT t1.first_name, t2.job_title FROM employees t1, jobs t2
WHERE t1.job_id = t2.job_id AND t1.commission_pct IS NOT NULL
```
案例5 查询城市名第二个字为o的部门名和城市名

```sql
SELECT t2.city, t1.department_name FROM departments t1, locations t2
WHERE t1.location_id = t2.location_id AND t2.city LIKE '_o%'
```

案例6 查询城市部门个数

```sql
SELECT COUNT(*) 部门个数, city FROM departments d, locations l
WHERE d.location_id = l.location_id
GROUP BY city
```
案例7 查询工种的工种名和员工个数，并且按照员工个数降序排序

```sql
SELECT COUNT(*) c, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY c DESC
```

案例8 员工名，部门名和所在城市

```sql
SELECT t1.tname, t1.tdep, l.city
FROM
(SELECT e.last_name tname, d.department_name tdep, d.location_id tloc
FROM employees e, departments d
WHERE e.department_id = d.department_id)
t1,
locations l
WHERE t1.tloc = l.location_id
```

非等值连接

案例 查询员工工资和工资级别

```sql
SELECT salary, grade_level
FROM employees e, job_grades j
WHERE salary BETWEEN lowest_sal AND highest_sal
```

自连接

案例 查询员工名和上级名字

```sql
SELECT e1.last_name, e2.last_name
FROM employees e1, employees e2
WHERE e1.manager_id = e2.employee_id
```
