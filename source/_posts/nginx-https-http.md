---
title: nginx同时保持http和https
date: 2018/11/30 23:35:19
---
<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

我使用的nginx版本是1.9.7，直接post：

```

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
        listen       80;
        listen 443 ssl;
        server_name  www.xxxxx.com;
        #charset koi8-r;
        #access_log  logs/host.access.log  main;

		location / {    
            proxy_pass http://localhost:8080/gchourse/;  
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
        
        ssl_certificate      cert/1570524_www.xxxxx.com.pem;
        ssl_certificate_key  cert/1570524_www.xxxxx.com.key;

        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;

        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;

        location /mini {
            proxy_pass http://localhost:8090/mini;  
        }
        
        location /power {
            proxy_pass http://localhost:8090/power;
        }
    }

    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

}

```

<div class="tip">
	参考：nginx 配置站点 支持 http协议 80端口 https协议 443端口同时兼容访问 实例[https://www.jiloc.com/40422.html](https://www.jiloc.com/40422.html "https://www.jiloc.com/40422.html")
		
</div>