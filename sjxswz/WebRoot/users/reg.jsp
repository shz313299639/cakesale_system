<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:include flush="true" page="/users/top.jsp" />
<%
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
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	else if (document.form1.name.value.length < 3 )  
	{
		alert("用户名长度最少3个字符!");
		document.form1.name.focus();
		return false;
	}
	else if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
	else if (document.form1.pwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form1.pwd.focus();
		return false;
	}
	else if (document.form1.reallyname.value == "" ) 
	{
		alert("请输入真实姓名!");
		document.form1.reallyname.focus();
		return false;
	}
	else if (document.form1.qq.value == "" ) 
	{
		alert("请输入qq号码!");
		document.form1.qq.focus();
		return false;
	}
	else if (!emails.test(document.form1.email.value))  
	{
		alert("电子邮箱格式错误(例如123@163.com)!");
		document.form1.email.focus();
		return false;
	}
	else if (!ints.test(document.form1.phone.value))  
	{
		alert("联系电话格式错误(例如02412345678)!");
		document.form1.phone.focus();
		return false;
	}
	else if (document.form1.address.value == "" ) 
	{
		alert("请输入联系地址!");
		document.form1.address.focus();
		return false;
	}
	else if (!ints.test(document.form1.postcode.value))  
	{
		alert("邮政编码只能是数字!");
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
	width: 650px;
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
        <h3> 未注册创建帐户 </h3>
        <form action="<%=path %>/RegServlet" method="post" name="form1" onSubmit="return reg()">
          <fieldset>
            <legend> 用户注册 </legend>
            <div>
              <label for="name"> 用户名： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="name">&nbsp;&nbsp;(3个以上字符，可以使用英文和数字)<br />
            </div>
            <div>
              <label for="pwd"> 密码： </label>
              <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="pwd">&nbsp;&nbsp;(3个以上字符，可以使用英文和数字)<br />
            </div>
            <div>
              <label for="reallyname"> 真实姓名： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="reallyname">&nbsp;&nbsp;(务必真实填写，以方便我们联系到您)<br />
            </div>
            <div>
              <label for="sex"> 性别： </label>
                                     男&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="sex" value="男" checked="checked">&nbsp;&nbsp;女&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="sex" value="女"><br />
            </div>
            <div>
              <label for="qq"> QQ号码： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="qq"><br />
            </div>
            <div>
              <label for="email"> 电子邮箱： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="email"><br />
            </div>
            <div>
              <label for="phone"> 联系电话： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="phone">&nbsp;&nbsp;(务必真实填写，以方便我们联系到您)<br />
            </div>
            <div>
              <label for="address"> 联系地址： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="address">&nbsp;&nbsp;(务必真实填写，以方便我们给您送货)<br />
            </div>
            <div>
              <label for="postcode"> 邮政编码： </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="postcode"><br />
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