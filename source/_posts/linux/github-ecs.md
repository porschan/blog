---
title: 写个定时任务，从github下载代码到阿里ECS服务器上
---

根据前几篇博客中能自己创建一个博客，并在github.io上访问到自己的博客，但是如果自己有服务器，那怎么能定时获取github上面自己的博客到自己的服务器上呢？如下图

![](../../../../../../images/2018_06_19/networkRelationship.png)

#### 编写脚本

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

#### 放到定时任务

```

	root@porschan:/var# crontab -e

	添加：
	40 14 * * * /var/copyS.sh

	ctrl + x
		-> 输入 Y
 		-> 按enter键

	查看是否在定时任务中

	root@porschan:/var# crontab -l


```

#### 完毕，这样我们只需要每次把代码提交到github上面，就能自动更新自己服务器的博客代码，这是一个简单的方法，多测试copyS.sh脚本，正确无误才添加到定时任务中。