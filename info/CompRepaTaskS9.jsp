

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
<script type="text/javascript" src="CompRepa.js"></script>
<script type="text/javascript">
 

function submitBefore(){

 	    document.all.MainForm.step.value = "S99";
 	    return true;

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
										<td width="120px" class="Tab_title"><e:esubmit
												name="btn_pg" title="任务结算" formID="MainForm"
												submitFunction="hgWxjs" isAutoRebind="true"
												beforeFunction="submitBefore" afterFunction=""
												isWait="true" isCheck="false" value="任务结算"  /></td>
													
									</tr>									
								</table>
							</e:etab>
								<br>
							<e:etab title="任务情况" tabType="T1" >
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
										<td class="Tab_title">任务单号</td>
										<td ><e:eshowfield name="wxdh" title="维修单号" />	</td>
										<td class="Tab_title">公司员工</td>
										<td ><e:epopfield name="jsy" 	ondblclick="PopUserSelect(this)" nullAble='true' /> 	</td>
										<td class="Tab_title">指派人</td>
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
							<e:etab title="任务情况" tabType="T1" >
								<table width="960px">
										<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
										</colgroup>	
									<tr>
										<td  class="Tab_title">相关产品</td>
										<td   colspan="3"><e:egroupselect name="product"    emptyOption="false"  initFunction="initrProductSelect" />	</td>
										<td  class="Tab_title">相关品牌</td>
										<td  colspan="3"><e:etextfield name="ProductSn" maxSize="32"	nullAble='true' /></td>
									</tr>
									<tr height="46">
										<td  class="Tab_title">任务要求</td>
										<td colspan="7"><e:etextfield name="gzMem" maxSize="32" nullAble='false' />
										</td>
									</tr>

								</table>
							</e:etab>
						
										<e:etab title="任务价值" tabType="T1" >
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
										<td><e:enumbfield name="clintPrice"
												nullAble="true" decimalSize="2" title="单位：元" value="0.00"
												intSize="4" />

										</td>
									</tr>
									</table>
									</e:etab>
									<br>
							
						<e:etab title="结算费用" tabType="T1" >
								<table width="960px"    >
									<colgroup> 
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
											  <col width="100px"  />  <col width="140px"  />
									</colgroup>
	
									<tr id="expenseBar2" style="display:">
										<td  class="Tab_title">收费类型</td>
										<td colspan="3"><e:eselect name="sfType" asName="paymentType" emptyOption="false" /></td>
										<td  class="Tab_title">实际收费</td>
										<td ><e:eshowfield name="sjsf" /></td>
										<td width="100px" class="Tab_title">结算积分</td>
										<td width="140px"><e:enumbfield name="wxJf" 	nullAble="true" decimalSize="2" title="单位：元" value="0.00"  intSize="4" /> </td>
									</tr>
									<tr id="expenseBar3" style="display:" >
										<td class="Tab_title">收费单据</td>
										<td colspan="3"><e:eshowfield name="sfBillcode" /></td>
										<td   class="Tab_title">收费说明</td>
										<td colspan="3"><e:eshowfield name="sfMem" /></td>
									</tr>										
									<tr   >
										<td class="Tab_title">结算技术员</td>
										<td colspan="3"><e:epopfield name="jsjsy" 	ondblclick="PopUserSelect(this)" nullAble='true' /> 	</td>
										<td   class="Tab_title">结算说明</td>
										<td colspan="3"><e:etextfield name="jsMem"  maxSize="64" nullAble='true' /></td>
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
	
		</table>
	</e:form>
</body>
</html>


