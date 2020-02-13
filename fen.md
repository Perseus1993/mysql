#分页查询

数据一页显示不全，需要分页

select xx from xx  limit offset , size

offset是要显示条目的起始索引（从0开始）

size 要显示的条目个数

案例1 查询第11条到第25条

```sql
SELECT * FROM employees LIMIT 10,15
```

# 联合查询

联合查询语几个语句查询出的列数句必须一致

查询部门编号>90或者邮箱中包含a的员工名字，查询关键字顺序要一致，union默认去重，如果是union all，则不去重

```sql
SELECT last_name FROM employees WHERE department_id > 90
UNION
SELECT last_name FROM employees WHERE email LIKE '%a%'
```
