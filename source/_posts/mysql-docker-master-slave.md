---
title: MySQL - 在 docker 中主从复制
date: 2019-06-24 23:20:40
---

> 虚拟机：VMware® Workstation 15 Pro
>
> 系统：CentOS7

##### 安装Docker

1.使用 `root` 权限登录 Centos。确保 yum 包更新到最新。

```shell
$ sudo yum update
```

2.卸载旧版本(如果安装过旧版本的话)

```shell
$ sudo yum remove docker  docker-common docker-selinux docker-engine
```

3.安装需要的软件包， yum-util 提供yum-config-manager功能，另外两个是devicemapper驱动依赖的

```shell
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

4.设置yum源

```shell
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

5.可以查看所有仓库中所有docker版本，并选择特定版本安装

```shell
$ yum list docker-ce --showduplicates | sort -r
```

6.安装docker

```shell
$ sudo yum install docker-ce
```

7.启动并加入开机启动

```shell
$ sudo systemctl start docker
$ sudo systemctl enable docker
```

8.验证安装是否成功(有client和service两部分表示docker安装启动都成功了)

```shell
$ docker version
```

9.下载镜像

```shell
$ docker pull registry.cn-hangzhou.aliyuncs.com/acs-sample/mysql:5.7
```

10.查看镜像

```shell
$ docker images
```

11.打上tag

```shell
$ docker tag registry.cn-hangzhou.aliyuncs.com/acs-sample/mysql:5.7 mysql:5.7
```

12.再次查看镜像

```shell
$ docker images
```

13.创建master容器

```shell
[root@localhost ~]# docker run -p 3339:3306 --name mymysql-master -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```

14.创建slave容器

```shell
[root@localhost ~]# docker run -p 3340:3306 --name mymysql-slave -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```

15.进入master容器
```shell
docker exec -it mysql-master /bin/bash


```
16.进入slave容器

```shell
docker exec -it mysql-slave /bin/bash
```

17.master和slave容器均要更新

```shell
$ apt-get update
$ apt-get -y install vim
```
18.使用vi编辑master的my.cnf添加：

```shell
[mysqld]
server-id=100  
log-bin=mysql-bin
```
19.使用vi编辑slave的my.cnf添加：

```shell
[mysqld]
server-id=101
log-bin=mysql-slave-bi
relay_log=edu-mysql-relay-bin  
```
20.重启master数据库：

```shell
$ service mysql restart
```

21.重启master的dockers容器：

```shell
[root@localhost ~]# docker start mymysql-master
```
22.进入master的dockers容器：

```shell
[root@localhost ~]# docker exec -it 74 /bin/bash

[root@746930502c9f]:/# mysql -uroot -p

mysql> CREATE USER 'slave'@'%' IDENTIFIED BY '123456';

mysql> GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'slave'@'%';

mysql> flush privileges;

mysql> show master status;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000001 |      761 |              |                  |                   |
+------------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)
```

23.重启slave数据库：

```shell
$ service mysql restart
```

24.重启slave的dockers容器：

```shell
[root@localhost ~]# docker start mymysql-slave
```

25.让dockers相互通讯：

```shell
[root@localhost ~]# docker inspect --format='{{.NetworkSettings.IPAddress}}' mymysql-master
172.17.0.2
[root@localhost ~]# docker inspect --format='{{.NetworkSettings.IPAddress}}' mymysql-slave
172.17.0.3
```

26.进入slave的dockers容器：

```shell
[root@localhost ~]# docker exec -it mymysql-slave /bin/bash

[root@746930502c9f]:/# mysql -uroot -p

mysql> change master to master_host='172.17.0.2', master_user='slave', master_password='123456', master_port=3306, master_log_file='mysql-bin.000001', master_log_pos= 761, mastter_connect_retry=30;

mysql> start slave;
Query OK, 0 rows affected (0.00 sec)

mysql> show slave status \G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 172.17.0.2
                  Master_User: slave
                  Master_Port: 3306
                Connect_Retry: 30
              Master_Log_File: mysql-bin.000001
          Read_Master_Log_Pos: 761
               Relay_Log_File: edu-mysql-relay-bin.000002
                Relay_Log_Pos: 320
        Relay_Master_Log_File: mysql-bin.000001
             Slave_IO_Running: Yes
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
          Exec_Master_Log_Pos: 761
              Relay_Log_Space: 531
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 100
                  Master_UUID: 887e6734-9680-11e9-93f1-0242ac110002
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
```

27.master测试结果：

```mysql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create database testabcd;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testabcd           |
+--------------------+
5 rows in set (0.00 sec)

mysql> create table person(id int ,name varchar(20) );
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+--------------------+
| Tables_in_testabcd |
+--------------------+
| person             |
+--------------------+
1 row in set (0.00 sec)

mysql> insert into person values(1,'porschan');
Query OK, 1 row affected (0.02 sec)
```

28.slave测试结果：

```mysql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testabcd           |
+--------------------+
5 rows in set (0.00 sec)

mysql> use testabcd
Database changed

Database changed
mysql> show tables;
+--------------------+
| Tables_in_testabcd |
+--------------------+
| person             |
+--------------------+
1 row in set (0.00 sec)

mysql> select * from person;
+------+----------+
| id   | name     |
+------+----------+
|    1 | porschan |
+------+----------+
1 row in set (0.01 sec)

```

> 参考：
> [Centos7上安装docker](https://www.cnblogs.com/yufeng218/p/8370670.html)
>
> [CentOS下使用Docker安装MySQL](https://www.linuxidc.com/Linux/2017-11/148564.htm)
>
>  [基于Docker的Mysql主从复制搭建](https://www.cnblogs.com/songwenjie/p/9371422.html)
