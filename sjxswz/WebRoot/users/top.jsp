<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>���϶�������</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/img/css.css">
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="<%=path %>/img/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<table width="100%" class="sky">
  <tr>
    <td align="center"><table class="skd">
        <tr>
          <td align="right">
          <%
          ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
			if(userlogin == null || userlogin.size() == 0){
           %>
          &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/login.jsp">��½</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/reg.jsp">�û�ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <%}else{ %>
          	��ӭ����<%=userlogin.get(1) %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/users/user_zhongxin.jsp"">�û�����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/user_zhiliao.jsp">�޸�����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/user_pwd.jsp">�޸�����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/orders.jsp">�ҵĶ���</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/RemoveServlet?mark=user">ע���˳�</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
          <%} %>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" class="skd">
  <tr>
    <td><table width="100%">
      <tr>
        <td><table width="420">
          <tr>
            <td width="115" height="55" background="<%=path %>/img/link_1.gif">&nbsp;</td>
            <td width="85" height="55" align="center" background="<%=path %>/img/link_2.gif"><a href="" style="color:#FFF">��ҳ</a></td>
            <td width="85" height="55" align="center" background="<%=path %>/img/link_3.gif"><a href="<%=path %>/users/dandu.jsp?id=4" style="color:#FFF">��ϵ����</a></td>
            <td width="85" height="55" align="center" background="<%=path %>/img/link_4.gif"><a href="<%=path %>/users/dandu.jsp?id=5" style="color:#FFF">��������</a></td>
            <td width="50" height="55" background="<%=path %>/img/link_5.gif">&nbsp;</td>
          </tr>
        </table></td>
        <td><table width="540">
          <tr>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/products_zhanshi.jsp">����չʾ</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/products_shoushuo.jsp">��������</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/liuyan_list.jsp">�˿�����</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/dandu.jsp?id=2">��������</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/shopping.jsp">���ﳵ</a></td>
         <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/admin/index.jsp">��̨����</a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td background="<%=path %>/img/top.jpg" width="960" height="250"><object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="960" height="250">
      <param name="movie" value="<%=path %>/img/13.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <param name="swfversion" value="6.0.65.0">
      <!-- �� param ��ǩ��ʾʹ�� Flash Player 6.0 r65 �͸��߰汾���û��������°汾�� Flash Player��������������û���������ʾ���뽫��ɾ���� -->
      <param name="expressinstall" value="<%=path %>/img/Scripts/expressInstall.swf">
      <!-- ��һ�������ǩ���ڷ� IE �����������ʹ�� IECC ����� IE ���ء� -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="<%=path %>/img/13.swf" width="960" height="250">
        <!--<![endif]-->
        <param name="quality" value="high">
        <param name="wmode" value="transparent">
        <param name="swfversion" value="6.0.65.0">
        <param name="expressinstall" value="<%=path %>/img/Scripts/expressInstall.swf">
        <!-- ��������������������ʾ��ʹ�� Flash Player 6.0 �͸��Ͱ汾���û��� -->
        <div>
          <h4>��ҳ���ϵ�������Ҫ���°汾�� Adobe Flash Player��</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="��ȡ Adobe Flash Player" width="112" height="33" /></a></p>
        </div>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object></td>
  </tr>
</table>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>
