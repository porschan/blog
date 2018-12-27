---
title: 使用idea创建spring boot 项目
date: 2018‎-‎7‎-19‎ ‏‎13:05:32
---

#### 参考lindaZ的[IntelliJ IDEA 创建spring boot 的Hello World 项目](https://www.cnblogs.com/lindaZ/p/6543333.html)

```

1.Open IDEA，choose "New-->Project"

2.Choose "Spring Initializr"

-> next

3.Project Metadata:

Group: com.chanchifeng
Artifact: server-system
Description: server-system project for Spring Boot

-> next

4. Choose "Web"

-> next

5.删除.mvn，mvnw，mvnw.cmd。

```

#### 创建HelloController

```

	HelloController.java:

	package com.chanchifeng.serversystem;
	
	import org.springframework.boot.SpringApplication;
	import org.springframework.boot.autoconfigure.SpringBootApplication;
	import org.springframework.context.annotation.ComponentScan;

	@SpringBootApplication
	@ComponentScan("com.chanchifeng.serversystem.ctrl")
	public class ServerSystemApplication {
	
	    public static void main(String[] args) {
	        SpringApplication.run(ServerSystemApplication.class, args);
	    }
	}

```

#### 修改HelloController

```

	package com.chanchifeng.serversystem.ctrl;
	
	import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RestController;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 10:14 2018/6/15
	 * @modified By:
	 */
	
	@RestController
	@EnableAutoConfiguration
	public class HelloController {
	
	    @RequestMapping("/hello")
	    public String index(){
	        System.out.println("进入controller");
	        return "Hello World!";
	    }
	}


```

#### 运行com.chanchifeng.serversystem.ServerSystemApplication#main，在浏览器输入http://localhost:8080/hello,spring Boot项目搭建成功。