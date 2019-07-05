---
title: 使用 IDEA 中创建 JeeSite 的 web 项目
date: 2019-07-05 11:35:04
---

> JeeSite的官网：https://jeesite.gitee.io/

1.下载JeeSite4.x源代码：

```shell
git clone https://gitee.com/thinkgem/jeesite4.git
```

2.将克隆的项目下web拷贝到日常运行的项目文件夹下，操作如下图所示：

![](jeesite-curd/1.png)

3.复制后的项目如下图所示：

![](jeesite-curd/2.png)

4.将idea打开项目，操作如下：

![](jeesite-curd/3.png)

5.选择项目，如下图所示：

![](jeesite-curd/4.png)

6.项目结构如下图所示：

![](jeesite-curd/5.png)

7.修改application.yml的数据库信息：

```yml
# 数据库连接
jdbc: 
  
  # Mysql 数据库配置
  type: mysql
  driver: com.mysql.jdbc.Driver
  url: jdbc:mysql://127.0.0.1:3306/jeesite?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull
  username: root
  password: 123456
  testSql: SELECT 1
```

8.或者可以安装官方文档修改数据库的配置或者使用jeesite账号操作：

```sql
1）打开 my.ini 给 [mysqld] 增加如下配置：

sql_mode="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

2）如果遇到 ERROR 1709 (HY000): Index column size too large. The maximum column size is 767 bytes. 错误

  a）打开 my.ini 给 [mysqld] 增加如下配置：

innodb_large_prefix = ON
innodb_file_format = Barracuda
innodb_file_per_table = ON

  b）并修改报错的建表语句后面加上：ENGINE=InnoDB row_format=DYNAMIC;

# 若没有修改my.ini的权限也可以使用命令查看参数和设置参数：
show global variables like "innodb_large_prefix";
show global variables like "innodb_file_format";
show global variables like "innodb_file_per_table";
set global innodb_large_prefix=ON;
set global innodb_file_format=Barracuda;
set global innodb_file_per_table=ON;

创建用户和授权、初始化数据库

set global read_only=0;
set global optimizer_switch='derived_merge=off'; 
create user 'jeesite'@'%' identified by 'jeesite';
create database jeesite DEFAULT CHARSET 'utf8' COLLATE 'utf8_unicode_ci';   
grant all privileges on jeesite.* to 'jeesite'@'%' identified by 'jeesite';
flush privileges;
```

9.首次运行com.jeesite.test.InitCoreData#initCoreData，会出现如下的报错`java.lang.RuntimeException: 为了防止误操作，请运行时增加 -Djeesite.initdata=true 参数。`,添加参数，如下图所示：

![](jeesite-curd/6.png)

![](jeesite-curd/7.png)

10.参数如下：

```shell
-ea -Djeesite.initdata=true
```

11.重新运行com.jeesite.test.InitCoreData#initCoreData，查看jeesite数据库,如下图所示：

![](jeesite-curd/8.png)

12.添加需求的表(应聘信息和学历信息)，SQL如下图所示：

```sql
CREATE TABLE `test_education` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `empid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键',
  `begindate` date DEFAULT NULL COMMENT '开始时间',
  `enddata` date DEFAULT NULL COMMENT '结束时间',
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学校',
  `degree` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学位',
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `test_employees` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年纪',
  `political` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '政治面貌',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `blood` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '血型q',
  `constellation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '星座',
  `hobby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '兴趣爱好',
  `residence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '户口所在地',
  `householdregister` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '户籍-农业-非农业',
  `archives` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '档案所在地',
  `foreignlanguages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外语',
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外语水平',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住地址',
  `presenttreatment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '目前待遇',
  `expectedtreatment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '期望待遇',
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '获取途径',
  `jobapplication` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请职位',
  `otherskill` text COLLATE utf8_unicode_ci COMMENT '其他技能',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

13.全部表如下图所示：

![](jeesite-curd/9.png)

14.启动项目com.jeesite.modules.Application#main，默认登录账号`system`,密码如下`admin`,效果图如下：

![](jeesite-curd/10.png)

15.点击研发工具 -> 代码生成工具 -> 右上角的添加，如下图所示：

![](jeesite-curd/11.png)

16.选择test_employees表，选择下一步，如下图所示：

![](jeesite-curd/12.png)

17.填写生成配置信息，如下图所示：

![](jeesite-curd/13.png)

18.表的结构，保持默认状态，如下图所示：

![](jeesite-curd/14.png)

19.配置生成信息，如下图所示：

![](jeesite-curd/15.png)

20.选择test_education表，选择如下图所示：

![](jeesite-curd/16.png)

21.配置生成信息，如下图所示：

![](jeesite-curd/17.png)

22.表的结构，保持默认状态，如下图所示：

![](jeesite-curd/18.png)

23.配置完成子表，如下图所示：

![](jeesite-curd/19.png)

24.选择研发工具 -> 代码生成工具 -> test_employees列中的编辑按钮，如下图所示：

![](jeesite-curd/20.png)

25.点击覆盖文件，再次点击保存并生成代码，如下图所示：

![](jeesite-curd/21.png)

26.点击系统设置 -> 菜单管理 -> 右上角的新增的按钮，如下图是所示：

![](jeesite-curd/22.png)

27.设置一级菜单，如下图所示：

![](jeesite-curd/23.png)

28.添加二级菜单，如下图所示：

![](jeesite-curd/24.png)

29.设置二级菜单，如下图所示：

![](jeesite-curd/25.png)

30.菜单中的链接和权限标识如下图所示，其中链接为下图中第一个红色框，主要注解为RequestMapping，如下图所示：

![](jeesite-curd/26.png)

31.而权限标识如下图第一个红色框已经上图第二个红色框，主要注解为@RequiresPermissions，如下图所示：

![](jeesite-curd/27.png)

31.点击权限管理 -> 角色管理 -> 选择系统管理员 中的功能菜单，如下图所示：

![](jeesite-curd/28.png)

32.选择一级菜单（应聘管理）以及二级菜单（应聘人员列表），如下图所示：

![](jeesite-curd/29.png)

33.此时，重启项目，即可用`system`来进行应聘管理中的应聘人员列表，菜单如下图所示：

![](jeesite-curd/30.png)

34.填写表单如下图所示：

![](jeesite-curd/31.png)

35.填写学历信息，如下图所示：

![](jeesite-curd/32.png)

36.填写完成后提交成功后，后台显示记录，如下图所示：

![](jeesite-curd/33.png)

37.查询数据库，数据已经入库，一个页面的功能模块（SPA）已经完成了，如下所示：

![](jeesite-curd/34.png)

![](jeesite-curd/35.png)

> 参考:
>
> 1.环境搭建、部署运行、修改包名、正式部署:<https://jeesite.gitee.io/docs/install-deploy/>
>
> 2.【汇智学堂】JeeSite4使用代码生成一对多（主子表）增删改查模板:<https://blog.csdn.net/qq_38187437/article/details/80051298>