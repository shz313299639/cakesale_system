<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:include flush="true" page="/users/top.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('index.jsp');</script><%
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
		alert("������ԭ����!");
		document.form1.oldpwd.focus();
		return false;
	}
	if (document.form1.oldpwd.value != "<%=userlogin.get(2) %>" ) 
	{
		alert("ԭ�������!");
		document.form1.oldpwd.focus();
		return false;
	}
	if (document.form1.newpwd.value == ""  )  
	{
		alert("������������!");
		document.form1.newpwd.focus();
		return false;
	}
	if (document.form1.newpwd.value.length < 3 )  
	{
		alert("���볤������3���ַ�!");
		document.form1.newpwd.focus();
		return false;
	}
	if (!pattern.test(document.form1.newpwd.value) )  
	{
		alert("����ֻ�ܰ�����ĸ������!");
		document.form1.newpwd.focus();
		return false;
	}
	if (document.form1.repetition.value == ""  )  
	{
		alert("�������ظ�������!");
		document.form1.repetition.focus();
		return false;
	}
	if (document.form1.repetition.value != document.form1.newpwd.value  )  
	{
		alert("�������벻һ��!");
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
        <h3> �Ѵ����ʻ� </h3>
        <form action="<%=path %>/ModifyUserServlet?mark=userpass" method="post" name="form1" onSubmit="return check()">
          <fieldset>
            <legend> �޸����� </legend>
            <div>
              <label for="name"> �����룺 </label>
              <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="oldpwd"><br />
            </div>
            <div>
              <label for="pwd"> �����룺 </label>
              <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="newpwd"><br />
            </div>
            <div>
              <label for="pwd"> �ظ������룺 </label>
              <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="repetition"><br />
            </div>
            <div class="enter">
              <input type="submit" class="buttom" value="�ύ" />
              <input type="reset" class="buttom" value="����" />
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