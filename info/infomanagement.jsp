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
var treeQuery=null;
function init(){
	if(document.all.infomanagement.frameControlOptionId.value=='2'){
		submitForm('infomanagement','getInfoAjax',true,'','','getAfter',false,false);
	}
 
}

function getAfter(){
	//document.all.infomanagement.wxdh.readOnly=true;
	//document.all.infomanagement.submit2.disabled=false;
		document.all.infomanagement.khname.readOnly=true;
}

function saveBefore(){
	try{
		var flag = tab3.getPackage();
		if(flag=="error"){
			return false;
		}
		document.all.infomanagement.glPackage.value=flag;
	}catch(err){}
	try{
		var flag = tab4.getPackage();
		if(flag=="error"){
			return false;
		}
		document.all.infomanagement.gpgPackage.value=flag;
	}catch(err){}
	 
	return true;
}

function saveAfter(){
	document.all.infomanagement.submit1.disabled=false;
	document.all.infomanagement.submit2.disabled=false;
	
	
	try{
		tab3.loadInfo(document.all.infomanagement.glId.value);
	}catch(err){}
	
	try{
		tab4.loadInfo(document.all.infomanagement.gpgId.value);
	}catch(err){}
	
}


function delBefore(){
	if(document.all.infomanagement.piId.value!=''){
		return confirm("您确定要删除本项目记录？");
	}
	return false;
}

function delAfter(){
	top.close();
}

var tab2opened=false;
var tab3opened=false;
var tab4opened=false;
var tab5opened=false;
var tab7opened=false;
var tab8opened=false;

function onSelectFunction(id){
	if(!tab2opened){
		if(id=='tab2'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				tab2.location.href= "../../../oa/file/fileselect.action?fileType=PJ_01&fileId="+encodeURIComponent(document.all.piId.value)+"&type=1";
				tab2opened=true;
			}else{
				return false;
			}
		}	
	}
	if(!tab5opened){
		if(id=='tab5'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				tab5.location.href= "../log/logselect.action?piId="+encodeURIComponent(document.all.piId.value);
				tab5opened=true;
			}else{
				return false;
			}
		}	
	}	
	if(!tab3opened){
		if(id=='tab3'){	
			linkPointGis(tab3,document.all.glId.value);
			tab3opened=true;
		}	
	}	

	if(!tab7opened){
		if(id=='tab7'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				var list = new ListXML(); 
				list.add(-1,'piid',document.all.piId.value);
				var sqlcondition="";
				treeQuery = new TreeGrid(tab7,'PJ_INFO_01','','',list.toString(),sqlcondition,''); 
			  	treeQuery.initTitle("工程日志维护");
			  	treeQuery.initRootId(document.all.piId.value);
			  	treeQuery.init();		
				tab7opened=true;
			}else{
				return false;
			}			
		}	
	}		
	if(!tab8opened){
		if(id=='tab8'){
			if(document.all.piId.value!=null&&document.all.piId.value!=''&&document.all.piId.value!='0'){
				tab8.location.href= "../../../finance/register/registerselect.action?keyId="+encodeURIComponent(document.all.piId.value)+"&keyType=PJ";
				tab8opened=true;
			}else{
				return false;
			}
		}	
	}		
	return true;
}

function selectPiPid(obj){
	var list = new ListXML(); 
	popUpGrid(obj,'PJ_INFO_01','','',list.toString(),'code',''); 
}



</script>
 
</head>

<e:head/>
<body style="overflow:hidden;" >
<e:form  action="infomanagement" id="infomanagement" cssStyle="border: 0px;width:100%;height:100%;" >
<e:hidden id='directoryNo' name="directoryNo"/>
<e:hidden id='glId' name="glId"/> 
<e:hidden id='glPackage' name="glPackage"/> 


<table width="100%" height="100%" border="0" align="center" >
  <tr align="center" >
  <td align="center" >
  <e:etabpanel tabIds="tab1,tab2,tab3,tab5,tab8" onSelectFunction="onSelectFunction"  tabTitles="项目信息,附属文件,地理位置,项目日志,费用登记" cssStyle="width:100%;height:100%;" tabActive="tab1" tabType="T1" >
		<table width="100%" height="100%" border="0" align="center" id="tab1">
		  <tr align="center" >
		  	<td align="center" >
				<e:etab>    
				<table width="600" border="1">
				  <tr>
				    <td   class="Tab_title" width="100" >维修单号</td>
				    <td valign="middle" >
				    	<e:eshowfield name="wxdh"></e:eshowfield>
				    </td>
				    <td   class="Tab_title" width="100" >上级维修单号</td>
				    <td valign="middle" >
				    	<e:epopfield name="piPid" readonly="true" ondblclick="selectPiPid(this)" maxSize="32" nullAble="true" /> 
				    </td>			    
				  </tr>		
	 			  <tr>
				    <td   class="Tab_title" width="100" >客户名称</td>
				    <td valign="middle" colspan="3">
				    	<e:etextfield name="khname"  maxSize="128"   nullAble='false'/>
				    </td>			    
				  </tr>
				  <tr>
				    <td   class="Tab_title" width="100" >客户地址</td>
				    <td valign="middle" colspan="3">
				    	<e:etextfield name="khaddr"  maxSize="32"   nullAble='false'/>
				    </td>    
				  </tr>	
				  
				  
			     <tr>
				    <td   class="Tab_title" width="100" >联系人</td>
				    <td valign="middle" >
				    	<e:etextfield name="lxr"  maxSize="16"   nullAble='true'/>
				    </td>
				    <td   class="Tab_title" width="100" >使用人</td>
				    <td valign="middle" >
				   			<e:etextfield name="syr"  maxSize="32"   nullAble='true'/>
				    </td>			    
				  </tr>	
				  
				  				  
				  			  					    
				  <tr>
				    <td   class="Tab_title" width="100" >坏件种类</td>
				    <td valign="middle" >
				    	<e:eselect name="hjzl" asName="COMPUTER_DEVICE" emptyOption="true"  ></e:eselect>
				    </td>
				    <td   class="Tab_title" width="100" >维修方式</td>
				    <td valign="middle" >
				   		<e:eselect name="wxfs"  emptyOption="true"  ></e:eselect>
				    </td>			    
				  </tr>			



			  

			     <tr>
				    <td   class="Tab_title" width="100" >上门费</td>
				    <td valign="middle" >
				    	<e:etextfield name="doorfee"  maxSize="16"   nullAble='true'/>
				    </td>
				    <td   class="Tab_title" width="100" >维修费</td>
				    <td valign="middle" >
				   			<e:etextfield name="wxf"  maxSize="32"   nullAble='true'/>
				    </td>			    
				  </tr>	

				  
				 <tr>
				    <td  class="Tab_title" >故障描述</td>
				    <td valign="middle" colspan="3">
                     	<e:etextfield name="gzms"  maxSize="128"   nullAble='true'/>   </td>
				  </tr>


				 <tr>
				    <td   class="Tab_title" width="100" >接单日期</td>
				    <td valign="middle" >
				    	<e:edatefield nullAble="true"  name="jdTime" format="yyyy-mm-dd hh:mm:ss"></e:edatefield>
				    </td>
				    <td   class="Tab_title" width="100" >派工日期</td>
				    <td valign="middle" >
				   		<e:edatefield nullAble="true"  name="pgTime" format=" yyyy-mm-dd hh:mm:ss"></e:edatefield>
				    </td>			    
				  </tr>	
	
				 <tr>
				    <td   class="Tab_title" width="100" >修复日期</td>
				    <td valign="middle" >
				    	<e:edatefield nullAble="true"  name="xfTime" format="yyyy-mm-dd hh:mm:ss"></e:edatefield>
				    </td>
				    <td   class="Tab_title" width="100" >取件日期</td>
				    <td valign="middle" >
				   		
				    </td>			    
				  </tr>	
				  		
 
				  		
	 
				  				  			    
				  <tr>
				    <td  class="Tab_title" >维修备注</td>
				    <td valign="middle" colspan="3">
				    	<e:etextarea name="mem" cssStyle="height:120px;" maxSize="2000" nullAble='true'/> 
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
		<iframe id="tab5" frameborder="no" style="width:100%;height:100%;"></iframe>
		<div id="tab7" frameborder="no" style="width:100%;height:100%;"></div>
		<iframe id="tab8" frameborder="no" style="width:100%;height:100%;"></iframe>
	</e:etabpanel>
</td>
</tr>
<tr height="30" align="center" >
  <td align="center" >
	<table width="100%" height="100%" border="0" align="center" >  
	  <tr >
	    <td height="30" align="center">	
			<e:esubmit hotKey="112" name="submit1" title="保 存(F1)" formID="infomanagement"  submitFunction="saveInfoAjax" isAutoRebind="true"  beforeFunction="saveBefore" afterFunction="saveAfter" isWait="false" isCheck="true"  value="保 存(F1)" />    
			<e:esubmit hotKey="113" name="submit2" title="删 除(F2)"  formID="infomanagement"  submitFunction="deleteInfoAjax" isAutoRebind="true"  beforeFunction="delBefore" afterFunction="delAfter" isWait="false" isCheck="true"  value="删 除(F2)"  disabled="true" />    
			<e:ebutton hotKey="114" name="btn_close" title="退 出(F3)" onclick="top.close()" value="退 出(F3)" /> 
		</td>	
	  </tr>
	</table>  
   </td>
  </tr>
</table>
</e:form >
</body>
</html>
