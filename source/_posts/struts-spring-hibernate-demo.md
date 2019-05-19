---
title: 使用 IDEA 中创建 Struts-Spring-Hibernate 的 web 项目
date: 2019-05-18 23:59:20
---

> 以下例子主要使用了sxjlinux在csdn上面的例子：[idea使用Maven创建web服务，并搭建ssh框架使用tomcat运行](https://blog.csdn.net/sunxiaoju/article/details/81007709)

1.新建一个空项目。

2.选择maven工程，这里简历的是最基础的maven工程，不需要自带的模板，如下图：

![](struts-spring-hibernate-demo/1.png)

3.在GroupId和ArtifactId分别填写com.chanchifeng和demo，如下图所示：

![](struts-spring-hibernate-demo/2.png)

4.在Project name和Project location中分别填写demo和对于的项目路径，如下图所示：

![](struts-spring-hibernate-demo/3.png)

5.新建一个web目录，操作如下图所示：

![](struts-spring-hibernate-demo/4.png)

6.填写webapp,如下图所示：

![](struts-spring-hibernate-demo/5.png)

7.设置目录并让IDEA生成WEB-INF文件夹和web.xml，如下图所示：

![](struts-spring-hibernate-demo/6.png)

![](struts-spring-hibernate-demo/7.png)

8.选择webapp的目录，操作如下图所示：

![](struts-spring-hibernate-demo/8.png)

9.添加web.xml,如下图所示：

![](struts-spring-hibernate-demo/9.png)

10.设置web.xml的位置，注意，这里必须要以webapp的目录位置为准，如下图所示：

![](struts-spring-hibernate-demo/10.png)

11.设置完成，点击Apply和OK，即可自动生成WEB-INF和web.xml，如下图所示：

![](struts-spring-hibernate-demo/11.png)

12.下图即生成后的项目结构，如下图：

![](struts-spring-hibernate-demo/12.png)

13.使用maven下载对应依赖的jar包，代码如下：

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.chanchifeng</groupId>
    <artifactId>demo</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.7</maven.compiler.source>
        <maven.compiler.target>1.7</maven.compiler.target>

        <spring-version>5.0.7.RELEASE</spring-version>
        <hibernate-version>5.3.1.Final</hibernate-version>
        <struts-version>2.5.14.1</struts-version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.11</version>
            <scope>test</scope>
        </dependency>

        <!-- 添加Hibernate依赖 -->
        <!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-core -->
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>${hibernate-version}</version>
        </dependency>

        <!-- struts2 -->
        <!-- https://mvnrepository.com/artifact/org.apache.struts/struts2-core -->
        <dependency>
            <groupId>org.apache.struts</groupId>
            <artifactId>struts2-core</artifactId>
            <version>${struts-version}</version>
        </dependency>

        <!-- struts2 spring  整合的核心包-->
        <!-- https://mvnrepository.com/artifact/org.apache.struts/struts2-spring-plugin -->
        <dependency>
            <groupId>org.apache.struts</groupId>
            <artifactId>struts2-spring-plugin</artifactId>
            <version>${struts-version}</version>
        </dependency>

        <!-- spring -->
        <!-- https://mvnrepository.com/artifact/org.springframework/spring-core -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-jdbc -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-beans -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-beans</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-web -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-expression -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-expression</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.springframework/spring-orm -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-orm</artifactId>
            <version>${spring-version}</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/cglib/cglib -->
        <dependency>
            <groupId>cglib</groupId>
            <artifactId>cglib</artifactId>
            <version>3.2.6</version>
        </dependency>

        <!--spring aop包  注释方式使用事务管理 可以不引用-->
        <!-- https://mvnrepository.com/artifact/org.aspectj/aspectjrt -->
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjrt</artifactId>
            <version>1.9.0</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver -->
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjweaver</artifactId>
            <version>1.9.0</version>
        </dependency>

        <!-- 添加对数据库的支持 -->
        <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
        <!--<dependency>-->
        <!--<groupId>mysql</groupId>-->
        <!--<artifactId>mysql-connector-java</artifactId>-->
        <!--<version>8.0.11</version>-->
        <!--</dependency>-->

        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.46</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/com.mchange/c3p0 -->
        <dependency>
            <groupId>com.mchange</groupId>
            <artifactId>c3p0</artifactId>
            <version>0.9.5.1</version>
        </dependency>

        <!-- log4j -->
        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>

    </dependencies>

    <build>
        <finalName>ssh-webapp2</finalName>
        <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
            <plugins>
                <plugin>
                    <artifactId>maven-clean-plugin</artifactId>
                    <version>3.1.0</version>
                </plugin>
                <!-- see http://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_war_packaging -->
                <plugin>
                    <artifactId>maven-resources-plugin</artifactId>
                    <version>3.0.2</version>
                </plugin>
                <plugin>
                    <artifactId>maven-compiler-plugin</artifactId>
                    <version>3.8.0</version>
                </plugin>
                <plugin>
                    <artifactId>maven-surefire-plugin</artifactId>
                    <version>2.22.1</version>
                </plugin>
                <plugin>
                    <artifactId>maven-war-plugin</artifactId>
                    <version>3.2.2</version>
                </plugin>
                <plugin>
                    <artifactId>maven-install-plugin</artifactId>
                    <version>2.5.2</version>
                </plugin>
                <plugin>
                    <artifactId>maven-deploy-plugin</artifactId>
                    <version>2.8.2</version>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>

</project>
```

14.在resources下创建applicationContext.xml，操作如下图：

![](struts-spring-hibernate-demo/13.png)

15.applicationContext.xml的代码如下：

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

<context:component-scan base-package="com.chanchifeng.action"></context:component-scan>
    <context:component-scan base-package="com.chanchifeng.service"></context:component-scan>
    <context:component-scan base-package="com.chanchifeng.dao"></context:component-scan>

    <!--配置使springframwork引入jdbc.properties文件，然后就可以通过${mysql.driverClassName}来得到jdbc.properties文件中对应的值了-->
    <bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="location" value="classpath:jdbc.properties"/>
    </bean>

    <!-- 设置数据源连接字符串 -->
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="driverClass" value="${mysql.driverClassName}"></property>
        <property name="jdbcUrl" value="${mysql.url}"></property>
        <property name="user" value="${mysql.username}"></property>
        <property name="password" value="${mysql.password}"></property>
        <!-- 设置数据库连接池的最大连接数 -->
        <property name="maxPoolSize">
            <value>50</value>
        </property>
        <!-- 设置数据库连接池的最小连接数 -->
        <property name="minPoolSize">
            <value>5</value>
        </property>
        <!-- 设置数据库连接池的初始化连接数 -->
        <property name="initialPoolSize">
            <value>5</value>
        </property>
        <!-- 设置数据库连接池的连接最大空闲时间 -->
        <property name="maxIdleTime">
            <value>20</value>
        </property>
        <!-- c3p0缓存Statement的数量数 -->
        <property name="maxStatements">
            <value>50</value>
        </property>
        <!-- 当连接池里面的连接用完的时候,C3P0一下获取新的连接数 -->
        <property name="acquireIncrement">
            <value>20</value>
        </property>
    </bean>

    <!-- hibernate 管理-->
    <bean id="sessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
        <!-- 引用上面设置的数据源 -->
        <property name="dataSource">
            <ref bean="dataSource"/>
        </property>

        <property name="hibernateProperties">
            <props>
                <prop key="hibernate.dialect">org.hibernate.dialect.MySQLDialect</prop>
                <prop key="hibernate.autoReconnect">true</prop>
                <prop key="hibernate.connection.autocommit">true</prop>
                <prop key="hibernate.hbm2ddl.auto">update</prop>
                <prop key="hibernate.show_sql">true</prop>
                <prop key="hibernate.format_sql">true</prop>
                <!-- 解决session关闭问题 -->
                <prop key="hibernate.enable_lazy_load_no_trans">true</prop>
                <!-- spring 和 hibernate 整合的时候默认就是使用线程的，下面这一行不用写，写了反而要报错，此外 sessionFaction，不能使用openSession
                 既不能保存数据到数据库，还不能实现事务功能
                 -->
                <!--<prop key="current_session_context_class">thread</prop>-->

                <prop key="hibernate.max_fetch_depth">3</prop>
                <!--<prop key="hibernate.connection.url" >jdbc:mysql://localhost:3306/webapp</prop>-->
                <prop key="hibernate.connection.url" >jdbc:mysql://localhost:3306/webapp</prop>
                <!--<prop key="hibernate.connection.driver_class">com.mysql.jdbc.Driver</prop>-->
                <prop key="hibernate.connection.driver_class">com.mysql.jdbc.Driver</prop>
            </props>
        </property>

    </bean>

    <!-- 用注解来实现事物管理 -->
    <bean id="txManager" class="org.springframework.orm.hibernate5.HibernateTransactionManager">
        <property name="sessionFactory" ref="sessionFactory"/>
    </bean>

    <tx:annotation-driven transaction-manager="txManager"/>

</beans>
```

16.在resources创建jdbc.properties，操作如下：

![](struts-spring-hibernate-demo/14.png)

17.jdbc.properties代码如下：

```
mysql.driverClassName = com.mysql.jdbc.Driver
mysql.url = jdbc:mysql://localhost:3306/webapp?autoReconnect=true&useSSL=false&characterEncoding=utf-8
mysql.username = root
mysql.password = 1qaz2wsx
```

18.在resources下创建struts.xml，操作如下图：

![](struts-spring-hibernate-demo/15.png)

19.struts.xml代码如下：

```
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE struts PUBLIC
        "-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
        "http://struts.apache.org/dtds/struts-2.5.dtd">

<struts>

    <!-- 修改常量管理struts 中的action的工程，这个常量的使用，必须引入 spring和struts的整合包，不然spring无法管理struts2 Action 中的实体类-->
    <constant name="struts.objectFactory" value="spring" />

    <package name="employee" extends="struts-default" namespace="/">
        <action name="user_*" class="userAction" method="{1}">
            <result name="success">/index.jsp</result>
            <allowed-methods>m1,saveUser</allowed-methods><!-- struts 2.5 之后，使用通配符必须加上这一行 ，否则无法使用通配符访问-->
        </action>
    </package>

</struts>
```

20.在resources下创建model文件夹，操作如下图所示：

![](struts-spring-hibernate-demo/16.png)

21.创建数据库webapp,注意这里类型必须为utf-8，SQL代码如下：

```sql
/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : webapp

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/05/2019 00:21:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'porschan');

SET FOREIGN_KEY_CHECKS = 1;
```
22.测试idea的Database，操作如下：

![](struts-spring-hibernate-demo/17.png)

23.测试本地MySQL，注意新版本的IDEA注意要选择Driver，首次连接数据库需要下载mysql连接驱动包，如下图两张所示：

![](struts-spring-hibernate-demo/18.png)

![](struts-spring-hibernate-demo/20190517115635.png.png)

![](struts-spring-hibernate-demo/19.png)

24.当前项目仍为设置hibernate信息，左下角未有Persistence的菜单，这里需要先配置，打开项目配置窗口，操作如下图：

![](struts-spring-hibernate-demo/20.png)

25.先设置Spring的配置文件，如下图所示：

![](struts-spring-hibernate-demo/21.png)

26.选择ApplicationContext.xml，操作如下图所示：

![](struts-spring-hibernate-demo/22.png)

27.添加hibernate文件，操作如下图所示：

![](struts-spring-hibernate-demo/23.png)

28.选择module,操作如下图所示：

![](struts-spring-hibernate-demo/24.png)

29.配置完成后，点击Apply和OK，操作如下图所示：

![](struts-spring-hibernate-demo/25.png)

30.配置完成后，出现Persistence,如下图所示：

![](struts-spring-hibernate-demo/26.png)

31.点击Persistence菜单，选择的demo后右键，选择Generate Persistence Mapping 后再选择By Database Schema，操作如下图所示：

![](struts-spring-hibernate-demo/27.png)

32.信息填写如下图：

![](struts-spring-hibernate-demo/28.png)

33.点击OK后，再次选择Yes,如下图所示：

![](struts-spring-hibernate-demo/29.png)

34.在model包内生成了User.java和User.hbm.xml，由于我们设定了src文件夹是存放代码的，resource文件夹是存放资源的，因此intellij在编译的时候会忽略src文件夹下面的xml文件，导致最后发布的文件夹下面丢失了这些映射文件，所以将User.hbm.xml移动到resources中的model，操作如下图所示：

![](struts-spring-hibernate-demo/30.png)

35.当前的目录结构如下图所示：

![](struts-spring-hibernate-demo/31.png)

36.创建index.jsp,操作如下图所示：

![](struts-spring-hibernate-demo/39.png)

37.index.jsp代码如下：

```html
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 引入struts2 的标签库--%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>ssh测试</title>
</head>
<body>

<%-- 获取值栈中的user对象的uname的值--%>
用户名1： <s:property value="user.uname"></s:property>
</body>
</html>
```

38.完整的项目结构如下图所示，其余源码在下补上：

![](struts-spring-hibernate-demo/40.png)

39.UserAction：

```java
import com.chanchifeng.model.User;
import com.chanchifeng.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {

    private User user;

    @Resource
    private UserService userService;

    public User getUser(){
        return user;
    }
    public String m1(){
        user=userService.getUser(1);
        System.out.println(user.getUname());
        return SUCCESS;
    }
    public String saveUser(){
        User user=new User();
        user.setUname("事务已提交");
        userService.saveUser(user);
        return SUCCESS;
    }
}
```

40.UserDaoImpl：

```java
import com.chanchifeng.dao.UserDao;
import com.chanchifeng.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import javax.annotation.Resource;

@Repository("userDao")
public class UserDaoImpl implements UserDao {


    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public User getUser(Integer uid){
        Session session=sessionFactory.getCurrentSession();
        //当getCurrentSession所在的方法，或者调用该方法的方法绑定了事务之后，session就与当前线程绑定了，也就能通过currentSession来获取，否则就不能。
        User user=session.get(User.class,uid);
        return user;
    }

    @Override
    public void saveUser(User user){
        Session session=sessionFactory.getCurrentSession();
        session.save(user);
        System.out.println("======="+user.getUname());
        //使用getCurrentSession后，hibernate 自己维护session的关闭，写了反而会报错
    }
}
```

41.UserDao：

```java
import com.chanchifeng.model.User;

public interface UserDao {
    User getUser(Integer uid);
    void saveUser(User user);
}
```

42.UserServiceImpl：

```java
import com.chanchifeng.dao.UserDao;
import com.chanchifeng.model.User;
import com.chanchifeng.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {

    /**
     * 依赖Dao
     */
    @Resource
    private UserDao userDao;

    @Transactional(rollbackFor = {Exception.class, RuntimeException.class})
    @Override
    public User getUser(Integer uid) {
        return userDao.getUser(uid);
    }

    /**
     * 注入事务管理
     * @param user
     */
    @Transactional(rollbackFor = {Exception.class, RuntimeException.class})
    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }
}
```

43.UserService：

```java
import com.chanchifeng.model.User;

public interface UserService {
    User getUser(Integer uid);
    void saveUser(User user);
}
```

44.User：

```java
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
    private Integer uid;
    private String uname;

    @Id
    @Column(name = "uid")
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "uname")
    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        User user = (User) o;

        if (uid != null ? !uid.equals(user.uid) : user.uid != null) {
            return false;
        }
        if (uname != null ? !uname.equals(user.uname) : user.uname != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = uid != null ? uid.hashCode() : 0;
        result = 31 * result + (uname != null ? uname.hashCode() : 0);
        return result;
    }
}
```

45.User.hbm.xml：

```xml
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-mapping PUBLIC
    "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
    "http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">
<hibernate-mapping>

    <class name="com.chanchifeng.model.User" table="user" schema="webapp">
        <id name="uid" column="uid"/>
        <property name="uname" column="uname"/>
    </class>
</hibernate-mapping>
```

46.完整的applicationContext.xml：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context" xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

<context:component-scan base-package="com.chanchifeng.action"></context:component-scan>
    <context:component-scan base-package="com.chanchifeng.service"></context:component-scan>
    <context:component-scan base-package="com.chanchifeng.dao"></context:component-scan>

    <!--配置使springframwork引入jdbc.properties文件，然后就可以通过${mysql.driverClassName}来得到jdbc.properties文件中对应的值了-->
    <bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="location" value="classpath:jdbc.properties"/>
    </bean>

    <!-- 设置数据源连接字符串 -->
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="driverClass" value="${mysql.driverClassName}"></property>
        <property name="jdbcUrl" value="${mysql.url}"></property>
        <property name="user" value="${mysql.username}"></property>
        <property name="password" value="${mysql.password}"></property>
        <!-- 设置数据库连接池的最大连接数 -->
        <property name="maxPoolSize">
            <value>50</value>
        </property>
        <!-- 设置数据库连接池的最小连接数 -->
        <property name="minPoolSize">
            <value>5</value>
        </property>
        <!-- 设置数据库连接池的初始化连接数 -->
        <property name="initialPoolSize">
            <value>5</value>
        </property>
        <!-- 设置数据库连接池的连接最大空闲时间 -->
        <property name="maxIdleTime">
            <value>20</value>
        </property>
        <!-- c3p0缓存Statement的数量数 -->
        <property name="maxStatements">
            <value>50</value>
        </property>
        <!-- 当连接池里面的连接用完的时候,C3P0一下获取新的连接数 -->
        <property name="acquireIncrement">
            <value>20</value>
        </property>
    </bean>

    <!-- hibernate 管理-->
    <bean id="sessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
        <!-- 引用上面设置的数据源 -->
        <property name="dataSource">
            <ref bean="dataSource"/>
        </property>

        <property name="hibernateProperties">
            <props>
                <prop key="hibernate.dialect">org.hibernate.dialect.MySQLDialect</prop>
                <prop key="hibernate.autoReconnect">true</prop>
                <prop key="hibernate.connection.autocommit">true</prop>
                <prop key="hibernate.hbm2ddl.auto">update</prop>
                <prop key="hibernate.show_sql">true</prop>
                <prop key="hibernate.format_sql">true</prop>
                <!-- 解决session关闭问题 -->
                <prop key="hibernate.enable_lazy_load_no_trans">true</prop>
                <!-- spring 和 hibernate 整合的时候默认就是使用线程的，下面这一行不用写，写了反而要报错，此外 sessionFaction，不能使用openSession
                 既不能保存数据到数据库，还不能实现事务功能
                 -->
                <!--<prop key="current_session_context_class">thread</prop>-->

                <prop key="hibernate.max_fetch_depth">3</prop>
                <!--<prop key="hibernate.connection.url" >jdbc:mysql://localhost:3306/webapp</prop>-->
                <prop key="hibernate.connection.url" >jdbc:mysql://localhost:3306/webapp</prop>
                <!--<prop key="hibernate.connection.driver_class">com.mysql.jdbc.Driver</prop>-->
                <prop key="hibernate.connection.driver_class">com.mysql.jdbc.Driver</prop>
            </props>
        </property>
        <property name="annotatedClasses">
            <list>
                <value>com.chanchifeng.model.User</value>
            </list>
        </property>
        <property name="mappingLocations">
            <list>
                <value>classpath:/model/User.hbm.xml</value>
            </list>
        </property>

    </bean>

    <!-- 用注解来实现事物管理 -->
    <bean id="txManager" class="org.springframework.orm.hibernate5.HibernateTransactionManager">
        <property name="sessionFactory" ref="sessionFactory"/>
    </bean>

    <tx:annotation-driven transaction-manager="txManager"/>

</beans>
```

47.web.xml：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">

    <display-name>Archetype Created Web Application</display-name>

    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
    </context-param>

    <!-- 配置 Struts2 的 Filter -->

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

</web-app>
```

48.添加web容器的Tomcat，如下图所示：

![](struts-spring-hibernate-demo/32.ng)

![](struts-spring-hibernate-demo/33.png)

![](struts-spring-hibernate-demo/34.png)

49.点击Fix，操作如下图所示：

![](struts-spring-hibernate-demo/35.png)

50.添加war，操作如下图：

![](struts-spring-hibernate-demo/36.png)

51.修改项目路径，操作如下图所示：

![](struts-spring-hibernate-demo/37.png)

52.启动Tomcat，如下图所示：

![](struts-spring-hibernate-demo/38.png)

53.测试应用，在浏览器上输入http://localhost:8080/webapp3/user_m1。

![](struts-spring-hibernate-demo/41.png)