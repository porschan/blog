---
title: JavaScript - 对浏览器缓存的JS、CSS的思考
date: ‎2018/7/28 22:54:35 
desc: chanchfieng.com
tags: [JavaScript]
---

### 背景 ###

一般我们对页面优化，都会通过加载外部的JS或者CSS文件，然后由浏览器缓存，然后下次访问的时候就能访问到浏览器加载完毕的缓存文件，然而对于常更新JS或者CSS文件的情况，我们经常会这样处理：

```

	<script type="text/javascript" src="/js/common.js?t=20180728" ></script>

```

就是每次都会更新t的值，以到达每次浏览器加载服务器最新的js或者css文件。这样就会反复加载，对于改好之后稳定的网站来说可不允许这样，应该修改为：

```

		<script type="text/javascript" src="/js/common.js?v=20180728" ></script>

```

这里v改为版本号，以天为时间的粒度，这样就优化了一许。

<div class="tip">
  这也许是我目前认识所最好的，欢迎提更好的解决方案/哈哈。
</div>