---
title: Bandwagonhost 切换 IP
date: ‎‎2018/7/24 11:01:20 
desc: chanchfieng.com
tags: [帮瓦工、IP]
---
# 背景 #

1.能ping通服务器IP。
2.不能通过tcping使用ssh、ssr服务的端口。
3.帮瓦工后台能正常访问。

## 步骤一：先换个ssh端口号，尝试将远程连接重现 ##

```
	
	1.更换端口为18724：

	vi /etc/ssh/sshd_config

	Port 18724 #修改为18724


	2.直接重启：
	reboot

```

## 问题来了，依旧不能ssh访问。 ##

感谢在[Bandwagonhost中文网](https://www.bandwagonhost.net/1990.html)中找到答案，可以换IP：

*	能 ping 通：因为 ping 采用的是 ICMP 报文，所有 ICMP 报文都被放行了；
*	不能登录 SSH：因为 SSH 采用的是 TCP 报文，所有 TCP 报文都被丢弃了。

## 免费换IP ##

搬瓦工现在可以免费更换被封的 IP，每 10 周可以更换一次，具体操作如下。此外，还是可以没有时间限制的通过付费随时更换 IP。

1.登录帮瓦工的账号，再访问[https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck](https://kiwivm.64clouds.com/main-exec.php?mode=blacklistcheck),如下图所示：

![](../Bandwagonhost-IP/20180724104251.png)

2.可以看出"IP BLOCKED",然后点击"Replace Main IP"按钮，获取获取IP，完成之后，如下图所示：

![](../Bandwagonhost-IP/20180724105613.png)

这样就成功切换IP，一切又恢复原来的宁静。

<div class="tip">
  下次要试试不用免费的换IP。。/哈哈。
</div>