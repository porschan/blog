---
title: 在Red Hat 安装SVN
date: 2019-11-19 15:29:47
tags:
---

安装svn:

########## 当前使用的操作系统版本 ##########

```
[root@localhost home]# head -n 1 /etc/issue
Red Hat Enterprise Linux Server release 6.5 (Santiago)
```

########## @1.下载rpm
http://www.collab.net/downloads/subversion#tab-2

上述链接需要访问外网

CollabNetSubversion-client-1.12.2-1.x86_64.rpm
CollabNetSubversion-server-1.12.2-1.x86_64.rpm

########## @2.安装rpm

```
rpm -ivh CollabNetSubversion-client-1.12.2-1.x86_64.rpm  (一定要先装client)

rpm -ivh CollabNetSubversion-server-1.12.2-1.x86_64.rpm

rpm -ivh的意思是安装rpm包并显示安装进度。
``

然后输入svn --help 如果未提示错误，基本上是安装成功了

########## @3.创建SVN仓库
```
mkdir /home/svnRepository

svnadmin create /opt/svnRepository   创建仓库
```

########## @4.修改了passwd和authz以及realm
具体参考配置文件:
/home/software-installer/svn/demo/conf/


########## @5.启动svn服务

``
svnserve -d -r  /opt/svnrepository/   启动服务

netstat -ntlp | grep 3690  验证svn服务是否开启
```

剩下的就和平时使用SVN一样了，你的小乌龟可以通过svn://svn服务ip:3690/项目名 访问了

```
[root@localhost conf]# svnserve -d -r /home/svn（启动）
[root@localhost conf]#killall svnserve（停止）
```

上述启动命令中，-d表示守护进程， -r 表示在后台执行。停止还可以采用杀死进程的方式:

```
[root@localhost conf]# ps -ef|grep svnserve
root      4908     1  0 21:32 ?        00:00:00 svnserve -d -r /home/svn
root      4949  4822  0 22:05 pts/0    00:00:00 grep svnserve
[root@localhost conf]# kill -9 4908
```

########## @6.参考

参考链接：
1.Red hat下搭建简易实用的SVN服务器
https://www.cnblogs.com/dycg/archive/2013/05/30/3107945.html

2.Linux下安装SVN服务端小白教程
https://www.cnblogs.com/liuxianan/p/linux_install_svn_server.html

########## @6.备注

rpm:
/home/software-installer/svn
参考配置文件:
/home/software-installer/svn/demo/conf/

**************************** 20191119 新加

参考链接：

3.同一台服务器开启多个SVN仓库的方法（两种方法）
https://blog.dugwang.com/?p=753

4.Linux下 svn 更改版本库路径
https://zhidao.baidu.com/question/1706930463994480420.html


**** 备份及导入SVN仓库 ****

用 svnadmin dump 命令来备份打包库数据

svnadmin dump /你的地址/repository > /打包目录/repository-backup.svn

创建新库地址

svnadmin create /新地址/repository

svnadmin load /新地址/repository < /打包目录/repository-backup.svn