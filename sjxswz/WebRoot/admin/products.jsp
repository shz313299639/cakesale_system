<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript">
function check()
{
	var pattern = /^[0-9]+$/;
	if (document.form1.name.value == "" ) 
	{
		alert("�����뵰������!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.leibie.value == "" ) 
	{
		alert("���������!");
		document.form1.leibie.focus();
		return false;
	}
	if (document.form1.chailiao.value == "" ) 
	{
		alert("�����뱣����!");
		document.form1.chailiao.focus();
		return false;
	}
	if (document.form1.baozhuang.value == "" ) 
	{
		alert("�������װ!");
		document.form1.baozhuang.focus();
		return false;
	}
	if (document.form1.huayu.value == "" ) 
	{
		alert("������洢!");
		document.form1.huayu.focus();
		return false;
	}
	if (document.form1.fushong.value == "" ) 
	{
		alert("������Ʒ��!");
		document.form1.fushong.focus();
		return false;
	}
	if (!pattern.test(document.form1.price.value) )  
	{
		alert("�۸�ֻ��������!");
		document.form1.price.focus();
		return false;
	}
	if (!pattern.test(document.form1.kuchun.value) )  
	{
		alert("���ֻ��������!");
		document.form1.kuchun.focus();
		return false;
	}
	if (document.form1.shuoming.value == "" ) 
	{
		alert("����������!");
		document.form1.shuoming.focus();
		return false;
	}
	if (document.form1.path.value == "" ) 
	{
		alert("���ϴ�����ͼƬ!");
		document.form1.path.focus();
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
    <table width="920" border="0" cellspacing="0" cellpadding="0" background="<%=path%>/img/all_bg.jpg" height="420">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<div id="formwrapper">
        <h3> ������� </h3>
        <form action="<%=path %>/XianhuaServlet?mark=add" method="post" name="form1" onSubmit="return check()">
          <fieldset>            
            <div>
              <label for="name"> �������ƣ� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="name"><br />
            </div>
            <div>
              <label for="name"> ��� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="leibie"><br />
            </div>
            <div>
              <label for="name"> �����ڣ� </label>
              <textarea name="chailiao" cols="70" rows="5" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';"></textarea><br />
            </div>
            <div>
              <label for="name"> ��װ�� </label>
              <textarea name="baozhuang" cols="70" rows="5" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';"></textarea><br />
            </div>
            <div>
              <label for="name"> �洢�� </label>
              <textarea name="huayu" cols="70" rows="5" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';"></textarea><br />
            </div>
            <div>
              <label for="name"> Ʒ�ƣ� </label>
              <textarea name="fushong" cols="70" rows="5" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';"></textarea><br />
            </div>
            <div>
              <label for="name"> �۸� </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="price"><br />
            </div>
            <div>
              <label for="name"> ��棺 </label>
              <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 180px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="kuchun"><br />
            </div>
            <div>
              <label for="name"> ���飺 </label>
              <textarea name="shuoming" cols="70" rows="10" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';"></textarea><br />
            </div>
            <div>
              <label for="name"> ����ͼƬ�� </label>
              
              <input type="text" size="50" name="path" readonly>&nbsp;<input type="button" value="�ϴ�ͼƬ" onClick="window.open('upfile.jsp?typename=path','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')"><br />
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
<%} %>
