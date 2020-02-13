# DML

## 插入语句

语法1 insert into  表名 values

语法2 insert into 表名 set 列名 = 值

语法1用的多，因为可以插入多行

案例 插入女神表

写法一
```sql
INSERT INTO beauty(id, NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'李总','女','1990-4-23','1888888',NULL,2)
```

写法二
```sql
INSERT INTO beauty SET
id = 55, NAME = '王连财', phone = 12345
```

## 修改语句

#### 修改单表

语法 update 表名 set 列 = new value where 筛选条件

案例1 把姓王的电话修改成123

```sql
UPDATE beauty SET phone = 123
WHERE NAME LIKE '%王'
```


#### 修改多表

语法  update 表1 别名 join 表2 别名 on 条件 set ... where

案例1 修改张无忌女朋友电话为888
```sql
UPDATE beauty be JOIN boys bo ON be.boyfriend_id = bo.id
SET be.phone = 888 WHERE bo.boyName = '张无忌'
```

案例2 修改没有男朋友的女神的男朋友编号都为2
```sql
UPDATE beauty be LEFT JOIN boys bo ON be.boyfriend_id = bo.id
SET be.boyfriend_id = 2 WHERE bo.id IS NULL
```

#### 删除语句

语法1 delete xxx from 表名 where 条件

语法2 truncate table 表名

如果有id自增，delete后从断点开始， truncate是从头开始

truncate不能回滚

案例1 删除手机号结尾是9的女神

```sql
delete from beauty where phone like '%9'
```

案例2 删除张无忌女朋友的信息

```sql
DELETE b FROM beauty b INNER JOIN boys bo ON b.boyfriend_id = bo.id
WHERE bo.boyName = '张无忌'
```

案例3 删除张无忌和他女朋友

```sql
DELETE b, bo FROM beauty b INNER JOIN boys bo ON b.boyfriend_id = bo.id
WHERE bo.boyName = '张无忌'
```
