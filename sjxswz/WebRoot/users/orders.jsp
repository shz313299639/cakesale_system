<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/users/top.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
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
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.oldpwd.value == "" ) 
	{
		alert("请输入原密码!");
		document.form1.oldpwd.focus();
		return false;
	}
	if (document.form1.oldpwd.value != "<%=userlogin.get(2) %>" ) 
	{
		alert("原密码错误!");
		document.form1.oldpwd.focus();
		return false;
	}
	if (document.form1.newpwd.value == ""  )  
	{
		alert("请输入新密码!");
		document.form1.newpwd.focus();
		return false;
	}
	if (document.form1.newpwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form1.newpwd.focus();
		return false;
	}
	if (!pattern.test(document.form1.newpwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.newpwd.focus();
		return false;
	}
	if (document.form1.repetition.value == ""  )  
	{
		alert("请输入重复新密码!");
		document.form1.repetition.focus();
		return false;
	}
	if (document.form1.repetition.value != document.form1.newpwd.value  )  
	{
		alert("两次密码不一致!");
		document.form1.repetition.focus();
		return false;
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
          <td height="5"></td>
        </tr>
      </table>
      <div id="formwrapper">
        <h3> 我的订单 </h3>
        <table width="100%">
          <tr class="tabletd2">
            <td height="25" align="center">订单号</td>
            <td height="25" align="center">订购时间</td>
            <td height="25" align="center">订购的蛋糕</td>
            <td height="25" align="center">合计</td>
            <td height="25" align="center">是否发货</td>
            <td height="25" align="center">管理员回复</td>
          </tr>
          <%
            ArrayList products = array.getUserOrder(userlogin.get(0).toString());
            for(int i = 0;i < products.size();i++){
            	ArrayList alRow = (ArrayList)products.get(i);
             %>
          <tr class="tabletd<%=i%2+1 %>">
            <td align="center"><%=alRow.get(0) %></td>
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
            <td align="center"><%=alRow.get(3) %></td>
            <td align="center"><%=alRow.get(4) %></td>
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
<jsp:include flush="true" page="/users/bottom.jsp" />
<%} %>