---
title: 从http 到 https
date: ‎2018‎-‎7‎-19‎ ‏‎13:04:24
desc: chanchfieng.com
tags: https
---

http和https的原理和区别这里就不一一细谈，在搭建网站使用https的时候总结了以下。

这里使用的FreeSSL.org的免费证书

1.进入[FreeSSL.org](https://freessl.org/)的官网，以我的chanchifeng.com为例子，操作如下

![](../http-https/createSSL.gif)

到此，我们能能拿到DNS 验证，接下来就要到我们的服务器管理后台做如下配置，以阿里云为例子：

2.添加安全组规则的入方向，配置如下：

```

	授权策略:允许
	
	协议类型:自定义 TCP
	
	端口范围:443/443
	
	授权类型:地址段访问
	
	授权对象:0.0.0.0/0
	
	描述:xxx
	
	优先级:1

```

3.添加解析：进入云解析DNS -> 解析设置 -> 添加记录，配置如下：

```

	记录类型:TXT
	
	主机记录:_dnsauth
	
	解析线路(isp):默认
	
	记录值：201807030915543rmxzixgf0jvxjutfwf05g0p2n76ph29375r9ateh1spmhwmbe
	
	MX优先级：--
	
	TTL：10分钟

```

上面的主机记录和记录值为上面的DNS 验证的信息，配置完成如图：

![](../http-https/20180704170706.png)

4.手动验证，操作如下：

![](../http-https/checkSSL.gif)

5.验证并下载证书，操作如下：

![](../http-https/lookSSL.gif)

![](../http-https/20180704173153.png)

6.登录服务器，操作如下：

```

	1.将下载的证书的压缩包（里面的文件为：full_chain.pem和private.key）上传到/etc/ssl/private/路径下。
	
	2.修改nginx的配置如下：

	server {
	  listen 443;
	  server_name chanchifneg.com;
	  root /var/www/;
	  index index.html;
	  ssl on;
	  ssl_certificate /etc/ssl/private/full_chain.pem;
	  ssl_certificate_key /etc/ssl/private/private.key;
	  location ~* \.(?:ico|css|js|gif|jpe?g|png)$ {
	                expires max;
	                add_header Pragma public;
	                add_header Cache-Control "public, must-revalidate, proxy-revalidate";
	   }
	}
	
	server{
	    listen 80;
	    server_name chanchifeng.com www.chanchifeng.com;
	    return 301 https://chanchifeng.com$request_uri;
	}

	3.防火墙允许443端口访问：

	sudo ufw allow 443

	4.重启nginx.

	sudo service nginx force-reload
	sudo service nginx restart

```

完成，网站就能启动https了，如下：

![](../http-https/20180704174224.png)

存在的问题：
	1.阿里云有SSL证书，这里没有用到。
	2.不能显示二级域名如https://www.chanchifeng.com

PS:后续继续解决！