# MySQL 5.7 指令備註


> DB目錄: 



OS          | ini dir                                       | db dir
----------- | --------------------------------------------- | ------------------
Ubuntu16.04 | /etc/mysql/mysql.cnf                          | /var/lib/mysql/
CentOS7.3   | /etc/my.cnf                                   | ?
Win10       | C:\ProgramData\MySQL\MySQL Server 5.7\my.ini  | ?


## DML
```sql
drop database tt;
create database tt;
use tt;
create table t1(
    xid int primary key auto_increment, 
    xname varchar(30) not null, xscore int default 0
);

insert into t1(xname, xscore) values ('andy', 88), ('josh', 77), ('howr', 90), ('tony', 99);
insert into t1(xname, xscore) values ('yk', 66), ('john', 75);
select * from t1;

delete from t1 where xname='yk';
select * from t1;

update t1 set xname='michael' where xid=6;
select * from t1;
```