---
title: jfinal初使用
date: 2018/8/10 17:22:53
---

公司是再用jfianl开发项目，jfianl比较轻巧，使用起来比较上手，下面我就使用jfianl来编写一个具有定时器及简易web的工单的项目，并且能使用java命令及jar包的形式显示出来。

创建maven项目：

![](../jfinal-jar-main/20180810163158.png)

![](../jfinal-jar-main/20180810163224.png)

![](../jfinal-jar-main/20180810163232.png)

项目的目录结构：

![](../jfinal-jar-main/20180810172716.png)

<div class="tip">
  你会看到target文件夹，是我使用maven命令来生成的，这里无需操作。
</div>

config.AppConfig:

```

	package config;

	import com.jfinal.config.*;
	import com.jfinal.core.JFinal;
	import com.jfinal.plugin.cron4j.Cron4jPlugin;
	import com.jfinal.template.Engine;
	import controller.HelloController;
	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;
	import task.MyTask;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 16:35 2018/8/10
	 * @modified By:
	 */
	
	public class AppConfig extends JFinalConfig {
	
	    protected static Logger logger = LoggerFactory.getLogger(AppConfig.class);
	
	    //用于启动JFinal
	    public static void main(String[] args) {
	        JFinal.start("src/main/webapp", 2018, "/");
	    }
	
	    @Override
	    public void configConstant(Constants me) {
	//        me.setDevMode(true);
	    }
	
	    @Override
	    public void configRoute(Routes me) {
	        me.add("/hello", HelloController.class);
	    }
	
	    @Override
	    public void configEngine(Engine me) {
	
	    }
	
	    @Override
	    public void configPlugin(Plugins me) {
	        System.out.println("run cron4jPlugin");
	
	        Cron4jPlugin cpTask = new Cron4jPlugin();
	//        cpTask.addTask("0-59/1 * * * *", new MyTask(
	        cpTask.addTask("*/1 * * * *", new MyTask());
	        me.add(cpTask);
	    }
	
	    @Override
	    public void configInterceptor(Interceptors me) {
	
	    }
	
	    @Override
	    public void configHandler(Handlers me) {
	
	    }
	}


```

config.AppMain：

```

	package config;

	import com.jfinal.core.JFinal;
	import com.jfinal.kit.PathKit;
	import com.jfinal.kit.StrKit;
	import com.xiaoleilu.hutool.util.ZipUtil;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 16:39 2018/8/10
	 * @modified By:
	 */
	
	public class AppMain {
	    /**
	     * 用于在 IDEA 中，通过创建 main 方法的方式启动项目，不支持热加载
	     * 本方法存在的意义在于此方法启动的速度比 maven 下的 jetty 插件要快得多
	     * <p>
	     * 注意：不支持热加载。建议通过 Ctrl + F5 快捷键，来快速重新启动项目，速度并不会比 eclipse 下的热加载慢多少
	     * 实际操作中是先通过按 Alt + 5 打开 debug 窗口，才能按 Ctrl + F5 重启项目
	     */
	    public static void main(String[] args) {
	        /**
	         * 特别注意：IDEA 之下建议的启动方式，仅比 eclipse 之下少了最后一个参数
	         */
	        String baseBath = String.valueOf(AppMain.class.getProtectionDomain().getCodeSource().getLocation());
	        String classPath, webRootPath, jarPath;
	        if (StrKit.notBlank(baseBath) && baseBath.contains("file:/")) {
	            // 获取运行操作系统的运行方式  window和linux的细微区别
	            boolean windows = System.getProperties().getProperty("os.name").contains("Windows");
	            System.out.println(System.getProperties().getProperty("os.name"));
	            jarPath = (windows ? "" : "/") + baseBath.substring("file:/".length());
	            classPath = (windows ? "" : "/") + jarPath.substring(0, jarPath.lastIndexOf("/")) + "/class-path";
	            System.out.println("jarPath:" + jarPath);
	            System.out.println("classPath:" + classPath);
	            webRootPath = classPath;
	            ZipUtil.unzip(jarPath, classPath);
	            // 这两步是核心指定 webapp目录和classpath目录
	            PathKit.setWebRootPath(webRootPath);
	            PathKit.setRootClassPath(classPath);
	            // eclipse 启动是4个参数
	            JFinal.start(webRootPath, 2018, "/");
	        } else {
	            throw new RuntimeException("路径不对");
	        }
	    }
	}


```

controller.HelloController：

```

	package controller;

	import com.jfinal.core.Controller;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 16:37 2018/8/10
	 * @modified By:
	 */
	
	public class HelloController extends Controller {
	
	    public void index() {
	        renderText("Hello JFinal World.");
	    }
	}


```

task.MyTask：

```

	package task;

	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 16:38 2018/8/10
	 * @modified By:
	 */
	
	public class MyTask implements Runnable{
	
	    @Override
	    public void run() {
	        System.out.println("Another minute ticked away...");
	    }
	
	}


```

WEB-INF/web.xml(resources下的WEB-INF/web.xml和webapp/WEB-INF/web.xml的内容是一致)：

```

	<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd" >
	<web-app>
	    <display-name>Archetype Created Web Application</display-name>
	    <filter>
	        <filter-name>jfinal</filter-name>
	        <filter-class>com.jfinal.core.JFinalFilter</filter-class>
	        <init-param>
	            <param-name>configClass</param-name>
	            <param-value>config.AppConfig</param-value>
	        </init-param>
	    </filter>
	    <filter-mapping>
	        <filter-name>jfinal</filter-name>
	        <url-pattern>/*</url-pattern>
	    </filter-mapping>
	</web-app>

```

log4j.properties:

```

	log4j.rootLogger=WARN, stdout, file
	log4j.appender.stdout=org.apache.log4j.ConsoleAppender
	log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
	log4j.appender.stdout.layout.ConversionPattern=%n%-d{yyyy-MM-dd HH:mm:ss}%n[%p]-[Thread: %t]-[%C.%M()]: %m%n
	
	# Output to the File
	log4j.appender.file=org.apache.log4j.FileAppender
	log4j.appender.file.File=./jfinal_jar_demo.log
	log4j.appender.file.layout=org.apache.log4j.PatternLayout
	log4j.appender.file.layout.ConversionPattern=%n%-d{yyyy-MM-dd HH:mm:ss}%n[%p]-[Thread: %t]-[%C.%M()]: %m%n

```

pom.xml：

```

	<?xml version="1.0" encoding="UTF-8"?>
	<project xmlns="http://maven.apache.org/POM/4.0.0"
	         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	    <modelVersion>4.0.0</modelVersion>
	
	    <groupId>com.chanchifeng</groupId>
	    <artifactId>jfinal_jar_demo</artifactId>
	    <version>1.0-SNAPSHOT</version>
	    <packaging>jar</packaging>
	
	    <!-- 集中定义依赖版本号 -->
	    <properties>
	        <java-version>1.8</java-version>
	        <encoding>UTF-8</encoding>
	
	        <project.build.sourceEncoding>${encoding}</project.build.sourceEncoding>
	        <maven.compiler.source>${java-version}</maven.compiler.source>
	        <maven.compiler.target>${java-version}</maven.compiler.target>
	
	        <!--项目依赖包-->
	        <jfinal.version>3.4</jfinal.version>
	        <jfinal.jetty.version>8.1.8</jfinal.jetty.version>
	        <junit.version>4.12</junit.version>
	        <hutool-all.version>3.2.2</hutool-all.version>
	        <log4j.version>1.2.16</log4j.version>
	        <slf4j.api.version>1.7.24</slf4j.api.version>
	        <slf4j.log4j12.version>1.7.24</slf4j.log4j12.version>
	        <mysqlJdbc.version>5.1.38</mysqlJdbc.version>
	        <c3p0.version>0.9.1.2</c3p0.version>
	        <cron4j.version>2.2.5</cron4j.version>
	        <!-- 以上已检查 -->
	
	        <jfinal.cos.version>2017.5</jfinal.cos.version>
	        <lombox.version>1.16.18</lombox.version>
	        <hutool.version>3.1.0</hutool.version>
	        <jwt.version>3.2.0</jwt.version>
	        <jjwt.version>0.6.0</jjwt.version>
	        <fastjson.version>1.2.35</fastjson.version>
	        <druid.version>1.1.1</druid.version>
	
	        <ehcache.version>2.6.11</ehcache.version>
	        <beanutils.version>1.9.3</beanutils.version>
	        <javax.servlet.version>2.5</javax.servlet.version>
	        <JFinal-event.version>1.5.1</JFinal-event.version>
	        <JFinal-wx.version>1.9</JFinal-wx.version>
	        <httpclient-version>3.1</httpclient-version>
	    </properties>
	
	    <dependencies>
	
	        <dependency>
	            <groupId>com.jfinal</groupId>
	            <artifactId>jfinal</artifactId>
	            <version>${jfinal.version}</version>
	        </dependency>
	
	        <dependency>
	            <groupId>com.jfinal</groupId>
	            <artifactId>jetty-server</artifactId>
	            <version>${jfinal.jetty.version}</version>
	            <scope>compile</scope>
	            <!--<scope>provided</scope>-->
	        </dependency>
	
	        <dependency>
	            <groupId>junit</groupId>
	            <artifactId>junit</artifactId>
	            <version>${junit.version}</version>
	            <scope>test</scope>
	        </dependency>
	
	        <dependency>
	            <groupId>com.xiaoleilu</groupId>
	            <artifactId>hutool-all</artifactId>
	            <version>${hutool-all.version}</version>
	        </dependency>
	
	        <dependency>
	            <groupId>org.slf4j</groupId>
	            <artifactId>slf4j-log4j12</artifactId>
	            <version>${slf4j.log4j12.version}</version>
	        </dependency>
	
	        <dependency>
	            <groupId>org.slf4j</groupId>
	            <artifactId>slf4j-api</artifactId>
	            <version>${slf4j.api.version}</version>
	        </dependency>
	
	        <dependency>
	            <groupId>log4j</groupId>
	            <artifactId>log4j</artifactId>
	            <version>${log4j.version}</version>
	        </dependency>
	
	        <dependency>
	            <groupId>mysql</groupId>
	            <artifactId>mysql-connector-java</artifactId>
	            <version>${mysqlJdbc.version}</version>
	        </dependency>
	
	        <!-- https://mvnrepository.com/artifact/c3p0/c3p0 -->
	        <dependency>
	            <groupId>c3p0</groupId>
	            <artifactId>c3p0</artifactId>
	            <version>${c3p0.version}</version>
	        </dependency>
	
	        <!-- 作业调度器 -->
	        <!-- https://mvnrepository.com/artifact/it.sauronsoftware.cron4j/cron4j -->
	        <dependency>
	            <groupId>it.sauronsoftware.cron4j</groupId>
	            <artifactId>cron4j</artifactId>
	            <version>${cron4j.version}</version>
	        </dependency>
	
	        <!-- https://mvnrepository.com/artifact/org.apache.httpcomponents/httpclient -->
	        <dependency>
	            <groupId>org.apache.httpcomponents</groupId>
	            <artifactId>httpclient</artifactId>
	            <version>4.5.2</version>
	        </dependency>
	
	        <!-- https://mvnrepository.com/artifact/org.json/json -->
	        <dependency>
	            <groupId>org.json</groupId>
	            <artifactId>json</artifactId>
	            <version>20160810</version>
	        </dependency>
	
	    </dependencies>
	
	    <build>
	        <finalName>jfinal_jar_demo</finalName>
	
	        <!-- maven 插件 -->
	        <plugins>
	            <plugin>
	                <groupId>org.apache.maven.plugins</groupId>
	                <artifactId>maven-compiler-plugin</artifactId>
	                <version>2.3.2</version>
	                <configuration>
	                    <source>1.8</source>
	                    <target>1.8</target>
	                    <encoding>UTF-8</encoding>
	                </configuration>
	            </plugin>
	
	            <plugin>
	                <groupId>org.apache.maven.plugins</groupId>
	                <artifactId>maven-surefire-plugin</artifactId>
	                <configuration>
	                    <skip>true</skip>
	                </configuration>
	            </plugin>
	
	            <!--核心打成jar包插件-->
	            <plugin>
	                <groupId>org.apache.maven.plugins</groupId>
	                <artifactId>maven-jar-plugin</artifactId>
	                <version>2.6</version>
	                <configuration>
	                    <archive>
	                        <manifest>
	                            <addClasspath>true</addClasspath>
	                            <classpathPrefix>lib/</classpathPrefix>
	                            <mainClass>config.AppMain</mainClass>
	                        </manifest>
	                    </archive>
	                </configuration>
	            </plugin>
	
	            <plugin>
	                <groupId>org.apache.maven.plugins</groupId>
	                <artifactId>maven-dependency-plugin</artifactId>
	                <version>2.10</version>
	                <executions>
	                    <execution>
	                        <id>copy-dependencies</id>
	                        <phase>package</phase>
	                        <goals>
	                            <goal>copy-dependencies</goal>
	                        </goals>
	                        <configuration>
	                            <outputDirectory>${project.build.directory}/lib</outputDirectory>
	                        </configuration>
	                    </execution>
	                </executions>
	            </plugin>
	
	        </plugins>
	
	    </build>
	
	</project>

```

进入Terminal:

![](../jfinal-jar-main/20180810173519.png)

```

	生成target文件夹及对应的jar包
	D:\Codeware\jfinal_jar_demo>mvn install

	重新生成target文件夹及对应的jar包
	D:\Codeware\jfinal_jar_demo>mvn clean

```

<div class="tip">
  这里需要提前配置好电脑的maven，并且完成的进度要看下载速度。
</div>

启动的2种方法：

1.进入target文件夹使用**java -jar**命令：

```

	java -jar .\jfinal_jar_demo.jar

```

![](../jfinal-jar-main/20180810174050.png)

2.使用main方法启动：


![](../jfinal-jar-main/20180810174529.jpg)

看到定时器在跑：

![](../jfinal-jar-main/20180810175024.png)


<div class="tip">
  源码下载地址：https://github.com/porschan/back-end-demo/tree/master/jfinal_jar_demo
</div>
