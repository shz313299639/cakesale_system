<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
if(adminlogin == null || adminlogin.size() == 0){
	%>
<script>alert('����û�е�¼!');window.navigate('index.jsp');</script>
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
			alert("����������!");
			document.form1.xiao.focus();
			return false;
		}
		
	}
	if (document.form1.da.value != "" ) 
	{
		if (!ints.test(document.form1.da.value))
		{
			alert("����������!");
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
                <td>ҵ����</td>
                <td><input name="xiao" type="text" size="10">Ԫ��<input name="da" type="text" size="10"></td>
                <td><input type="submit" value="����"></td>
              </tr>
            </table>
            </form></td>
        </tr>
      </table>
      <div id="formwrapper">
        <h3> ����ҵ�� </h3>
        <table width="100%">
          <tr class="tabletd2">
            <td height="25" align="center">������</td>
            <td height="25" align="center">�û�����</td>
            <td height="25" align="center">�ͻ���ַ</td>
            <td height="25" align="center">����ʱ��</td>
            <td height="25" align="center">�����ĵ���</td>
            <td height="25" align="center">ҵ��</td>
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
                  <td align="center" bgcolor="#CCCCCC">���</td>
                  <td align="center" bgcolor="#CCCCCC">����</td>
                  <td align="center" bgcolor="#CCCCCC">����</td>
                  <td align="center" bgcolor="#CCCCCC">����</td>
                  <td align="center" bgcolor="#CCCCCC">�ܼ�</td>
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
                  <td align="center"><%=xianhua.get(7) %>Ԫ</td>
                  <td align="center"><%=alRow1.get(3) %></td>
                  <td align="center"><%=Integer.parseInt(xianhua.get(7).toString())*Integer.parseInt(alRow1.get(3).toString()) %>Ԫ</td>
                </tr>
                <%} %>
              </table></td>
            <td align="center"><%=sums %>Ԫ</td>
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