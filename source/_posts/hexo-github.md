---
title: 使用hexo建立主题，并发布到github
date: ‎‎2018‎-‎6‎-‎15‎ 0:28:16
---

### 根据[hexo官网的概述](https://hexo.io/zh-cn/docs/index.html)和[hexo官网的建站](https://hexo.io/zh-cn/docs/setup.html)，搭建最开始的hexo博客。

```

1.环境预先安装好node.js和git

2.npm安装hexo：

$ npm install -g hexo-cli

3.进入对应目录：

$ hexo init <folder>
$ cd <folder>
$ npm install

4.进入使用命令行：

$ hexo clean
$ hexo g
$ hexo s

5.查看本地运行的hexo

localhost:4000

```

### 下载对应的[主题](https://hexo.io/themes/),这里，我选择了Anatole主题。不同的主题会有不一样的修改，查看主题发布者的对主题的提示就可以完成一个属于自己的主题内容的hexo博客，这里不一一叙述。

```

1.重新清理并发布到本地查看博客：

$ hexo clean
$ hexo g
$ hexo s

```

### 在此，我的github仓库中有blog和porschan.github.io的命名的profile，其中blog是存放我blog源码的仓库，而porschan.github.io存放在blog中public生成的静态文件，在此，我写了一个简陋的bat文件，能把在电脑上面blog中的public中的静态网站文件复制到porschan.github.io文件中。

```

copyS.bat:

@echo off 
echo y|xcopy D:\Codeware\profile\blog\public\*.* D:\Codeware\profile\porschan.github.io\ /s /e /y

运行例子：

PS D:\Codeware\profile\blog> .\copyPublic.bat

```

### 最后po一下我的blog和porschan.github.io的电脑文件结构，上次到github使用GitHub Desktop（简单，快捷，非常不错），下载安装hexo的时候需要点耐心！

```

--	blog
		+	node_modules
		+	public
		+	scaffolds
		+	source
		+	themes
		+	themesSourse
		+	.gitattributes
		+	.gitignore
		+	_config.yml
		+	_config.yml_bak
		+	copyPublic.bat
		+	db.json
		+	package.json
		+	README.md

--	porschan.github.io
		+	2018
		+	about
		+	archives
		+	css
		+	fonts
		+	images
		+	js
		+	links
		+	page
		+	.gitattributes
		+	index.html
		+	README.md

```

