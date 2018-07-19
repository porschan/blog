---
title: Tomcat使用命令行启动之指定jdk版本
date: 2018‎-7‎-‎19‎ ‏‎13:10:52
desc: chanchfieng.com
tags: tomcat
---

准备好环境，jdk和tomcat。

## 主要步骤

1.找到Tomcat/bin/catalina.bat文件。
2.在文件前端添加如下。

```
set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_161
```

3.保存，使用命令行启动。

```
PS D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin> .\catalina.bat run
```

4.启动时，显示如下即表示配置成功。

```
PS D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin> .\catalina.bat run

Using CATALINA_BASE:   "D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82"

Using CATALINA_HOME:   "D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82"

Using CATALINA_TMPDIR: "D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\temp"

Using JRE_HOME:        "C:\Program Files (x86)\Java\jdk1.8.0_161"

Using CLASSPATH:       "D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin\bootstrap.jar;D:\Program Files\Tomcat\apache-tomcat-7.0.82-windows-x64\apache-tomcat-7.0.82\bin\tomcat-juli.jar"
```

PS：这仅仅是用命令行启动tomcat，未尝试使用服务是否具有相同效果。