---
title: 继上次git clone 下来CES 服务器之后再优化
---

###回顾上次代码：

```

	copyS.sh:

	#!/bin/bash
	
	cd /var/
	
	git clone https://github.com/porschan/porschan.github.io.git
	
	time=$(date "+%Y%m%d")
	
	mv /var/www/ /var/www_backfile/www_${time}
	
	mv /var/porschan.github.io /var/www
	
	echo "${time}" >> /var/copyLog.txt

```

上次的代码貌似是没有问题，但是在一段时间内，我发现以下问题：

1.git clone 下来的代码耗时长及占用空间，如下图：

![](../git_clone-CES/20180709095658.png)

2.若在git clone 的过程中发送错误，会整个网站挂掉。

### 优化

从网络上发现有一个git pull的命令能暂时解决这个问题，如修改为：

```

	#!/bin/bash

	# old	
	#cd /var/
	#git clone https://github.com/porschan/porschan.github.io.git
	#time=$(date "+%Y%m%d")
	#mv /var/www/ /var/www_backfile/www_${time}
	#mv /var/porschan.github.io /var/www
	#echo "${time}" >> /var/copyLog.txt
	
	# new edit time : 2018/07/09
	
	cd /var/www/
	
	git pull
	
	echo "${time}" >> /var/copyLog.txt


```

总结：因为主要由我一个人更新blog webSite，所以github上面只有一个master分支，使用git pull解决了没用每次都git clone 和git clone 下来之后的一系列操作，省去时间和空间及出错的机会。

问题：没有网站备份。