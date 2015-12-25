
		/* 
		wx.ready(function(){
			alert("OK11");
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
		wx.error(function(res){
			alert("Err:"+res);
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

		}); 
*/



	function saveImage(){
	 //alert("saveImage");
 		wx.chooseImage({
		    success: function (res) {
		        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
		        //alert("开始上传：localIds:"+localIds[0]);
		        wx.uploadImage({
				    localId: localIds[0], // 需要上传的图片的本地ID，由chooseImage接口获得
				    isShowProgressTips: 1, // 默认为1，显示进度提示
				    success: function (res) {
				        var serverId = res.serverId; // 返回图片的服务器端ID
				        document.all.serverId.value=serverId;
				        //alert("上传成功1："+serverId)
		 
				         submitForm("CompRepaWeixin","saveImage",true,"","","afterSaveImg",false,true);
				    },      
				    fail: function (res) {
			          alert(JSON.stringify(res));
			        }
				});
		    },
		   fail: function (res) {
			          alert(JSON.stringify(res));
			 }
		});
		//  submitForm("test1","saveTest1",true,"","","",false,true);
	}
	
	 function afterSaveImg(){
		 
	     
		    var innerHTML =document.all.innerHTML.value;
		 
		 var imageHtml=document.all.imageHtml.value;
		msg.innerHTML=innerHTML+imageHtml+
		'<input class="pxbtn" name="saveImagebtn" id="saveImagebtn" type="button"  onclick="saveImage()" value="提交照片"/>'+
		'<p  >安桌手机，需要把照片分辨率调整到低像素！</p>';

		}
