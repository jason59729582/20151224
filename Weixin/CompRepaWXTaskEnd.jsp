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

   
	function doSubmit(){
		  submitForm("CompRepaWeixin","Arrive",true,"","beforeSubmit","afterSubmit",false,true);
	}
	function beforeSubmit(){

     document.all.initStep.value ="S2";
     return true;

}
	
function afterSubmit(){
  refreshMsg();
 
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


 var   xfTime  ='<%=(String)request.getAttribute("xfTime")%>';
                        var   sfType  ='<%=(String)request.getAttribute("sfType")%>'; 
                        if(sfType=='01')sfType='现金';
                        if(sfType=='04')sfType='现金';
                        if(sfType=='05')sfType='赠送';
    var   jsMem  ='<%=(String)request.getAttribute("jsMem")%>';      
    
        var   smf  ='<%=(String)request.getAttribute("smf")%>';    
          var   clf  ='<%=(String)request.getAttribute("clf")%>';                              
         var   wxf  ='<%=(String)request.getAttribute("wxf")%>';  
           var   sjsf  ='<%=(String)request.getAttribute("sjsf")%>';                          
         var   wxJf  ='<%=(String)request.getAttribute("wxJf")%>';        
         
                  if(sfType=='null')sfType='没有确定';   


var imageHtml=document.all.imageHtml.value;
     if(imageHtml=='null')imageHtml='';
     

var innerHTML=
 '<img src="images/02SEnd.jpg">'+
   '<br>'+
 '<p  >客户名称：<strong>'+khname+'</strong></p>'+
'<p>客户地址:<span class="red">'+khaddr+'</span></p>'+
'<p>联系人：'+khname+'</p>'+
'<p>联系人手机：'+handtel+'</p>'+
'<p >故障描述：<span class="red">'+gzMem+'</span></p>'+
'<br>'+
  '<p  >技术员：<strong>'+jsy+'</strong></p>'+
  '<p >报修单号：<span class="red">'+wxdh+'</span> </p>'+
    '<p  >承诺到达：<strong>'+cnxfTime+'</strong></p>'+
    '<p  >实际到达：<strong>'+ddTime+'</strong></p>'+
     '<p  >离开时间：<strong>'+leaveTime+'</strong></p>'+
	 
     '<br>'+
  '<p  ><strong>收费情况</strong></p>'+
    '<p >收费类型：<span class="red">'+sfType+'</span> </p>'+
  '<p >上门费：<span class="red">'+smf+'</span> </p>'+
    '<p>材料费：<strong>'+clf+'</strong></p>'+
    '<p  >维修费（工时费）：<strong>'+wxf+'</strong></p>'+
     '<p  >合计收费：<strong>'+sjsf+'</strong></p>'+
	 
     '<br>'+
     '<p  >本维修单已经完成，正在好格内审！</p>';



document.all.innerHTML.value = innerHTML;
msg.innerHTML=innerHTML+ imageHtml;
 
 
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