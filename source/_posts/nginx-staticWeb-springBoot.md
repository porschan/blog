---
title: 静态网站和SpringBoot项目的配置
date: 2018-11-15 23:40:31
---

### 找到对应Nginx的位置 ###

![](nginx-staticWeb-springBoot/20181115234435.png)

### 直接post配置文件（static-naice-me.conf） ###

![](nginx-staticWeb-springBoot/20181115234611.png)

### 常用的nginx的命令 ###

```
	查看出错原因：
	sudo nginx -t

	查看nginx版本号：
	nginx -v

	启动nginx:
	sudo service nginx start

	暂停nginx:
	sudo service nginx stop

```

<div class="tip">
	经过测试，由于我的nginx版本为1.4.6，启动的时候不会报错，所以要检查是否配置文件出问题。
</div>