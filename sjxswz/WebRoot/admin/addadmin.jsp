<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('index.jsp');</script><%
}else{
if(adminlogin.get(3) != null && !adminlogin.get(3).equals("0")){
	%><script>alert('������ݲ��ԣ����ܲ�������Ŀ!');window.navigate('index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript" type="text/javascript" src="<%=path %>/img/My97DatePicker/WdatePicker.js"></script>
<script language="JavaScript">
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
	else if (document.form1.shengri.value == "" ) 
	{
		alert("�������������!");
		document.form1.shengri.focus();
		return false;
	}
	else if (document.form1.xueli.value == "" ) 
	{
		alert("������ѧ��!");
		document.form1.xueli.focus();
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
    <table width="920" border="0" cellspacing="0" cellpadding="0" background="<%=path%>/img/all_bg.jpg" height="420">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<div id="formwrapper">
        <h3> ���Ա�� </h3>
        <form action="<%=path %>/ModifyAdminServlet?mark=insert" method="post" name="form1" onSubmit="return reg()">
          <fieldset>
            <legend> ���Ա�� </legend>
            <div>
              <label for="name"> �û����� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="name"><br />
            </div>
            <div>
              <label for="pwd"> ���룺 </label>
              <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="pwd"><br />
            </div>
            <div>
              <label for="reallyname"> ��ʵ������ </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="reallyname"><br />
            </div>
            <div>
              <label for="sex"> �Ա� </label>
                                     ��&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="sex" value="��" checked="checked">&nbsp;&nbsp;Ů&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="sex" value="Ů"><br />
            </div>
            <div>
              <label for="qq"> QQ���룺 </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="qq"><br />
            </div>
            <div>
              <label for="email"> �������䣺 </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="email"><br />
            </div>
            <div>
              <label for="phone"> ��ϵ�绰�� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="phone"><br />
            </div>
            <div>
              <label for="address"> ��ϵ��ַ�� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="address"><br />
            </div>
            <div>
              <label for="postcode"> �������룺 </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="postcode"><br />
            </div>
            <div>
              <label for="address"> �������ڣ� </label>
              <input type="text" name="shengri" class="Wdate" id="d4321" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
              ><br />
            </div>
            <div>
              <label for="postcode"> ѧ���� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 160px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="xueli"><br />
            </div>
            <div class="enter">
              <input type="submit" class="buttom" value="�ύ" />
              <input type="reset" class="buttom" value="����" />
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
<%}} %>
