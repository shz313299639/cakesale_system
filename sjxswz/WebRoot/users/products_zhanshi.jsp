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
		ArrayList products = array.getXianhua();
       %>
      <div id="formwrapper">
        <h3> 蛋糕展示 </h3>
        <%
        for(int i = 0;i < products.size();i++){
        	ArrayList alRow = (ArrayList)products.get(i);
         %>
          <fieldset>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="28%" rowspan="23" align="center"><a href="<%=path %>/users/products_show.jsp?id=<%=alRow.get(0) %>"><img src="<%=path %>/<%=alRow.get(9) %>" width="130" height="130" border="0"></a></td>
                <td width="7%">【编号】</td>
                <td width="65%" height="25"><%=alRow.get(0) %></td>
              </tr>
              <tr>
                <td>【名称】</td>
                <td height="25"><%=alRow.get(1) %></td>
              </tr>
              <tr>
                <td>【类别】</td>
                <td height="25"><%=alRow.get(2) %></td>
              </tr>
              <tr>
                <td>【价格】</td>
                <td height="25"><%=alRow.get(7) %></td>
              </tr>
              <tr>
                <td>【库存】</td>
                <td height="25"><%=alRow.get(10) %></td>
              </tr>
              <tr>
                <td height="40" colspan="2" align="center"><a href="<%=path %>/GouwucheServlet?id=<%=alRow.get(0) %>"><img src="<%=path %>/img/buy.gif" width="100px" height="26px" border="0"/></a></td>
              </tr>
            </table>
        </fieldset>
          <%} %>
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