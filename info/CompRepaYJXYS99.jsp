

<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="e" uri="/eframe-tags"%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<title>好格维修任务单</title>

<style type="text/css" media="screen">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<script type="text/javascript" src="/web/html/HgPublic/HgLib/HgStd.js"></script>
<script type="text/javascript" src="ComputerRepair.js"></script>
<script type="text/javascript">

var ActiveTab="tab1";
var f_tab9=false;
var picnum=0;
var myQuery;

var logopened=false;

var DocFrameOn= false;
var DocModiOn= false;
var  SubFrameOn=false;

 



function init(){

//expenseBar

	if(document.all.MainForm.frameControlOptionId.value=='1' ){
		submitForm('MainForm','Add',true,'','','',true,false);
	}
	if(document.all.MainForm.frameControlOptionId.value=='2' ){
		submitForm('MainForm','RecoRefresh',true,'','','afterRefresh',true,false);
	
	}

	
 
}

function submitBefore(){

 	    document.all.MainForm.step.value = "S99";

}

function afterRefresh(){

     var ParentWxdh= document.all.MainForm.ParentWxdh.value;
	 if (ParentWxdh!='' ){
	 		expenseBar1.style.display='';
			expenseBar2.style.display='';
			expenseBar3.style.display='';
		    
		  
			
			
			
			
	 }else{
	 
	 	    expenseBar1.style.display='';
			expenseBar2.style.display='';
			expenseBar3.style.display='';
		    
		    
			
			
	 }
 


}



function GridRefresh(){
	     var list = new ListXML(); 
       //list.add(-1,'listtype',listtype);
           ParentWxdh = document.MainForm.wxdh.value; 
           whereCondition1 ="ParentWxdh='"+ParentWxdh+"'";
           orderField1='';
           list1str = list.toString();
            RefreshPageGrid("queryFrame1","ComputerRepair",whereCondition1,list1str,orderField1,"0");
 
  }


function do_qybh_change(){
	var qybh = document.all.id.value;
	if(qybh!=''){
	  submitForm('MainForm','qybhRefresh',true,'','','',false,false);
	}   
}




function PopParentWxdh(obj){
    var temp=obj.value;
    obj.value="";
    var list = new ListXML();
    list.add(-1,"usercode",'');
 	popUpGrid(obj,"PopParentWxdh",'', '', list.toString(),"RetField", '');
	if(obj.value==""){
	    obj.value=temp;
 	}else{
 	   var back = obj.value; 
  	   document.all.MainForm.ParentWxdh.value = back.split('|~~|')[1];
	   afterRefresh();
      }
   
}



function PopempSelect(obj){
    var temp=obj.value;
    obj.value="";
    var list = new ListXML();
    list.add(-1,"usercode",'');
 	popUpGrid(obj,"PopTraderCompany",'', '', list.toString(),"RetField", '');
	if(obj.value==""){
	    obj.value=temp;
 	}else{
 	   var back = obj.value; 
  	   document.all.MainForm.khcode.value = back.split('|~~|')[2];
  	   document.all.MainForm.khname.value = back.split('|~~|')[3];
  	   document.all.MainForm.khaddr.value = back.split('|~~|')[4];
       document.all.MainForm.lxr.value = back.split('|~~|')[5];
  	   document.all.MainForm.tel.value = back.split('|~~|')[6];  
       document.all.MainForm.glId.value = back.split('|~~|')[7];  	     	    
    }
   
}
function PopSyrSelect(obj){
    var temp=obj.value;
    obj.value="";
    var list = new ListXML();
    list.add(-1,"listid", document.all.MainForm.khcode.value);
    
 	 	popUpGrid(obj,"PopTrarderEmp",'', '', list.toString(),"RetField", '');
	if(obj.value==""){
	    obj.value=temp;
 	}else{
 	   var back = obj.value; 
 	    document.all.MainForm.syr.value = back.split('|~~|')[3];
 	    document.all.MainForm.ip.value = back.split('|~~|')[7];
 	    document.all.MainForm.mac.value = back.split('|~~|')[8];
 	  	document.all.MainForm.ProductSn.value = back.split('|~~|')[9];   
    }
   
}


 


function afterSelectFunction(id){
		//相关人员

		 if(id=='empFrame'){
		     ActiveTab="empFrame";
			if(document.MainForm.wxdh.value!=null&&document.MainForm.wxdh.value!=''&&document.MainForm.wxdh.value!='0'){
			
				empFrame.location.href= "/web/html/HgPublic/Employ/LinkManSelect.action?listtype=ComputerRepair&listId="+encodeURIComponent(document.MainForm.wxdh.value);

			}else{
				return false;
			}
        }
   		//子单据
	 if(!SubFrameOn){		
		 if(id=='SubFrame'){
		     ActiveTab="SubFrame";
			if(document.MainForm.wxdh.value!=null&&document.MainForm.wxdh.value!=''&&document.MainForm.wxdh.value!='0'){
			   SubFrameOn=true;
                  GridRefresh();
			}else{
				return false;
			}
        }
      }     

      //电子地图

      if(id=='MapFrame'){
 
                ActiveTab="MapFrame";
   	     	if(document.MainForm.wxdh.value!=null&&document.MainForm.wxdh.value!=''&&document.MainForm.wxdh.value!='0'){
   	     	
   	     			var param =frameDialogArguments();
		            if(param!=null&&param!=""){
			           param.gisRefreshFlag="1";
		            }
   		           	var url  ="/web/html/HgPublic/Gis/GisPoint.action?hideBar=1&glId="+document.MainForm.glId.value;
   		       	         

   
		     	    MapFrame.location.href = url;
		      } else {
				return false;
			  }
       }
       

       
}
        
 

function delAfter(){
    close();
   
}

function SaveBefore(){
	try{
		var flag = MapFrame.getPackage();
		if(flag=="error"){
			return false;
		}
		document.all.MainForm.glPackage.value=flag;
	}catch(err){}
	try{
		var flag = MapFrame.getPackage();
		if(flag=="error"){
			return false;
		}
		document.all.MainForm.gpgPackage.value=flag;
	}catch(err){}
	 
	return true;

}


function delBefore(){
    var id = document.all.MainForm.wxdh.value;
	if(id!=''){
		return confirm("您确定要删除维修单号是:<<"+id+">>维修单吗？");
	}
	return false;
}

function changepic(){
	picnum=picnum+1;
	refreshImg();
}  

function refreshImg(){
	var qybh =document.all.id.value;
    if(qybh!=''){

        var url ="QyzlkManagermentCzj.action?frameControlSubmitFunction=downloadImg"+
        "&Suffix="+encodeURIComponent("comppic")+
        "&qybh="+encodeURIComponent(qybh)+
        "&picnum="+encodeURIComponent(picnum)+
        "&temp="+Math.random()*(1000);
		document.getElementById("comppic").src=url;
	}
} 

function PopUserSelect(obj){
    var temp=obj.value;
    obj.value="";
 	popUpGrid(obj,"pop_UserSelect",'', '', '','USERNAME', '');
	if(obj.value==""){
	    obj.value=temp;
 	}else{
 	   var back = obj.value; 
    }
    
}



function PopDefTypeSelect(obj){
    var temp=obj.value;
    obj.value="";
    var dataower= document.all.MainForm.dataower.value; 
 	popUpGrid(obj,"pop_DefType",'', '', '','deftype','');
	if(obj.value==""){
	    obj.value=temp;
 	}else{
 	   var back = obj.value; 
    }
    
}


function do_qybh_change(){
	var qybh = document.all.id.value;
	if(qybh!=''){
	  submitForm('MainForm','qybhRefresh',true,'','','',false,false);
	}   
}


 function do_Report(){
        var wxdh =  document.all.MainForm.wxdh.value;
 	    var WhereCondition = "wxdh='"+wxdh+"'";
        
		var list = new ListXML(); 	
		 var CompDepart = document.all.MainForm.CompDepart.value;
		 var RepairType =  document.all.MainForm.RepairType.value;
		var ReportName = "ComputerRepair_"+RepairType+".rpt";
		crystalReport(ReportName,'ComputerRepair','','',list.toString(),WhereCondition,'','','');
}
 


function initrProductSelect(selectObj){
        selectObj.setQuery("ComputerProductTpye",'','','','','');
} 

function initrGzmsSelect(selectObj){
        selectObj.setQuery("ComputerGzmsTpye",'','','','','');
} 




</script>
<e:head />
<e:eopi opiNo="CompRepaMana" opiName="好格维修明细(维修单)"  >
<body>
	<e:form action="CompRepaMana" id="MainForm"
		cssStyle="border: 0px;width:100%;height:100%; " onsubmit="">
		<e:hidden name="checkmode" />
		<e:hidden name="batchcode" />
		<e:hidden id='glId' name="glId" />
		<e:hidden id='glPackage' name="glPackage" />
	    <e:hidden id='step' name="step" />

 
		<!--维修部门  -->



		<!-- 用户及权限  -->
		<e:hidden id='opId' name='opId' />
		<e:hidden name='department' />

		<table width="100%" height="100%" border="0">
			<tr height="100%" valign="top">
				<td align="center"><e:etabpanel id="TabPanle"
						tabTitles="基础信息,子单据,相关文件,地理位置,档案维护,相关人员"
						tabIds="tab1,SubFrame,DocFrame,MapFrame,DocModi,empFrame"
						afterSelectFunction="afterSelectFunction"
						onSelectFunction="onSelectFunction"
	  				    cssStyle="width:100%;height:100%;" tabActive="tab1" tabType="T1">

						<div align="center" style="width:100%;height:100%;overflow:auto;"
							id="tab1">
							<br>
							<e:etab title="相关操作" tabType="T2" 	 	>
								<table width="960px">
<tr>
									<tr>
									<!--
											<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="维修派工" formID="MainForm"
												submitFunction="hgWxpg" isAutoRebind="true"
												beforeFunction="submitBefore" afterFunction="" isWait="true"
												isCheck="false" value="维修派工"     disabled="false"  /></td>
												
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="到达现场" formID="MainForm"
												submitFunction="Arrive" isAutoRebind="true"
												beforeFunction="submitBefore" afterFunction=""
												isWait="true" isCheck="false" value="到达现场"   /></td>
										<td width="100px" class="Tab_title"><e:esubmit
												name="btn_pg" title="离开现场" formID="MainForm"
												submitFunction="Leave" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="离开现场" /></td>
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="维修质检" formID="MainForm"
												submitFunction="Quality" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="维修质检" /></td>
										<td width="100px" class="Tab_title"><e:esubmit
												name="btn_pg" title="维修完成" formID="MainForm"
												submitFunction="hgWxxf" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="维修完成"  /> </td>
										
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="确认取件" formID="MainForm"
												submitFunction="GetBack" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="确认取件" /></td>
												-->
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="确认结算" formID="MainForm"
												submitFunction="Wxjs" isAutoRebind="true"
												beforeFunction="submitBefore" afterFunction=""
												isWait="true" isCheck="false" value="确认结算"  /></td>
													
									</tr>									
								</table>
							</e:etab>
							<br>

							<e:etab title="接单情况" tabType="T1" >
								<table width="960px">
										<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
										</colgroup>
										<tr>
											<td  class="Tab_title">开单员</td>
											<td ><e:eshowfield name="opname" />	</td>
											<td  class="Tab_title">单据类型</td>
											<td ><e:eselect name='RepairType' asName="ComputerType"  emptyOption="false" disabled="true" /></td>								
										   <td   class="Tab_title">上级单号</td>
										   <td  ><e:epopfield name="ParentWxdh"  ondblclick="PopParentWxdh(this)"  nullAble='true' /></td>
										   <td   class="Tab_title">接单日期</td>
										   <td  ><e:eshowfield name="jdTime" />	</td>
									</tr>				
								
									<tr>
										<td class="Tab_title">维修单号</td>
										<td ><e:eshowfield name="wxdh" title="维修单号" />	</td>
										<td class="Tab_title">技术员</td>
										<td ><e:eshowfield name="jsy"  /> 	</td>
										<td class="Tab_title">业务员</td>
										<td ><e:eshowfield name="bussinessman" 		 /></td>
										<td class="Tab_title">所属部门</td>
										<td ><e:eselect name="CompDepart" asName="code" 	disabled="true"  queryNo="DepartmentTree"	 emptyOption="false" /></td>
									</tr>

									<tr>
										<td class="Tab_title">客户代码</td>
										<td ><e:eshowfield name="khcode"   />	</td>
										<td class="Tab_title">联系人</td>
										<td ><e:eshowfield name="lxr"  /></td>
										<td class="Tab_title">称喟</td>
										<td ><e:eselect name="call" asName="ComputerCallType"  
												  emptyOption="true" disabled="true" />
										</td>
										<td class="Tab_title">维修级别</td>
										<td ><e:eselect name="level" asName="ComputerLevelTpye"
												  emptyOption="false" disabled="true" />
										</td>

									</tr>

									<tr>
										<td class="Tab_title">客户名称</td>
										<td colspan="3"><e:eshowfield name="khname" 
												  />
										</td>
										<td class="Tab_title">使用人</td>
										<td >  	<e:eshowfield name="syr"    />										
										</td>
										
										<td class="Tab_title"></td>
										<td >
										</td>										
										<!-- 
										<td class="Tab_title">维修状态</td>
										<td ><e:eselect name="status" asName="ComputerRepairStatus"  
												  emptyOption="true" />
										</td>
										-->
										
										
									</tr>

									<tr>
										<td class="Tab_title">客户地址</td>
										<td colspan="3"><e:eshowfield name="khaddr" 
												  />
										</td>
										<td class="Tab_title">所属区域</td>
										<td ><e:eshowfield name="area"   
												   />
										</td>
			                             <td class="Tab_title"></td>
										<td > </td>										
										<!--
										<td class="Tab_title">维修结果</td>
										<td >
										<e:eselect name="wxjg" asName="ComputerRepairResult"
												  emptyOption="true" />
												  
										</td>
										-->
									</tr>

									<tr>
										<td class="Tab_title">固定电话</td>
										<td ><e:eshowfield name="tel"  
												  />
										</td>
										<td class="Tab_title">手机</td>
										<td ><e:eshowfield name="handtel"
												  />
										</td>
										<td class="Tab_title">传真</td>
										<td ><e:eshowfield name="fax"  
											  />
										</td>
										<td class="Tab_title">维修类型</td>
										<td ><e:eselect name='type' asName="ComputerRepairType2" 	disabled="true"		   emptyOption="false" /> 	 		</td>
									</tr>

									<tr height="46">
										<td class="Tab_title">备注信息</td>
										<td colspan="7"><e:etextarea nullAble="true" name="mem"
												cssStyle=' height:40px' />
										</td>
									</tr>
									<tr >
										<td colspan="6" class="Tab_title">
												<e:ebutton id="btn_Add"  name="btn_Add" title="新增维修" onclick="do_Add()" value="增子单据" />
										</td>
											   <td    class="Tab_title" >父单标记</td>
	                                           <td    class="Tab_title" ><e:echeckbox  name="isParentWx"   /></td>		
									</tr>										

									
									
								</table>
							</e:etab>
							<br>
	    	      <e:etab title="时间情况" tabType="T1" >
								<table width="960px">
										<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
										</colgroup>								
								
                      	        <tr>
										<td   class="Tab_title">承诺时间</td>
										<td  colspan="3"><e:edatefield nullAble="false"
												name="cnxfTime" title="格式：yyyy-mm-dd hh:mm:ss"
												format="yyyy-mm-dd hh:mm:ss"  isPop="true"></e:edatefield>
										</td>
										<td  class="Tab_title">计划时间</td>
										<td colspan="3"> 
                                               <e:edatefield nullAble="false"  name="planTime" 
                                                  title = "格式：yyyy-MM-dd hh:mm:ss"  
                                                  format="yyyy-mm-dd hh:mm:ss" isPop="true"></e:edatefield>									
										</td>	
	
								</tr>									
								
								<tr>
											 <td  class="Tab_title">派工时间</td>
										     <td  ><e:eshowfield name="pgTime" />
											<td   class="Tab_title">到达时间</td>
											<td ><e:eshowfield name="ddTime" />	</td>
											<td  class="Tab_title">离开时间</td>
											<td ><e:eshowfield name="LeaveTime" /></td>									
											<td  class="Tab_title">取件时间</td>
											<td ><e:eshowfield name="GetBackTime" /></td>
									</tr>	
									
  									<tr>									
										<td  class="Tab_title">修复时间</td>
										<td  colspan="3"><e:eshowfield name="xfTime" />
										</td>
										<td class="Tab_title">质检时间</td>
										<td colspan="3"><e:eshowfield name="QualityTime" /></td>
								  </tr>

										
								</table>
						</e:etab>								
							
							<br>
							<e:etab title="故障情况" tabType="T1" >
								<table width="960px">
								
																		<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
										</colgroup>	
									<tr>
										<td  class="Tab_title">维修产品</td>
										<td  ><e:egroupselect name="product"    emptyOption="false"  initFunction="initrProductSelect" disabled="true" />	</td>
										<td   class="Tab_title">故障部件</td>
										<td  > <e:egroupselect name="wxbj"   parentSelect="product" disabled="true"/></td>
										<td  class="Tab_title">品牌型号及Sn</td>
										<td colspan="3"><e:eshowfield name="ProductSn"   /></td>
									</tr>

									<tr>
										<td  class="Tab_title">外观情况</td>
										<td colspan="3"><e:eselect name="wg" asName="ComputerWgType"
												  emptyOption="true" disabled="true" />
										</td>
										<td  class="Tab_title">附件情况</td>
										<td colspan="3"><e:eselect name="fj" asName="ComputerFjType"
												  emptyOption="false" disabled="true"/>
										</td>
									</tr>
									<tr>
										<td  class="Tab_title">初检情况</td>
										<td colspan="3"><e:eselect name="cj" asName="ComputerCjType"
												  emptyOption="true" disabled="true" />
										</td>
										<td  class="Tab_title">故障描述</td>
										<td colspan="3"><e:egroupselect name="gzms"   parentSelect="product"  initFunction="initrGzmsSelect"  disabled="true"/></td>
									</tr>
									
									<tr>
										<td  class="Tab_title">Mac</td>
										<td colspan="3"><e:eshowfield name="mac"
												  /> </td>
		 
										<td  class="Tab_title">ip</td>
										<td colspan="3"><e:eshowfield name="ip"
												  /> </td>
									</tr>									

									<tr height="46">
										<td  class="Tab_title">其他故障说明</td>
										<td colspan="7"><e:eshowfield name="gzMem"  
												  />
										</td>
									</tr>

								</table>
							</e:etab>
							<br>
							<e:etab title="数据信息" tabType="T1" >
								<table width="960px">
								
								
								<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
									</colgroup>
								
									<tr>
										<td  class="Tab_title" Title="100元;500元;1000元">数据价值</td>
										<td ><e:eselect name="datavalue" asName="ComputerGzmsType"
												  emptyOption="true" />
										</td>
										<td  class="Tab_title">数据保存费</td>
										<td ><e:eselect name="dataPrice" asName="ComputerGzmsType"
												  emptyOption="true" disabled="true" />
										</td>
										<td  class="Tab_title">重要数据目录</td>
										<td colspan="3"><e:eshowfield name="datpath"
												  />
										</td>

									</tr>
									<tr height="46">
										<td  class="Tab_title">数据要求</td>
										<td colspan="7"><e:eshowfield name="dataMem"
												  />
										</td>
									</tr>

								</table>
							</e:etab>
							
							<br>


							<e:etab title="维修情况" tabType="T1">
								<table width="960px">
								
								<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
									</colgroup>
								
									<tr>
										<td  class="Tab_title" title="店内维修;外送维修;外协维修">维修方式</td>
										<td width="140px"><e:eselect name="wxfs" asName="ComputerWxfsType"
												  emptyOption="true" disabled="true"/>
										</td>
										<td  class="Tab_title" title="">维修代码</td>
										<td ></td>
										<td  class="Tab_title">维修名称</td>
										<td colspan="3"></td>

									</tr>


								
									<tr>
										<td  class="Tab_title">质检员</td>
										<td ></td>
										<td  class="Tab_title"></td>
										<td ></td>
										<td  class="Tab_title">送货员</td>
										<td ></td>
										<td  class="Tab_title"></td>
										<td ></td>
									</tr>
									<tr height="46">
										<td  class="Tab_title">维修报告</td>
										<td colspan="7"><e:etextfield name="wxMem" maxSize="128"
												nullAble='true' />
										</td>

									</tr>
								</table>
							</e:etab>


							<br>							
					
					
							
							<e:etab title="服务报价" tabType="T1" >
								<table width="960px"    >
								
								
								<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
									</colgroup>
								
									<tr id="expenseBar1" style="display:" >
										<td  class="Tab_title">上门费</td>
										<td ><e:enumbfield name="smf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
										<td  class="Tab_title">材料费</td>
										<td ><e:enumbfield name="clf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
										<td  class="Tab_title">服务费</td>
										<td ><e:enumbfield name="wxf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
										<td  class="Tab_title">合计报价</td>
										<td ><e:enumbfield name="clintPrice"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
									</tr>
									</table>
									</e:etab>
									
									<br>
									
									
							<e:etab title="结算费用" tabType="T1" >
								<table width="960px"    >
								
								

									<tr id="expenseBar2" style="display:">
										<td width="100px" class="Tab_title">收费类型</td>
										<td colspan="3"><e:etextfield name="sfType"
												maxSize="32" title='零售;售后;协议;赠送' nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">实际收费</td>
										<td width="140px"><e:enumbfield name="sjsf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
										<td width="100px" class="Tab_title">结算积分</td>
										<td width="140px"><e:enumbfield name="wxJf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
									</tr>
									<tr id="expenseBar3" style="display:" >
										<td width="100px" class="Tab_title">收费单据</td>
										<td colspan="3"><e:etextfield name="sfBillcode"
												maxSize="32" title='来自速达的销售开单' nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">收费说明</td>
										<td colspan="3"><e:etextfield name="sfMem" maxSize="32"
												title='' nullAble='true' />
										</td>

									</tr>

								</table>
							</e:etab>
							<br>
							






						</div>
	       <div style="width:100%;height:100%;overflow:auto;" id="SubFrame"  >
	       
	  		    	<e:etab> 
					<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					     <td id="queryFrame1" >			  
 
					     </td>
					  </tr>


					</table>
				</e:etab>	     
	       
	       </div>
											
						<iframe id="DocFrame" name="DocFrame" frameborder="0"
							style="width:100%;height:100%;overflow:auto;"></iframe>
						<iframe id="MapFrame" name="MapFrame" frameborder="0"
							style="width:100%;height:100%;overflow:auto;"></iframe>
						<iframe id="DocModi" name="DocModi" frameborder="0"
							style="width:100%;height:100%;overflow:auto;"></iframe>
						<iframe id="empFrame" name="empFrame" frameborder="0"
							style="width:100%;height:100%;overflow:auto;"></iframe>
					</e:etabpanel></td>
			</tr>
			<tr height="40px" id="ToolsBar">
				<td align="center">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" align="center">
						<tr>
							<td>&nbsp;</td>
							<td id="TR_Save" width="20%"><e:esubmit
									name="btn_Save" title="save" formID="MainForm"
									submitFunction="Save" isAutoRebind="true"
									beforeFunction="SaveBefore" afterFunction="" isWait="true"
									isCheck="true" value="保　　存" /></td>
							<td id="TR_Delete" width="20%" ><e:esubmit
									name="btn_Dele" title="dele" formID="MainForm"
									submitFunction="Dele" isAutoRebind="true"
									beforeFunction="delBefore" afterFunction="delAfter"
									isWait="true" isCheck="false" value="删    除"   /></td>
							<td id="TR_Print"   >
							      <e:ebutton id="btn_Print"  name="btn_Print"  title="打印单据" onclick="do_Report()" value="打印单据"  />  
							 </td> 
						</tr>
					</table></td>


			</tr>
		</table>
	</e:form>
</body>
</e:eopi>
</html>


