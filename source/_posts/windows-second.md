---
title: windows10任务栏上的时间显示秒操作
date: ‎2018‎-‎7‎-‎13‎ 16:03:59
---

1.快速进入注册表编辑器（Win+R之后输入regedit）。

2.进入HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

3.右侧新建个名为“ShowSecondsInSystemClock”的DWORD（32位）值，把它的数值数据修改成1，如图所示。

![](../windows-second/20180713160220.png)

4.重启电脑或者注销用户之后再次进入，如发现以下动图，则想修改成功。

![](../windows-second/time.gif)