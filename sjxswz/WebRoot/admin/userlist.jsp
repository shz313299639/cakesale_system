<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
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
		<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25">ע���û�����</td>
          </tr>
        </table>
		<form name="form1" method="post" action="ModifyAdminServlet?mark=username" onSubmit="return check()">
		  <table width="98%" border="0" cellspacing="1" cellpadding="3">
            <tr class="tabletop">
              <td height="20" colspan="11" align="center">�����û�</td>
            </tr>
            <tr class="tabletd2">
              <td align="center">���</td>
              <td align="center">�û���</td>
              <td align="center">��ʵ����</td>
              <td align="center">�Ա�</td>
              <td align="center">qq����</td>
              <td align="center">��������</td>
              <td align="center">��ϵ�绰</td>
              <td align="center">��ϵ��ַ</td>
              <td align="center">��������</td>
              <td align="center">&nbsp;</td>
            </tr>
            <%
            ArrayList geren = array.getUser();
            for(int i = 0;i < geren.size();i++){
            	ArrayList alRow = (ArrayList)geren.get(i);
             %>
            <tr class="tabletd<%=i%2+1 %>">
              <td align="center"><%=i+1 %></td>
              <td align="center"><%=alRow.get(1) %></td>
              <td align="center"><a href="<%=path %>/admin/usershow.jsp?id=<%=alRow.get(0) %>" class="admin"><%=alRow.get(3) %></a></td>
              <td align="center"><%=alRow.get(4) %></td>
              <td align="center"><%=alRow.get(5) %></td>
              <td align="center"><%=alRow.get(6) %></td>
              <td align="center"><%=alRow.get(7) %></td>
              <td align="center"><%=alRow.get(8) %></td>
              <td align="center"><%=alRow.get(9) %></td>
              <td align="center"><a href="<%=path %>/DelServlet?users=<%=alRow.get(0) %>" class="admin">ɾ��</a></td>
            </tr>
            <%} %>
          </table>
          </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
