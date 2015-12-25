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

  var jsMem ='';      
  var smf ='';
  var clf ='';
  var sjsf ='';
  var wxJf = '';
  var wxf = '';
  var sfType = '';

<%=jsWxConfig%>

   
function doSubmit(){
  submitForm("CompRepaWeixin","hgWxxf",true,"","beforeSubmit","afterSubmit",false,true);
}

function beforeSubmit(){
  jsMem  =  document.all.jsMem.value;
  smf  =  document.all.smf.value;
  clf  =  document.all.clf.value;
  sjsf  =  document.all.sjsf.value;
  wxJf  =  document.all.wxJf.value;
  wxf =  document.all.wxf.value;
  sfType = document.all.sfType.value;

  document.all.initStep.value ="S9";
  return true;
}
	
function afterSubmit(){var khname = '<%=(String)request.getAttribute("khname")%>';
  var khaddr = '<%=(String)request.getAttribute("khaddr")%>';
  var handtel = '<%=(String)request.getAttribute("handtel")%>';
  var lxr = '<%=(String)request.getAttribute("lxr")%>';
  var wxdh = '<%=(String)request.getAttribute("wxdh")%>';
  var jsy = '<%=(String)request.getAttribute("jsy")%>';
  var gzMem = '<%=(String)request.getAttribute("gzMem")%>';
  var cnxfTime = '<%=(String)request.getAttribute("cnxfTime")%>';
  var ddTime = '<%=(String)request.getAttribute("ddTime")%>';
  var leaveTime = '<%=(String)request.getAttribute("leaveTime")%>';
  var  xfTime = '<%=(String)request.getAttribute("xfTime")%>';
  //var   sfType  ='<%=(String)request.getAttribute("sfType")%>'; 
  if(sfType=='01')sfType='现金';
  if(sfType=='04')sfType='欠款';
  if(sfType=='05')sfType='赠送';
  if(sfType=='null')sfType='没有确定';   
  if(smf=='null')smf=''; 
  if(xfTime=='null')xfTime='';
  if(clf=='null')clf ='0.00';
  if(wxf=='null')wxf ='0.00';
  if(sjsf=='null')sjsf ='0.00';  
  if(wxJf=='null')wxJf ='0.00';  
  if(khname=='null')khname='';
  if(handtel=='null')handtel ='';
  if(lxr=='null')lxr ='';
  if(gzMem=='null')gzMem ='';  
  if(jsy=='null')jsy ='';  
  if(cnxfTime=='null')cnxfTime ='';   
  if(ddTime=='null')ddTime ='';   
  if(leaveTime=='null')leaveTime ='';      

var imageHtml=document.all.imageHtml.value;
     if(imageHtml=='null')imageHtml='';
     

var innerHTML=
 '<img src="images/06S9.jpg">'+
   '<br>'+
'<p  >客户名称：<strong>'+khname+'</strong></p>'+
'<p>客户地址：<span class="red">'+khaddr+'</span></p>'+
'<p>联系人：'+khname+'</p>'+
'<p>联系人手机：'+handtel+'</p>'+
'<p >备注信息：<span class="red">'+gzMem+'</span></p>'+
'<br>'+
  '<p  >送货员：<strong>'+jsy+'</strong></p>'+
  '<p >送货单号：<span class="red">'+wxdh+'</span> </p>'+
//    '<p  >承诺到达：<strong>'+cnxfTime+'</strong></p>'+
    '<p  >送达时间：<strong>'+ddTime+'</strong></p>'+
//     '<p  >离开时间：<strong>'+leaveTime+'</strong></p>'+
//     '<p  >修复时间：<strong>'+xfTime+'</strong></p>'+

     '<br>'+
   '<p  >收费类型：<strong>'+sfType+'</strong></p>'+
   '<p  >上门费：<strong>'+smf+'</strong></p>'+
    '<p  >交通费：<strong>'+clf+'</strong></p>'+
     '<p  >送货费：<strong>'+wxf+'</strong></p>'+
     '<p  >实际收费：<strong>'+sjsf +'</strong></p>'+
     '<p  >技术员积分：<strong>'+wxJf+'</strong></p>';
     


 document.all.innerHTML.value = innerHTML;
msg.innerHTML=innerHTML;
 
 
    return true;

}

	function init(){
  refreshMsg();
 
	}
	
function refreshMsg(){
var khname = '<%=(String)request.getAttribute("khname")%>';
    var khaddr = '<%=(String)request.getAttribute("khaddr")%>';
     var handtel = '<%=(String)request.getAttribute("handtel")%>';
     var lxr =  '<%=(String)request.getAttribute("lxr")%>';
     var wxdh=  '<%=(String)request.getAttribute("wxdh")%>';
     var jsy=  '<%=(String)request.getAttribute("jsy")%>';
     var gzMem=    '<%=(String)request.getAttribute("gzMem")%>';
     var cnxfTime=    '<%=(String)request.getAttribute("cnxfTime")%>';
    var   ddTime  ='<%=(String)request.getAttribute("ddTime")%>';
        var   leaveTime  ='<%=(String)request.getAttribute("leaveTime")%>';
      if(khname=='null')khname='';
     if(handtel=='null')handtel ='';
     if(lxr=='null')lxr ='';
     if(gzMem=='null')gzMem ='';  
     if(jsy=='null')jsy ='';  
       if(cnxfTime=='null')cnxfTime ='';   
           if(ddTime=='null')ddTime ='';   
               if(leaveTime=='null')leaveTime ='';      



var imageHtml=document.all.imageHtml.value;
     if(imageHtml=='null')imageHtml='';
     

var innerHTML=
 '<img src="images/06S9.jpg">'+
   '<br>'+
 '<p  >客户名称：<strong>'+khname+'</strong></p>'+
'<p>客户地址：<span class="red">'+khaddr+'</span></p>'+
'<p>联系人：'+khname+'</p>'+
'<p>联系人手机：'+handtel+'</p>'+
'<p >备注信息：<span class="red">'+gzMem+'</span></p>'+
'<br>'+
  '<p  >技术员：<strong>'+jsy+'</strong></p>'+
  '<p >报修单号：<span class="red">'+wxdh+'</span> </p>'+
//    '<p  >承诺到达：<strong>'+cnxfTime+'</strong></p>'+
    '<p  >送达时间：<strong>'+ddTime+'</strong></p>'+
//     '<p  >离开时间：<strong>'+leaveTime+'</strong></p>'+
     '<br>'+
     '<p  >您的送货工作，已经暂时结束，请及时联系商务结算单据!</p>'+
    							'<select  class="px" name="sfType">'+
                  '<option value="00" selected="selected" >请选择收费类型</option>'+
                  '<option value="01" >现金</option>'+
                  '<option value="04" >欠款</option>'+
                  '<option value="05" >赠送</option>'+
               '</select>'+
	     '<input name="jsMem" class="px" id="jsMem" value="" type="text" placeholder="结算说明">'+						 
     '<input name="smf" class="px" id="smf" value="" type="text" placeholder="上门费">'+
     '<input name="clf" class="px" id="clf" value="" type="text" placeholder="交通费">'+
     '<input name="wxf" class="px" id="wxf" value="" type="text" placeholder="送货费">'+  
      '<input name="sjsf" class="px" id="sjsf" value="" type="text" placeholder="实际收费">'+
     '<input name="wxJf" class="px" id="wxJf" value="" type="text" placeholder="结算积分">'+ 
    '<input name="sfBillcode" class="px" id="sfBillcode" value="" type="text" placeholder="收费单据">'+
    '<input class  ="pxbtn" name="提 交" id="save-btn" type="button"  onclick="doSubmit()" value="确认费用及提交">';

 document.all.innerHTML.value = innerHTML;
msg.innerHTML=innerHTML;
 
 
    return true;
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
	
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp; </p>
	
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