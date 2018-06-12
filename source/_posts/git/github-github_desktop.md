---
title: 使用gitHub 和 gitHub Desktop 协同开发
---

git 对于我来说是很新鲜，一开始觉得使用git要使用命令行模式的，非常very good，非常cool,一直使用ToroiseSVN的图像界面的我，一直有点不适应，知道有了gitHub desktop,我觉得我应该研究研究一番了。

本次使用的是我的github账号和测试的github账号。

下载 [github desktop](https://desktop.github.com/)

1. 测试账号创建项目
![](../../../../../../images/2018_04_07/1.jpg)

2. 命名项目名称 并 为新建项目添加README.md
![](../../../../../../images/2018_04_07/2.png)

3. 在测试账号的github desktop 中 File -> Clone a repository ,选择项目及对应的目录
![](../../../../../../images/2018_04_07/3.png)

4. current repository 选择自己项目 ， current branch 选择master(也可以新建分支) ， 点击fetch origin
![](../../../../../../images/2018_04_07/4.png)

5. 登录自己的账号的github , 找到测试账号的项目
![](../../../../../../images/2018_04_07/5.png)

6. 点击右上角的fork
![](../../../../../../images/2018_04_07/6.png)

7. 跳转到自己账号下对应fork的项目，点击clone or download -> open in desktop
![](../../../../../../images/2018_04_07/7.png)

8. 弹出请求打开 github desktop 软件，点击打开 githubDesktop.exe
![](../../../../../../images/2018_04_07/8.png)

9. 登录自己账号的github desktop , 在 file -> clone a repository -> url 填写 URL 及对应下载的路径
![](../../../../../../images/2018_04_07/9.png)

10. 使用自己账号 fork 下来
![](../../../../../../images/2018_04_07/10.png)

11. 查看自己的文件夹是否于github 上面结构一致
![](../../../../../../images/2018_04_07/11.jpg)

12.创建分支 current branch -> new branch
![](../../../../../../images/2018_04_07/12.png)

13.命名分支
![](../../../../../../images/2018_04_07/13.png)

14.模拟实际开发中的新增文件，在根目录下创建backEnd 文件夹 ，在其里面添加README.md文件
![](../../../../../../images/2018_04_07/14.jpg)

15.查看github desktop 修改情况 ，点击 change -> 填写summary  和 不是必填的description 以及 不是必填add co-authors ，最后点击 commit 同 proschan
![](../../../../../../images/2018_04_07/15.png)

16.点击history 可以查看刚刚commit 的记录 ，点击publish branch 提价修改
![](../../../../../../images/2018_04_07/16.png)

17.回到自己的github ，查看刚刚提交的github项目情况，点击compare & pull request
![](../../../../../../images/2018_04_07/17.png)

18.将自己的修改提交给作者 ， 选择的时候可以店家compare across forks ,注意红色框中以作者的master(或者其他分支)为 base fork ， 自己修改的为 head fork
![](../../../../../../images/2018_04_07/18.png)

19.查看提价、合并情况
![](../../../../../../images/2018_04_07/19.png)

20.登录测试账号的github,此时在pull request 看到有一个提交
![](../../../../../../images/2018_04_07/20.png)

21.点击提交修改的内容项
![](../../../../../../images/2018_04_07/21.png)

22.合并分支
![](../../../../../../images/2018_04_07/22.png)

23.填写简要合并信息
![](../../../../../../images/2018_04_07/23.png)

24.查看合并情况
![](../../../../../../images/2018_04_07/24.png)

25.回到自己的项目，查看是否已经合并分支
![](../../../../../../images/2018_04_07/25.png)

26.会收到相应的邮件来着github
![](../../../../../../images/2018_04_07/26.png)

27.回到测试账号的github desktop中更新项目
![](../../../../../../images/2018_04_07/27.png)

28.用测试账号登录git湖北 desktop 在根目录添加README2.md 文件 commmit 并fetch
![](../../../../../../images/2018_04_07/28.png)

29.回到自己账号的github中，查看Pull request -> Comparing changes ，点击 compare across forks -> create new pull request
![](../../../../../../images/2018_04_07/29.png)

30.创建自己分支的名称和简要
![](../../../../../../images/2018_04_07/30.png)

31.github更新主分支的等待过程
![](../../../../../../images/2018_04_07/31.png)

32.提交合并
![](../../../../../../images/2018_04_07/32.png)

33.确认合并
![](../../../../../../images/2018_04_07/33.jpg)

34.完成合并
![](../../../../../../images/2018_04_07/34.png)

35.查看合并情况
![](../../../../../../images/2018_04_07/35.png)

36.回到自己的github desktop 中更新项目
![](../../../../../../images/2018_04_07/36.png)

37.查看是否更新一致
![](../../../../../../images/2018_04_07/37.jpg)


注意：
1.需要fork对方的项目。

2.在fork对方的项目的时候，使用github desktop 的 URL fork 下来的时候，URL 一定 ，必须 ，使用用户名/项目名称 来fork 下来 （如porschan/TestProject）。

3.这次是过程主要为：

创建项目 -> 测试账号创建项目 -> 测试账号本地下载项目 ->

自己账号 fork 测试账号项目  -> 自己账号本地下载项目  -> 自己账号 提交修改 

项目内容  -> 测试账号 确认并合并提交修改 项目内容  -> 自己账号 更新本地项目 ->

测试账号 提交修改 项目内容  -> 自己项目更新测试账号的修改内容  ->

自己账号 更新本地项目

4.如果下载github desktop 超级慢，请使用梯子，你懂的！