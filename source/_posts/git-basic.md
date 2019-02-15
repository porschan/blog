---
title: Git - 基本配置
date: 2019-02-15 10:10:41
---
<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

### 创建Git仓库 ###

```

	1.在现有目录中初始化仓库
	如果你打算使用 Git 来对现有的项目进行管理，你只需要进入该项目目录并输入：
	$ git init
	2.新建项目
	会在当前路径下创建和项目名称同名的文件夹：
	$ git init your_project

```

### config的三个作用域 ###

```

	1.system对系统所有登录的用户有效：
	$ git config --system user.name 'porschan'
	$ git config --system user.email '710437653@qq.com'
	
	2.global对当前用户所有仓库有效：
	$ git config --global user.name 'porschan'
	$ git config --global user.email '710437653@qq.com'
	
	3.local只对某个仓库有效：
	$ git config --local user.name 'porschan'
	$ git config --local user.email '710437653@qq.com'

```

### 查看各个作用域的配置 ###

```

	$ git config --local --list
	$ git config --global --list
	$ git config --system --list

```

### 删除作用域中的配置 ###

```

	$ git config --global --unset user.name

```

### 各个作用域的优先级别 ###

	system > global > local

### 快速浏览文件修改记录的 Git History ###

	只要将任何文件的 URL 中的“github.com”替换成“github.githistory.xyz”即可以动画的方式快速查看该文件的修改历史记录。