---
title: 'sourceTree 在windows安装'
date: ‎‎2018/7/31 14:53:03
---

GitHub Desktop 和 Sourcetree都是管理git仓库的图像界面，我一直在用GitHub Desktop,但是也想看看sourcetree的样子。

引用官方的介绍surcetree：

Sourcetree simplifies how you interact with your Git repositories so you can focus on coding. Visualize and manage your repositories through Sourcetree's simple Git GUI.

1.下载[Sourcetree](https://www.sourcetreeapp.com/)。

![](../SourceTree/20180731145731.png)

2.点击SourceTreeSetup-2.6.10.exe。

![](../SourceTree/20180731145823.png)

3.操作如下：

![](../SourceTree/20180731150022.png)

![](../SourceTree/20180731150055.png)

4.在文件资源管理器的地址栏输入：

```

	%LocalAppData%\Atlassian\SourceTree\

```

5.在该目录下创建accounts.json，内容如下：

```

	[
	  {
	    "$id": "1",
	    "$type": "SourceTree.Api.Host.Identity.Model.IdentityAccount, SourceTree.Api.Host.Identity",
	    "Authenticate": true,
	    "HostInstance": {
	      "$id": "2",
	      "$type": "SourceTree.Host.Atlassianaccount.AtlassianAccountInstance, SourceTree.Host.AtlassianAccount",
	      "Host": {
	        "$id": "3",
	        "$type": "SourceTree.Host.Atlassianaccount.AtlassianAccountHost, SourceTree.Host.AtlassianAccount",
	        "Id": "atlassian account"
	      },
	      "BaseUrl": "https://id.atlassian.com/"
	    },
	    "Credentials": {
	      "$id": "4",
	      "$type": "SourceTree.Model.BasicAuthCredentials, SourceTree.Api.Account",
	      "Username": "",
	      "Email": null
	    },
	    "IsDefault": false
	  }
	]

```

6.退出刚刚的安装界面，再次运行安装包SourceTreeSetup-2.6.10.exe。

![](../SourceTree/20180731150459.png)

7.安装过程：

![](../SourceTree/create.gif)

8.安装成功：

![](../SourceTree/20180731150709.png)

<div class="tip">
  此操作跳过注册账号，你也能注册一下账号，但是我很快将它删掉，因为还是喜欢GitHub Desktop 的界面/哈哈。
</div>