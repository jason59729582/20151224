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
		  submitForm("CompRepaWeixin","Arrive",true,"","beforeSubmit","afterSubmit",false,true);
	}
	function init(){
 
	}
function beforeSubmit(){
 step
  return true;
}
	
	
function afterSubmit(){
   refreshMsg();
    return true;
}
 
function refreshMsg(){


}
 

	
	
</script>



</head>
 
<e:emobile  type="simple">
<e:head/>

<body class="activity-coupon-winning" style="" onLoad="init();">
<e:form action="CompRepaWeixin" name="CompRepaWeixin" id="CompRepaWeixin">
<e:hidden name="step" ></e:hidden>
<e:hidden name="initStep" ></e:hidden>
<e:hidden name="wxdh" ></e:hidden>



			<div class="main">
				<div class="cover" id="Conponid">
			   	<img id="winaprize" src="images/诚心为您服务.jpg"></div>
			</div>

			<div class="content">	   
			
			
			<div id="zjl" style="" class="boxcontent boxwhite">
					<div class="box">
						<div class="title-red">任务信息：</div>
						<div  id="msg" class="Detail">
							<p  >技术员：<strong><%=(String)request.getAttribute("jsy")%></strong>     
							<p>客户名称:<span class="red"><%=(String)request.getAttribute("khname")%></span></p>

    					
							<p>&nbsp;</p>
							<p>&nbsp;</p>
							<p>&nbsp; </p>
	
						</div>
					</div>
				<div style="height:60px;"></div>
				<div class="cover" id="bootcover">
			   	<img id="a11" src="images/01s1.jpg"></div>
			</div>	
					<!--领到了优惠券end-->
			  </div>	
		
							

          <div class="boxcontent boxwhite">
						<div class="box">
							<div class="title-brown"><span>您的下一任务</span></div>
							<div class="Detail">
							<p> 任务说明： </p>
					 	  </div>
						</div>
		 </div>

			</div>


<div class="footFix" id="footReturn"><a href="javascript:void(0)" onClick="location.href='/index.php?g=Wap&amp;m=Index&amp;a=index&amp;token=qoiktq1426662252&amp;wecha_id=oRRV9sxCp36F-YrRozpBd2F63K04';"><span>返回3G网站</span></a></div>	



	</e:form>

</body>

</e:emobile>

</html>