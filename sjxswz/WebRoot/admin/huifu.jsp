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
function reg()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	
	if (document.form1.huifu.value == "" ) 
	{
		alert("请输入回复内容!");
		document.form1.huifu.focus();
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
	width: 700px;
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
            <td height="25">回复留言</td>
          </tr>
        </table>
		<%
		String id = request.getParameter("id");
      ArrayList liuyan = array.getLiuyan(id);
       %>
      <div id="formwrapper">
        <h3> 回复留言 </h3>
        <form action="<%=path %>/HuifuServlet?id=<%=id %>" method="post" name="form1" onSubmit="return reg()">
          <fieldset>
            <div>
              <label for="name"> 用户姓名： </label>
              <input name="name" type="text" class="it1" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" onBlur="this.className='it1';" value="<%=liuyan.get(1) %>" readonly="readonly"><br />
            </div>
            <div>
              <label for="phone"> 联系电话： </label>
              <input name="phone" type="text" class="it1" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" onBlur="this.className='it1';" value="<%=liuyan.get(2) %>" readonly="readonly"><br />
            </div>
            <div>
              <label for="email"> 电子邮箱： </label>
              <input name="email" type="text" class="it1" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" onBlur="this.className='it1';" value="<%=liuyan.get(3) %>" readonly="readonly"><br />
            </div>
            <div>
              <label for="result"> 留言内容： </label>
              <textarea name="neirong" cols="60" rows="10" readonly="readonly" class="it1" onFocus="this.className='it2';" onBlur="this.className='it1';"><%=liuyan.get(4) %></textarea><br />
            </div>
            <div>
              <label for="result"> 回复内容： </label>
              <textarea class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="huifu" cols="60" rows="10"></textarea><br />
            </div>
            <div class="enter">
              <input type="submit" class="buttom" value="提交" />
              <input type="reset" class="buttom" value="重置" />
            </div>
          </fieldset>
        </form>
      </div>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%} %>
