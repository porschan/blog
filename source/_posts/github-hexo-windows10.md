---
title: github下载并搭建hexo环境
date: 2018/11/11 23:51:01
---

<div class="tip">
	来历：
		
	自身的特点：

	适合解决的问题：
		
	实际的应用场景：从github下载的hexo主题的博客项目如何再本地运行。
</div>

## 前提：环境预先搭建完成 ##

![](../github-hexo-windows10/20181111235623.jpg)

```
	$ node -v

	$ hexo -v

	$ git --version


```

## git clone ##


![](../github-hexo-windows10/20181111164528.jpg)

![](../github-hexo-windows10/20181111164550.jpg)

```
	$ git clone https://github.com/porschan/source.porschan.github.io.git

```

## [可选]不使用npm install ##

官方的推荐的使用如下：
![](../github-hexo-windows10/20181112000623.jpg)
我遇到的报错如下：
![](../github-hexo-windows10/20181112000814.jpg)

切换npm为cnpm:
```
	$ npm install -g cnpm --registry=https://registry.npm.taobao.org

	$ cnpm install vue-cli -g

	$ cnpm install


```

## [可选]遇到markdownPad不能直接显示图片 ##

```
	$ npm install hexo-asset-image --save

```

## 最后运行hexo ##

```
	$ hexo generate

	$ hexo server

```

## 预览效果 ##

浏览器输入localhost:400

<div class="tip">
	参考文章：
	1.[npm run dev 报错求助啊](https://ask.csdn.net/questions/374320)
	2.[hexo生成博文插入图片](https://blog.csdn.net/sugar_rainbow/article/details/57415705)
</div>