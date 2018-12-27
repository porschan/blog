---
title: 查看ubunt系统版本
date: 2018/10/21 21:53:35
---

<div class="tip">
	当前ubunt系统版本：Description:	Ubuntu 16.04.3 LTS
</div>

# 第一种 #

```
	
	porschan@porschan-X555LD:~$ lsb_release -a
	No LSB modules are available.
	Distributor ID:	Ubuntu
	Description:	Ubuntu 16.04.3 LTS
	Release:	16.04
	Codename:	xenial

```

# 第二种 #

```

	porschan@porschan-X555LD:~$ cat /proc/version
	Linux version 4.15.0-36-generic (buildd@lcy01-amd64-017) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.10)) #39~16.04.1-Ubuntu SMP Tue Sep 25 08:59:23 UTC 2018

```

linux内核版本号：Linux version 4.15.0-36-generic (buildd@lcy01-amd64-017)
gcc编译器版本号：gcc version 5.4.0 20160609
Ubuntu版本号：Ubuntu 5.4.0-6ubuntu1~16.04.10

<div class="tip">
	学习链接：
	ubuntu：查看ubuntu系统的版本信息：[https://blog.csdn.net/whbing1471/article/details/52074390](https://blog.csdn.net/whbing1471/article/details/52074390 "ubuntu：查看ubuntu系统的版本信息")
</div>