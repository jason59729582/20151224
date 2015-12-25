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

function do_Report(){
    var wxdh =  document.all.MainForm.wxdh.value;
	    var WhereCondition = "wxdh='"+wxdh+"'";
    
	var list = new ListXML(); 	
	 var CompDepart = document.all.MainForm.CompDepart.value;
	 var RepairType =  document.all.MainForm.RepairType.value;
	var ReportName = "ComputerRepair_"+RepairType+".rpt";
	crystalReport(ReportName,'ComputerRepair','','',list.toString(),WhereCondition,'','','');
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

}function initrProductSelect(selectObj){
        selectObj.setQuery("ComputerProductTpye",'','','','','');
} 

function initrGzmsSelect(selectObj){
        selectObj.setQuery("ComputerGzmsTpye",'','','','','');
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


function delAfter(){
    close();
   
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



function do_qybh_change(){
	var qybh = document.all.id.value;
	if(qybh!=''){
	  submitForm('MainForm','qybhRefresh',true,'','','',false,false);
	}   
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

function delAfter(){
    close();
   
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

function do_qybh_change(){
	var qybh = document.all.id.value;
	if(qybh!=''){
	  submitForm('MainForm','qybhRefresh',true,'','','',false,false);
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



function afterRefresh(){

return true;
 


}

function submitBefore(){
    return true;
}






        
 

 