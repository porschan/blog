---
title: Nginx配置阿里云ssl证书使HTTPS生效
date: 2018/11/29 23:24:22 
desc: chanchfieng.com
tags: [windows , jdk]
---

从阿里云获取免费的SSL，解压后获取.pem和.key文件，以下直接POST数据（nginx.conf），参考：

```
    # HTTPS server
    #
    server {
        listen       443 ssl;
        server_name  wechat.chanchifeng.com;
    
        ssl_certificate      cert/1564577_wechat.chanchifeng.com.pem;
        ssl_certificate_key  cert/1564577_wechat.chanchifeng.com.key;
    
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
    
        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;
    
        location /mini {
            proxy_pass http://localhost:8081/mini;  
        }
        
        location /power {
            proxy_pass http://localhost:8081/power;
        }
    }

```

<div class="tip">
	ssl_certificate      cert/1564577_wechat.chanchifeng.com.pem;
	ssl_certificate_key  cert/1564577_wechat.chanchifeng.com.key;

	重点,配置中的1564577_wechat.chanchifeng.com.pem和1564577_wechat.chanchifeng.com.key文件是（nginx-1.9.7\conf）文件夹位置中。
	重点,配置中的1564577_wechat.chanchifeng.com.pem和1564577_wechat.chanchifeng.com.key文件是（nginx-1.9.7\conf）文件夹位置中。
	重点,配置中的1564577_wechat.chanchifeng.com.pem和1564577_wechat.chanchifeng.com.key文件是（nginx-1.9.7\conf）文件夹位置中。
	
</div>