<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
    <table class="skd" bgcolor="#E5E5E5">
  <tr>
    <td align="center"><table>
  <tr>
   
    <td><DIV align="center">&nbsp;&nbsp;&nbsp;&nbsp;| <a href="<%=path %>/users/index.jsp">������ҳ</a> | <a class=Bottom onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('');" href="javascript:void(0)">��Ϊ��ҳ</a> | <a class=Bottom href="javascript:window.external.addFavorite('http://localhost:8080/ddhnwz','�������͵������޹�˾');">�ղر�վ</a> | <a href="<%=path %>/users/dandu.jsp?id=4">��ϵ����</a>  | <a href="<%=path %>/users/dandu.jsp?id=5">��������</a> | </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
