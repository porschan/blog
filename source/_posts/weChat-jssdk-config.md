---
title: 微信公众平台JS-SDK的config接口注入权限验证配置
---

今天，我将简单介绍一下如何通过java能完成微信公众平台JS-SDK的config接口注入权限验证配置。

#### 主要使用的微信接口如下：

```

	1.通过appid和secret，获取token：

	https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=SECRET

	2.通过token，获取ticket:

	https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=ACCESS_TOKEN

```

#### 如何获取appid和secret？

这里我们获取appid和secret并不是使用真正的微信公众号的appid和secret，而且使用[接口测试账号申请](https://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login)的appid和secret,操作如下：

![](../weChat-jssdk-config/loginTest.gif)

登录完成之后，如下图所示：

![](../weChat-jssdk-config/20180712164313.png)

此时，可以在页面根据页面的测试号信息中获取appid和secret，到此，先让自己的测试的Demo页面能在外网访问。

[DEMO页面](http://demo.open.weixin.qq.com/jssdk)

可以先把地址用自己的手机访问，是否官方的页面是否正常，如果正常则可以把DEMO页面拿下来，并放到自己的项目中，并让外网能访问。

注意：我这里外网访问的路径是http:www.你的域名.com/你的项目名称/你的方法名称

ok，外网可以访问到自己把demo页面拿下来之后，分析页面会发现以下配置提醒，如下：

```

  /*
   * 注意：
   * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
   * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
   * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
   * 邮箱地址：weixin-open@qq.com
   * 邮件主题：【微信JS-SDK反馈】具体问题
   * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
   */
  wx.config({
      debug: false,
      appId: 'wxf8b4f85f3a794e77',
      timestamp: 1531385535,
      nonceStr: '5qBjQwOM7dphJU1x',
      signature: 'd2594f9b9a029709ca093051c9863535ae7f64a8',
      jsApiList: [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'onMenuShareQZone',
        'hideMenuItems',
        'showMenuItems',
        'hideAllNonBaseMenuItem',
        'showAllNonBaseMenuItem',
        'translateVoice',
        'startRecord',
        'stopRecord',
        'onVoiceRecordEnd',
        'playVoice',
        'onVoicePlayEnd',
        'pauseVoice',
        'stopVoice',
        'uploadVoice',
        'downloadVoice',
        'chooseImage',
        'previewImage',
        'uploadImage',
        'downloadImage',
        'getNetworkType',
        'openLocation',
        'getLocation',
        'hideOptionMenu',
        'showOptionMenu',
        'closeWindow',
        'scanQRCode',
        'chooseWXPay',
        'openProductSpecificView',
        'addCard',
        'chooseCard',
        'openCard'
      ]
  });

```

#### 如何通过已有的appid和secret获取关键的appId（已用）、timestamp、nonceStr和signature，这里就需要使用上面的接口了，直接po代码。

注意：我使用的框架是jfinal。

访问页面的controller:

```

    /**
     * 测试微信页面
     * Test
     */
    @ClearInterceptor(ClearLayer.ALL)
    @ActionKey("/wechatApi")
    public void wechatApi(){
        if (getStaff() != null)
            removeSessionAttr("user");

        WcConfigBean wcConfig = WechatKit.getWcConfig(getRequest().getRequestURI());
        
        setAttr("appId",wcConfig.getAppId());
        setAttr("timestamp",wcConfig.getTimestamp());
        setAttr("nonceStr",wcConfig.getNonceStr());
        setAttr("signature",wcConfig.getSignature());

        renderFreeMarker("../wechat/test/wechatApi.ftl");
    }

```

获取token和ticket的凭票及有效性的util:

```

	package ligent.util.weChatKit;
	
	import org.json.JSONException;
	import org.json.JSONObject;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 17:04 2018/7/11
	 * @modified By:
	 */
	
	public class Token {
	
	    private static String access_token="";
	
	    private static String jsapi_ticket = "";
	
	    public static int time = 0;
	
	    private static int expires_in = 7200;
	
	    static{
	        Thread t = new Thread(new Runnable(){
	            public void run(){
	                do{
	                    time++;
	                    try {
	                        Thread.sleep(1000);
	                    } catch (InterruptedException e) {
	                        e.printStackTrace();
	                    }
	                }while(true);
	            }});
	        t.start();
	    }
	
	    public static String getToken(){
	        if("".equals(access_token)||access_token==null){
	            send();
	        }else if(time>expires_in){
	            //当前token已经失效，从新获取信息
	            send();
	        }
	        return access_token;
	    }
	
	    public static String getTicket(){
	        if("".equals(jsapi_ticket)||jsapi_ticket==null){
	            send();
	        }else if(time>expires_in){
	            //当前token已经失效，从新获取信息
	            send();
	        }
	        return jsapi_ticket;
	    }
	
	    private static void send(){
	        String url = WXConfig.server_token_url.replace("APPID",WXConfig.appid).replace("SECRET",WXConfig.appsecret);
	        JSONObject json = SendHttpRequest.sendGet(url);
	//        access_token = json.getString("access_token");
	        try {
	            access_token = json.getString("access_token");
	        } catch (JSONException e) {
	            e.printStackTrace();
	        }
	        String ticket_url = WXConfig.access_token_url.replace("ACCESS_TOKEN",access_token);
	        try {
	            jsapi_ticket = SendHttpRequest.sendGet(ticket_url).getString("ticket");
	        } catch (JSONException e) {
	            e.printStackTrace();
	        }
	        time = 0;
	//        if(!"".equals(access_token)&&!"".equals(jsapi_ticket)){
	//            new Thread
	//        }
	
	    }
	}


```

微信官方提供的加密签名的util,[下载页面](https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421141115)及[下载链接](http://demo.open.weixin.qq.com/jssdk/sample.zip):

```

	package ligent.util.weChatKit;

	import java.io.UnsupportedEncodingException;
	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;
	import java.util.Formatter;
	import java.util.HashMap;
	import java.util.Map;
	import java.util.UUID;
	
	/**
	 * @author:porschan
	 * @description:
	 *
	 * 来自官方文档的加密方式
	 *
	 * JAVA, Node, Python 部分代码只实现了签名算法，需要开发者传入 jsapi_ticket 和 url ，
	 * 其中 jsapi_ticket 需要通过 http://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=ACCESS_TOKEN 接口获取
	 * ，url 为调用页面的完整 url 。
	 *
	 * PHP 部分代码包括了获取 access_token 和 jsapi_ticket 的操作，只需传入 appid 和 appsecret 即可，
	 * 但要注意如果已有其他业务需要使用 access_token 的话，应修改获取 access_token 部分代码从全局缓存中获取，
	 * 防止重复获取 access_token ，超过调用频率。
	 *
	 * 注意事项：
	 * 1. jsapi_ticket 的有效期为 7200 秒，开发者必须全局缓存 jsapi_ticket ，防止超过调用频率。
	 *
	 * @date: Created in 16:29 2018/7/11
	 * @modified By:
	 */
	
	public class sign {
	
	    //额外添加
	    public static WcConfigBean getWcConfigBean(String jsapi_ticket, String url,String appId){
	        Map<String, String> ret = sign(jsapi_ticket, url);
	
	        WcConfigBean wcConfigBean = new WcConfigBean();
	
	        wcConfigBean.setAppId(appId);
	
	        for (Map.Entry entry : ret.entrySet()) {
	            switch(entry.getKey().toString()){
	                case "url" :
	                    wcConfigBean.setUrl(String.valueOf(entry.getValue()));
	                    break;
	                case "nonceStr" :
	                    wcConfigBean.setNonceStr(String.valueOf(entry.getValue()));
	                    break;
	                case "timestamp" :
	                    wcConfigBean.setTimestamp(String.valueOf(entry.getValue()));
	                    break;
	                case "signature" :
	                    wcConfigBean.setSignature(String.valueOf(entry.getValue()));
	                    break;
	            }
	        }
	
	        return wcConfigBean;
	
	    }
	
	    public static void main(String[] args) {
	        String jsapi_ticket = "HoagFKDcsGMVCIY2vOjf9vekSs_wMj2R9WS9DiM被你发现了,保密数据83KNuhk8dQ";
	
	        // 注意 URL 一定要动态获取，不能 hardcode
	        String url = "http://www.你的域名.com/项目名称/访问的方法";
	        Map<String, String> ret = sign(jsapi_ticket, url);
	        for (Map.Entry entry : ret.entrySet()) {
	            System.out.println(entry.getKey() + ", " + entry.getValue());
	        }
	    }
	
	    //获取签名
	    public static Map<String, String> sign(String jsapi_ticket, String url) {
	        Map<String, String> ret = new HashMap<String, String>();
	        String nonce_str = create_nonce_str();
	        String timestamp = create_timestamp();
	        String string1;
	        String signature = "";
	
	        //注意这里参数名必须全部小写，且必须有序
	        string1 = "jsapi_ticket=" + jsapi_ticket +
	                "&noncestr=" + nonce_str +
	                "&timestamp=" + timestamp +
	                "&url=" + url;
	        System.out.println(string1);
	
	        try
	        {
	            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	            crypt.reset();
	            crypt.update(string1.getBytes("UTF-8"));
	            signature = byteToHex(crypt.digest());
	        }
	        catch (NoSuchAlgorithmException e)
	        {
	            e.printStackTrace();
	        }
	        catch (UnsupportedEncodingException e)
	        {
	            e.printStackTrace();
	        }
	
	        ret.put("url", url);
	        ret.put("jsapi_ticket", jsapi_ticket);
	        ret.put("nonceStr", nonce_str);
	        ret.put("timestamp", timestamp);
	        ret.put("signature", signature);
	
	        return ret;
	    }
	
	    private static String byteToHex(final byte[] hash) {
	        Formatter formatter = new Formatter();
	        for (byte b : hash)
	        {
	            formatter.format("%02x", b);
	        }
	        String result = formatter.toString();
	        formatter.close();
	        return result;
	    }
	
	    private static String create_nonce_str() {
	        return UUID.randomUUID().toString();
	    }
	
	    private static String create_timestamp() {
	        return Long.toString(System.currentTimeMillis() / 1000);
	    }
	}


```

有关微信配置的bean:

```

	package ligent.util.weChatKit;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 10:29 2018/7/12
	 * @modified By:
	 */
	
	public class WcConfigBean {
	
	    String appId;//必填,公众号的唯一标识
	
	    String timestamp;//必填,生成签名的时间戳
	
	    String nonceStr;//必填,生成签名的随机串
	
	    String signature;//必填,签名
	
	    String url;//选填,访问页面的路径
	
	    @Override
	    public String toString() {
	        return "WcConfigBean{" +
	                "appId='" + appId + '\'' +
	                ", timestamp='" + timestamp + '\'' +
	                ", nonceStr='" + nonceStr + '\'' +
	                ", signature='" + signature + '\'' +
	                ", url='" + url + '\'' +
	                '}';
	    }
	
	    public String getAppId() {
	        return appId;
	    }
	
	    public void setAppId(String appId) {
	        this.appId = appId;
	    }
	
	    public String getTimestamp() {
	        return timestamp;
	    }
	
	    public void setTimestamp(String timestamp) {
	        this.timestamp = timestamp;
	    }
	
	    public String getNonceStr() {
	        return nonceStr;
	    }
	
	    public void setNonceStr(String nonceStr) {
	        this.nonceStr = nonceStr;
	    }
	
	    public String getSignature() {
	        return signature;
	    }
	
	    public void setSignature(String signature) {
	        this.signature = signature;
	    }
	
	    public String getUrl() {
	        return url;
	    }
	
	    public void setUrl(String url) {
	        this.url = url;
	    }
	}


```

http请求的util:

```

	package ligent.util.weChatKit;
	
	import org.apache.http.client.methods.CloseableHttpResponse;
	import org.apache.http.client.methods.HttpGet;
	import org.apache.http.impl.client.CloseableHttpClient;
	import org.apache.http.impl.client.HttpClients;
	import org.apache.http.util.EntityUtils;
	import org.json.JSONObject;
	
	import java.io.IOException;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 17:05 2018/7/11
	 * @modified By:
	 */
	
	public class SendHttpRequest {
	
	    public static JSONObject sendGet(String url){
	
	        CloseableHttpClient httpclient = HttpClients.createDefault();
	        JSONObject jsonResult = null;
	        HttpGet method = new HttpGet(url);
	
	        try {
	            CloseableHttpResponse result = httpclient.execute(method);
	            if (result.getStatusLine().getStatusCode() == 200) {
	                String str = "";
	                try {
	                    str = EntityUtils.toString(result.getEntity());
	                    jsonResult = new JSONObject(str);
	                } catch (Exception e) {
	                    System.out.println("get请求提交失败:" + url);
	                }
	            }
	        } catch (IOException e) {
	            System.out.println("get请求提交失败:" + url);
	        }
	
	        return jsonResult;
	
	    }
	
	}


```

微信页面可能用到参数的util:

```

	package ligent.util.weChatKit;
	
	/**
	 * @author:porschan
	 * @description:
	 * @date: Created in 10:21 2018/7/12
	 * @modified By:
	 */
	
	public class WechatKit {
	
	    //获取access_token
	    public static String getAccessToken(){
	        return  Token.getToken();
	    }
	
	    //获取ticket
	    public static String getTicket(){
	        return Token.getTicket();
	    }
	
	    //获取页面的api信息
	    public static WcConfigBean getWcConfig(String requestURI){
	        String jsapi_ticket = getTicket();
	        return sign.getWcConfigBean(jsapi_ticket,WXConfig.redirect_uri + requestURI,WXConfig.appid);
	    }
	
	}


```

测试WechatKit的方法：

```

	package ligent.test.weChatKitTest;

	import ligent.util.weChatKit.WechatKit;
	
	/**
	 * @author:porschan
	 * @description:
	 *
	 * 测试WeChatKit的类
	 *
	 * @date: Created in 15:24 2018/7/12
	 * @modified By:
	 */
	
	public class WeChatKitTest {
	
	//    @Test
	    public void weChatKitTest1(){
	        System.out.println("accessToken" + WechatKit.getAccessToken());
	        System.out.println("ticket:" + WechatKit.getTicket());
	        System.out.println(WechatKit.getWcConfig("/etcc/wechatApi"));
	    }
	
	    public static void main(String[] args) {
	        new WeChatKitTest().weChatKitTest1();
	    }
	}


```

配置文件：

```

	#-----------------------------------------------------------
	# 微信公众号设置
	#-----------------------------------------------------------
	weChat.appid=你的APPID,e.g.:从接口测试账号申请的获取的appid
	weChat.appsecret=你的APPSECRET,e.g.:从接口测试账号申请的获取的appsecret
	weChat.redirect_uri=外网访问的页面，e.g.:http://www.baidu.com

```

完成之后，使用时手机访问的你的项目中的demo页面，如图所示，则成功调用。

![](../weChat-jssdk-config/20180712171217.jpg)

以下就是使用调用api返回的结果：

```

	获取token的请求：
	
	https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=你的APPID&secret=你的SECRET

	获取token的响应：

	{
	    "access_token": "11_DXAnrOx-UnocqkswgEKsJT8BrmGFSO5uy-l0M9870YFG被你发现了,保密数据YGxt17gEN07pcHO8mmSyopQq-mbWFSknt2HkC9BHMcADANTY",
	    "expires_in": 7200
	}

	获取ticket的请求：
	
	https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=11_DXAnrOx-UnocqkswgEKsJT8BrmGFSO5uy-l0M987被你发现了,保密数据jH3nWAvFktuv2C6BvYGxt18mmSyopQq-mbWFSkANTY
	
	获取ticket的响应：

	{
	    "errcode": 0,
	    "errmsg": "ok",
	    "ticket": "HoagFKDcsGMVCIY2被你发现了,保密数据qyBXkZ4cMH_IwNYTwvr83KNuhk8dQ",
	    "expires_in": 7200,
		    "asd":{
		    "errcode": 0,
		    "errmsg": "ok",
		    "ticket": "HoagFKDcsGMV被你发现了,保密数据cMH_IwNYTwvr83KNuhk8dQ",
		    "expires_in": 7200
		}
	}	

	使用官方的sign的签名打印：

	jsapi_ticket=HoagFKDcsGMVCIY2vOjf9vekS被你发现了,保密数据Z4cMH_IwNYTwvr83KNuhk8dQ&noncestr=b7016842-2df1-4314-a617-a75245b281ea&timestamp=1531299156&url=http://www.你的域名.com/
	signature, cb97被你发现了,保密数据eadeeb81c038ce745b4ad5e265c
	jsapi_ticket, HoagFKDcsGMVCIY被你发现了,保密数据WjK46Wbek_a8jsNpqyBXkZ4cMH_IwNYTwvr83KNuhk8dQ
	url, http://www.你的域名.com/你的项目名称/你访问的方法
	nonceStr, b7016842-被你发现了,保密数据-a617-a75245b281ea
	timestamp, 1531299156

```

感谢[微信公众号网页开发-jssdk config配置参数生成（Java版）](https://www.cnblogs.com/di8hao/p/5412708.html)博客中获取重要的代码部分。

PS:
[微信公众平台接口调试工具](https://mp.weixin.qq.com/debug/)
[公众号的接入指南](https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=open1419318183&token=&lang=zh_CN)