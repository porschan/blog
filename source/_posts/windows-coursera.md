---
title: windows下修改hosts文件，使coursera能正常学习
date: 2018-12-24 13:11:49
---

## 找到hosts文件 ##

```
	windows:

	C:\Windows\System32\drivers\etc

	在hosts文件中尾部添加如下：
	52.84.246.72 d3c33hcgiwev3.cloudfront.net

```

## 刷新一下dns解析缓存 ##

```
	Microsoft Windows [版本 10.0.17134.472]
	(c) 2018 Microsoft Corporation。保留所有权利。
	
	C:\Users\chan>ipconfig/flushdns
	
	Windows IP 配置
	
	已成功刷新 DNS 解析缓存。
	
	C:\Users\chan>

```

<div class="tip">
	在实际操作中，会发现修改不了，我的做法是复制一份到桌面，然后使用文本编辑器直接修改完成后保存，再复制回原本的位置，覆盖即可。		
</div>

<div class="tip">
	参考：
	解决coursera可以登录但无法播放视频：[https://blog.csdn.net/wj1066/article/details/78972002](https://blog.csdn.net/wj1066/article/details/78972002 "https://blog.csdn.net/wj1066/article/details/78972002")
	Coursera无法观看课程解决方案：[https://jingyan.baidu.com/article/6f2f55a14059eeb5b93e6cab.html](https://jingyan.baidu.com/article/6f2f55a14059eeb5b93e6cab.html "https://jingyan.baidu.com/article/6f2f55a14059eeb5b93e6cab.html")

</div>