---
title: nginx - 基本配置
date: 2019-02-22 17:39:14
---
<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>
```
	
	1.下载nginx:
	porschan@porschan-virtual-machine:~$ wget http://nginx.org/download/nginx-1.14.2.tar.gz
	
	2.解压nginx:
	porschan@porschan-virtual-machine:~$ tar -xzf nginx-1.14.2.tar.gz 
	
	目录：
	auto	-	辅助configure文件提供服务
	CHANGES	-	 版本特性历史
	CHANGES.ru	-	 版本特性历史(俄罗斯语言)
	conf - configure 的demo
	configure - 配置文件
	contrib	-	脚本（nginx 语法标色）
	html	-	50x错误跳转页面和首页
	LICENSE
	man	-	 帮助文件
	README
	src	-	 源代码
	objs - 中间文件
	
	3.cp -r contrib/vim/* ~/.vim/
	
	(未成功)sudo cp -r /contrib/vim/* ~/.vim/
	
	4.查看安装情况：
	porschan@porschan-virtual-machine:~/nginx-1.14.2$ ./configure --help | more
	with(默认不添加)、without(默认添加)
	
	5.编译：
	porschan@porschan-virtual-machine:~/nginx-1.14.2$ ./configure --help | more
	
	6.
	./configure --prefix=/home/geek/nginx
	
	7.
	make && make install

```