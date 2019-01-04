---
title: Jfinal 打完收枪 收集录
date: 2019-01-04 11:19:22
---

<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

## JFinal3.0，如何处理Json请求 ##

```

	如下代码即可打完收枪
	String jsonString = HttpKit.readData(getRequest());
	User user = FastJson.getJson().parse(jsonString, User.class);

	来源 ：http://www.jfinal.com/feedback/1275
```

## Map 转 Model ##

```

    Map<String,String> stringStringMap = wxPayUtil.xmlToMap(xml);
	WechatNotify wechatNotify = new WechatNotify();
	wechatNotify.put((Map)stringStringMap);

```