<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="e" uri="/eframe-tags"%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目日志管理</title>
<style type="text/css" media="screen">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}
</style>
<script>	

function init(){
	if(document.all.logmanagement.frameControlOptionId.value=='2'){
		submitForm('logmanagement','getInfoAjax',true,'','','getAfter',false,false);
	}
 
}

function getAfter(){
	document.all.logmanagement.plId.readOnly=true;
}
 
var tab2opened=false;
 
function onSelectFunction(id){
	if(!tab2opened){
		if(id=='tab2'){
			if(document.all.plId.value!=null&&document.all.plId.value!=''&&document.all.plId.value!='0'){
				tab2.location.href= "../../../oa/file/filequery.action?fileType=PJ_02&fileId="+encodeURIComponent(document.all.plId.value)+"&type=1";
				tab2opened=true;
			}else{
				return false;
			}
		}	
	}
	return true;
}

</script>
 
</head>

<e:head/>
<body style="overflow:hidden;" >
<e:form  action="logmanagement" id="logmanagement" cssStyle="border: 0px;width:100%;height:100%;" >
<e:hidden id='piId' name="piId"/> 
<table width="100%" height="100%" border="0" align="center" >
  <tr align="center" >
  <td align="center" >
  <e:etabpanel tabIds="tab1,tab2" onSelectFunction="onSelectFunction" tabTitles="项目日志,相关文件" cssStyle="width:100%;height:100%;" tabActive="tab1" tabType="T1" >
		<table width="100%" height="100%" border="0" align="center" id="tab1">
		  <tr align="center" >
		  	<td align="center" >
				<e:etab>    
				<table width="600" border="1">
				  <tr>
				    <td   class="Tab_title" width="100" >日志ID</td>
				    <td valign="middle" >
				    	<e:eshowfield name="plId"></e:eshowfield>
				    </td>
				    <td   class="Tab_title" width="100" >日志概要</td>
				    <td valign="middle" >
				    	<e:eshowfield name="plName"></e:eshowfield>
				    </td>					    
				  </tr>		  					    
				  <tr>
				    <td   class="Tab_title" width="100" >项目状态</td>
				    <td valign="middle" >
				    	<e:eselect name="plState" asName="PJ_STATE"></e:eselect>
				    </td>
				    <td   class="Tab_title" width="100" >项目类型</td>
				    <td valign="middle" >
				   		<e:eselect name="plType" asName="PJ_TYPE"></e:eselect>
				    </td>			    
				  </tr>			
				  <tr>
				    <td   class="Tab_title" width="100" >开始日期</td>
				    <td valign="middle" >
				    	<e:eshowfield name="plStartDate"></e:eshowfield>
				    </td>
				    <td   class="Tab_title" width="100" >结束日期</td>
				    <td valign="middle" >
				    	<e:eshowfield name="plEndDate"></e:eshowfield>
				    </td>			    
				  </tr>				    
				  <tr>
				    <td  class="Tab_title" >日志说明</td>
				    <td valign="middle" colspan="3">
				    	<e:etextarea name="plDetail" readonly="true" cssStyle="height:400px;" maxSize="2000" nullAble='true'/> 
					</td>
				  </tr>
				</table>
			   </e:etab>
		    </td>
		  </tr> 
		</table> 
		<iframe id="tab2" frameborder="no" style="width:100%;height:100%;"></iframe>
	</e:etabpanel>
</td>
</tr>
</table>
</e:form >
</body>
</html>
