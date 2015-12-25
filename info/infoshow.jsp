<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="e" uri="/eframe-tags"%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理</title>
<style type="text/css" media="screen">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}
</style>
<script>	
var logQuery=null;
var myScheduler=null;
var treeQuery=null;
function init(){
	if(document.all.infomanagement.frameControlOptionId.value=='2'){
		submitForm('infomanagement','getInfoAjax',true,'','','getAfter',false,false);
	}
}

function getAfter(){
	document.all.infomanagement.piId.readOnly=true;
}
 
var tab2opened=false;
var tab3opened=false;
var tab4opened=false;
var tab5opened=false;
var tab6opened=false;
var tab7opened=false;
var tab8opened=false;


function onSelectFunction(id){
	if(!tab2opened){
		if(id=='tab2'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				tab2.location.href= "../../../oa/file/filequery.action?fileType=PJ_01&fileId="+encodeURIComponent(document.all.piId.value)+"&type=2";
				tab2opened=true;
			}else{
				return false;
			}
		}	
	}
	if(!tab5opened){
		if(id=='tab5'){
			var list = new ListXML(); 
			list.add(-1,'piid',document.all.piId.value);
			var sqlcondition="";
			logQuery = new PageGrid(tab5,'PJ_INFO_02','','',list.toString(),sqlcondition,''); 
		  	logQuery.initTitle("工程日志维护");
		  	logQuery.init();		
		 	tab5opened=true;
		}	
	}	
	if(!tab3opened){
		if(id=='tab3'){	
			linkPointGis(tab3,document.all.glId.value,true);
			tab3opened=true;
		}	
	}	
	if(!tab4opened){
		if(id=='tab4'){
			linkAreaGis(tab4,document.all.gpgId.value,true);
			tab4opened=true;
		}	
	}	
	if(!tab7opened){
		if(id=='tab7'){
			var list = new ListXML(); 
			list.add(-1,'piid',document.all.piId.value);
			var sqlcondition="";
			treeQuery = new TreeGrid(tab7,'PJ_INFO_01','','',list.toString(),sqlcondition,''); 
		  	treeQuery.initTitle("工程日志维护");
		  	treeQuery.initRootId(document.all.piId.value);
		  	treeQuery.init();		
			tab7opened=true;
		}	
	}		
 	if(!tab8opened){
		if(id=='tab8'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				tab8.location.href= "../../../finance/register/registerselect.action?keyId="+encodeURIComponent(document.all.piId.value)+"&keyType=PJ&frameQueryNo=show";
				tab8opened=true;
			}else{
				return false;
			}
		}	
	}	
	return true;
}

function afterSelectFunction(id){
	if(!tab6opened){
		if(id=='tab6'){
			var list = new ListXML(); 
			list.add(-1,'piid',document.all.piId.value);
			var sqlcondition="";
		  	myScheduler = new Scheduler(tab6,'PJ_INFO_03','','',list.toString(),sqlcondition,''); //声明日志查询
			myScheduler.init(document.all.startDate.value); //初始化
		 	tab6opened=true;
		}
	}
}



function on_PJ_INFO_02_click(object,row){
    var plId=logQuery.getCellValueById(row,"PLID");   
	if(plId!=""){
		var url="../log/logmanagement.action?plId="+encodeURIComponent(plId)+"&frameQueryNo=show&frameControlOptionId=2";
    	var rv=popDialog(url,'','dialogwidth=700px; dialogheight=600px; status=no');
    	CollectGarbage(); 
	}
}

function on_PJ_INFO_01_click(object,row){
    var piId=treeQuery.getCellValueById(row,"PIID");   
	if(piId!=""){
		var url="infomanagement.action?piId="+encodeURIComponent(piId)+"&frameQueryNo=show&frameControlOptionId=2";
    	var rv=popDialog(url,'','dialogwidth=700px; dialogheight=600px; status=no');
    	CollectGarbage(); 
	}	
}
 


</script>
 
</head>

<e:head/>
<body style="overflow:hidden;" >
<e:form  action="infomanagement" id="infomanagement" cssStyle="border: 0px;width:100%;height:100%;" >
<e:hidden id='glId' name="glId"/> 
<e:hidden id='gplId' name='gplId' />
<e:hidden id='gpgId' name='gpgId' />
<e:hidden id='startDate' name='startDate' />
<table width="100%" height="100%" border="0" align="center" >
  <tr align="center" >
  <td align="center" >
  <e:etabpanel tabIds="tab1,tab2,tab3,tab4,tab5,tab6,tab7,tab8" onSelectFunction="onSelectFunction" afterSelectFunction="afterSelectFunction" tabTitles="项目信息,附属文件,项目坐标,项目区域,项目日志,日志视图,子项目,费用登记" cssStyle="width:100%;height:100%;" tabActive="tab1" tabType="T1" >
		<table width="100%" height="100%" border="0" align="center" id="tab1">
		  <tr align="center" >
		  	<td align="center" >
				<e:etab>    
	<table width="600" border="1">
				  <tr>
				    <td   class="Tab_title" width="100" >项目ID</td>
				    <td valign="middle" >
				    	<e:eshowfield name="piId"></e:eshowfield>
				    </td>
				    <td   class="Tab_title" width="100" >上级项目ID</td>
				    <td valign="middle" >
				    	<e:epopfield name="piPid" readonly="true" ondblclick="selectPiPid(this)" maxSize="32" nullAble="true" /> 
				    </td>			    
				  </tr>		
	 			  <tr>
				    <td   class="Tab_title" width="100" >项目名称</td>
				    <td valign="middle" colspan="3">
				    	<e:etextfield name="piName"  maxSize="128"   nullAble='false'/>
				    </td>			    
				  </tr>
				  <tr>
				    <td   class="Tab_title" width="100" >项目编号</td>
				    <td valign="middle" colspan="3">
				    	<e:etextfield name="piNo"  maxSize="32"   nullAble='false'/>
				    </td>    
				  </tr>				  					    
				  <tr>
				    <td   class="Tab_title" width="100" >项目状态</td>
				    <td valign="middle" >
				    	<e:eselect name="piState" asName="PJ_STATE"></e:eselect>
				    </td>
				    <td   class="Tab_title" width="100" >项目类型</td>
				    <td valign="middle" >
				   		<e:eselect name="piType" asName="PJ_TYPE"></e:eselect>
				    </td>			    
				  </tr>			


			     <tr>
				    <td   class="Tab_title" width="100" >项目联系人</td>
				    <td valign="middle" >
				    	<e:etextfield name="linkman"  maxSize="16"   nullAble='true'/>
				    </td>
				    <td   class="Tab_title" width="100" >联系电话</td>
				    <td valign="middle" >
				   			<e:etextfield name="linktel"  maxSize="32"   nullAble='true'/>
				    </td>			    
				  </tr>	
				  
			  

			     <tr>
				    <td   class="Tab_title" width="100" >项目投资额</td>
				    <td valign="middle" >
				    	<e:etextfield name="inveAmount"  maxSize="16"   nullAble='true'/>
				    </td>
				    <td   class="Tab_title" width="100" >项目面积</td>
				    <td valign="middle" >
				   			<e:etextfield name="area"  maxSize="32"   nullAble='true'/>
				    </td>			    
				  </tr>	

				  
				 <tr>
				    <td  class="Tab_title" >项目地址</td>
				    <td valign="middle" colspan="3">
                     	<e:etextfield name="address"  maxSize="128"   nullAble='true'/>             					</td>
				  </tr>


				 <tr>
				    <td   class="Tab_title" width="100" >项目开始日期</td>
				    <td valign="middle" >
				    	<e:edatefield nullAble="true"  name="piStartDate" format="yyyy-mm-dd"></e:edatefield>
				    </td>
				    <td   class="Tab_title" width="100" >项目结束日期</td>
				    <td valign="middle" >
				   		<e:edatefield nullAble="true"  name="piEndDate" format="yyyy-mm-dd"></e:edatefield>
				    </td>			    
				  </tr>	
				  		
		          <tr>
				    <td   class="Tab_title" width="100" >项目负责人</td>
				    <td valign="middle" >
				    	<e:etextfield name="manager"  maxSize="16"   nullAble='true'/>
				    </td>
				    <td   class="Tab_title" width="100" >联系电话</td>
				    <td valign="middle" >
				   			<e:etextfield name="managertel"  maxSize="32"   nullAble='true'/>
				    </td>			    
				  </tr>			
				  		
	 
				  				  			    
				  <tr>
				    <td  class="Tab_title" >项目概述</td>
				    <td valign="middle" colspan="3">
				    	<e:etextarea name="piDetail" cssStyle="height:280px;" maxSize="2000" nullAble='true'/> 
					</td>
				  </tr>
				</table>				
				
				
				
				
			   </e:etab>
		    </td>
		  </tr> 
		</table> 
		<iframe id="tab2" frameborder="no" style="width:100%;height:100%;"></iframe>
		<iframe id="tab3" frameborder="no" style="width:100%;height:100%;"></iframe>
		<iframe id="tab4" frameborder="no" style="width:100%;height:100%;"></iframe>
		<div id="tab5" frameborder="no" style="width:100%;height:100%;"></div>
		<div id="tab6" frameborder="no" style="width:100%;height:100%;"></div>
		<div id="tab7" frameborder="no" style="width:100%;height:100%;"></div>
		<iframe id="tab8" frameborder="no" style="width:100%;height:100%;"></iframe>
	</e:etabpanel>
</td>
</tr>
</table>
</e:form >
</body>
</html>
