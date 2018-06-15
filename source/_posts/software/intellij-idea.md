---
title: IntelliJ IDEA常用设置
---

### 设置idea的类注释快捷键

#### File -> Settings -> Live Templates

```

	1.右边的 + -> Templates Group -> 输入：LTModel
	2.右边的 + -> Live Templates -> 为Abbreviation输入：pClassNote，为Description输入：自定义类注释

	Template text:

	/**
	* @author:porschan
	* @description:
	* @date: Created in $TIME$ $DATE$
	* @modified By:
	*/

	3.设置变量，点击右侧的Edit variables
	Name	Expression	Default value	Skip if defined
	TIME	time()								□
	DATE	date()								□

```

### 设置idea的类注释

#### File -> Settings -> Editor -> File and Code Templates ,如图：

![](../../../../../../images/2018_06_15/20180615112543.png)

```
	/**
	* @author:porschan
	* @description:
	* @date: Created in ${TIME} ${DATE}
	* @modified By:
	*/
```

### 设置idea的背景图

#### 1.open IDEA -> File -> Settings -> Plugins ，如图

![](../../../../../../images/2018_06_15/20180615111640.png)

#### 2.搜索Background Image Plus,安装并重启idea.

#### 3.选择图片 ，如图

![](../../../../../../images/2018_06_15/20180615112045.png)

![](../../../../../../images/2018_06_15/20180615112119.png)


如果连快捷键都无法熟练的使用，那你应该熟练一下哈哈哈哈。

### 设置水平、上下分屏

```
File -> Settings -> Keymap，搜索（注意大小写）： 

水平分屏.Split Vertically

垂直分屏.Split Horizontally

直接双击对应的，会出现Edit Shortcuts弹窗，点击Add Keyboard Shortcut，输入快捷键点击OK即可。
````

### 设置选择项目进入IDEA

```
File -> Settings -> Appearance & Behavior -> System Settings

去掉默认选择的Reopen last project on startup选项即可。
```