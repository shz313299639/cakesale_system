<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.huifu.value == "" ) 
	{
		alert("������ظ�!");
		document.form1.huifu.focus();
		return false;
	}
}
</script>
<html>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%> 
  <body>
    <table width="920" border="0" cellspacing="0" cellpadding="0" background="<%=path%>/img/all_bg.jpg" height="420">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table width="920" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5" class="adminmenu" align="center"></td>
          </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
        <%
        String id = request.getParameter("id");
         %>
		<form name="form1" method="post" action="<%=path %>/FahuoServlet?id=<%=id %>" onSubmit="return check()">
        <table width="60%" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3">��ʼ����</td>
		  </tr>
          <tr>
            <td width="46%" height="25" align="right" bgcolor="#DEF1E3">�ظ���</td>
            <td width="54%" height="25" bgcolor="#DEF1E3">
                <textarea name="huifu" id="textarea" cols="45" rows="5"></textarea></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" bgcolor="#DEF1E3"><input type="submit" value="��ʼ����" class="input"></td>
		  </tr>
        </table>
  </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
