<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
<! DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>明细数据</title>
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
<script type="text/javascript">
 
var conditionSql='';
var  whereCondition='';
var keyField='';
function afterSelectFunction(id){

    if(id.indexOf('queryFrame')>=0){
      eval("ActiveFrame='"+id+"';");
      refresh();
        return true;
    }
  return true;
}

 



    
function init(){
        treeQuery= 'DepartmentTree';
        treeValue = '99';        
      submitForm('MainForm','PageAjax',true,'','','PageInit',true,false);
}



function PageInit(){
   DateInit();//初始化日期值
 document.getElementById("startmonth").value =  document.getElementById("endmonth").value;

   treeInit('DepartmentTree','99',false);
   ShowDateBar();
  refresh();
   firstRun=1;
 }




  
function refresh(){
 

       var list = new ListXML(); 
         //list.add(-1,'',listId);
         //list.add(-1,'listtype',listtype);
         

     var startmonth = document.getElementById("startmonth").value;//startmonth
         var endmonth = document.getElementById("endmonth").value;
         
          var startdate = document.getElementById("startdate").value;
         var enddate = document.getElementById("enddate").value;    
         
         var Datetj = "plandate>='"+startdate+"' and plandate<='"+enddate +"'";
     
      var jsy =  document.getElementById("jsy").value;
        var jsyTj = "jsy = '"+jsy+"'";
        if(jsy==""||jsy==null ){
              jsyTj = "1=1";
    
        var jsjsyTj = "jsjsy = '"+jsy+"'";
        if(jsy==""||jsy==null ){
              jsjsyTj = "1=1";
        }     }

      
      
         

        var CompDepart=treeValue;
        var CompDepartTj = "CompDepart = '"+CompDepart+"'";
        if(CompDepart=="99"||CompDepart==null||CompDepart==""){
             CompDepartTj = "1=1";
        }
 /*
        var RepairStatus = document.getElementById("RepairStatus").value;
       
        var RepairStatusTj = "wxjg = '"+RepairStatus+"'";
        if(RepairStatus==""||RepairStatus==null ||RepairStatus=="99" ){
              RepairStatusTj = "1=1";
        }
      */
        
             var billType = document.getElementById("RepairType").value;
             
             
            var  billTypeTj =  "RepairType = '"+billType+"'";
        if(billType==""||billType==null ||billType=="99" ){
              billTypeTj = "1=1";
        }

         var  statusTj =  "status = '09'";
   
//************************待修复***********************
       /*    myQueryNo1="ComputerRepair";
           whereCondition1 = jsyTj+" and "+CompDepartTj +  " and " +Datetj +"and step = 'S0' or step is null   " ;
           orderField1='wxdh desc';
           list1str = list.toString();
        */

//************************所有记录***********************
           myQueryNo1="ComputerReportDetail";
           whereCondition1 = jsyTj+" and "+   Datetj +"and RepairType <> '12'"+"and RepairType <> '15'";
           orderField1='wxdh desc';
           list1str = list.toString();
   
           
//************************所有记录***********************
            myQueryNo2="ComputerRepair";
           whereCondition2 =jsyTj+" and "+ CompDepartTj +  " and " +Datetj +"and step ='S4'" ;
           orderField2='';
           list2str = list.toString();       
           
            myQueryNo3="ComputerRepair";
           whereCondition3 =jsyTj+" and "+ CompDepartTj +  " and " +Datetj +"and step ='S6'" ;
           orderField3='';
           list3str = list.toString();          
           
           myQueryNo4="ComputerRepair";
           whereCondition4 =jsyTj+" and "+ CompDepartTj +  " and " +Datetj+"and step ='S9'" ;
           orderField4='';
           list4str = list.toString();    
           
          myQueryNo5="ComputerRepairConfirm";
           whereCondition5 =jsyTj+" and "+ CompDepartTj +  " and " +Datetj +"and step ='S99'" ;
           orderField5='';
           list5str = list.toString();    
           
     
           myQueryNo6="ComputerReportDetail";
           whereCondition6 =jsyTj+" and "+ CompDepartTj +  " and " +Datetj +"and step ='End'" ;
           orderField6='';
           list6str = list.toString();  
           
           
           
           myQueryNo9="ComputerRepair";
           whereCondition9=  Datetj +" and   RepairType='02'  ";
           orderField9='';
           list9str = list.toString();  
           //外协硬件  
           
           myQueryNo10="ComputerRepair";
           whereCondition10 = Datetj +" and   RepairType='07'  and   isParentWx='true' ";
           orderField10='';
           list10str = list.toString();   
           //硬件协议
           
           myQueryNo11="ComputerRepair";
           whereCondition11 =  Datetj +"  and RepairType='08'   and isParentWx='true' ";
           orderField11='';
           list11str = list.toString();         
           //软件工作      
                  
                  
           myQueryNo12="ComDailyReport";
           whereCondition12 =   Datetj; 
           orderField12='';
           list12str = list.toString();
   
           //所有记录
   
           
          refreshExec();                    
       
}




//单击事件



function on_ComputerRepairConfirm_click(grid,row,col,value){

  var status = grid.getCellValueById(row,"status"); //维修状态
  var wxdh=grid.getCellValueById(row,"wxdh");  //维修单号 
  var RepairType = grid.getCellValueById(row,"RepairType");  //维修类型 
  var step = grid.getCellValueById(row,"step");  //维修步骤

  if(wxdh!=""){

         url="CompRepaMana.action?RepairType="+RepairType+
       "&step="+step+
       "&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2";

      var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
      grid.refresh();
  }

}

function on_ComputerRepairDetail_click(grid,row,col,value){

  var status = grid.getCellValueById(row,"status"); //维修状态
  var wxdh=grid.getCellValueById(row,"wxdh");  //维修单号 
  var RepairType = grid.getCellValueById(row,"RepairType");  //维修类型 
  var step = grid.getCellValueById(row,"step");  //维修步骤

  if(wxdh!=""){

         url="CompRepaMana.action?RepairType="+RepairType+
       "&step=End"+
       "&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2";

      var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
      grid.refresh();
  }

}


function on_ComputerRepairEnd_click(grid,row,col,value){

  var status = grid.getCellValueById(row,"status"); //维修状态
  var wxdh=grid.getCellValueById(row,"wxdh");  //维修单号 
  var RepairType = grid.getCellValueById(row,"RepairType");  //维修类型 
  var step = grid.getCellValueById(row,"step");  //维修步骤

  if(wxdh!=""){
     var frameShowView ="1";
     var url="CompRepaMana.action?RepairType="+RepairType+
           "&step="+step+
         "&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2"+
         "&frameShowView="+frameShowView;
      var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
  }

}






function on_ComputerRepair_click(grid,row,col,value){

  var status = grid.getCellValueById(row,"status"); //维修状态
  var wxdh=grid.getCellValueById(row,"wxdh");  //维修单号 
  var RepairType = grid.getCellValueById(row,"RepairType");  //维修类型 
  var step = grid.getCellValueById(row,"step");  //维修步骤

  if(wxdh!=""){
     var frameShowView ="1";
     var url="CompRepaMana.action?RepairType="+RepairType+
           "&step="+step+
         "&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2";//+"&frameShowView="+frameShowView;
       if(status==null  ||status==""  ){
         url="CompRepaMana.action?RepairType="+RepairType+
       "&step="+step+
       "&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2";
      }
     
    
      var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
      grid.refresh();
  }

}


//新增记录事件
function do_Add(){

/*
01  电脑维修
02  外协维修
03  安装调试
06  送货服务
07  硬件协议
08  软件服务
09  任务交办

          <result name="01" >CompRepaWxd.jsp</result>  
           <result name="02" >CompRepaShd.jsp</result>
            <result name="03" >CompRepaSetup.jsp</result>  
           <result name="06" >CompRepaDelivery.jsp</result>     
              <result name="07" >CompRepaYJXY.jsp</result>               
          <result name="08" >CompRepaSoft.jsp</result>  
           <result name="09" >CompRepaTask.jsp</result>  
       

*/
        var CompDepart=treeValue;
        var RepairType = document.getElementById("RepairType").value;
        var Page = RepairType;
    var url="CompRepaMana.action?frameControlOptionId=1&Page="+Page+"&CompDepart="+CompDepart+"&RepairType="+RepairType;
     var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
       setRefresh(); 
       refresh(); 


}


function do_AddExpenses(){
   /*      var ContractCode=document.all.MainForm.ContractCode.value; 
         var PropCode = document.all.MainForm.ContractCode.value; 
          var ExpensesType = document.all.MainForm.ContType.value; 
        if(ContractCode!='' || ContractCode!=null){
      var url="PropertyExpenses.action?Page=ArchExpenses&frameControlOptionId=1&ContractCode="+ContractCode+"&ExpensesType="+ExpensesType;
        var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
        }else{
           alert("no propCode");
        }
        */
        //   var url="/web/html/HgPublic/StdExpenses/StdExpenses.action?frameControlOptionId=1";
             var conditionSql = myQuery1.getCheckSQL();
           
            var url="/web/html/HgPublic/StdExpenses/StdExpenses.action?frameControlOptionId=1";
        var rv=popDialog(url,conditionSql,'dialogwidth=1024px; dialogheight=600px; status=no');
          myQuery1.refresh();
}



</script> 
<e:head/> 
<body >
                        

  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr height="100%" >
      <td width="260px" id="treeFrame" style="display:"  >&nbsp;</td>
      <td  width="10px" id= "btn_hidden"  style="display:none" ><img id="hiddenImg" src="/web/resources/hg_img/divarrowupright.gif" style="cursor:hand" border="0" onClick="hiddenTree()"  ></td> 
      <td >
         <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
       <tr height="28px" id= ToolsBar   style="display:">
                   <td>
                          <e:etab  > 
                             <table>
                                      <tr height="30px" >
                                         <td id="TR_ADD" width="200px" class="Tab_title"   >
                                              <e:ebutton id="btn_Add"  name="btn_Add" title="新增维修" onclick="do_Add()" value="新增维修" /> 
                                              <e:ebutton id="btn_AddExpenses"  name="btn_AddExpenses" title="新增费用" onclick="do_AddExpenses()" value="新增费用" />                                             
                                          </td>
                                         <td width="75px" class="Tab_title"  >维修类型</td>
                                         <td class="Tab_title"  width="100px">
                                                  <e:eselect  name="RepairType"  asName="ComputerType"  value="" emptyOption="false"  onchange="setRefresh();refresh()" />
                                          </td>
                                 <td  class="Tab_title"  width="100px" >技术员</td>
                                                 <td  width="100px"   ><e:eselect name="jsy"       queryNo="QueryUserName"  emptyOption="true"   onchange="setRefresh();refresh()"  ></e:eselect></td> 
                        <!--
                                        <td width="75px" class="Tab_title"  >维修状态</td>
                                         <td class="Tab_title"  width="110px">
                                                 <e:eselect  name="RepairStatus"  asName="ComputerRepairResult"  value="" emptyOption="true"  onchange="setRefresh();refresh()" />
                                          </td> 
                          -->

                                         <td width="75px" class="Tab_title"     id="startmonthlable"  style="display:none"  >起始月度</td>
                                         <td class="Tab_title"  width="140px" id="startmonthtd"    style="display:none"  ><e:eselect name="startmonth"  queryNo="datacove_month" onchange="startmonthselect();setRefresh();refresh()"/></td>
                                           <td width="75px" class="Tab_title"  id="endmonthlable"  style="display:none"    >截止月度</td>
                                         <td class="Tab_title"  width="140px"  id="endmonthtd"  style="display:none"  ><e:eselect  name="endmonth"  queryNo="datacove_month" onchange="endmonthselect();setRefresh();refresh()"/></td>

                                            <td width="75px" class="Tab_title"     id="startdatelable"   style="display:none"  >开始日期</td>
                                         <td class="Tab_title"  width="140px" id="startdatetd"     style="display:none"  ><e:edatefield isPop="true" nullAble="true"  name="startDate" title = "格式：yyyy-mm-dd" format="yyyy-mm-dd"></e:edatefield></td>
                                         <td width="75px" class="Tab_title"  id="enddatelable"   style="display:none"   >结束日期</td>
                                         <td class="Tab_title"  width="140px"  id="enddatetd"   style="display:none"  ><e:edatefield   isPop="true" nullAble="true"  name="endDate" title = "格式：yyyy-mm-dd" format="yyyy-mm-dd"></e:edatefield></td>
                                         <td  class="Tab_title"   id="DateRefresh" >
                                                       <e:ebutton  title="明细刷新" onclick="setRefresh();refresh()" value="明细刷新"  />
                                         </td>      
  
                                         
                     </tr>                              </table>
                                
    
                              
                             </e:etab>
                     </td>
                 </tr>
       
        <tr>
          <td>
           <e:etabpanel
                       onSelectFunction="onSelectFunction" afterSelectFunction="afterSelectFunction"
                tabIds="queryFrame1,queryFrame2,queryFrame3,queryFrame4,queryFrame5,queryFrame6,queryFrame7,queryFrame8,queryFrame9,queryFrame10,queryFrame11,queryFrame12" 
                           tabTitles="所有单据,待检测,待修复,待结算,待审核,完成单据,异常单据,预约单据,外协单据,硬件协议,软件协议,单据统计"
                          tabActive="queryFrame1"                            
                          cssStyle="width:100%;height:100%">
                          
             <div id="queryFrame1" style="width:100%;height:100%"></div>
           <div id="queryFrame2" style="width:100%;height:100%"></div>
             <div id="queryFrame3" style="width:100%;height:100%"></div>  
             <div id="queryFrame4" style="width:100%;height:100%"></div>  
             <div id="queryFrame5" style="width:100%;height:100%"></div>
           <div id="queryFrame6" style="width:100%;height:100%"></div>
             <div id="queryFrame7" style="width:100%;height:100%"></div>  
              <div id="queryFrame8" style="width:100%;height:100%"></div> 
              <div id="queryFrame9" style="width:100%;height:100%"></div>  
             <div id="queryFrame10" style="width:100%;height:100%"></div>               
             <div id="queryFrame11" style="width:100%;height:100%"></div>
              <div id="queryFrame12" style="width:100%;height:100%"></div>                                    
             </e:etabpanel>
           </td>
          </tr>
         </table>

      </td>
      
    </tr>
    
  </table>

<e:form  action="/html/HgPublic/HgStandardDetail.action" id="MainForm" cssStyle="border: 0px;width:0px;height:0px;overflow:auto;">
           <e:hidden   name='treeQueryNo'/>
           <e:hidden   name='QueryNo'/>
           <e:hidden   name='conditionSql'/>        
             <e:hidden   name='whereCondition'/>  
              <e:hidden   name='orderBy'/>        
             <e:hidden   name='keyField'/>                         
           
           
 
              <!-- 月度选择  -->            
             <e:hidden   name='month'/>
             <e:hidden   name='InitSMonth'/>
              <e:hidden   name='InitEMonth'/>           
 
 
              <!-- 用户及权权限  -->  
          <e:hidden id='opId' name='opId'/>
              <e:hidden   name='department'/>                         

           
           <!-- gis  -->
           <e:hidden   name='areaSql'/>   
           <e:hidden   name='lat'/>
           <e:hidden   name='lng'/> 
           <e:hidden   name='zoom'/>
  
  
 </e:form>                                              

</body>
</html>
