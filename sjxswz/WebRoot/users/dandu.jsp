<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
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
		alert("�û���ֻ�ܰ�����ĸ������!");
		document.form1.name.focus();
		return false;
	}
	else if (document.form1.name.value.length < 3 )  
	{
		alert("�û�����������3���ַ�!");
		document.form1.name.focus();
		return false;
	}
	else if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("����ֻ�ܰ�����ĸ������!");
		document.form1.pwd.focus();
		return false;
	}
	else if (document.form1.pwd.value.length < 3 )  
	{
		alert("���볤������3���ַ�!");
		document.form1.pwd.focus();
		return false;
	}
	else if (document.form1.reallyname.value == "" ) 
	{
		alert("��������ʵ����!");
		document.form1.reallyname.focus();
		return false;
	}
	else if (document.form1.profession.value == "" ) 
	{
		alert("������ְҵ!");
		document.form1.profession.focus();
		return false;
	}
	else if (document.form1.qq.value == "" ) 
	{
		alert("������qq����!");
		document.form1.qq.focus();
		return false;
	}
	else if (!emails.test(document.form1.email.value))  
	{
		alert("���������ʽ����(����123@163.com)!");
		document.form1.email.focus();
		return false;
	}
	else if (!ints.test(document.form1.phone.value))  
	{
		alert("��ϵ�绰��ʽ����(����02412345678)!");
		document.form1.phone.focus();
		return false;
	}
	else if (document.form1.address.value == "" ) 
	{
		alert("��������ϵ��ַ!");
		document.form1.address.focus();
		return false;
	}
	else if (!ints.test(document.form1.postcode.value))  
	{
		alert("��������ֻ��������!");
		document.form1.postcode.focus();
		return false;
	}
	else if (document.form1.question.value == "" ) 
	{
		alert("������������ʾ����!");
		document.form1.question.focus();
		return false;
	}
	else if (document.form1.result.value == "" ) 
	{
		alert("������������ʾ��!");
		document.form1.result.focus();
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
      <%
		String id = request.getParameter("id");
		if(id == null || id.equals("")){
			id = (String)request.getAttribute("id");
		}
		String str = "";
      ArrayList dandu = array.getDandu(id);
      if(id != null && id.equals("1")){
      	str = "��������";
      }
      if(id != null && id.equals("2")){
      	str = "��������";
      }
      if(id != null && id.equals("3")){
      	str = "��������";
      }
      if(id != null && id.equals("4")){
      	str = "��ϵ����";
      }
      if(id != null && id.equals("5")){
      	str = "��������";
      }
       %>
      <div id="formwrapper">
        <h3> <%=str %> </h3>
        <form action="<%=path %>/reg.do?mark=geren" method="post" name="form1" onSubmit="return reg()">
          <fieldset>
            <div>
              <%=dandu.get(1) %>
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