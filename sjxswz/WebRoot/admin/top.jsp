<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>蛋糕销售后台管理系统</title>

	<link rel="stylesheet" type="text/css" href="<%=path %>/img/admin.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/img/css.css">
</head>
<body>
<table cellSpacing=0 cellPadding=0 width="100%" background="<%=path %>/img/header_bg.jpg" border=0>
  <tr height=56>
    <td width=260><IMG height=56 src="<%=path %>/img/header_left.jpg" width=260></TD>
    <td align=right width=268><img height=56 src="<%=path %>/img/header_right.jpg" width=268></td>
  </tr>
</table>
<table cellSpacing=0 cellPadding=0 width="100%" border=0>
  <tr bgColor=#1c5db6 height=4>
    <td><DIV id=menu_bg>
<DIV id=nav>
<UL>
  <LI class="navbg"><A href="<%=path %>/admin/products_list.jsp">蛋糕管理</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/userlist.jsp">用户管理</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/orders.jsp">订单管理</A></LI>

   <LI class="navbg"><A href="<%=path %>/admin/liuyanlist.jsp">留言管理</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/dandu.jsp?id=2">常见问题</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/dandu.jsp?id=4">联系我们</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/dandu.jsp?id=5">关于我们</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/adminlist.jsp">系统管理</A></LI>
  <LI class="navbg"><A href="<%=path %>/admin/modifypwd.jsp">修改密码</A></LI>
  <LI class="navbg"><A href="<%=path %>/RemoveServlet?mark=admin">注销退出</A></LI>
</UL></DIV></DIV></td>
  </tr>
</table>
</body>
</html>
