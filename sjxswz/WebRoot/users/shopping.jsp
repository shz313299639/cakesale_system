<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
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
    
    <title>�ҵĹ��ﳵ</title>
	
  </head>
    	<style>
<!--
.input1 {
	BORDER-BOTTOM-WIDTH: 0px; WIDTH: 60px; COLOR: #000000; HEIGHT: 20px; BORDER-RIGHT-WIDTH: 0px
}
-->
</style> 
  <script language="JavaScript">
		function chick(id,i)
			{
				form1.action="<%=path %>/GouwucheServlet?i="+i+"&id="+id;
  				form1.submit();
			}
</script>
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
  <form name="form1" action="" method="post">
  <table class="skd" background="<%=path%>/img/all_bg.jpg" height="420">
  <tr>
    <td valign="top">

  <table bgcolor="#ffcc00" border="0" cellpadding="1" cellspacing="1" align="center" width="800">
		<tr bgcolor="#ffe2a6">
			<td align="center" valign="middle" colspan="10">
			<font face="�����п�" size="3">�ҵĹ��ﳵ</font></td>
		</tr>
		<tr bgcolor="#ffe2a6">
			<td align="center" valign="middle">���</td>
			<td align="center" valign="middle">����</td>
			<td align="center" valign="middle">����</td>
			<td align="center" valign="middle">����</td>
			<td align="center" valign="middle">�ܼ�</td>
			<td align="center" valign="middle">�޸�����</td>
			<td align="center" valign="middle">ɾ��</td>
		</tr>
		<%
		ArrayList shopping = (ArrayList)session.getAttribute("shopping");
		int sum = 0;
  		int sumPrices = 0;
		if(shopping == null || shopping.size() == 0){
		%>
		<tr bgcolor="#fff9ec"><td colspan="10" align="center" valign="middle"><font size="1" color="red">���ﳵ��һ������Ҳû�У�</font></td></tr>
		<%}else{
		for(int i = 0;i < shopping.size();i++){
		ArrayList alShop = (ArrayList)shopping.get(i);
		sum += Integer.parseInt(alShop.get(1).toString());
		sumPrices += Integer.parseInt(((ArrayList)alShop.get(0)).get(7).toString())*Integer.parseInt(alShop.get(1).toString());
		%>
		<tr bgcolor="#fff9ec">
			<td valign="middle" align="center"><a href="<%=path %>/users/products_show.jsp?id=<%=((ArrayList)alShop.get(0)).get(0) %>"><%=((ArrayList)alShop.get(0)).get(0)%></a></td>
			<td valign="middle" align="center"><a href="<%=path %>/users/products_show.jsp?id=<%=((ArrayList)alShop.get(0)).get(0) %>"><%=((ArrayList)alShop.get(0)).get(1)%></a></td>
			<td valign="middle" align="center"><%=((ArrayList)alShop.get(0)).get(7) %>Ԫ</td>
			<td valign="middle" align="center"><input class="input1" type="text" value="<%=alShop.get(1)%>" name="num<%=i %>"/></td>
			<td valign="middle" align="center"><%=Integer.parseInt(((ArrayList)alShop.get(0)).get(7).toString())*Integer.parseInt(alShop.get(1).toString())%>Ԫ</td>
			<td align="center" valign="middle">
			<input type="button" value="�޸�����" onClick="chick(<%=((ArrayList)alShop.get(0)).get(0)%>,<%=i %>)"/></td>
			<td align="center" valign="middle">
			<a href="<%=path %>/GouwucheServlet?del=<%=i%>">
            <img src="img/trash.gif" border="0" height="17" width="15" alt="">
          	</a>
			</td>
		</tr>
		<%}%>
		<tr bgcolor="#fff9ec">
			<td colspan="10" align="center">���ﳵ���е��⣺<%=shopping.size()%>����������<%=sum%>�����ƣ�<%=sumPrices%>Ԫ��</td>
		</tr>
		<%}%>
		<tr bgcolor="#ffffff">
			<td colspan="10" align="center">
				<a href="<%=path %>/users/index.jsp">
		          <img alt="" src="img/cart01.gif" border=0/>
		        </a>
		        <a href="<%=path %>/GouwucheServlet?remove=1">
		          <img alt="" src="img/cart02.gif" border=0/>
		        </a>
		        <a href="<%=path %>/GouwucheServlet?reckoning=reckoning&yeji=<%=sumPrices %>">
		          <img alt="" src="img/cart04.gif" border=0/>
		        </a>
		     </td>
		</tr>
		<tr><td colspan="10"valign="middle"><font color="red">*</font>�����ˢ���˹��ﳵҳ�棬�ϴι���ĵ�����Ŀ��������1��</br><font color="red">*</font>��������������̨���̳ǽ��ᱣ�����Ķ���������������Ĺ��ﳵ��</td></tr>
	</table></td>
  </tr>
</table>
	</form>
  </body>
</html>
<jsp:include flush="true" page="/users/bottom.jsp" />
<%} %>
