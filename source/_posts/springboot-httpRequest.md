---
title: springboot - http请求
date: 2019-02-14 10:49:35
---
<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

### 核心代码 ###

```

	public static String HttpRestClient(String url, HttpMethod method, MultiValueMap<String, String> params) throws IOException {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        requestFactory.setConnectTimeout(10*1000);
        requestFactory.setReadTimeout(10*1000);
        RestTemplate client = new RestTemplate(requestFactory);
        HttpHeaders headers = new HttpHeaders();
        //  请勿轻易改变此提交方式，大部分的情况下，提交方式都是表单提交
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //  执行HTTP请求
        ResponseEntity<String> response = client.exchange(url, method, requestEntity, String.class);
        return response.getBody();
	}

	//api url地址
	String url = "";
	//post请求
	HttpMethod method =HttpMethod.GET;
	// 封装参数，千万不要替换为Map与HashMap，否则参数无法传递
	MultiValueMap<String, String> params= new LinkedMultiValueMap<String, String>();
	//发送http请求并返回结果
	String result = HttpUtil.HttpRestClient(url,method,params);

```

<div class="tip">
	参考锋神丶的《springboot发送http请求》([https://blog.csdn.net/u012613251/article/details/83278713](https://blog.csdn.net/u012613251/article/details/83278713 "https://blog.csdn.net/u012613251/article/details/83278713"))
</div>