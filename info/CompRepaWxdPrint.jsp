

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
<script type="text/javascript" src="CompRepa.js"></script>
<script type="text/javascript">

 
 
 

function afterSelectFunction(id){
		//相关人员
		
		//电子档案
	 if(!DocFrameOn){		
		 if(id=='DocFrame'){
		     ActiveTab="DocFrame";
			if(document.MainForm.wxdh.value!=null&&document.MainForm.wxdh.value!=''&&document.MainForm.wxdh.value!='0'){
				//type：101，为好格任务交办类型
				//DocFrame.location.href= "/web/html/am/archive/file/filequery.action?fileType=v&fileId="+encodeURIComponent(document.MainForm.id.value)+"&rootDirectoryNo=9909";
                  linkArchive(DocFrame,'ComputerRepair',document.MainForm.wxdh.value,false,'9909');

			}else{
				return false;
			}
        }
      }
 
 		//电子档案维护
 	if(!DocModiOn){	
 		 if(id=='DocModi'){
 		        ActiveTab="DocModi";
	            var docModiPower ='1' ;//document.MainForm.docModiPower.value; 	
			    if(docModiPower=='1'){		            		     
				if(document.MainForm.wxdh.value!=null&&document.MainForm.wxdh.value!=''&&document.MainForm.wxdh.value!='0'){
	                linkArchive(DocModi,'ComputerRepair',document.MainForm.wxdh.value,true,'9909');
	                DocModiOn = true;
	                DocFrame = false;//将刷新展示页面
	                
				}else{
				 
					return false;
				}
            }else{
                 alert('您没有电子档案的维护权限！');
            }
        }
    }
      //电子地图
		

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
</script>
<e:head />

<body>
	<e:form action="CompRepaMana" id="MainForm"
		cssStyle="border: 0px;width:100%;height:100%; " onsubmit="">
		<e:hidden name="checkmode" />
		<e:hidden name="batchcode" />
		<e:hidden id='glId' name="glId" />
		<e:hidden id='glPackage' name="glPackage" />
	    <e:hidden id='step' name="step" />

 
		<!--维修部门  -->



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
											<td ><e:eselect name='RepairType' asName="ComputerType"  emptyOption="false" /></td>								
										   <td   class="Tab_title">上级单号</td>
										   <td  ><e:epopfield name="ParentWxdh"  ondblclick="PopParentWxdh(this)"  nullAble='true' /></td>
										   <td   class="Tab_title">接单日期</td>
										   <td  ><e:eshowfield name="jdTime" />	</td>
									</tr>				
								
									<tr>
										<td class="Tab_title">维修单号</td>
										<td ><e:eshowfield name="wxdh" title="维修单号" />	</td>
										<td class="Tab_title">技术员</td>
										<td ><e:epopfield name="jsy" 	ondblclick="PopUserSelect(this)" nullAble='true' /> 	</td>
										<td class="Tab_title">业务员</td>
										<td ><e:epopfield name="bussinessman" 		ondblclick="PopUserSelect(this)" nullAble='false' /></td>
										<td class="Tab_title">所属部门</td>
										<td ><e:eselect name="CompDepart" asName="code" 	disabled="true"  queryNo="DepartmentTree"	 emptyOption="false" /></td>
									</tr>

									<tr>
										<td class="Tab_title">客户代码</td>
										<td ><e:epopfield name="khcode"  ondblclick="PopempSelect(this)"  nullAble='true' />	</td>
										<td class="Tab_title">联系人</td>
										<td ><e:etextfield name="lxr" maxSize="8" 	nullAble='true' /></td>
										<td class="Tab_title">称喟</td>
										<td ><e:eselect name="call" asName="ComputerCallType"  
												  emptyOption="true" />
										</td>
										<td class="Tab_title">维修级别</td>
										<td ><e:eselect name="level" asName="ComputerLevelTpye"
												  emptyOption="false" />
										</td>

									</tr>

									<tr>
										<td class="Tab_title">客户名称</td>
										<td colspan="3"><e:etextfield name="khname" maxSize="32"
												nullAble='true' />
										</td>
										<td class="Tab_title">使用人</td>
										<td >  	<e:epopfield name="syr"  ondblclick="PopSyrSelect(this)"  nullAble='true' />										
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
										<td colspan="3"><e:etextfield name="khaddr" maxSize="64"
												nullAble='true' />
										</td>
										<td class="Tab_title">所属区域</td>
										<td ><e:eselect name="area"  asName="ComputerAreaTpye"
												    emptyOption="true" />
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
										<td ><e:enumbfield name="tel" intSize="8"
												title="固定电话的长度是：8" nullAble='true' />
										</td>
										<td class="Tab_title">手机</td>
										<td ><e:enumbfield name="handtel"
												intSize="11" title="手机长度：11" nullAble='false' />
										</td>
										<td class="Tab_title">传真</td>
										<td ><e:enumbfield name="fax" intSize="8"
												title="固定电话的长度是：8" nullAble='true' />
										</td>
										<td class="Tab_title">维修类型</td>
										<td ></td>
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
										<td  ><e:egroupselect name="product"    emptyOption="false"  initFunction="initrProductSelect" />	</td>
										<td  class="Tab_title">故障部件</td>
										<td  > <e:egroupselect name="wxbj"   parentSelect="product"/></td>
										<td  class="Tab_title">品牌型号及Sn</td>
										<td  colspan="3"><e:etextfield name="ProductSn" maxSize="32"	nullAble='true' /></td>
									</tr>

									<tr>
										<td  class="Tab_title">外观情况</td>
										<td colspan="3"><e:eselect name="wg" asName="ComputerWgType"
												  emptyOption="true" />
										</td>
										<td  class="Tab_title">附件情况</td>
										<td colspan="3"><e:eselect name="fj" asName="ComputerFjType"
												  emptyOption="false" />
										</td>
									</tr>
									<tr>
										<td  class="Tab_title">初检情况</td>
										<td colspan="3"><e:eselect name="cj" asName="ComputerCjType"
												  emptyOption="true" />
										</td>
										<td  class="Tab_title">故障描述</td>
										<td colspan="3"><e:egroupselect name="gzms"   parentSelect="product"  initFunction="initrGzmsSelect" /></td>
									</tr>
									
									<tr>
										<td  class="Tab_title">Mac</td>
										<td colspan="3"><e:etextfield name="mac"
												maxSize="128" nullAble='true' /> </td>
		 
										<td  class="Tab_title">ip</td>
										<td colspan="3"><e:etextfield name="ip"
												maxSize="20" nullAble='true' /> </td>
									</tr>									

									<tr height="46">
										<td  class="Tab_title">其他故障说明</td>
										<td colspan="7"><e:etextfield name="gzMem" maxSize="32" nullAble='false' />
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
										<td   class="Tab_title" Title="100元;500元;1000元">数据价值</td>
										<td  ><e:eselect name="datavalue" asName="ComputerGzmsType"
												  emptyOption="true" />
										</td>
										<td  class="Tab_title">数据保存费</td>
										<td  ><e:eselect name="dataPrice" asName="ComputerGzmsType"
												  emptyOption="true" />
										</td>
										<td   class="Tab_title">重要数据目录</td>
										<td colspan="3"><e:etextfield name="datpath"
												maxSize="128" nullAble='true' />
										</td>

									</tr>
									<tr height="46">
										<td   class="Tab_title">数据要求</td>
										<td colspan="7"><e:etextfield name="dataMem"
												maxSize="128" nullAble='true' />
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
										<td  class="Tab_title">维修费</td>
										<td ><e:enumbfield name="wxf"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />
										</td>
										
										<td  class="Tab_title">合计报价</td>
										<td><e:enumbfield name="clintPrice"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />

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

							<td id="TR_Print"   >
							      <e:ebutton id="btn_Print"  name="btn_Print"  title="打印单据" onclick="do_Report()" value="打印单据"  />  
							 </td> 
						</tr>
					</table></td>


			</tr>
		</table>
	</e:form>
</body>
</html>


