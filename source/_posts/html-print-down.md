---
title: 打印及下载的js摘抄
date: 2019-01-25 15:09:53
---

[打印及下载的js下载](https://github.com/porschan/front-end-demo/tree/master/%E6%89%93%E5%8D%B0js "https://github.com/porschan/front-end-demo/tree/master/%E6%89%93%E5%8D%B0js")

```

<div id="printFrame"></div>

<#-- 打印插件 -->
<script src="../ligentres/jquery-jqprint/jquery-migrate-1.2.1.min.js"></script>
<script src="../ligentres/jquery-jqprint/jquery.jqprint-0.3.js"></script>

<#-- js压缩包插件 -->
<script type="text/javascript" src="../ligentres/zip-js/zip.js"></script>
<script type="text/javascript" src="../ligentres/zip-js/zip-ext.js"></script>
<script type="text/javascript" src="../ligentres/zip-js/z-worker.js"></script>

<script language="javascript">
    zip.workerScriptsPath = "../ligentres/zip-js/";

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
    
    function batchShowQrCode() {
        var qrCodeStr = "${weChatURL!''}";

        if ($(".listCheckbox:checked").length < 1) {
            layer.alert("请选择要查看二维码的设备!");
            return;
        }

        layer.open({
            type: 1,
            content: "<div id='QRCodeDiv' style='overflow: hidden'></div>",
            btn: ['下载', '打印'],
            area: ['800px','530px'],
            btn1: function () {
                downQrCode();
                return false;
            },
            btn2: function () {
                printQrCode();
                return false;
            },
            success: function(layero,index) {
                var $div = layero.find("#QRCodeDiv");
                $(".listCheckbox:checked").each(function (i, n) {
                    var devNumber = n.value;
                    var href = qrCodeStr + devNumber;

                    $div.append("<div style='float:left;padding: 5px'></div>");
                    $div.find('div:last-child').qrcode(href);
                    var q = $div.find('div:last-child').children()[0];

                    q = canvasAddText(q, devNumber);

                    var src = q.toDataURL("image/png");
                    $div.find('div:last-child').html("<img src='" + src + "'></div>");
                });
            }
        });
    }


    /**
     * 打印二维码
     */
    function printQrCode() {
        $("#QRCodeDiv").jqprint({debug: true, importCSS: false});
    }

    /**
     * 下载二维码图片
     */
    function downQrCode() {
        var imgs = $('#QRCodeDiv img');
        if (imgs.length == 1) {
            var src = imgs[0].src;
            var $a = $("<a></a>").attr("href", src).attr("download", "img.png");
            $a[0].click();
        } else if (imgs.length > 1) {
            var files = new Array();
            var fileNames = new Array();
            $.each(imgs, function (i, n) {
                var src = n.src;

                var file = dataURLtoBlob(src);
                files[i] = file;
                fileNames[i] = i + ".png";
            });

            var writer = new zip.BlobWriter();
            zip.createWriter(writer, function (writer) {
                var zipWriter = writer;

                function downFile() {
                    zipWriter.close(function (blob) {
                        var src = URL.createObjectURL(blob);
                        zipWriter = null;
                        var $a = $("<a></a>").attr("href", src).attr("download", "demo.zip");
                        $a[0].click();
                    });
                }

                function addFile(i) {
                    if (i < files.length) {
                        zipWriter.add(fileNames[i], new zip.BlobReader(files[i]), function () {
                            addFile(++i);
                        });
                    } else {
                        console.info("下载");
                        downFile();
                    }
                }

                addFile(0);


            }, function (message) {
                var msg = "创建zip文件出错!\n" + message;
                layer.alert(msg);
            });
        }
    }

    /**
     * 将 dataUrl 转成 Blob 文件
     * @param dataurl
     * @returns {Blob}
     */
    function dataURLtoBlob(dataurl) {
        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], {type: mime});
    }

</script>

```
