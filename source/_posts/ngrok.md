---
title: ngrok初使用
date: ‎2018/7/20 9:36:00
---

# 登录ngrok #

[点击登录ngrok登录页面](https://dashboard.ngrok.com/user/login)，没有注册的可以先注册。

![](../ngrok/20180720094135.png)

# 第一步，下载对应系统版本的ngrok #

![](../ngrok/20180720094313.png)

我直接点击**Download for Windows**,下载之后的压缩包名称为**ngrok-stable-windows-amd64.zip**。

# 第二步，解压压缩包并运行 #

将下载完成的解压，我的是**ngrok-stable-windows-amd64.zip**，解压完成的文件夹内文件如下：

![](../ngrok/20180720094655.png)

# 第三步，运行并得到渗透 #

1.先关联你的账号，copy你的信息，如下图：

![](../ngrok/20180720094905.png)

2.运行ngrok,输入复制后的authtoken,回车得到如下图：

```

	ngrok authtoken 63tbPkLsBapi8VRbd被你看到了哈哈H2tWUEL

```

![](../ngrok/20180720095005.png)

3.设置访问的端口号，并在控制台查看访问地址。

控制台的地址：[http://localhost:4040](http://localhost:4040)

```

	ngrok http 80

```

控制台打印的如下图：

![](../ngrok/20180720095459.png)

打开ngrok的后台控制台：

![](../ngrok/20180720095623.png)

点击其中一个地址，就能访问到你的内网的web应用。

![](../ngrok/20180720095707.png)

总结一下：给我的感觉，ngrok配置简单，访问速度还挺快，相对于frp无需配置或者需要更多的东西（服务器、域名等等），ngrok用于给身边的朋友同事展示自己的web应用，而frp更多给我的是配置企业微信或者微信公众平台的可信域名，对应2者的使用，哪个简单方便用哪个，给自己增加一个技能拓展，哈哈哈。