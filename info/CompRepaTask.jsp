

<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="e" uri="/eframe-tags"%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<title>好格工作任务单</title>

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

	if(document.all.MainForm.frameControlOptionId.value=='1' ){
		submitForm('MainForm','Add',true,'','','',true,false);
	}
	if(document.all.MainForm.frameControlOptionId.value=='2' ){
		submitForm('MainForm','RecoRefresh',true,'','','',true,false);
	
	}
}



function afterRefresh(){

     var ParentWxdh= document.all.MainForm.ParentWxdh.value;
	 if (ParentWxdh!='' ){
	 		expenseBar1.style.display='none';
		    expenseBar2.style.display='none';
		    expenseBar3.style.display='none';
			
			 document.all.MainForm.sjsf.value='0';
			 document.all.MainForm.clintPrice.value='0';
			
	 }else{
	 
	 	    expenseBar1.style.display='';
		    expenseBar2.style.display='';
		    expenseBar3.style.display='';
			
			 document.all.MainForm.sjsf.value='0';
			 document.all.MainForm.clintPrice.value='0';
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

 
		<!--维修部门  -->



		<!-- 用户及权权限  -->
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
											<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="维修派工" formID="MainForm"
												submitFunction="hgWxpg" isAutoRebind="true"
												beforeFunction="" afterFunction="" isWait="true"
												isCheck="false" value="维修派工"     disabled="true"  /></td>
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="到达现场" formID="MainForm"
												submitFunction="Arrive" isAutoRebind="true"
												beforeFunction="" afterFunction=""
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
												name="btn_pg" title="维修修复" formID="MainForm"
												submitFunction="hgWxxf" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="维修修复"  /> </td>
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="确认取件" formID="MainForm"
												submitFunction="GetBack" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="确认取件" /></td>
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="单据结算" formID="MainForm"
												submitFunction="Wxjs" isAutoRebind="true"
												beforeFunction="" afterFunction=""
												isWait="true" isCheck="false" value="单据结算"  /></td>
									</tr>									
								</table>
							</e:etab>
							<br>
							<e:etab title="接单情况" tabType="T1" >
								<table width="960px">
										<tr>
											<td width="100px" class="Tab_title">开单员</td>
											<td width="140px"><e:eshowfield name="opname" />	</td>
											<td width="100px" class="Tab_title">单据类型</td>
											<td width="140px"><e:eselect name='RepairType' asName="ComputerType"  	   emptyOption="false" /></td>								
										   <td width="100px" class="Tab_title">上级单号</td>
										   <td width="140px"><e:epopfield name="ParentWxdh"  ondblclick="PopParentWxdh(this)"  nullAble='true' /></td>
										   <td width="100px" class="Tab_title">接单日期</td>
										   <td width="140px"><e:eshowfield name="jdTime" />	</td>
									</tr>				
								
									<tr>
										<td width="100px" class="Tab_title">维修单号</td>
										<td width="140px"><e:eshowfield name="wxdh" title="维修单号" />	</td>
										<td width="100px" class="Tab_title">技术员</td>
										<td width="140px"><e:epopfield name="jsy" 	ondblclick="PopUserSelect(this)" nullAble='true' /> 	</td>
										<td width="100px" class="Tab_title">业务员</td>
										<td width="140px"><e:epopfield name="bussinessman" 		ondblclick="PopUserSelect(this)" nullAble='false' /></td>
										<td width="100px" class="Tab_title">所属部门</td>
										<td width="140px"><e:eselect name="CompDepart" asName="code" 	disabled="true"  queryNo="DepartmentTree"	 emptyOption="false" /></td>
									</tr>

									<tr>
										<td width="100px" class="Tab_title">客户代码</td>
										<td width="140px"><e:epopfield name="khcode"  ondblclick="PopempSelect(this)"  nullAble='true' />	</td>
										<td width="100px" class="Tab_title">联系人</td>
										<td width="140px"><e:etextfield name="lxr" maxSize="8" 	nullAble='true' /></td>
										<td width="100px" class="Tab_title">称喟</td>
										<td width="140px"><e:eselect name="call" asName="ComputerCallType"  
												  emptyOption="true" />
										</td>
										<td width="100px" class="Tab_title">维修级别</td>
										<td width="140px"><e:eselect name="level" asName="ComputerLevelTpye"
												  emptyOption="false" />
										</td>

									</tr>

									<tr>
										<td width="100px" class="Tab_title">客户名称</td>
										<td colspan="3"><e:etextfield name="khname" maxSize="32"
												nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">使用人</td>
										<td width="140px">  	<e:epopfield name="syr"  ondblclick="PopSyrSelect(this)"  nullAble='true' />				</td>
										<td width="100px" class="Tab_title">维修状态</td>
										<td width="140px"><e:eselect name="status" asName="ComputerRepairStatus"  
												  emptyOption="true" />
										</td>
									</tr>

									<tr>
										<td width="100px" class="Tab_title">客户地址</td>
										<td colspan="3"><e:etextfield name="khaddr" maxSize="64"
												nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">所属区域</td>
										<td width="140px"><e:eselect name="area"  asName="ComputerAreaTpye"
												    emptyOption="true" />
										</td>
										<td width="100px" class="Tab_title">维修结果</td>
										<td width="140px"><e:eselect name="wxjg" asName="ComputerRepairResult"
												  emptyOption="true" />
										</td>
									</tr>

									<tr>
										<td width="100px" class="Tab_title">固定电话</td>
										<td width="140px"><e:enumbfield name="tel" intSize="8"
												title="固定电话的长度是：8" nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">手机</td>
										<td width="140px"><e:enumbfield name="handtel"
												intSize="11" title="手机长度：11" nullAble='false' />
										</td>
										<td width="100px" class="Tab_title">传真</td>
										<td width="140px"><e:enumbfield name="fax" intSize="8"
												title="固定电话的长度是：8" nullAble='true' />
										</td>
										<td width="100px" class="Tab_title">维修类型</td>
										<td width="140px"><e:eselect name='type' asName="ComputerRepairType2" 			   emptyOption="true" /> 			</td>
									</tr>

									<tr height="46">
										<td width="100px" class="Tab_title">备注信息</td>
										<td colspan="7"><e:etextarea nullAble="true" name="mem"
												cssStyle=' height:40px' />
										</td>
									</tr>
									
									<tr >
										<td colspan="6" class="Tab_title">
										</td>
											   <td    class="Tab_title" >父单标记</td>
	                                           <td    class="Tab_title" ><e:echeckbox  name="isParentWx"   fieldValue="0"/></td>		
									</tr>										

									
									
								</table>
							</e:etab>
							<br>
	    	      <e:etab title="时间情况" tabType="T1" >
								<table width="960px">
                      	        <tr>
										<td width="100px" class="Tab_title">承诺时间</td>
										<td  colspan="3"><e:edatefield nullAble="false"
												name="cnxfTime" title="格式：yyyy-mm-dd hh:mm:ss"
												format="yyyy-mm-dd hh:mm:ss"  isPop="true"></e:edatefield>
										</td>
										<td width="100px" class="Tab_title">计划时间</td>
										<td colspan="3"> 
                                               <e:edatefield nullAble="false"  name="planTime" 
                                                  title = "格式：yyyy-MM-dd hh:mm:ss"  
                                                  format="yyyy-mm-dd hh:mm:ss" isPop="true"></e:edatefield>									
										</td>	
	
								</tr>									
								
								<tr>
											 <td width="100px" class="Tab_title">派工时间</td>
										     <td width="140px"><e:eshowfield name="pgTime" />
											<td width="100px" class="Tab_title">到达时间</td>
											<td width="140px"><e:eshowfield name="ddTime" />	</td>
											<td width="100px" class="Tab_title">离开时间</td>
											<td width="140px"><e:eshowfield name="LeaveTime" /></td>									
											<td width="100px" class="Tab_title">取件时间</td>
											<td width="140px"><e:eshowfield name="GetBackTime" /></td>
									</tr>	
									
  									<tr>									
										<td width="100px" class="Tab_title">修复时间</td>
										<td  colspan="3"><e:eshowfield name="xfTime" />
										</td>
										<td width="100px" class="Tab_title">质检时间</td>
										<td colspan="3"><e:eshowfield name="QualityTime" /></td>
								  </tr>

										
								</table>
						</e:etab>											
							<br>
							<e:etab title="任务情况" tabType="T1" >
								<table width="960px">
									<tr>
										<td width="100px" class="Tab_title">任务类型</td>
										<td colspan="3"><e:egroupselect name="product"    emptyOption="false"  initFunction="initrProductSelect" />	</td>
										<td width="100px" class="Tab_title">任务项目</td>
										<td colspan="3"> <e:egroupselect name="wxbj"   parentSelect="product"/></td>
									</tr>
									<tr height="46">
										<td width="100px" class="Tab_title">任务描述</td>
										<td colspan="7"><e:etextarea nullAble="false" name="gzMem" cssStyle='height:40px' />
									</tr>
								</table>
							</e:etab>
							
							
							<br>
							    <e:etab title="完成情况" tabType="T1">
								<table width="960px">
								    <tr height="46">
										<td width="100px" class="Tab_title">任务报告</td>
										<td colspan="7"><e:etextarea nullAble="true" name="wxMem" cssStyle='height:40px' />
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


