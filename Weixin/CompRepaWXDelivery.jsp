<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,com.xccode.service.weixin.utils.WeixinConfigUtil" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
 <%
//String jsWxConfig=WeixinConfigUtil.getJSWXConfig(request);
  
 
 
 String jsWxConfig=(String)request.getAttribute("jsWxConfig");
 /*
	String url= request.getRequestURL().toString();
		String queryString= request.getQueryString();
		String fullUrl=url;
		if(queryString!=null&&!"".equals(queryString)){
			fullUrl=fullUrl+"?"+queryString;
		}
		
		System.out.println(fullUrl);
		
		System.out.println(jsWxConfig);
*/		

%>
 
<! DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<style type="text/css" media="screen">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
}
</style>
 <link href="activity-style.css" rel="stylesheet" type="text/css">

<link href="message.css" rel="stylesheet" type="text/css">
 
 
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script type="text/javascript" src="CompRepaWeixin.js"></script>
	<script type="text/javascript">


<%=jsWxConfig%>

   var RepairName='';
	function doSubmit(){
		  submitForm("CompRepaWeixin","Save",true,"","beforeSubmit","afterSubmit",false,true);
	}
	
	function doClientSubmit(){
		  submitForm("CompRepaWeixin","ClientRefresh",true,"","","",false,true);
	}
	

	
	function init(){
        intValue();
	}
	
function intValue(){
	var khname = '<%=(String)request.getAttribute("khname")%>';
    var khaddr = '<%=(String)request.getAttribute("khaddr")%>'; 
    var handtel = '<%=(String)request.getAttribute("handtel")%>';  
    var lxr = '<%=(String)request.getAttribute("lxr")%>'; 
    var jsy = '<%=(String)request.getAttribute("wxjsy")%>';   
    document.all.jsy.value   =jsy;
    if(khname!='null')document.all.khname.value =khname;
    if(khaddr!='null')document.all.khaddr.value =khaddr;
    if(lxr!='null')document.all.lxr.value =lxr;
    if(handtel!='null')document.all.handtel.value =handtel;     
 
//(!exp && typeof(exp)!="undefined" && exp!=0)

}	

function beforeSubmit(){
	document.all.initStep.value ="S1";
    var ret=true;
    var khname =document.all.khname.value;
    var khaddr =document.all.khaddr.value;
    var handtel =document.all.handtel.value;
    var lxr = document.all.lxr.value;
    var wxdh= document.all.wxdh.value;
    var gzMem=  document.CompRepaWeixin.gzMem.value;
    var errorMsg ='';
   if(khname =='') errorMsg='客户名称\n'+errorMsg;
   if(khaddr =='') errorMsg='客户地址\n'+errorMsg;
   if(handtel =='') errorMsg='客户手机\n'+errorMsg;
   if(gzMem =='')errorMsg='故障\n'+errorMsg;
   if(errorMsg==''){
   		return true;
    }
        else {
        	errorMsg=errorMsg+'相关信息必填！';
     		alert(errorMsg);
    return false;
    }
}
	
	
function afterSubmit(){
	refreshMsg();
    return true;
}
 
function refreshMsg(){
	var khname = document.all.khname.value;
    var khaddr = document.all.khaddr.value;
    var handtel = document.all.handtel.value;
    var lxr = document.all.lxr.value;
    var wxdh = document.all.wxdh.value;
    var gzMem = document.CompRepaWeixin.gzMem.value;
    if(khname!='null')document.all.lxr.value ='';
    if(handtel!='null')document.all.khaddr.value ='';
    if(lxr!='null')document.all.lxr.value ='';
    if(gzMem!='null')document.CompRepaWeixin.gzMem.value ='';
    var imageHtml=document.all.imageHtml.value;
    if(imageHtml=='null')imageHtml='';
     

var innerHTML=
'<p  >业务类型：<span class="red">送货工作</span></p>'+
'<p  >客户名称：<strong>'+khname+'</strong></p>'+
'<p>客户地址：<span class="red">'+khaddr+'</span></p>'+
'<p>联系人：'+khname+'</p>'+
'<p>联系人手机：'+handtel+'</p>'+
'<p >故障描述：<span class="red">'+gzMem+'</span></p>'+
'<p >亲爱的技术员，您的送货单已经登记，送货单号：<span class="red">'+wxdh+'</span> ,请及时送货！谢谢！</p>'+
'<br>';
document.all.innerHTML.value = innerHTML;
msg.innerHTML=innerHTML+
'<input class="pxbtn" name="saveImagebtn" id="saveImagebtn" type="button"  onclick="saveImage()" value="提交照片"/>'+
'<p  >安桌手机，需要把照片分辨率调整到低像素！</p>';

}
 

	
	
</script>



</head>
 
<e:emobile  type="simple">
<e:head/>

<body class="activity-coupon-winning" style="" onLoad="init();">
<e:form action="CompRepaWeixin" name="CompRepaWeixin" id="CompRepaWeixin">
<e:hidden id="step"  name="step" ></e:hidden>
<e:hidden name="initStep" ></e:hidden>
<e:hidden name="serverId" ></e:hidden>
<e:hidden name="wxdh" ></e:hidden>
<e:hidden name="RepairType" ></e:hidden>
<e:hidden name="weixinId" ></e:hidden>
<e:hidden name="weixinName" ></e:hidden>
<e:hidden name="imageHtml" ></e:hidden>
<e:hidden name="innerHTML" ></e:hidden>
 




			<div class="main">
				<div class="cover" id="Conponid">
			   	<img id="winaprize" src="images/诚心为您服务.jpg"></div>
			</div>

			<div class="content">	   
			
			
			<div id="zjl" style="" class="boxcontent boxwhite">
					<div class="box">
						<div class="title-red">任务信息：</div>
						<div  id="msg" class="Detail">
							<p  >您正在登记：<strong>送货工作</strong></p>
							<p>请准确填写送货信息：</p>
					        
							<table width="100%" height="350px">
							<tr height="30px"><td> 	<input name="khcode" class="px" id=""khcode"" value="" type="text" placeholder="客户代码"></td> </tr>
							<tr height="30px"><td><input class="pxbtn" name="获取客户" id="save-btn" type="button"  onclick="doClientSubmit()" value="获取客户信息"/></td> </tr>
							<tr height="30px"><td> <input name="khname" class="px" id="khname" value="" type="text" placeholder="客户名称"></td> </tr>
							<tr  height="30px"><td><input name="khaddr" class="px" id="khaddr" value="" type="text" placeholder="客户地址"></td> </tr>
							<tr  height="30px"><td>  <input name="lxr" class="px" id="lxr" value="" type="text" placeholder="联系人"></td> </tr>
							<tr  height="30px"><td><input name="handtel" class="px" id="handtel" value="" type="text" placeholder="联系手机">	</td> </tr>
							<tr  height="120px"><td><e:etextarea name="gzMem"  maxSize="70"   cssClass="px"  cssStyle="width:100%; height:85px;overflow:auto" nullAble='false'/></td> </tr>
							<tr  height="30px"><td> <e:eselect name="jsy"    cssClass="px" cssStyle="border: 0px;width:100%;height:40px;overflow:auto;"    queryNo="TechPersonnelList"    onchange=""  ></e:eselect>	</td> </tr>
							<tr  height="30px"><td><input class="pxbtn" name="提 交" id="save-btn" type="button"  onclick="doSubmit()" value="生成送货单"/></td> </tr>									     
							</table>
						</div>
						
									<div  >
	
 
					</div>

			</div>	
					<!--领到了优惠券end-->
			  </div>	
		
							



			</div>





	</e:form>

</body>

</e:emobile>

</html>