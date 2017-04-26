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
<title>网上订购蛋糕</title>
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
          &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/login.jsp">登陆</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/reg.jsp">用户注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <%}else{ %>
          	欢迎您：<%=userlogin.get(1) %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path %>/users/user_zhongxin.jsp"">用户中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/user_zhiliao.jsp">修改资料</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/user_pwd.jsp">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/users/orders.jsp">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=path %>/RemoveServlet?mark=user">注销退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
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
            <td width="85" height="55" align="center" background="<%=path %>/img/link_2.gif"><a href="" style="color:#FFF">首页</a></td>
            <td width="85" height="55" align="center" background="<%=path %>/img/link_3.gif"><a href="<%=path %>/users/dandu.jsp?id=4" style="color:#FFF">联系我们</a></td>
            <td width="85" height="55" align="center" background="<%=path %>/img/link_4.gif"><a href="<%=path %>/users/dandu.jsp?id=5" style="color:#FFF">关于我们</a></td>
            <td width="50" height="55" background="<%=path %>/img/link_5.gif">&nbsp;</td>
          </tr>
        </table></td>
        <td><table width="540">
          <tr>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/products_zhanshi.jsp">蛋糕展示</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/products_shoushuo.jsp">蛋糕搜索</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/liuyan_list.jsp">顾客留言</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/dandu.jsp?id=2">常见问题</a></td>
            <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/users/shopping.jsp">购物车</a></td>
         <td width="90" height="55" align="center" background="<%=path %>/img/link_6.gif"><a href="<%=path %>/admin/index.jsp">后台管理</a></td>
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
      <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
      <param name="expressinstall" value="<%=path %>/img/Scripts/expressInstall.swf">
      <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="<%=path %>/img/13.swf" width="960" height="250">
        <!--<![endif]-->
        <param name="quality" value="high">
        <param name="wmode" value="transparent">
        <param name="swfversion" value="6.0.65.0">
        <param name="expressinstall" value="<%=path %>/img/Scripts/expressInstall.swf">
        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
        <div>
          <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
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
