---
title: '[转] 使用Docker部署完成，连接mysql出现的乱码'
date: 2018/7/27 9:44:24
---

使用Docker部署完成，连接mysql出现的乱码：
Authentication plugin 'caching_sha2_password' cannot be loaded:乱码。。

```

	问题：
	
	连接Docker启动的mysql出现：ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded
	
	C:\mysqldata>mysql -h 127.0.0.1 -P 13306 -uroot -p
	Enter password: ****
	ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded: ÕÒ²»µ½Ö¸¶¨µÄÄ£¿é¡£
	
	解决方案：
	
	1.进入mysql容器
	
	docker exec -it mysql2 /bin/bash
	
	2.进入mysql
	
	mysql -uroot -pmima
	
	3.修改密码
	
	ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '这里是设置的密码';

```

<div class="tip">
  感谢我从昨日微风的博客[ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded](https://www.cnblogs.com/chuancheng/p/8964385.html)学习到centOS6.5安装Docker的过程，以下为未使用到的过程。
</div>