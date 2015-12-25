<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
<! DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>派工维修任务</title>
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
 
 



function afterSelectFunction(id){
		if(id=='GisFrame'){
		    ActiveFrame= 'GisFrame'; 
	        gisRefresh();	    
 	   		return true;
		}
		

		if(id=="queryFrame1"){
	   		ShowDateBar();
		}

 
		if(id.indexOf('queryFrame')>=0){
			eval("ActiveFrame='"+id+"';");
			refresh();
	   		return true;
		}
		
}

 
  	
function init(){


        treeQuery= 'DepartmentTree';
        treeValue = '99';
        
	    submitForm('MainForm','PageAjax',true,'','','PageInit',true,false);


}


function PageInit(){

    document.getElementById("endmonth").value = document.getElementById("InitEMonth").value;
    var endmonth=  document.getElementById("endmonth").value;
    document.getElementById("startmonth").value  = DateCover(endmonth,1,'','1');
   document.getElementById("startdate").value= DateCover(endmonth,1,'-','');   
    document.getElementById("enddate").value = DateCover(endmonth,2,'-',''); 
      
     ShowDateBar();
    
    TreeRefresh();
    setRefresh();
    refresh();
    gisRefresh(); 
    firstRun=1;
 

}






function TreeRefresh(){



   if(treeQuery==null || treeQuery==''){
         treeFrame.style.display='none';
         btn_hidden.style.display='none';
      return false; 
   }

 
 	var opTj="";
  	
 	var sqlcondition =opTj;
 	var list = new ListXML();
 	
 	if(treeQueryOn!='1' ){
 	   treeQueryOn = '1';
       treeQuery = new TreeQuery(treeFrame,treeQuery,'','',list.toString(),opTj,''); 
       treeQuery.init();
	}else{
       treeQuery.refresh();
	}

}

 
 function TreeSelect(id,value){ 
         treeValue=id;
         setRefresh();  
         refresh();
         gisRefresh();	
 } 

  
function refresh(){


	     var list = new ListXML(); 
		     //list.add(-1,'',listId);
		     //list.add(-1,'listtype',listtype);
		     

		 var startmonth = document.getElementById("startmonth").value;
         var endmonth = document.getElementById("endmonth").value;
         
          var startdate = document.getElementById("startdate").value;
         var enddate = document.getElementById("enddate").value;    
         
         var Datetj = "jd_date>='"+startdate+"' and jd_date<='"+enddate +"'";
         

 	      var CompDepart=treeValue;
 	      var CompDepartTj = "CompDepart = '"+CompDepart+"'";
 	      if(CompDepart=="99"||CompDepart==null||CompDepart==""){
 	           CompDepartTj = "1=1";
 	      }

 	      var RepairStatus = document.getElementById("RepairStatus").value;
 	      
 	      var RepairStatusTj = "wxjg = '"+RepairStatus+"'";
 	      if(RepairStatus==""||RepairStatus==null ||RepairStatus=="99" ){
 	            RepairStatusTj = "1=1";
 	      }


           myQueryNo1="ComputerRepair";
           whereCondition1 = CompDepartTj + " and " + RepairStatusTj+" and " +Datetj;
           orderField1='';
           list1str = list.toString();
           
           
           
             var i=1;
             var str="";
             while (i<=QueryCount)
             {
                   str = str+" if(ActiveFrame=='queryFrame"+i+"' && myQuery"+i+"refresh=='1' && myQueryNo"+i+"!=null)"+
                                "refresnquery(ActiveFrame, myQueryNo"+i+",whereCondition"+i+",list"+i+"str,orderField"+i+");";
                   i=i+1;
              } 
              eval(str);                     
       
}


function hiddenTree(){
	if(showFlag==1){
		hiddenImg.src='/web/resources/hg_img/divarrowupright.gif';
		treeFrame.width='1px';
		treeFrame.style.display='none';
		//toolBar.style.display='none';
		showFlag=0;
	}else{
		hiddenImg.src='/web/resources/hg_img/divarrowupleft.gif';
		treeFrame.width='260px';
		treeFrame.style.display='';
		showFlag=1;
	}
	if(firstRun!=null){
	
         setRefresh(); 
         refresh();
         
         gisRefresh(); 
    }
}

//地图初始化及刷新

function gisRefresh(){

            var mtj = myQuery1.getWhereCondition();
            var Subtj =  myQuery1.getSubWhereCondition();
            
            if(mtj==null || mtj==''){
                mtj = " 1=1 ";
            }
            
            if(Subtj==null || Subtj==''){
                Subtj = " 1=1 ";
            }
            
 
           var archtypeTj = " PITYPE ='"+treeValue+"'" ; 
		   if(treeValue=='' ||   treeValue==null){
		      archtypeTj = " 1=1 ";
		   }           
            
            var tj  = mtj+ " and " + Subtj ;
           
            
            if(tj!=GisTj){
               GisTj = tj;
               GisRefreshOn='1';
                
            }
            
 
 
 	      var company_sql = " select id,title from ( "+
	                      " select  pj.GL_ID  as id,pj.id as title  from ( select * from computer_repair_detail where "+ GisTj+ " ) as pj inner join gis_latlng gs on pj.gl_id=gs.gl_id " +
	                        ") t ";
	                        


   if(GisRefreshOn=='1' && ActiveFrame=='GisFrame' && GisFrameOn==null){
 	                        
	                        
	                        
	
		  if(GisFrameOn==null){
		  
		
		    var areaSql =  document.getElementById("areaSql").value;
		    var lng =  document.getElementById("lng").value;
	        var lat =  document.getElementById("lat").value;
		    var zoom =  document.getElementById("zoom").value;	
	
		    
			gpe=new GisShow(GisFrame);
			gpe.initLatLng(lat,lng);
			gpe.initAreaSql(areaSql);
			gpe.initZoom(zoom);
			gpe.initClickFunction('gisSelect');
			gpe.init();	
			GisFrameOn='1';
		    GisRefreshOn=null;
		
			
			gpe.addPoints(company_sql,"labelBlue");
			
	        return true;
		  
		  
		  }
	  }
	  
      if(GisRefreshOn=='1' && ActiveFrame=='GisFrame' && GisFrameOn!=null){
          gpe.clearPoints(); 
	      gpe.addPoints(company_sql,"labelBlue"); 
          GisRefreshOn=null;	 
	     return true;     		
	 
	  }

  }
  



function startmonthselect(){
             var startmonth =  document.getElementById("startmonth").value;
             var endmonth =  document.getElementById("endmonth").value;
             
             if(startmonth>endmonth){
                 document.getElementById("endmonth").value=startmonth;
             }
}


function endmonthselect(){

             var startmonth =  document.getElementById("startmonth").value;
             var endmonth =  document.getElementById("endmonth").value;
             
             if(endmonth<startmonth){
                 document.getElementById("startmonth").value=endmonth;
             }
}

 


//地图的单击事件
function gisSelect(id,type){  
      if(type=='point' ){
            var url="infomanagement.action?glId="+encodeURIComponent(id)+"&frameQueryNo=&frameControlOptionId=2";
 
 	        var rv=popDialog(url,window,"dialogwidth=800px; dialogheight=550px; status=no");	  
	       return false;
      }
} 





//单击事件



function on_ComputerRepair_click(grid,row,col,value){
  var wxdh=grid.getCellValueById(row,"wxdh");   
  var RepairType = grid.getCellValueById(row,"RepairType");   
	if(wxdh!=""){
		var url="CompRepaMana.action?RepairType="+RepairType+"&wxdh="+encodeURIComponent(wxdh)+"&frameControlOptionId=2";
    	var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
    	grid.refresh();
 	}

}




//新增记录事件
function do_Add(){

/*
01	电脑维修
02	外协维修
03	安装调试
06	送货服务
08	软件服务
09	任务交办

*/
        var CompDepart=treeValue;
        var RepairType = document.getElementById("RepairType").value;
        var Page = RepairType;
  
      alert(Page);
        
        
        if(CompDepart!=null&&CompDepart!=''&&CompDepart!='99' ){
	 		var url="CompRepaMana.action?frameControlOptionId=1&Page="+Page+"&CompDepart="+CompDepart+"&RepairType="+RepairType;
		    var rv=popDialog(url,'','dialogwidth=1024px; dialogheight=600px; status=no');
	        setRefresh(); 
	        refresh(); 
        }else{
            alert('必须首先择所属部门！');
        }

}



function  ShowMonthBar(){
		startmonthlable.style.display='';
		startmonthtd.style.display='';
		endmonthlable.style.display='';
		endmonthtd.style.display='';	
		HideDateBar();
		
 
} 

function  HideMonthBar(){
		startmonthlable.style.display='none';
		startmonthtd.style.display='none';
		endmonthlable.style.display='none';
		endmonthtd.style.display='none';			


} 

function  ShowDateBar(){

		startdatelable.style.display='';
		startdatetd.style.display='';
		enddatelable.style.display='';
		enddatetd.style.display='';		
		DateRefresh.style.display='';		
        HideMonthBar();			                                   	
 

} 
function  HideDateBar(){
		startdatelable.style.display='none';
		startdatetd.style.display='none';
		enddatelable.style.display='none';
		enddatetd.style.display='none';		
		DateRefresh.style.display='none';		

} 



	


</script>	
<e:head/> 
<body >
		                    



	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
	<tr height="100%" >
			<td width="260px" id="treeFrame">&nbsp;</td>
			<td  width="10px" id= "btn_hidden"><img id="hiddenImg" src="/web/resources/hg_img/divarrowupright.gif" style="cursor:hand" border="0" onClick="hiddenTree()"  ></td>	
			<td >
		     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
			 <tr height="28px" id= ToolsBar >
			             <td>
			                    <e:etab  > 
		                    
			                    
			                       <table>
			                              <tr height="30px" >
			                                   <td id="TR_ADD" width="110px" class="Tab_title"   >
			                                        <e:ebutton id="btn_Add"  name="btn_Add" title="新增维修" onclick="do_Add()" value="新增维修" />
			                                    </td>
			                                   <td width="90px" class="Tab_title"  >维修类型</td>
			                                   <td class="Tab_title"  width="120px">
			                                            <e:eselect  name="RepairType"  asName="ComputerType"  value="" emptyOption="false"  onchange="setRefresh();refresh()" />
			                                    </td>
				                                <td width="90px" class="Tab_title"  >维修状态</td>
			                                   <td class="Tab_title"  width="120px">
			                                           <e:eselect  name="RepairStatus"  asName="ComputerRepairResult"  value="" emptyOption="true"  onchange="setRefresh();refresh()" />
			                                    </td>		                                    
			                                    
			                                   <td class="Tab_title"  >&nbsp;</td>
			                                   <td width="90px" class="Tab_title"     id="startmonthlable"  style="display:none"  >起始月度</td>
			                                   <td class="Tab_title"  width="180px" id="startmonthtd"    style="display:none"  ><e:eselect name="startmonth"  queryNo="datacove_month" onchange="startmonthselect();setRefresh();refresh()"/></td>
				                                   <td width="90px" class="Tab_title"  id="endmonthlable"  style="display:none"    >截止月度</td>
			                                   <td class="Tab_title"  width="180px"  id="endmonthtd"  style="display:none"  ><e:eselect  name="endmonth"  queryNo="datacove_month" onchange="endmonthselect();setRefresh();refresh()"/></td>

	                                          <td width="90px" class="Tab_title"     id="startdatelable"   style="display:none"  >开始日期</td>
			                                   <td class="Tab_title"  width="180px" id="startdatetd"     style="display:none"  ><e:edatefield isPop="true" nullAble="true"  name="startDate" title = "格式：yyyy-mm-dd" format="yyyy-mm-dd"></e:edatefield></td>
			                                   <td width="90px" class="Tab_title"  id="enddatelable"   style="display:none"   >结束日期</td>
			                                   <td class="Tab_title"  width="180px"  id="enddatetd"   style="display:none"  ><e:edatefield   isPop="true" nullAble="true"  name="endDate" title = "格式：yyyy-mm-dd" format="yyyy-mm-dd"></e:edatefield></td>
			                                   <td width="90px" class="Tab_title"   id="DateRefresh" >
		                                                   <e:ebutton  title="明细刷新" onclick="setRefresh();refresh()" value="明细刷新"  />
			                                   </td>			
	
			                                   
 										 </tr>
			                        </table>
				                        
		
			                        
			                       </e:etab>
			               </td>
			           </tr>
			 
			  <tr>
			    <td>
			     <e:etabpanel
			                 onSelectFunction="onSelectFunction" afterSelectFunction="afterSelectFunction"
								tabIds="queryFrame1,GisFrame" 
			                     tabTitles="维修任务单明细,地理位置"
			                 tabActive="queryFrame1"    			                   
			                 cssStyle="width:100%;height:100%">

				     <div id="queryFrame1" style="width:100%;height:100%"></div>
	                 <div id="GisFrame" style="width:100%;height:100%"></div>			 	 			         				         	 			         
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
