---
title: windows下面切换jdk版本
date: 2018/11/29 23:15:25 
desc: chanchfieng.com
tags: [windows , jdk]
---


<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

jdk的安装过程非常傻瓜，下一步下一步。

jdk各个版本的下载：[https://www.oracle.com/technetwork/java/javase/archive-139210.html](https://www.oracle.com/technetwork/java/javase/archive-139210.html "https://www.oracle.com/technetwork/java/javase/archive-139210.html")

**很多人都以为windows修改过系统的配置都需要重启，其实很多配置修改不成功，只是修改不到位，或者修改之后，软件没有自检的过程或者插件来校验是否正确。
**
<div class="tip">
参考文章：

	1.minxinfeng的博客：[https://www.cnblogs.com/fengxm/p/4384229.html](https://www.cnblogs.com/fengxm/p/4384229.html "https://www.cnblogs.com/fengxm/p/4384229.html")


	Windows系统上安装多个版本jdk，修改环境变量不生效
	本机已经安装了jdk1.6，而比较早期的项目需要依赖jdk1.5，于是同时在本机安装了jdk1.5和jdk1.6. 
	安装jdk1.5前，执行
	
	java -version

	得到
	java version "1.6.0_38" Java(TM) SE Runtime Environment (build 1.6.0_38-b05) Java HotSpot(TM) 64-Bit Server VM (build 20.13-b02, mixed mode)
	
	安装完jdk1.5,并修改环境变量JAVA_HOME为D:\devSoftware\jdk1.5.再执行 java -version时，依然显示：
	java version "1.6.0_38" Java(TM) SE Runtime Environment (build 1.6.0_38-b05) Java HotSpot(TM) 64-Bit Server VM (build 20.13-b02, mixed mode)
	
	看上去，新的环境变量JAVA_HOME=D:\devSoftware\jdk1.5并没有生效。 在网上找了很多资料才发现：
	在安装JDK1.6时（本机先安装jdk1.6再安装的jdk1.5），自动将java.exe、javaw.exe、javaws.exe三个可执行文件复制到了C:\Windows\System32目录，由于这个目录在WINDOWS环境变量中的优先级高于JAVA_HOME设置的环境变量优先级
	
	解决方案：将java.exe,javaw.exe,javaws.exe删除即可。开启新的命令行窗口，再执行java -version时，就得到了期望中的结果
	java version "1.5.0_17" Java(TM) 2 Runtime Environment, Standard Edition (build 1.5.0_17-b04) Java HotSpot(TM) 64-Bit Server VM (build 1.5.0_17-b04, mixed mode)


AND

	2.修改jdk环境变量后，java版本不变 java -version[https://blog.csdn.net/wckjlu/article/details/70155037](https://blog.csdn.net/wckjlu/article/details/70155037 "https://blog.csdn.net/wckjlu/article/details/70155037")

	win 7环境下修改JAVA_HOME后，在命令行执行:java -version 发现版本没有变化,以为需要重启才行，就把电脑重新启动了，结果重新启动后执行:java -version 版本依然没有变化.

	在命令行执行 命令where java ,打印如下信息:

	C:\Users\wck>where java
	C:\ProgramData\Oracle\Java\javapath;
	C:\Windows\System32\java.exe
	D:\jdk1.7.0_80\bin\java.exe

	查看path发现，原来在系统安装oracle数据库后，oracle使用的jdk被写入path,这样前面配置了JAVA_HOME,但是在java查找jdk时是按照从前到后依次查找，这样始终无法查找到JAVA_HOME配置的JDK，修改path配置，将JAVA_HOME路径设置在最前面(可以检索到的java前面即可)%JAVA_HOME%\bin; 这样配置后问题解决.
</div>