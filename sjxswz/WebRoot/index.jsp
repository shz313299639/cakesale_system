<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<SCRIPT language=JavaScript src="<%=path %>/img/flash/myflash.js" type=text/javascript></SCRIPT>
  </head>
  
  <body>
      <%
    request.getRequestDispatcher("/users/index.jsp").forward(request,response);
     %>
  </body>
</html>
