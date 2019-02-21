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

```

	未整理:
	git status
	
	git add index.html image
	
	git commit -m 'add index + logo'
	
	对所有工作区当中，被git管理，已经控制的文件一起提交到暂存区
	git add -u
	
	git rm readme.md
	
	git reset --hard
	
	git最近修改名字
	git mv readme.md README.md
	
	查看简短历史记录
	git log --oneline
	
	查看最近4条的历史记录
	git log -n4
	
	查看本地分支
	git branch -v
	
	直接生成commit,不需要暂存区暂存文件：
	git commit -am 'add test'
	
	git log --all
	
	git log --all --graph
	
	git help
	
	git help --web log
	
	gitk
	
	git checkout -b temp 415c5c8086e16399
	
	git checkout master
	
	切换分支，观察.git/HEAD会引用到不同的文件
	
	//当前分支为master
	$ cat .git/HEAD
	ref: refs/heads/master
	
	$ cat master
	//查看master当前的状态(commit/tree)
	$ git cat-file -t 117037d4f17688d0fe597711d1d321a65390a9c8
	commit
	
	查看分支情况
	git branch -av
	
	查看tag内容
	$ git cat-file -t -p 117037d4f17688d0fe597711d1d321a65390a9c8
	
	$ find .git/objects/ -type f
	
	分离头指针，没有基于某个branch，提交之后需要创建branch.
	head除了可以指向branch(分支)，也可以指向某个commit.
	
	删除分支：
	git branch -d 9c6861f3a71ba
	git branch -D 9c6861f3a71ba
	
	修改最新commit的message:
	git commit --amend
	
	修改旧的commit的message：
	1.git rebase -i c4312be89b5(注意，这里的c4312be98b5是修改分支的父分支)
	
	2.将pick修改为reword,如下：
	reword ...
	pick ..
	
	3.git自动打开修改文件，直接修改message,如下：
	Add a refering projects.
	
	可知，master并不指向原本的commit的值。
	
	将多个commit整理为一个commit:
	git rebase -i 3257e7(注意，这里的3257e7是修改分支的父分支)
	
	修改为如下：
	pick ..
	squash ..
	squash ..
	squash ..
	pick ..
	
	在添加第一行：
	Create a complete web page
	
	将间隔多个commit整理为一个：
	
	
	
	添加父分支：
	pick 3257e7f
	s 8b0f543 Move filename to readme to README.md(将需要合并的放到这里，并紧靠父分支)
	pick bad933b Create ...(不修改)
	(最后一行删除)
	
	git rebase --Continue
	添加第一行：
	Add readme.md

	暂存区和head直接的差异，也可以检查暂存区和head完全一样（为空的情况下）：
	git diff --cached
	
	工作区与暂存区的区别：
	git diff
	
	只对工作区和暂存区中某个文件进行比较：
	git diff -- readme.md
	
	让暂存区恢复和head一样：
	git reset HEAD
	
	让工作区恢复暂存区一样：
	git checkout -- index.html
	
	取消暂存区的部分文件更改：
	git reset HEAD -- style/style.css

```