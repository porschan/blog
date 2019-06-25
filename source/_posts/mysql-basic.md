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

19.如何确认两表之间如何在对于表添加索引
SELECT * FROM TABLE1 LEFT JOIN TABLE2 ON TABLE1.ID = TABLE2.ID;
由于TABLE1需要搜索出来，所以优化在与右表，因此在TABLE2中添加索引。

20.join语句的优化：
尽可能减少join语句中的nestedloop的循环总次数;永远用小结果集驱动大的结果集。
优先优化nestedloop的内层循环。
保证join语句中被驱动表上join条件字段已经被索引。
当无法保证被驱动表的join条件字段被索引且内存资源充足的前提下，不要太吝啬joinBuffer的设置。

21.索引失效：
1.全值匹配我最爱。【龙头大哥不能死，中间兄弟不能断】
2.最佳左前缀法则--如果索引了多列，要遵守最左前缀法则。指的是查询从索引的最前列开始并且不跳过索引中的列。
3.不在索引列上做任何操作（计算、函数、（自动或手动）类型转换），会导致索引失效而转向全表扫描。
4.存储引擎不能使用索引中范围条件右边的列。
5.尽量使用覆盖索引（只访问索引的查询（索引列和查询列一致）），减少select *。
6.MySQL在使用不等于（！=或者<>）的时候无法使用索引会导致全表扫描。
7.is null，is not null也也无法使用索引。
8.立刻以通配符开头（'%abc....'）mysql索引失效会变成全表扫描的操作--问题：解决like'%字符串%'时索引不被使用的方法？？建立覆盖索引
9.字符串不加单引号索引。
10.少用or，用它来连接时会索引失效。

22.小表驱动大表：
select * from A where id in（select id from b）
当B表的数据集必须小于A表的数据集时，用in由于exists.

select * from A  where exists (select 1 from b where b.id = a.id)
当A表的数据集系小于B表的数据集时，用exists优于in。

exists：将主查询的数据，放到子查询中做条件验证，根据验证结果（true/false）来决定主查询的数据结果是否得以保留。

23.提高Order By的速度：
1.Order by时select * 是一个大忌只query需要的字段，这点非常重要。

2.尝试提高sort_buffer_size。

3.尝试提高max_length_for_sort_data

24.若order by 不能使用索引：
key a_b_c(a,b,c)
order by a ASC,b DESC，c DESC//排序不一致
where g = const order by b,cat//丢掉a索引
where a = const  order by c //丢掉b索引
where a = const order by a,d//d不是索引的一部分
where a in（...） order by b,c//对于排序来说，多个相等条件也是范围查询

25.为排序使用索引，不会出现using filesort
1)Mysql两种排序方式：文件排序或扫描有序索引排序
2)MySQL能为排序与查询使用相同的索引。

26.查看是否开启和如何开启：
mysql> SHOW VARIABLES LIKE '%slow_query_log%';
+---------------------+--------------------------------------+
| Variable_name       | Value                                |
+---------------------+--------------------------------------+
| slow_query_log      | OFF                                  |
| slow_query_log_file | /var/lib/mysql/49f2e38d38b3-slow.log |
+---------------------+--------------------------------------+
2 rows in set (0.00 sec)

开启：
mysql> set global slow_query_log=1;

若需要永久生效需要再my.cnf中修改如下：
slow_query_log=1
slow_query_log_file=/var/lib/mysql/porschan.log

查看默认阀值：
mysql> SHOW VARIABLES LIKE 'long_query_time%';
+-----------------+-----------+
| Variable_name   | Value     |
+-----------------+-----------+
| long_query_time | 10.000000 |
+-----------------+-----------+
1 row in set (0.01 sec)

设置阀值为3秒：
mysql> set global long_query_time = 3;
Query OK, 0 rows affected (0.00 sec)

需要重新连接或者创建新会话。

睡眠4秒：
+----------+
| sleep(4) |
+----------+
|        0 |
+----------+
1 row in set (4.00 sec)

查看有多少条SQL为慢查询：
mysql> show global status like '%Slow_queries%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Slow_queries  | 1     |
+---------------+-------+
1 row in set (0.00 sec)

配置版本：
在mysqld配置：
slow_query_log=1
slow_query_log_file=/var/lib/mysql/porschan.slow.log
long_query_tim=3
log_output=FILE

27.mysqldumpslow
root@49f2e38d38b3:/var/lib/mysql# mysqldumpslow --help
Usage: mysqldumpslow [ OPTS... ] [ LOGS... ]

Parse and summarize the MySQL slow query log. Options are

  --verbose    verbose
  --debug      debug
  --help       write this text to standard output

  -v           verbose
  -d           debug
  -s ORDER     what to sort by (al, at, ar, c, l, r, t), 'at' is default
                al: average lock time
                ar: average rows sent
                at: average query time
                 c: count
                 l: lock time
                 r: rows sent
                 t: query time  
  -r           reverse the sort order (largest last instead of first)
  -t NUM       just show the top n queries
  -a           don't abstract all numbers to N and strings to 'S'
  -n NUM       abstract numbers with at least n digits within names
  -g PATTERN   grep: only consider stmts that include this string
  -h HOSTNAME  hostname of db server for *-slow.log filename (can be wildcard),
               default is '*', i.e. match all
  -i NAME      name of server instance (if using mysql.server startup script)
  -l           don't subtract lock time from total time

CREATE TABLE dept(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
dname VARCHAR(20) NOT NULL DEFAULT "",
loc VARCHAR(13) NOT NULL DEFAULT ""
)ENGINE=INNODB DEFAULT CHARSET=GBK;

CREATE TABLE emp(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
empno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
ename VARCHAR(20) NOT NULL DEFAULT "",
job VARCHAR(9) NOT NULL DEFAULT "",
mgr MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
hiredate DATE NOT NULL,
sal DECIMAL(7,2) NOT NULL,
comm DECIMAL(7,2) NOT NULL,
DEPTNO MEDIUMINT UNSIGNED NOT NULL DEFAULT 0
)ENGINE=INNODB DEFAULT CHARSET=GBK;

创建函数，假如报错：This function has none of DETERMINISTIC...
# 由于开启过慢查询日志，因为我们开启了bin-log，我们需要指定一个function参数。
mysql> SHOW VARIABLES LIKE 'log_bin_trust_function_creators';
+---------------------------------+-------+
| Variable_name                   | Value |
+---------------------------------+-------+
| log_bin_trust_function_creators | OFF   |
+---------------------------------+-------+
1 row in set (0.00 sec)

mysql> set global log_bin_trust_function_creators=1;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW VARIABLES LIKE 'log_bin_trust_function_creators';
+---------------------------------+-------+
| Variable_name                   | Value |
+---------------------------------+-------+
| log_bin_trust_function_creators | ON    |
+---------------------------------+-------+
1 row in set (0.00 sec)

如果需要永久设置如下：
windows在my.int[mysqld]加上log_bin_trust_function_creators=1
linux在/etc/my.cnf下my.cnf[mysqld]加上log_bin_trust_function_creators=1

mysql> desc emp;
+----------+-----------------------+------+-----+---------+----------------+
| Field    | Type                  | Null | Key | Default | Extra          |
+----------+-----------------------+------+-----+---------+----------------+
| id       | int(10) unsigned      | NO   | PRI | NULL    | auto_increment |
| empno    | mediumint(8) unsigned | NO   |     | 0       |                |
| ename    | varchar(20)           | NO   |     |         |                |
| job      | varchar(9)            | NO   |     |         |                |
| mgr      | mediumint(8) unsigned | NO   |     | 0       |                |
| hiredate | date                  | NO   |     | NULL    |                |
| sal      | decimal(7,2)          | NO   |     | NULL    |                |
| DEPTNO   | mediumint(8) unsigned | NO   |     | 0       |                |
+----------+-----------------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> select now() from dual;
+---------------------+
| now()               |
+---------------------+
| 2019-06-22 07:25:12 |
+---------------------+
1 row in set (0.00 sec)

DELIMITER $$
CREATE FUNCTION rand_string(n INT) RETURNS VARCHAR(255)
BEGIN
DECLARE chars_str VARCHAR(100) DEFAULT 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
DECLARE return_str VARCHAR(255) DEFAULT '';
DECLARE i INT DEFAULT 0;
WHILE i<n DO
SET return_str = CONCAT(return_str,SUBSTRING(chars_str,FLOOR(1+RAND()*52),1));
SET i = i + 1;
END WHILE;
RETURN return_str;
END $$

DELIMITER $$
CREATE FUNCTION rand_num() RETURNS INT(5)
BEGIN
DECLARE i INT DEFAULT 0;
SET i=FLOOR(100+RAND()*10);
RETURN i;
END $$

DELIMITER $$
CREATE PROCEDURE insert_emp(IN START INT(10),IN max_num INT(10))
BEGIN
DECLARE i INT DEFAULT 0;
SET autocommit = 0;
REPEAT
SET i = i + 1;
INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES((START+i),RAND_STRING(6),'salesman',0001,CURDATE(),2000,400,rand_num());
UNTIL i = max_num
END REPEAT;
COMMIT;
END $$

DELIMITER $$
CREATE PROCEDURE insert_dept(IN START INT(10),IN max_num INT(10))
BEGIN
DECLARE i INT DEFAULT 0;
SET autocommit = 0;
REPEAT
SET i = i + 1;
INSERT INTO dept(deptno,dname,loc) VALUES((START+i),rand_string(10),rand_string(8));
UNTIL i = max_num
END REPEAT;
COMMIT;
END $$

DELIMITER ;
CALL insert_dept(100,10);

DELIMITER ;
CALL insert_emp(100001,500000);

28.查看profiling
mysql> show variables like 'profiling';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| profiling     | OFF   |
+---------------+-------+
1 row in set (0.00 sec)

mysql>  set profiling = on;
Query OK, 0 rows affected, 1 warning (0.00 sec)

设置打开。

mysql> show profiles;
+----------+------------+----------------------------------------------+
| Query_ID | Duration   | Query                                        |
+----------+------------+----------------------------------------------+
|        1 | 0.36642675 | select * from emp group by id%10 limit 15000 |
|        2 | 0.38175700 | select * from emp group by id%20 order by 5  |
|        3 | 0.00011450 | set profiling = on                           |
+----------+------------+----------------------------------------------+
3 rows in set, 1 warning (0.00 sec)

mysql> show profile cpu,block io for query 3;
+----------------+----------+----------+------------+--------------+---------------+
| Status         | Duration | CPU_user | CPU_system | Block_ops_in | Block_ops_out |
+----------------+----------+----------+------------+--------------+---------------+
| starting       | 0.000056 | 0.000051 |   0.000000 |            0 |             0 |
| Opening tables | 0.000013 | 0.000014 |   0.000000 |            0 |             0 |
| query end      | 0.000006 | 0.000005 |   0.000000 |            0 |             0 |
| closing tables | 0.000005 | 0.000004 |   0.000000 |            0 |             0 |
| freeing items  | 0.000019 | 0.000020 |   0.000000 |            0 |             0 |
| cleaning up    | 0.000017 | 0.000016 |   0.000000 |            0 |             0 |
+----------------+----------+----------+------------+--------------+---------------+
6 rows in set, 1 warning (0.00 sec)

29.全局查询日志：
配置启动：
在MySQL的my.cnf中，设置如下：
#开启：general_log=1
#记录日志文件的路径：
general_log_file=/path/logfile
#输出格式
log_output=FILE

编码设置：
set global general_log=1;

set global log_output = 'TABLE';

此后，你所编写的SQL语句，将会记录到MySQL库中的general_log表，可以用下面的命令查看：
select * from mysql.general_log;

mysql> set global general_log=1;
Query OK, 0 rows affected (0.00 sec)

mysql> set global log_output = 'TABLE';
Query OK, 0 rows affected (0.00 sec)

mysql> select * from mysql.general_log;
+----------------------------+---------------------------+-----------+-----------+--------------+---------------------------------+
| event_time                 | user_host                 | thread_id | server_id | command_type | argument                        |
+----------------------------+---------------------------+-----------+-----------+--------------+---------------------------------+
| 2019-06-22 08:55:49.304028 | root[root] @  [127.0.0.1] |         5 |         0 | Query        | select * from mysql.general_log |
+----------------------------+---------------------------+-----------+-----------+--------------+---------------------------------+
1 row in set (0.00 sec)

永远不要再生成环境中开启此功能。

30.对数据操作的类型（读、写）
读锁（共享锁）：针对同一份数据，多个读操作可以同时进行而不会相互影响。
写锁（排它锁）：当前写操作没有完成前，它会阻断其他写锁和读锁。

对数据操作的粒度分类：锁表、锁行。

锁表：偏向MyISAM存储引擎，开销小，加锁快，无死锁，锁定粒度大，发生锁冲突的概率最高，并发度最低。

查看表上加过的锁：
show open tables;

手动添加表锁：
lock table 表名字 read(write), 表名字2 read(write), 其他；
手动解表锁：
unlock tables;

锁表的会话不能查询其他没有加锁的表。

简单而言，读所会阻塞写，但不会阻塞读，而写锁则会把读和写都阻塞。

如何分析表锁定：
show status like 'table%';

table_locks_immediate:产生表级锁定的次数，表示可以立即获取锁的查询次数，每立即获取锁加1。
table_locks_waited:出现表级锁定争用而发生的等待次数（不能立即获取锁的次数，每等待一次锁值加1），此值高则说明存在着较严重的表级锁争用情况。

行锁：
偏向InnoDB存储引擎，开销大，加锁慢，会出现死锁，锁定粒度最小，发生锁冲突的概率最低，并发度也最高。
InnoDB与MyISAM的最大不同有两点，意识支持事务（TRANSACTION）；二是采用了行级锁。

查看支持事务级别：
show variables like 'tx_isolation';

31.什么是间隙锁？
当我们用范围条件而不相同条件检索数据，并请求共享或排他锁时，innoDB会给符合条件的已有数据记录的索引加锁，对于键值在条件范围内但并不存在的记录，叫做“间隙（GAP）”，innoDB也会对这个“间隙”加锁，这种锁机制就是所谓的间隙锁（next-key锁）。

32.如何锁定一行：
begin;
select * from test_innodb_lock where a=8 for update;
commit;
锁定某一行之后，其他的操作会被阻塞，知道锁定行的会话提交commit;

33.查看行锁：
show status like 'innodb_row_lock%';
innodb_row_lock_time_avg(等待平均时长)
innodb_row_lock_time_waits(等待总次数)
innodb_row_lock_time(等待总时长)

34.优化建议：
1.尽可能让所有数据索引都通过索引来完成，避免无索引行锁升级为表锁。（比如索引列中varchar类型，比较单引号）
2.合理设计索引，尽量缩小锁的范围。（避免间隙锁）
3.尽可能较少检索条件，避免间隙锁。（where index > 1 and index <5,导致另外会话对index = 2操作阻塞）
4.尽量控制事务大小，减少锁定资源量和时间长度。
5.尽可能低级别事务隔离。

35.什么是页锁？
开销和加锁时间介于表锁和行锁之间；会出现死锁；锁定粒度介于表锁和行锁之间，并发度一般。

36.主从复制：
windows的my.ini:C:\ProgramData\MySQL\MySQL Server 5.7
内容如下：
[mysqld]
# Binary Logging.
log-bin=log-error="C:\ProgramData\MySQL\MySQL Server 5.7\Data\mysqlbin"

# Error Logging.
# 默认配置
# log-error="DESKTOP-6FUJB64.err"
log-error="C:\ProgramData\MySQL\MySQL Server 5.7\Data\mysqlerr"

# Server Id.
server-id=1

linux的my.cnf：/etc/my.cnf
由于我在dockers环境下所以在/etc/mysql/my.cnf
内容如下：
[mysqld]
log-bin = mysql-bin
server-id = 2

重启MySQL。

主数据库master:
GRANT REPLICATION SLAVE ON *.* TO 'zhangsan'@'192.168.51.15' IDENTIFIED BY '123456';
flush privileges;

查看主机状态：
show master status;

mysql> show master status;
+-----------------+----------+--------------+------------------+-------------------+
| File            | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+-----------------+----------+--------------+------------------+-------------------+
| mysqlbin.000001 |      605 |              |                  |                   |
+-----------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)

stop flave

从数据库设置：
mysql> CHANGE MASTER TO MASTER_HOST='192.168.51.232',MASTER_USER='zhangsan',MASTER_PASSWORD='123456',MASTER_LOG_FILE='mysqlbin.000001',MASTER_LOG_POS=605;
Query OK, 0 rows affected, 2 warnings (0.01 sec)

mysql> start slave;
Query OK, 0 rows affected (0.00 sec)

mysql> show slave status\G
*************************** 1. row ***************************
               Slave_IO_State: Connecting to master
                  Master_Host: 192.168.51.232
                  Master_User: zhangsan
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysqlbin.000001
          Read_Master_Log_Pos: 605
               Relay_Log_File: 097d05870add-relay-bin.000001
                Relay_Log_Pos: 4
        Relay_Master_Log_File: mysqlbin.000001
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 605
              Relay_Log_Space: 154
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 0
                  Master_UUID: 
             Master_Info_File: /var/lib/mysql/master.info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
1 row in set (0.00 sec)

ps:
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
