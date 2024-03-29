  <%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page import="com.gzunicorn.common.util.SysConfig" %>

<!--
	客户地区表页工具栏
-->
<script language="javascript">
//关于ToolBar
function CreateToolBar(){
  SetToolBarHandle(true);
  SetToolBarHeight(20);
  AddToolBarItemEx("ReturnBtn","../../common/images/toolbar/back.gif","","",'<bean:message key="toolbar.return"/>',"65","0","returnMethod()");
  AddToolBarItemEx("ViewBtn","../../common/images/toolbar/view.gif","","",'<bean:message key="toolbar.read"/>',"65","1","viewMethod()");
  
  <%-- 是否有可写的权限--%>
  <logic:equal name="<%=SysConfig.TOOLBAR_RIGHT%>" property="nlostelevatorregistermaster" value="Y"> 
</logic:equal>
window.document.getElementById("toolbar").innerHTML=GenToolBar("TabToolBar_Manage","TextToolBar_Black","Style_Over","Style_Out","Style_Down","Style_Check");
}

//返回
function returnMethod(){
  window.location = '<html:rewrite page="/lostElevatorRegisterMasterAction.do"/>?method=toSearchRecord';
}
//查看
function viewMethod(){
  toDoMethod(checkedIndex(),"toDisplayRecord","&isreturn=2","<bean:message key="javascript.role.alert2"/>");
}

//跳转方法
function toDoMethod(index,method,params,alertMsg){
	if(index >= 0){	
		window.location = '<html:rewrite page="/lostElevatorRegisterMasterAction.do"/>?id='+getVal('ids',index)+'&method='+method+params;
	}else if(alertMsg && alertMsg != ""){
		alert(alertMsg);
	}
}

function checkedIndex(){
	if(lostElevatorRegisterMasterForm.ids){
			var ids = lostElevatorRegisterMasterForm.ids;
			if(ids.length == null){
				if(ids.checked==true)
					return 0;
				else
					return -1;
			}
			for(var i=0;i<ids.length;i++){
				if(ids[i].checked == true){
					return i;
				}
			}		
		}
		return -1;	
}

//根据name和选中下标获取元素的值
function getVal(name,index){
	var obj = eval("lostElevatorRegisterMasterForm."+name);
	if(obj && obj.length){
		obj = obj[index];
	}
	return obj ? obj.value : null;
}
/* function viewMethod(){
	if(custReturnRegisterForm.ids)
	{
		var l = document.custReturnRegisterForm.ids.length;
		if(l)
		{
			for(i=0;i<l;i++)
			{
				if(document.custReturnRegisterForm.ids[i].checked == true)
				{
					window.location = '<html:rewrite page="/custReturnRegisterAction.do"/>?id='+document.custReturnRegisterForm.ids[i].value +'&isreturn=2&method=toDisplayRecord';
					return;
				}
			}
			if(l >0)
			{
				alert("<bean:message key="javascript.role.alert2"/>");
			}
		}else if(document.custReturnRegisterForm.ids.checked == true)
		{
			window.location = '<html:rewrite page="/custReturnRegisterAction.do"/>?id='+document.custReturnRegisterForm.ids.value +'&isreturn=2&method=toDisplayRecord';
		}
		else
		{
			alert("<bean:message key="javascript.role.alert2"/>");
		}
	}
	} */
</script>

  <tr>
    <td width="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" class="table_outline3" valign="bottom" width="100%">
            <div id="toolbar" align="center">
            <script language="javascript">
              //<!--
                CreateToolBar();
              //-->
            </script>
            </div>
            </td>
        </tr>
      </table>
    </td>
  </tr>
</table>