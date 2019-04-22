---
title: windows - 虚拟机安装 ubunt
date: 2019-02-17 16:50:36
---
1.这里使用的VMware Workstation软件，打开该软件。

2.点击创建新的虚拟机，如下图：

![](windows-install-ubunt-vm/1.png)

3.选择典型，如下图：

![](windows-install-ubunt-vm/2.png)

4.选择稍后安装操作系统，如下图：

![](windows-install-ubunt-vm/3.png)

5.客户机操作系统选择Linux，版本选择Ubuntu,如下图：

![](windows-install-ubunt-vm/4.png)

6.虚拟机名称和位置可以根据你的具体位置设置，如下图：

![](windows-install-ubunt-vm/5.png)

7.使用默认最低配置，如下图：

![](windows-install-ubunt-vm/6.png)

8.点击自定义硬件，如下图：

![](windows-install-ubunt-vm/7.png)

9.将硬件中的设备去掉不需要的，设置适合配置的内存，处理器，修改最终如下图：

![](windows-install-ubunt-vm/8.png)

10.点击CD/DVD,如下图：

![](windows-install-ubunt-vm/9.png)

11.点击浏览，如下图：

![](windows-install-ubunt-vm/10.png)

12.选择ubunt的iso对应的路径，如下图：

![](windows-install-ubunt-vm/11.png)

13.点击开启此虚拟机，如下图：

![](windows-install-ubunt-vm/12.png)

14.点击确定，如下图：

![](windows-install-ubunt-vm/13.png)

15.点击Install Ubunt，如下图：

![](windows-install-ubunt-vm/14.png)

16.点击Continue,如下图：

![](windows-install-ubunt-vm/15.png)

17.点击Install Now，如下图：

![](windows-install-ubunt-vm/16.png)

18.点击Continue，如下图：

![](windows-install-ubunt-vm/17.png)

19.在输入框中输入Shanghai,点击Continue,如下图：

![](windows-install-ubunt-vm/18.png)

20.默认配置，点击Continue,如下图：

![](windows-install-ubunt-vm/19.png)

21.填写系统的账号及密码，如下图：

![](windows-install-ubunt-vm/20.png)

22.安装完成后，需要重启，如下图：

![](windows-install-ubunt-vm/21.png)

23.打开终端，开启ssh和获取ip：

![](windows-install-ubunt-vm/22.png)

```
	*)查看ip:
	porschan@porschan-virtual-machine:~$ ifconfig
	ens32     Link encap:Ethernet  HWaddr 00:0c:29:df:29:98  
	          inet addr:192.168.207.139  Bcast:192.168.207.255  Mask:255.255.255.0
	          inet6 addr: fe80::386e:7a2e:cbaa:780d/64 Scope:Link
	          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
	          RX packets:2574 errors:0 dropped:0 overruns:0 frame:0
	          TX packets:801 errors:0 dropped:0 overruns:0 carrier:0
	          collisions:0 txqueuelen:1000 
	          RX bytes:2647668 (2.6 MB)  TX bytes:67674 (67.6 KB)
	
	lo        Link encap:Local Loopback  
	          inet addr:127.0.0.1  Mask:255.0.0.0
	          inet6 addr: ::1/128 Scope:Host
	          UP LOOPBACK RUNNING  MTU:65536  Metric:1
	          RX packets:252 errors:0 dropped:0 overruns:0 frame:0
	          TX packets:252 errors:0 dropped:0 overruns:0 carrier:0
	          collisions:0 txqueuelen:1000 
	          RX bytes:20555 (20.5 KB)  TX bytes:20555 (20.5 KB)

	*)开启ssh:

	1.查看当前的ubuntu是否安装了ssh-server服务。默认只安装ssh-client服务:
	porschan@porschan-virtual-machine:~$ dpkg -l | grep ssh

	2.安装ssh-server服务
	porschan@porschan-virtual-machine:~$ sudo apt-get install openssh-server

	3.再次查看安装的服务:
	porschan@porschan-virtual-machine:~$ dpkg -l | grep ssh

	4.确认ssh-server是否启动:
	porschan@porschan-virtual-machine:~$ ps -e | grep ssh

```

24.在本地测试虚拟机ip是否能ping通，如下图：

![](windows-install-ubunt-vm/23.png)

25.用Xshell连接虚拟机，如下图：

![](windows-install-ubunt-vm/24.png)

26.拍照快照，备恢复快照，如下图：

![](windows-install-ubunt-vm/25.png)

<div class="tip">
	参考：jackghq的博客《ubuntu开启SSH服务远程登录》（[https://blog.csdn.net/jackghq/article/details/54974141](https://blog.csdn.net/jackghq/article/details/54974141 "https://blog.csdn.net/jackghq/article/details/54974141")）
</div>