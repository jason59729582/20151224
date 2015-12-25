<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib prefix="e" uri="/eframe-tags"%>
<! DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>工程管理</title>
</head>

<script type="text/javascript">
function on_PJ_INFO_01_click(object,row){
    var piId=myQuery.getCellValueById(row,"PIID");   
	if(piId!=""){
		var url="infomanagement.action?piId="+encodeURIComponent(piId)+"&frameQueryNo=show&frameControlOptionId=2";
    	var rv=popDialog(url,'','dialogwidth=700px; dialogheight=600px; status=no');
    	CollectGarbage(); 
		 
	}	
}


var myQuery=null;

function init(){
	var list = new ListXML(); 
	list.add(-1,'opid',document.all.opId.value);
	var sqlcondition="";
 
	myQuery = new TreeGrid(myIframe,'PJ_INFO_01','','',list.toString(),sqlcondition,''); 
  	myQuery.initTitle("工程维护");
  	myQuery.init();
}

function do_new(){
		var url="infomanagement.action";
	    var rv=popDialog(url,'','dialogwidth=700px; dialogheight=600px; status=no');
	    myQuery.refresh();
}
  
function do_search(){
		var sqlcondition="";
		myQuery.setWhereCondition(sqlcondition);
    	myQuery.refresh();
}


function clearWindow(){
	document.clear(); 
	document.write('');
	CollectGarbage(); 
}
</script>	
<body style="overflow:hidden;" >
<e:head/> 
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
		<tr>
			<td height='100px' valign="middle">
				<e:form action="infoselect" id="infoselect" cssStyle="border:0px;height:100%" onsubmit="">
						<e:hidden id='opId' name='opId'/>
						<table width="100%" border="0" height="100%" cellpadding="0"
							cellspacing="0">
							<tr >
								<td align="center" >
									<e:etab> 
										<table width="512" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="120" height="30px" class="Tab_title">
													 项目管理
												</td>
												<td  align="center">
												</td>
											</tr>
											<tr>
												<td colspan="2" height="30px" align="right">														
													<e:ebutton hotKey="112" name="btn_clear" title="刷 新(F1)" onclick="do_search()" value="刷 新(F2)" />
												</td> 
											</tr>												
										</table>
									</e:etab>
								</td>
							</tr>
						</table>
				</e:form>
			</td>
		</tr>
		<tr >
			<td id="myIframe">
			</td>
		</tr>
	</table>
</body>
</html>
