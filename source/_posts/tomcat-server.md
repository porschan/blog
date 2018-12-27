---
title: DOS tomcat 操作
date: ‎‎2018/8/1 13:24:48
---

进入tomcat的bin目录：

1.添加Tomcat服务：
```

	添加服务名为tomcat的服务:

	service install tomcat

	添加服务名为Test的服务:

	service install Test

```

2.删除Tomcat服务,建议使用这条命令（包括删除服务）:
```

	service remove tomcat

```

3.启动tomcat服务:
```

	net start tomcat

```

4.关闭tomcat服务:
```

	net stop tomcat

```

5.删除tomcat服务：
```

	sc delete tomcat

```

