<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
 
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
 
 

<script type="text/javascript">
	function doSubmit(){
		  submitForm("CompRepaWeixin","hgWxxf",true,"","beforeSubmit","afterSubmit",false,true);
	}
	function init(){
    refreshMsg();
	}
function beforeSubmit(){
document.all.initStep.value ="S9";

return true;

}
	
	
function afterSubmit(){
   refreshMsg();
    return true;
}
 
function refreshMsg(){
msg.innerHTML=
'<p>&nbsp;<p>'+
'<p>&nbsp;<p>'+
'<p>&nbsp;<p>'+
'<p>&nbsp;<p>'+
'<p>&nbsp;<p>'+
' <p  >单据号：<strong><%=(String)request.getAttribute("wxdh")%></strong>                      您的任务：<strong>电脑维修</strong></p>'+
					'<p  >技术员：<strong><%=(String)request.getAttribute("jsy")%></strong>'+     
							'<p>客户名称:<span class="red"><%=(String)request.getAttribute("khname")%> </span>&nbsp;&nbsp;&nbsp;联系人：<%=(String)request.getAttribute("syr")%></p>'+
							'<p>客户地址：<span class="red"><%=(String)request.getAttribute("khaddr")%></span></p>'+
							'<p>工作总结：<span class="red"><%=(String)request.getAttribute("wxMem")%></span></p>'+
							'<p>收款方式：<span class="red"><%=(String)request.getAttribute("sfType")%></span>01-现金;02- POS;03- 支票;04-欠款;05-赠送;06-电汇;07- 贷记</p>'+
							'<p>费用单据：<span class="red"><%=(String)request.getAttribute("sfBillcode")%></span></p>'+
							'<p>服务费：<span class="red"><%=(String)request.getAttribute("smf")%></span></p>'+
								'<p>材料费：<span class="red"><%=(String)request.getAttribute("wxf")%></span></p>'+
							'<p>服务费：<span class="red"><%=(String)request.getAttribute("clf")%></span></p>'+						
								'<p>实际收费：<span class="red"><%=(String)request.getAttribute("sjsf")%></span></p>';									

 		                    
}
 

	
	
</script>



</head>
 
<e:emobile  type="simple">
<e:head/>

<body class="activity-coupon-winning" style="" onLoad="init();">
<e:form action="CompRepaWeixin" name="CompRepaWeixin" id="CompRepaWeixin">
<e:hidden id="step"  name="step" ></e:hidden>
<e:hidden name="initStep" ></e:hidden>
<e:hidden name="wxdh" ></e:hidden>



			<div class="main">
				<div class="cover" id="Conponid">
			</div>

			<div class="content">	   
			
			
			<div id="zjl" style="" class="boxcontent boxwhite">
					<div class="box">
						<div class="title-red">任务信息：</div>
						<div  id="msg" class="Detail">
 

	
						</div>
					</div>


			</div>	
					<!--领到了优惠券end-->
			  </div>	
		
							


			</div>




	</e:form>

</body>

</e:emobile>

</html>