---
title: MySQL - 基础知识点
date: 2019-06-21 17:36:05
---

1.下载rpm:
https://dev.mysql.com/downloads/mysql/
https://downloads.mysql.com/archives/community/

wget https://downloads.mysql.com/archives/get/file/MySQL-server-5.5.48-1.linux2.6.x86_64.rpm
wget https://downloads.mysql.com/archives/get/file/MySQL-client-5.5.48-1.linux2.6.x86_64.rpm

2.查看是否安装过Mysql：
[root@# localhost opt]# rpm -qa|grep -i mysql

3.删除命令：
rpm -e RPM软件包（该名字为查询出来的名字）

4.安装MySQL rpm:
帮助日志：https://www.cnblogs.com/gpdm/p/7170521.html
[root@# localhost opt]# rpm -ivh MySQL-server-5.5.48-1.linux2.6.x86_64.rpm --force --nodeps
[root@# localhost opt]# rpm -ivh MySQL-client-5.5.48-1.linux2.6.x86_64.rpm --force --nodeps

5.检查：
[root@# localhost opt]# cat /etc/passwd|grep mysql
mysql:x:997:993:MySQL server:/var/lib/mysql:/bin/bash
[root@# localhost opt]# cat /etc/group|grep mysql
mysql:x:993:
[root@# localhost opt]# mysqladmin --version
mysqladmin  Ver 8.42 Distrib 5.5.48, for Linux on x86_64

6.启动MySQL：
service mysql start 

ps -ef|grep mysql

top

7.连接MySQL
mysql

8.设置密码
/usr/bin/mysqladmin -u root password 123456

9.登录mysql -uroot -p

10.设置自启动
chkconfig mysql on

chkconfig --list|grep mysql

ntsysv

10.mysql的安装位置：
ps -ef|grep mysql

11.查看字符集：
show variables like 'character%'

show variables like '%char%'
默认使用latin1,所以会出现乱码

vi my.cnf

修改为以下：
[client]
default-character-set=ftf8

[mysqld]
character_set_server=utf8
character_set_client=utf8
collation-server=utf8_general_ci

[mysql]
default-character-set=utf8

12.查看引擎
show engines;

show variables like '%storage_engine%';

13.创建索引
create index idx_user_name on user(name)

MySQL官方对索引的定义为：索引（index）是帮助MySQL高效获取数据的数据结构。
可以得到索引的本质：索引就是数据结构。
索引的目标在于提高查询效率，可以类比字典。

14.查看索引：
show index from tb1_emp

15.MySQL索引结构：BTree索引、Hash索引、full-text全文索引、R-Tree索引

16.性能分析：
MySQL Query Optimizer
MySQL常见瓶颈
Explain

17.使用Explain
explain select * from tb1_emp;

id：【表的读取顺序】
1)id相同，执行顺序由上从下
2)如果是子查询，id值越大，查询优先越大，越先执行
3)如果出现id相同，可以认为是一组，从上往下顺序执行，在所有组中，id值越大，优先级越高，越先执行。
衍生 = DERIVED；虚表e.g. from （....） as table1 这里的table1就是衍生表

select_tye:【数据读取操作的操作类型】
常见的值有SIMPLE/PRIMARY/SUBQUERY/DERIVED/UNION/UNION RESULT
查询的类型，主要是用于区别
SIMPLE:简单的select查询，查询不包含子查询或者union
PRIMARY:查询中若包含任何复杂的子部分，最外层查询则被标记
SUBQUERY：在SELECT或where列表中包含了子查询。
DERIVED：在FROM列表中包含的子查询被标记为DERIVED（衍生），MYSQL会递归执行这些子查询，把结果放到临时表里。
UNION：若第二个select出现union之后，则被标记为union；若union包含在from子句的子查询中，外层select将select将标记为derived;
UNION RESULT:从union表获取结果的select

table:
显示哪张表的。

type:
访问类型
显示查询使用了何种类型：
从最好到最差依次是：
system>const>eq_ref>ref>fulltext>ref_or_null>index_merget>unique_subquery>index_subquery>range>index>ALL
常用：
system>const>eq_ref>ref>range>index>ALL
system:表只有一行记录（等于系统表），这是const类型的特列，平时不会出现，这个耶可以忽略不计。
const:表示通常索引一次就能找到了，const用于比较primary key或者unique索引。
eq_ref：唯一性索引扫描，对于每个索引键，表中仅有一条记录与之匹配。常见于主键或者唯一索引扫描。
ref:非唯一性索引扫描，返回匹配某个单独值得所有行。
range:值检索给定范围的行，使用一个索引来选择行。
index:Full Index Scan,index与ALL区别为index类型只遍历索引树。通常比ALL快，索引文件表全表小。
ALL:Full Table scan,将遍历全表以找到匹配的行。

possible_keys:
显示可能应用在这张表中的索引，一个或者多个。查询涉及到的字段上若存在的索引，则该索引将被列出来，但不一定被查询实际使用。

key:
实际使用的索引。如果为null，则没有使用索引。查询若使用了覆盖索引，则该索引仅出现在课余列表中。

key_len:
表示索引中使用的字节数，可通过该列计算查询中使用的索引的长度。在不损失精确性的情况下，长度越短越好。

ref:
显示索引的哪一列被使用了，如果可能的话，是一个常数。哪些列或者常量被用于查询索引列上的值。

rows:
根据表统计信息及索引选用的情况，大致估算初找到所需的记录所需要读取的行数。

Extra:
包含不适合在其他列中显示但十分重要的额外信息。
【尽快优化】using filesort:说明MySQL会对数据使用一个外部的索引排序，而不是按照表内的索引顺序进行读取。MySQL中无法利用索引完成的排序操作成为文件排序。
【尽快优化】using temporary:使用了临时表来保持中间结果，MySQL在对查询结果排序是使用临时表。常见于排序order by和分组查询。
using index:表示相应的select操作中使用了覆盖索引（covering index),避免访问了表的数据行，效率不错。
如果同时出现using where，表示索引被用来执行索引值得查找。
如果没有同时出现using where，表示索引引用来读取数据而非执行查找动作。


18.覆盖索引（covering index），一说为索引覆盖
就是select的数据列只用从索引中就能够取得，不必读取数据化，MySQL可以利用索引返回select列表中的字段，而不必根据索引再次读取数据文件，也就是说查询列要被所建的索引覆盖。