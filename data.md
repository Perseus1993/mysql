# 常见约束

限制数据，保证准确性

约束

1 非空约束

not null

2 默认值

default

3 主键约束

primary key

4 唯一

unique

5 检查约束[mysql不支持]

check

6 foreign key

外键




#### 案例

```sql
CREATE TABLE stuinfo(
	id INT PRIMARY KEY,
	stuName VARCHAR(20) NOT NULL,
	gender CHAR(1) CHECK(gender = '男' OR gender = '女'),
	seat INT UNIQUE,
	age INT DEFAULT 18
	majorId INT FOREIGN KEY REFERENCES major(id)
)
```

表级约束

```sql
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo(
	id INT,
	stuName VARCHAR(20),
	gender CHAR(1),
	seat INT,
	age INT,
	majorId INT,
	CONSTRAINT pk PRIMARY KEY(id),
	CONSTRAINT up UNIQUE(seat),
	CONSTRAINT fk FOREIGN KEY(majorId) REFERENCES major(id)
)
```


####主键和唯一的对比

1.都保证唯一性

2.主键不能有null 唯一可以有一个null

3.主键一个表最多一个， 唯一可以有很多

####外键
1 .在从表设置外键关系

2.主从表外键需要兼容

3.主表关联列一般是主键或者唯一
