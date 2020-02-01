# DQL

USE 库名

基础查询

语法 select 列表 from 表名

1查询列表可以说 表中的字段，常量值，表达式，函数

2查询结果是虚拟表格



查询单个字段

SELECT last_name FROM employee

查询多个字段

SELECT last_name, salary FROM employees;

所有字段

SELECT * FROM employees;

着重号`xxx`  区分字段和关键字



查询常量值,运算，函数

SELECT 100;

SELECT "JO";

SELECT 90-3;

SELECT VERSION();



#### 起别名

1便于理解

2有重名可以方便区分

方式1 as

SELECT last_name  as 姓 FROM employees;

方式2 空格

SELECT last_name 姓 FROM employees;

如果别名有特殊符号，建议加上引号


####去重 distinct

SELECT DISTINCT department_id FROM employees;



####+的作用：只是运算符

SELECT 8+2;

SELECT 8 + '2';

结果都是10

SELECT 'KKK' + 30; 结果是30

一方为null 结果为null

####连接符 CONCAT函数（'a', 'c'）as result;

SELECT last_name + first_name as 姓名 FROM employees;

SELECT CONCAT(last_name,',',first_name,',') FROM employees;


####IFNULL（expA,0）

判断第一个是否是null, 如果是就输出0

SELECT CONCAT(last_name,',',first_name,',',IFNULL(commission_pct,0)) FROM employees;



## 条件查询

SELECT FROM  WHERE 筛选条件

条件运算 < > = != <> <= >=

SELECT * FROM employees WHERE salary > 12000;

逻辑运算 && ||  ！

SELECT * FROM employees WHERE salary > 10000 AND salary < 12000;



模糊查询 like ,between and ,  in ,  is null

case1

查询员工名包含字符a的员工名

SELECT * FROM employees WHERE last_name LIKE '%a%';

like一般和通配符搭配使用



case2

下划线代表字母

查询员工名中第三个字符为e的员工

```
SELECT * FROM employees WHERE last_name LIKE '___e%';
```


case3

查询员工名第二个字符为下划线的员工

\转义

SELECT * FROM employees WHERE last_name LIKE '_\_%';

或者其他符号转义

SELECT * FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';



case4

查询100到120之间的

SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 200;



case5

in列表的值需要兼容

查询员工编号是IT_PROT或者AD_VP

SELECT * FROM employees WHERE job_id IN ('IT_PROT', 'AD_VP');



case6

is null

SELECT * FROM employees WHERE commission_pct IS NULL;



安全等于

可以判断null，也可以判断普通值

SELECT * FROM employees WHERE commission_pct <+> NULL;



查询没奖金而且工资小于18000的

SELECT * FROM employees WHERE commission_pct IS NULL AND salary <18000;



查询job_id不为‘IT’ 或者 工资为12000的



### 排序查询

desc  asc 不写默认升序

SELECT * FROM employees ORDER BY salary DESC;



case 2 查询部门编号>=90的，按照入职先后顺序排序

SELECT * FROM employees WHERE department_id >= 90 ORDER BY hiredate ASC;



case3

按照表达式排序

SELECT * FROM employees ORDER BY salary*12*(1+IFNULL(commission_pct, 0)) DESC;



case 4

按照姓名长度

SELECT * FROM employees ORDER BY LENGTH(last_name) DESC;



case5 先按工资，再按员工号

SELECT * FROM employees ORDER BY salary DESC, employee_id DESC;
