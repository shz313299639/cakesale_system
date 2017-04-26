<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%>
<script>alert('您还没有登录!');window.navigate('index.jsp');</script>
<%
}else{
if(adminlogin.get(3) != null && !adminlogin.get(3).equals("0")){
	%><script>alert('您的身份不对，不能操作此项目!');window.navigate('index.jsp');</script><%
}else{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">
function o(ids)
{
	var id = ids;
	document.getElementById(id).className="to";
}
function p(ids)
{
	var id = ids;
	document.getElementById(id).className="in";
}
function check()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.xiao.value != "" ) 
	{
		if (!ints.test(document.form1.xiao.value))
		{
			alert("请输入数字!");
			document.form1.xiao.focus();
			return false;
		}
		
	}
	if (document.form1.da.value != "" ) 
	{
		if (!ints.test(document.form1.da.value))
		{
			alert("请输入数字!");
			document.form1.da.focus();
			return false;
		}
		
	}
}
</script>
<style>
<!--
.it1 {
	background-color: #F6F6F6;
	border-top-color: #999;
	border-right-color: #999;
	border-bottom-color: #999;
	border-left-color: #999;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}
.it2 {
	background-color: #F9FC81;
	border-top-color: #999;
	border-right-color: #999;
	border-bottom-color: #999;
	border-left-color: #999;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}
h3 {
	font-size: 14px;
	font-weight: bold;
}
pre, p {
	color: #1E7ACE;
	margin: 4px;
}
input, select, textarea {
	padding: 1px;
	margin: 2px;
	font-size: 11px;
}
.buttom {
	padding: 1px 10px;
	font-size: 12px;
	border: 1px #1E7ACE solid;
	background: #D0F0FF;
}
#formwrapper {
	width: 900px;
	margin: 15px auto;
	padding: 20px;
	text-align: left;
	border: 1px #1E7ACE solid;
}
fieldset {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #1E7ACE;
	background: #fff;
}
fieldset legend {
	color: #1E7ACE;
	font-weight: bold;
	padding: 3px 20px 3px 20px;
	border: 1px solid #1E7ACE;
	background: #fff;
}
fieldset label {
	float: left;
	width: 120px;
	text-align: right;
	padding: 4px;
	margin: 1px;
}
fieldset div {
	clear: left;
	margin-bottom: 2px;
}
.enter {
	text-align: center;
}
.clear {
	clear: both;
}
-->
</style>
</head>
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
<table class="skd" background="<%=path%>/img/all_bg.jpg" height="420">
  <tr>
    <td align="center">
    <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25"><a href="<%=path %>/admin/adminlist.jsp">员工管理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/admin/chakuchun.jsp">查询库存</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/admin/zhuangkuang.jsp">销售状况</a></td>
          </tr>
        </table>
    <table width="100%">
        <tr>
          <td height="25" align="center">
          <form action="<%=path %>/admin/chakuchun.jsp" method="post" name="form1" onSubmit="return check()">
          <table>
              <tr>
                <td>库存：</td>
                <td><input name="xiao" type="text" size="10">到<input name="da" type="text" size="10"></td>
                <td><input type="submit" value="搜索"></td>
              </tr>
            </table>
            </form></td>
        </tr>
      </table>
      <div id="formwrapper">
        <h3> 蛋糕库存 </h3>
        <table width="100%">
          <tr class="tabletd2">
            <td width="17" align="center">序号</td>
              <td width="103" align="center">蛋糕名称</td>
              <td width="60" align="center">类别</td>
              <td width="98" align="center">保质期</td>
              <td width="84" align="center">包装</td>
              <td width="87" align="center">存储</td>
              <td width="100" align="center">品牌</td>
              <td width="35" align="center">价格</td>
              <td width="136" align="center">详情</td>
              <td align="center">库存</td>
          </tr>
          <%
            ArrayList products = array.getXianhua();
            String xiao = request.getParameter("xiao");
            String da = request.getParameter("da");
            String str = "";
            if((xiao != null && !xiao.equals("")) && (da != null && !da.equals(""))){
	            if(Integer.parseInt(xiao) < Integer.parseInt(da)){
	            	str = "where kuchun>="+xiao+" and kuchun<="+da;
	            }
	            if(Integer.parseInt(xiao) > Integer.parseInt(da)){
	            	str = "where kuchun<="+xiao+" and kuchun>="+da;
	            }
	            products = array.getXianhuashou(str);
            }
            for(int i = 0;i < products.size();i++){
            	ArrayList alRow = (ArrayList)products.get(i);
             %>
          <tr class="tabletd<%=i%2+1 %>">
            <td align="center"><%=i+1 %></td>
              <td align="center"><%=alRow.get(1) %></td>
              <td align="center"><%=alRow.get(2) %></td>
              <td align="center"><%=alRow.get(3) %></td>
              <td align="center"><%=alRow.get(4) %></td>
              <td align="center"><%=alRow.get(5) %></td>
              <td align="center"><%=alRow.get(6) %></td>
              <td align="center"><%=alRow.get(7) %></td>
              <td align="center"><%=alRow.get(8) %></td>
              <td align="center" width="35"><%=alRow.get(10) %></td>
            </tr>
          <%} %>
        </table>
      </div>
      <table width="100%">
        <tr>
          <td height="5"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<jsp:include flush="true" page="/admin/bottom.jsp" />
<%}} %>