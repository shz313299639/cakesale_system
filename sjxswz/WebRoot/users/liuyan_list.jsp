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
<style>
<!--
.buttom {
	padding: 1px 10px;
	font-size: 12px;
	border: 1px #1E7ACE solid;
	background: #D0F0FF;
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
    <td valign="top"><table width="100%">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
    <td align="center" valign="top"><table width="100%">
        <tr>
          <td height="30" align="right"><a href="<%=path %>/users/liuyan.jsp">我要留言</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
      </table>
      <%
      ArrayList liuyan = array.getLiuyan();
      for(int i = 0;i < liuyan.size();i++){
      	ArrayList alRow = (ArrayList)liuyan.get(i);
       %>
      <fieldset style=" width:940px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" bgcolor="#D3EBEF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;姓名：<%=alRow.get(1) %></td>
                  <td>联系电话：<%=alRow.get(2) %></td>
                  <td>电子邮箱：<%=alRow.get(3) %></td>
                  <td>留言时间：<%=alRow.get(6).toString().substring(0,10) %></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="8%">&nbsp;留言内容：</td>
                  <td width="92%"><%=alRow.get(4) %></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="25" bgcolor="#D3EBEF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="8%">&nbsp;回复：</td>
                  <td width="92%"><%=alRow.get(5) == null || alRow.get(5).equals("")?"暂无回复":alRow.get(5) %></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </fieldset>
      <%} %>
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