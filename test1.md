#练习题

1 将员工姓名按照首字母排序并且写出姓名长度

SELECT LENGTH(last_name), SUBSTR(last_name, 1, 1) AS init FROM employees ORDER BY init

2 查询公司员工工资最大值，最小值，平均，总和

SELECT MAX(salary) 最大工资, MIN(salary) 最小工资, AVG(salary) 平均, SUM(salary) 总和 FROM employees

3 入职时间最大和最小相差的天数

SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) 差值 FROM employees

4 部门编号是90的员工个数

`SELECT COUNT(*) FROM employees WHERE department_id = 90;`

5 查询各个工种的最大工资，并按照工种升序

6 查询各个管理者手下员工的最低工资，不能低于6000，没有管理者的不算在内

7 查询所有部门的编号，员工数量和平均工资，按照平均工资降序

8选择具有
