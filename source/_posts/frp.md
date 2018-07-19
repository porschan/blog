---
title: frp初使用
date: ‎‎‎2018‎-6‎-15‎ ‏‎1:04:18
desc: chanchfieng.com
tags: frp
---

## 先star[fatedier/frp](https://github.com/fatedier/frp)，再开工。

## 什么是frp?

## frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. Now, it supports tcp, udp, http and https protocol when requests can be forwarded by domains to backward web services.

### 先看看[中文文档](https://github.com/fatedier/frp/blob/master/README_zh.md)

### 看完了，你要检查一下，你是否有公网IP的服务器一台，测试的电脑一台，如果符合这2个条件请往下看。

### 先下载[Releases](https://github.com/fatedier/frp/releases),我电脑用的是windows系统,服务器是linux系统，所以下载了frp_0.20.0_windows_amd64.zip和frp_0.20.0_linux_amd64.tar.gz文件。

```

把frp_0.20.0_linux_amd64.tar.gz弄到服务器中,这里我把文件放到/usr/local/frp：

tar -zxvf frp_0.20.0_linux_amd64.tar.gz

cd frp_0.20.0_linux_amd64

root@porschan:/usr/local/frp/frp_0.20.0_linux_amd64# sudo vi frps.ini

[common]
bind_port = 7000

vhost_http_port = 8080

dashboard_port = 7500
dashboard_user = DUSER_DUSER
dashboard_pwd = DPWD_DPWD

token = TOKEN_TOKEN

subdomain_host = chanchifeng.com

```

#### 这里DUSER_DUSER为仪表台的账号，dashboard_pwd为仪表台的密码，TOKEN_TOKEN为frp凭票（若填写，则frpc中需要填写正确，才能正确连接，可删除，subdomain_host为一级域名，此处是chanchifeng.com）

### 重要！重要！重要！需要防火墙允许7000,7500，8080端口访问

```

sudo ufw allow 7000
sudo ufw allow 7500
sudo ufw allow 8080端口访问

```

### 重要！重要！重要！还要在服务器商家确认是否需要添加安全组，我的是阿里云，需要上面的端口！

### 以chanchifeng.com域名为例子：DNS域名解析需要 *.chanchifeng.com 解析上。

```

把frp_0.20.0_windows_amd64.zip弄到测试电脑中，并解压：

修改frpc.ini：

[common]
server_addr = SADDR_SADDR
server_port = 7000
token = TOKEN_TOKEN

[porschan-web]

# $type://$subdomain.chanchifeng.com:$local_port
#	e.g. http://porschan.chanchifeng.com:8080/

type = http
local_port = 8080
subdomain = porschan

# 通过密码保护你的 web 服务
http_user = abc
http_pwd = abc

```

#### 这里SADDR_SADDR为服务器的公网IP，TOKEN_TOKEN为frp凭票（若填写，则frpc中需要填写正确，才能正确连接，可删除，local_port为你测试电脑下面的端口，subdomain为其二级域名，访问路径为$type://$subdomain.chanchifeng.com:$local_port，则[http://porschan.chanchifeng.com:8080/](http://porschan.chanchifeng.com:8080/)，这里我测试使用tomcat。


```

服务器启动：

root@porschan:/usr/local/frp/frp_0.20.0_linux_amd64# ./frps -c ./frps.ini 
2018/06/15 00:57:14 [I] [service.go:128] frps tcp listen on 0.0.0.0:7000
2018/06/15 00:57:14 [I] [service.go:161] http service listen on 0.0.0.0:8080
2018/06/15 00:57:14 [I] [service.go:205] Dashboard listen on 0.0.0.0:7500
2018/06/15 00:57:14 [I] [root.go:190] Start frps success

客户端启动：

PS C:\Users\chan\Desktop\frp\frp_0.20.0_windows_amd64> .\frpc -c .\frpc.ini
2018/06/15 00:57:42 [I] [proxy_manager.go:300] proxy removed: []
2018/06/15 00:57:42 [I] [proxy_manager.go:310] proxy added: [porschan-web]
2018/06/15 00:57:42 [I] [proxy_manager.go:333] visitor removed: []
2018/06/15 00:57:42 [I] [proxy_manager.go:342] visitor added: []
2018/06/15 00:57:42 [I] [control.go:246] [720bc9bba0978b63] login to server success, get run id [720bc9bba0978b63], server udp port [0]
2018/06/15 00:57:42 [I] [control.go:169] [720bc9bba0978b63] [porschan-web] start proxy success


启动完成后，客户端会出现如下：

2018/06/15 00:57:44 [I] [service.go:305] client login info: ip [14.213.158.103:7797] version [0.20.0] hostname [] os [windows] arch [amd64]
2018/06/15 00:57:44 [I] [proxy.go:291] [720bc9bba0978b63] [porschan-web] http proxy listen for host [porschan.chanchifeng.com] location []
2018/06/15 00:57:44 [I] [control.go:335] [720bc9bba0978b63] new proxy [porschan-web] success


Tomcat的命令行启动：

PS D:\Program Files\Tomcat\apache-tomcat-7.0.40-windows-x64\apache-tomcat-7.0.40\bin> .\catalina.bat run

访问仪表盘：http://chanchifeng.com:7500

访问二级域名：http://porschan.chanchifeng.com:8080/

```

### 最后这里启动仅是命令行，还没把frp服务弄到服务器中，只要重启或者关闭xshell窗口就会关闭，这里我学习了，一定要看frp的作者的readme.md和下载下来的frpc_full.ini和frps_full.ini，里面都是宝藏，ini文件与旧版本有些不一样，要学好看文档和多多分析啊啊啊。后续中，我会在把它弄到服务中，敬请期待，哈哈哈哈。