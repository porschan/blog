---
title: Tomcat安装服务之指定jdk版本
date: 2018-12-02 09:28:56
---

## 操作步骤 ##

1.找到Tomcat根目录的/bin/service.bat文件。
2.在文件前端添加如下。

```

	...
	
	rem ---------------------------------------------------------------------------
	rem NT Service Install/Uninstall script
	rem
	rem Options
	rem install                Install the service using Tomcat8 as service name.
	rem                        Service is installed using default settings.
	rem remove                 Remove the service from the System.
	rem
	rem name        (optional) If the second argument is present it is considered
	rem                        to be new service name
	rem ---------------------------------------------------------------------------
	
	setlocal

	set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_152
	set JRE_HOME=C:\Program Files\Java\jdk1.8.0_152\jre
	
	set "SELF=%~dp0%service.bat"
	rem Guess CATALINA_HOME if not defined
	
	...

```

<div class="tip">

	在windows中安装tomcat服务参考：
	DOS TOMCAT 操作:[https://chanchifeng.com/2018/11/11/tomcat-server/](https://chanchifeng.com/2018/11/11/tomcat-server/ "https://chanchifeng.com/2018/11/11/tomcat-server/")

</div>
