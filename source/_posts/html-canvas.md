---
title: 记一次canvas的打印和下载
date: 2018-12-11 23:03:24
desc: chanchfieng.com
---

<div class="tip">
	来历：
				
	自身的特点：
		
	适合解决的问题：
		
	实际的应用场景：
		
</div>

### 打印 ###

```

	关键代码：
	<script src="../ligentres/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
	<script src="../ligentres/jquery-qrcode/jquery.qrcode.min.js" type="text/javascript"></script>
	<script src="../ligentres/html2canvas/html2canvas.js" type="text/javascript"></script>
	<script src="../ligentres/html2canvas/print-plug-in.js" type="text/javascript"></script>

	<script id="qrCodeModel" type="text/html">
	    <div style="padding: 20px; background-color: #F2F2F2;height: 100%;">
	        <div class="layui-row layui-col-space15">
	            <div class="layui-col-md12">
	                <div class="layui-card">
	                    <div class="layui-card-header">设备二维码:{{devNumber}}</div>
	                    <div class="layui-card-body" style="text-align:center;">
	                        <div id='QRCodeImg'></div>
	                        <div class="layui-btn-container">
	                            <button class="layui-btn" onclick="toPrint()">打印</button>
	                            <a class="layui-btn" onclick="toDown('{{devNumber}}')" id="down_button" style="text-decoration:none">下载</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</script>

    //打印
    function toPrint(){
        var index = layer.load(0);
        var printAreaDiv = document.getElementById('QRCodeImg'); //待打印区域dom对象
        html2canvas(printAreaDiv) //代入打印对象参数，生成canvas图形
            .then(function (canvas) {//返回canvas对象
                var dataUrl = canvas.toDataURL();//获取canvas对象图形的外部url
                var newImg = document.createElement("img");//创建img对象
                newImg.src = dataUrl;//将canvas图形url赋给img对象
                $('#printFrame').append(newImg).printArea();//打印img，注意不能直接打印img对象，需要包裹一层div
                $('#printFrame').html(''); //打印完毕释放包裹层内容（图像）
                layer.close(index);
            });
    }

```

### 下载 ###

```

	关键代码：
	<script src="../ligentres/html2canvas/base64.js" type="text/javascript"></script>
	<script src="../ligentres/html2canvas/canvas2image.js" type="text/javascript"></script>

	<script id="qrCodeModel" type="text/html">
	    <div style="padding: 20px; background-color: #F2F2F2;height: 100%;">
	        <div class="layui-row layui-col-space15">
	            <div class="layui-col-md12">
	                <div class="layui-card">
	                    <div class="layui-card-header">设备二维码:{{devNumber}}</div>
	                    <div class="layui-card-body" style="text-align:center;">
	                        <div id='QRCodeImg'></div>
	                        <div class="layui-btn-container">
	                            <button class="layui-btn" onclick="toPrint()">打印</button>
	                            <a class="layui-btn" onclick="toDown('{{devNumber}}')" id="down_button" style="text-decoration:none">下载</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</script>

    //下载
    function toDown(devNumber){
        var docName = "myDevice.jpg";
        if(devNumber != null){
            docName = devNumber + ".jpg";
        }

        // var dataurl =$("canvas").get(0).toDataURL('image/png').replace("image/png", "image/octet-stream");
        var dataurl =$("canvas").get(0).toDataURL('image/png').replace("image/png", "image/octet-stream");
        saveFile(dataurl,docName);

    }

    /**
    * 在本地进行文件保存
    * @param  {String} data     要保存到本地的图片数据
    * @param  {String} filename 文件名
    */
    var saveFile = function(data, filename){
        var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
        save_link.href = data;
        save_link.download = filename;

        var event = document.createEvent('MouseEvents');
        event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
        save_link.dispatchEvent(event);
    };

```

<div class="tip">
	资源下载：
	jquery.qrcode.min.js、html2canvas.js、print-plug-in.js、base64.js、canvas2image.js：[https://github.com/porschan/front-end-demo/tree/master/html-canvas](https://github.com/porschan/front-end-demo/tree/master/html-canvas "https://github.com/porschan/front-end-demo/tree/master/html-canvas")
</div>

<div class="tip">
	参考：
	html2canvas截图下载到本地精简版：[https://blog.csdn.net/hanguangdong/article/details/79109986](https://blog.csdn.net/hanguangdong/article/details/79109986 "https://blog.csdn.net/hanguangdong/article/details/79109986")
</div>
