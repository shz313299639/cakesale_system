<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/users/top.jsp" />
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('index.jsp');</script><%
}else{
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
function reg()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.qq.value == "" ) 
	{
		alert("请输入qq号码!");
		document.form1.qq.focus();
		return false;
	}
	if (!emails.test(document.form1.email.value))  
	{
		alert("邮箱格式错误(例如123@163.com)!");
		document.form1.email.focus();
		return false;
	}
	if (!ints.test(document.form1.phone.value))  
	{
		alert("电话格式错误(例如02412345678)!");
		document.form1.phone.focus();
		return false;
	}
	if (document.form1.address.value == "" ) 
	{
		alert("请输入地址!");
		document.form1.address.focus();
		return false;
	}
	if (!ints.test(document.form1.postcode.value))  
	{
		alert("邮编只能是数字!");
		document.form1.postcode.focus();
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
	width: 450px;
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
        <h3> 注册用户 </h3>
        <form action="<%=path %>/ModifyUserServlet?mark=usertext" method="post" name="form1" onSubmit="return reg()">
        <%
        ArrayList users = array.getUser(userlogin.get(0).toString());
         %>
          <fieldset>
            <legend> 修改资料 </legend>
            <div>
              <label for="qq"> QQ号码： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="qq" value="<%=users.get(5) %>"><br />
            </div>
            <div>
              <label for="email"> 电子邮箱： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="email" value="<%=users.get(6) %>"><br />
            </div>
            <div>
              <label for="phone"> 联系电话： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="phone" value="<%=users.get(7) %>"><br />
            </div>
            <div>
              <label for="address"> 联系地址： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="address" value="<%=users.get(8) %>"><br />
            </div>
            <div>
              <label for="postcode"> 邮政编码： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="postcode" value="<%=users.get(9) %>"><br />
            </div>
            <div class="enter">
              <input type="submit" class="buttom" value="提交" />
              <input type="reset" class="buttom" value="重置" />
            </div>
          </fieldset>
        </form>
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