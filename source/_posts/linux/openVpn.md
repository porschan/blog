---
title: 梯子制造术--openVpn
---

今天看到了[老李博客](http://www.bestlee.net/archives/28)中的CentOS快速搭建OpenVPN-AS,就提起了兴趣，之前用的是ssr,使用openVPN看起来有控制的页面，所以就开工了。

### 下载并安装OpenVPN

```

打开国外[openvpn网站](https://openvpn.net/index.php/access-server/download-openvpn-as-sw.html)


对应下载不同操作系统的平台软件（redhat、centos、ubuntu、fedora、virtual appliance、virtual appliance vhd）


wget http://swupdate.openvpn.org/as/openvpn-as-2.5.2-CentOS6.i386.rpm

安装openvpn-as:
安装openvpn-as，安装完成，默认管理员用户名为“openvpn”:

rpm -ivh openvpn-as-2.5.2-CentOS6.i386.rpm

修改管理员密码:
passwd openvpn

```

#### 配置

```

1.在浏览器输入“https://你的IP:943/admin/”进入OpenVPN-AS管理后台，输入管理员用户名及密码登陆；

2.点击”Network Settings”，修改udp端口号(UDP Port number)，建议使用30000以上端口，其它保持默认，然后点击”Save Settings”保存设置；

3.点击“User Permissions”勾选“Allow Auto-login”，然后点击”Save Settings”保存设置，这样就打开客户端自动登陆功能了，不用每次连接时都输入用户名和密码了；

4.依次点击“Status Overview”–“Stop The Server”–“Confirm Servers Stop”–“Start The Server”重启服务；

5.在浏览器输入“https://你的IP:943/”进入登陆界面，输入用户名、密码，然后下拉框选择“Login”，点击Go登陆。进入登陆界面后点击“Yourself (autologin profile)”下载自动登陆配置文件；

6.将下载好的配置文件拷贝到OpenVPN客户端安装目录下的“config”文件夹内，以管理员身份运行OpenVPN，右击任务栏上的OpenVPN图标点击连接即可。关于OpenVPN Windows客户端请自行百度下载。

```
