<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
<! DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>公共查询</title>
<style type="text/css" media="screen">
html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}
</style>
</head>

<script type="text/javascript">
 


//定义myQuery1 对象 ，queryon 打开标记 myQuery1refresh 刷新标记
var showFlag=1;
var showTree=0;

var ActiveFrame = null; 
var usercode=null;
var departlen=null;
var treeQuery=null;

 
var QueryCount=12;

var i=1;
var str="";
while (i<=QueryCount)
{
    str=str+"var myQuery"+i+"=null;"+
 	    "var myQuery"+i+"on=null;"+
  	    "var myQuery"+i+"refresh=null;"+
  	    "var myQueryNo"+i+"=null;"+
  	    "var whereCondition"+i+"='';";
  	    	
    i=i+1;
}

eval(str);


function setRefresh(){ 
          document.all.conditionstr.value=null;
          var i=1;
          var str="";
           while (i<=QueryCount)
           {
	          str=str+" myQuery"+i+"refresh='1';"; 
              i=i+1;
            }
   
            eval(str);
}

// 凡是 e:etabpanel 命名规则为：queryFrame+N; 例如：    queryFrame1，queryFrame2，queryFrame3...
function onSelectFunction(id){	

        if(id=='queryFrame1' || id=='queryFrame2' || id=='queryFrame3'  ){
               startmonthtd.style.display='none';
                startmonthlable.style.display='none';
        }else{
        
           startmonthtd.style.display='';
            startmonthlable.style.display='';       
        }
        
		if(id.indexOf('queryFrame')>=0){
			eval("ActiveFrame='"+id+"';");
			refresh();
	   		return true;
		}
};

function afterSelectFunction(id){
	return true;
}
 
 
   function mySelect1(id,value){ 
         usercode=id;
         setRefresh();  
         refresh();
  } 

function refresnquery(queryframe,queryno,whereCondition){
      
		var tabIndex = 0;
	
		if(queryframe.indexOf("queryFrame")==0){

			tabIndex = queryframe.substring("queryFrame".length,queryframe.length);
			if(tabIndex<=QueryCount){
				eval("myQuery"+tabIndex+"refresh='0';");
				alert(tabIndex);
			/*	
				var str=" if(myQuery"+tabIndex+"on=='1'){ alert(1); "+
				              " myQuery"+tabIndex+".setWhereCondition(whereCondition); " +
							  " myQuery"+tabIndex+".refresh(); "+
							  " }else{  alert(2);"+
							  "  myQuery"+tabIndex+"on='1'; "+
							  "  myQuery"+tabIndex+"= new PageGrid(queryFrame"+tabIndex+",'"+queryno+"','','','',whereCondition,'','1');  "+
							  "  myQuery"+tabIndex+".initPageSize(100);  "+
							  "  myQuery"+tabIndex+".init();   "+
							  " } ";
			*/				 
			
			var str=" if(myQuery"+tabIndex+"on=='1'){   "+
				              " myQuery"+tabIndex+".setWhereCondition(whereCondition); " +
							  " myQuery"+tabIndex+".refresh(); "+
							  " }else{  alert(queryno);"+
							  "  myQuery"+tabIndex+"on='1'; "+
							  "  myQuery"+tabIndex+"= new PageGrid(queryFrame"+tabIndex+",queryno,'','','',whereCondition,'','1');  "+
							  "  myQuery"+tabIndex+".initPageSize(100);  "+
							  "  myQuery"+tabIndex+".init();   "+
							  " } ";
			 
                 alert(str);
				eval(str);			  
			}else{
				alert("目前只支持"+QueryCount+"个Tab的查询。")
			}
		}
}



  function mySelect1(id,value){ 
         usercode=id;
         setRefresh();  
         refresh();
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
  
function refresh(){



      if(usercode!=null && usercode!=''){
         var userlen=usercode.length;

         if(usercode!="" && usercode!=null  && userlen>=departlen){



             var startmonth =  document.getElementById("startmonth").value;
             var endmonth =  document.getElementById("endmonth").value;
             
  
             whereCondition1 = " ";            

             
   
             
             var i=1;
             var str="";
             while (i<=QueryCount)
             {
                   str = str+"if(ActiveFrame=='queryFrame"+i+"' && myQuery"+i+"refresh=='1' && myQueryNo"+i+"!=null)"+
                                "refresnquery(ActiveFrame, myQueryNo"+i+",whereCondition"+i+");";
                   i=i+1;
              }  
              eval(str);                                       
                          
           } else {
              alert(" 对不起，您没有权限，访问此级别数据！！！");
            }
       }else{
              alert(" 请先选择您要操作的用户！！！");
       }
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
         setRefresh(); 
         refresh(); 
}



  	
function init(){

    startmonthtd.style.display='none';
    startmonthlable.style.display='none';
    
    var opid = document.all.MainForm.opid.value;
  	var department = document.all.department.value;
    
  	departlen = department.length;

  	
 	var opTj=" usercode in ( select usercode  from  userinformation where   usercode like substring('"+department+"',1,1)+'%' and len(usercode)=1 "+
             " union all "+
             " select usercode  from  userinformation where  usercode like substring('"+department+"',1,2)+'%' and len(usercode)=2 "+
             " union all "+
             " select usercode  from  userinformation where usercode like substring('"+department+"',1,4)+'%' and  len(usercode)=4 " +
             " union all "+
             " select usercode  from  userinformation where  usercode like substring('"+department+"',1,4)+'%' and len(usercode)=6 ) ";
             
 	if (opid=="admin" ){
 	   opTj=" 1=1 ";
 	}
 	
 	var sqlcondition =opTj;
  
   
	var list = new ListXML(); 
    treeQuery = new TreeQuery(treeFrame,'Treee_userinformation','','',list.toString(),sqlcondition,''); 
	treeQuery.init();
	
   myQueryNo1="compurepair_select";	


	
	
	setRefresh();
	    myQuery1refresh='1';

	usercode	= department;
    ActiveFrame = 'queryFrame1';
    
      
    refresh();
   	
}
	
	




 




</script>	
<e:head/> 
<body >
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
	<tr height="100%" >
			<td width="260px" id="treeFrame">&nbsp;</td>
			<td  width="10px"><img id="hiddenImg" src="/web/resources/hg_img/divarrowupright.gif" style="cursor:hand" border="0" onClick="hiddenTree()"  ></td>	
			<td >
		     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
			 <tr height="28px" id=toolBar >
			             <td>
			                    <e:etab  > 
			                    
			                       <table>
			                              <tr height="30px" >
			                                   <td class="Tab_title"  >&nbsp;</td>
			                  <!--              
			                                   <td width="90px" class="Tab_title"  > 已审记录</td>
			                                   <td class="Tab_title"  width="120px"><e:eselect  name="approve"   onchange="setRefresh();refresh()" /></td>
			                  -->   
			                  
	                                            <td width="90px" class="Tab_title"     id="startmonthlable" >起始月度</td>
			                                    <td class="Tab_title"  width="180px" id="startmonthtd"   ><e:eselect name="startmonth" queryNo="datacove_month" onchange="startmonthselect();setRefresh();refresh()"/></td>
			                                     
			                                   <td width="90px" class="Tab_title"  >截止月度</td>
			                                   <td class="Tab_title"  width="180px"><e:eselect  name="endmonth" queryNo="datacove_month" onchange="endmonthselect();setRefresh();refresh()"/></td>
			                 <!--  
			                                   <td width="90px" class="Tab_title"  >所属季度</td>
			                                   <td class="Tab_title"  width="120px"> <e:eselect  name="quarter"  onchange="setRefresh();refresh()"/></td>	
			                         -->
			                              </tr>
			                              
			                              
			                              
			                        </table>
			                       </e:etab>
			               </td>
			           </tr>
			 
			  <tr>
			    <td>
			     <e:etabpanel
			                 onSelectFunction="onSelectFunction" afterSelectFunction="afterSelectFunction"
								tabIds="queryFrame1" 
			                     tabTitles="维修明细"
			                 tabActive="queryFrame1"    			                   
			                 cssStyle="width:100%;height:100%">

				     <div id="queryFrame1" style="width:100%;height:100%"></div>
	    			 
  	    			 	  	    			 		 	    			  			    			 		    			  		   
			       </e:etabpanel>
			     </td>
			    </tr>
			   </table>

			</td>
			
		</tr>
		
	</table>
			<e:form  action="CzfcDetail" id="MainForm" cssStyle="border: 0px;width:0px;height:0px;overflow:auto;">
	            <e:hidden   name='conditionId'/>
	            <e:hidden   name='condition'/>
	            <e:hidden   name='conditionstr'/>
	            <e:hidden   name='treeQueryNo'/>
	            <e:hidden   name='QueryNo'/>
	            <e:hidden   name='month'/>
	            <e:hidden   name='opid'/>
	            <e:hidden   name='department'/>
			</e:form>	
</body>
</html>
