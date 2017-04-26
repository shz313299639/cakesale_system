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
    <td align="center"><table width="100%">
        <tr>
          <td height="25" align="center">
          <form action="<%=path %>/admin/yeji.jsp" method="post" name="form1" onSubmit="return check()">
          <table>
              <tr>
                <td>业绩：</td>
                <td><input name="xiao" type="text" size="10">元到<input name="da" type="text" size="10"></td>
                <td><input type="submit" value="搜索"></td>
              </tr>
            </table>
            </form></td>
        </tr>
      </table>
      <div id="formwrapper">
        <h3> 销售业绩 </h3>
        <table width="100%">
          <tr class="tabletd2">
            <td height="25" align="center">订单号</td>
            <td height="25" align="center">用户姓名</td>
            <td height="25" align="center">送货地址</td>
            <td height="25" align="center">订购时间</td>
            <td height="25" align="center">订购的蛋糕</td>
            <td height="25" align="center">业绩</td>
          </tr>
          <%
            ArrayList products = array.getUseryeji(adminlogin.get(0).toString());
            String xiao = request.getParameter("xiao");
            String da = request.getParameter("da");
            String str = "";
            if((xiao != null && !xiao.equals("")) && (da != null && !da.equals(""))){
	            if(Integer.parseInt(xiao) < Integer.parseInt(da)){
	            	str = "yeji>="+xiao+" and yeji<="+da;
	            }
	            if(Integer.parseInt(xiao) > Integer.parseInt(da)){
	            	str = "yeji<="+xiao+" and yeji>="+da;
	            }
	            products = array.getUseryeji(adminlogin.get(0).toString(),str);
            }
            for(int i = 0;i < products.size();i++){
            	ArrayList alRow = (ArrayList)products.get(i);
            	ArrayList users = array.getUser(alRow.get(1).toString());
             %>
          <tr class="tabletd<%=i%2+1 %>">
            <td align="center"><%=alRow.get(0) %></td>
            <td align="center"><a href="<%=path %>/admin/usershow.jsp?id=<%=users.get(0) %>" class="admin"><%=users.get(3) %></a></td>
            <td align="center"><%=users.get(8) %></td>
            <td align="center"><%=alRow.get(2).toString().substring(0,10) %></td>
            <td align="center"><table width="100%">
                <tr>
                  <td align="center" bgcolor="#CCCCCC">编号</td>
                  <td align="center" bgcolor="#CCCCCC">名称</td>
                  <td align="center" bgcolor="#CCCCCC">单价</td>
                  <td align="center" bgcolor="#CCCCCC">数量</td>
                  <td align="center" bgcolor="#CCCCCC">总价</td>
                </tr>
                <%
                ArrayList xiangxi = array.getXiangxi(alRow.get(0).toString());
                int sums = 0;
                for(int m = 0;m < xiangxi.size();m++){
                	ArrayList alRow1 = (ArrayList)xiangxi.get(m);
                	ArrayList xianhua = array.getXianhua(alRow1.get(2).toString());
                	sums += Integer.parseInt(xianhua.get(7).toString())*Integer.parseInt(alRow1.get(3).toString());
                 %>
                <tr>
                  <td align="center"><%=xianhua.get(0) %></td>
                  <td align="center"><%=xianhua.get(1) %></td>
                  <td align="center"><%=xianhua.get(7) %>元</td>
                  <td align="center"><%=alRow1.get(3) %></td>
                  <td align="center"><%=Integer.parseInt(xianhua.get(7).toString())*Integer.parseInt(alRow1.get(3).toString()) %>元</td>
                </tr>
                <%} %>
              </table></td>
            <td align="center"><%=sums %>元</td>
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
<%} %>