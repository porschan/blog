---
title: Windows 下的MySQL即时打印SQL日志
---

两三句的SQL加上一个简单的查看日志程序就能帮助你在发现问题、编程或在某种环境下，查看MySQL的SQL操作的日志。

## 开始

### 阶段一，日志查看程序的准备

[BareTail](http://www.baremetalsoft.com/baretail/index.php) 和 [BareTailPro](http://www.baremetalsoft.com/baretailpro/index.php) 是一个很好的查看日志程序，将它下载下来。注意打开该程序的时候会出现欢迎的界面，该界面是找不到关闭的按钮的，过几秒就自动关闭，至于加了xxxPro和没有带Pro有什么区别，就收费与否的问题，咳咳咳。

### 阶段二，MySQL的设置

使用拥有足够权限的用户登录MySQL，并敲如下：

1. 查看MySQL日志打开情况信息 ： `SHOW VARIABLES LIKE "general_log%";`

2. 设置MySQL日志打开 ： `SET GLOBAL general_log = 'ON';`

3. 设置MySQL日志打印的路径 ： `SET GLOBAL general_log_file = "C:\\mysql2.log"`

注意：设置MySQL日志打印的路径分隔符`\`为`\\`，如果路径设置成功，但是不看到日志产生出来，可以手动创建日志文件，注意编码为utf-8。

### 最后

打开下载完成的BareTail 或者 BareTailPro 的软件 open，打开日志文件，此时准备工作已经完成，当你敲SQL语言或者进行某些操作的时候，日志打印在刚指定的路径下的日志文件，而且该日志查看软件能实时查看日志。

用完或者不需要的时候，一定把MySQL打印日志的功能关掉！
用完或者不需要的时候，一定把MySQL打印日志的功能关掉！
用完或者不需要的时候，一定把MySQL打印日志的功能关掉！

设置MySQL日志关闭 ： `SET GLOBAL general_log = 'OFF';`

然后再查看MySQL日志打开情况信息 ： `SHOW VARIABLES LIKE "general_log%";`

这里才大功告成！