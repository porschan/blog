---
title: 在windows下使用bat文件跑命令
date: 2018/11/12 13:16:56
---

## 一次执行hexo clean,hexo generate,hexo server的hexo命令 ##

catalina.bat：
```
	@echo off
	echo hexo clean 开始执行..
	call cmd /c "hexo clean"
	
	echo hexo generate 开始执行..
	call cmd /c "hexo generate"
	
	echo hexo server 开始执行..
	call cmd /c "hexo server"


```

## 一次复制public目录到github目录 ##

copyPublic.bat：
```
	@echo off 
	echo y|xcopy D:\Gitware\source.porschan.github.io\public\*.* D:\Gitware\porschan.github.io\ /s /e /y

```

### 运行 ###

在cmd界面运行catalina.bat或者copyPublic.bat即可。

<div class="tip">
	保存.bat文件出现中文乱码一定要把编码保存为ANSI/ASCII格式！
	![](../hexo-cmd-windows-bat/20181112132213.jpg)
</div>