---
title: ubunt开启ssh server 的服务
date: 2018/10/24 0:02:49   
desc: chanchfieng.com
tags: [Linux,Ubunt,ssh]
---

<div class="tip">
	当前ubunt系统版本：Description:	Ubuntu 16.04.3 LTS
</div>

如ubunt系统没有开启ssh server 服务，则无法通过ssh来远程连接

# 安装ssh server 服务 #

```
	安装ssh server 服务，默认安装完成自动启动ssh server 服务:
	porschan@porschan-X555LD:~$ apt-get install openssh-server
	
	检查ssh服务开启状态:
	porschan@porschan-X555LD:~$ ps -s | grep ssh

```

打完收枪。

<div class="tip">
	学习链接：
	Ubuntu13.10：[3]如何开启SSH SERVER服务：[https://jingyan.baidu.com/article/00a07f38a5c05482d128dc5f.html](https://jingyan.baidu.com/article/00a07f38a5c05482d128dc5f.html "Ubuntu13.10：[3]如何开启SSH SERVER服务")
</div>