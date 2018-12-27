---
title: Ubuntu 安装java
date: 2018/8/3 17:47:22
---

1.下载页面[http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

![](../ubuntu-java/20180803174827.png)

2.将jdk-8u181-linux-x64.tar.gz上传到服务器的 **/usr** 路径下

![](../ubuntu-java/20180803174936.png)

![](../ubuntu-java/20180803175119.png)

3.进入该目录：

```

	cd /usr

```

4.解压:

```

	$ tar zxvf jdk-8u181-linux-x64.tar.gz

```

5.配置环境：

```

	$ vi /etc/profile

```

6.配置环境内容：

```

#Java Env
export JAVA_HOME=/usr/jdk1.8.0_121
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

```

7.是配置文件立即生效：

```

$ source /etc/profile

```

8.检查java：

```
$ java -version
java version "1.8.0_181"
Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)


```