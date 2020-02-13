#DDL 数据定义

####库的管理

创建库
```sql
create database xxx if not exists xxx;
```

库的修改


更改字符集
```sql
alter database xxx character set xxx;
```

删库
```sql
drop database xxx if exists xxx;
```
####表的管理

表的创建

```sql
create table 表名 (
列名 列的类型 【（长度）约束】
列名 列的类型 【（长度）约束】
列名 列的类型 【（长度）约束】
)
```

表的修改

修改列名

```sql
alter table booklist change publishDate  pubDate datetime
```

修改列的类型

```sql
alter table booklist modify pubDate timestamp
```

添加新列

```sql
alter table author add colum annual double;
```

删除列
```sql
alter table author drop column annual;
```

修改
```sql
alter table author rename to book_author;
```

表的删除
```sql
drop table book_author;
```
表的复制

结构复制
```sql
create table copy like book_author;
```

结构数据复制
```sql
create table copy2 select * from author;
```
