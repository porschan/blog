---
title: 树莓派Raspberrypi上配置Git
---

树莓派Raspberrypi上配置Git。

## 开始

首先你得有一树莓派！！！

## 过程

### 查看自己树莓派的版本

```
pi@raspberrypi:~ $ uname -a
```

运行效果：

```
Linux raspberrypi 4.9.59-v7+ #1047 SMP Sun Oct 29 12:19:23 GMT 2017 armv7l GNU/Linux
```

### 查看自己树莓派是否有安装Git

```
pi@raspberrypi:~ $ git --version
```

运行结果：

```
git version 2.11.0
```

### 设置自己的用户名称及电子邮箱

```
pi@raspberrypi:~ $ git config --global user.name "proschan"
pi@raspberrypi:~ $ git config --global user.email "710437653@qq.com"
```

运行效果：无，生成.gitconfig文件

### 查看.gitconfig文件

```
pi@raspberrypi:~ $ ls -al
```

运行效果：

```
total 104
drwxr-xr-x 18 pi   pi   4096 Feb  1 12:56 .
drwxr-xr-x  3 root root 4096 Nov 29 01:22 ..
-rw-------  1 pi   pi    802 Jan 25 16:08 .bash_history
-rw-r--r--  1 pi   pi    220 Nov 29 01:22 .bash_logout
-rw-r--r--  1 pi   pi   3523 Nov 29 01:22 .bashrc
drwxr-xr-x  6 pi   pi   4096 Jan 20 09:03 .cache
drwx------ 11 pi   pi   4096 Jan 20 15:12 .config
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Desktop
drwxr-xr-x  5 pi   pi   4096 Nov 29 02:22 Documents
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Downloads
-rw-r--r--  1 pi   pi     50 Feb  1 12:56 .gitconfig
drwx------  3 pi   pi   4096 Nov 29 02:56 .gnupg
drwxr-xr-x  2 pi   pi   4096 Jan 20 15:23 .idlerc
drwxr-xr-x  3 pi   pi   4096 Nov 29 02:22 .local
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Music
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Pictures
drwx------  3 pi   pi   4096 Jan 20 09:03 .pki
-rw-r--r--  1 pi   pi    675 Nov 29 01:22 .profile
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Public
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:22 python_games
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Templates
drwxr-xr-x  3 pi   pi   4096 Nov 29 02:56 .themes
drwxr-xr-x  2 pi   pi   4096 Nov 29 02:56 Videos
-rw-------  1 pi   pi     56 Jan 25 16:09 .Xauthority
-rw-------  1 pi   pi   3954 Jan 25 16:09 .xsession-errors
-rw-------  1 pi   pi   3954 Jan 25 14:58 .xsession-errors.old
```

### 创建SSH钥匙

```
pi@raspberrypi:~ $ ssh-keygen -t rsa -C "710437653@qq.com"
```

运行效果：

```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/pi/.ssh/id_rsa): 
Created directory '/home/pi/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/pi/.ssh/id_rsa.
Your public key has been saved in /home/pi/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:5s/lSMpU7gFcGYEEqOemcpctzr2h1oROisbEFot/r38 710437653@qq.com
The key's randomart image is:
+---[RSA 2048]----+
|     ..o..o.     |
|    .   .  o     |
|   .      o      |
| .. .  . .       |
|o oo .  S .      |
|.=  = .o +       |
|+o * =. o + .    |
|oo=.Boo+E* =     |
|.o ====oo = .    |
+----[SHA256]-----+
```

### 查看自己的公钥

```
pi@raspberrypi:~ $ cat /home/pi/.ssh/id_rsa.pub
```

运行效果：

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCodo81VEoEeLcX15cjYtaFBpU7jxqII9niGyccEWuVf5jjLyCMqT/WD4ru1yXmxA5XPgCSpriflf3zqkqzybRiFERQP0G4OHZBoHCWsamNEv1Ohs1mHTzQ0t8Ko2DCTps1EEo2vtMHMNpCqBXo05/LjEF/jzA9k0GYMI73XjeI/bI/mZFi+wJpF8flyf7mbK别看我的看你自己的44kHUxWKI1a9EL/vqMz+4YTsWvOKtURuRVRE/v0XRPufwKKtHcOV35EWQrxamvqhXcJmv5RBFWvRUpLvkx2wUXyplSpARBFpdEbuSf1JDH77VClr00396czTTszQW6o8zQX3VnGdXHw1TrA/kv/ 710437653@qq.com
```

### 在github官网配置SSH and GPG keys

找到Personal settings -> SSH and GPG keys -> New SSH key

Title : 填写自己易于理解的标题
key   : 填写上面公钥内容

点击 Add SSH Key 

### 校验树莓派的认证是否成功

```
pi@raspberrypi:~ $ ssh -T git@github.com
```

运行效果：

```
The authenticity of host 'github.com (192.30.255.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.255.112' (RSA) to the list of known hosts.
Hi proschan! You've successfully authenticated, but GitHub does not provide shell access.
```

打完收枪！

### 结束

多半查找度娘上具体linux的配置，如果纰漏请联系我(710437653@qq.com)，感谢谢谢Thank you~!