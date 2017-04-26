<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('index.jsp');</script><%
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
    <table width="920" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
		<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25">留言管理</td>
          </tr>
        </table>
		<%
      ArrayList liuyan = array.getLiuyan();
      for(int i = 0;i < liuyan.size();i++){
      	ArrayList alRow = (ArrayList)liuyan.get(i);
       %>
      <fieldset style=" width:910px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" bgcolor="#D3EBEF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;姓名：<%=alRow.get(1) %></td>
                  <td>联系电话：<%=alRow.get(2) %></td>
                  <td>电子邮箱：<%=alRow.get(3) %></td>
                  <td>留言时间：<%=alRow.get(6).toString().substring(0,10) %></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="8%">&nbsp;留言内容：</td>
                  <td width="92%"><%=alRow.get(4) %></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#D3EBEF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="8%">&nbsp;回复：</td>
                  <td width="87%"><%=alRow.get(5) == null || alRow.get(5).equals("")?"<a href='admin/huifu.jsp?id="+alRow.get(0)+"'>回复留言</a>":alRow.get(5) %></td>
                  <td width="5%"><a href="DelServlet?liuyan=<%=alRow.get(0) %>"class="admin">删除</a></td>
                
                </tr>
              </table></td>
          </tr>
        </table>
      </fieldset>
      <%} %>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
