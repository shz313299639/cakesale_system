<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/users/top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
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
function login()
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
	else if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("����ֻ�ܰ�����ĸ������!");
		document.form1.pwd.focus();
		return false;
	}
}
</script>
<script language="javascript">
function showandhide(h_id,hon_class,hout_class,c_id,totalnumber,activeno) {
    var h_id,hon_id,hout_id,c_id,totalnumber,activeno;
    for (var i=1;i<=totalnumber;i++) {
        document.getElementById(c_id+i).style.display='none';
        document.getElementById(h_id+i).className=hout_class;
    }
    document.getElementById(c_id+activeno).style.display='block';
    document.getElementById(h_id+activeno).className=hon_class;
}
var tips; 
var theTop = 40;
var old = theTop;
function initFloatTips() 
{ 
	tips = document.getElementById('divQQbox');
	moveTips();
}
function moveTips()
{
	 	  var tt=50; 
		  if (window.innerHeight) 
		  {
			  pos = window.pageYOffset  
		  }else if (document.documentElement && document.documentElement.scrollTop) {
			 pos = document.documentElement.scrollTop  
		  }else if (document.body) {
		    pos = document.body.scrollTop;  
		  }
		  pos=pos-tips.offsetTop+theTop; 
		  pos=tips.offsetTop+pos/10; 
		  if (pos < theTop){
			 pos = theTop;
		  }
		  if (pos != old) { 
			 tips.style.top = pos+"px";
			 tt=10;  //alert(tips.style.top);  
		  }
		  old = pos;
		  setTimeout(moveTips,tt);
}
initFloatTips();
	if(typeof(HTMLElement)!="undefined")    //firefox����contains()������ie�²�������
		{  
		  HTMLElement.prototype.contains=function (obj)  
		  {  
			  while(obj!=null&&typeof(obj.tagName)!="undefind"){
	   ���� ��if(obj==this) return true;  
	   ������	��obj=obj.parentNode;
	   ����	  }  
			  return false;  
		  }
	}
function show()
{
	document.getElementById("meumid").style.display="none"
	document.getElementById("contentid").style.display="block"
}
	function hideMsgBox(theEvent){
	  if (theEvent){
		var browser=navigator.userAgent;
		if (browser.indexOf("Firefox")>0){  //�����Firefox
		    if (document.getElementById("contentid").contains(theEvent.relatedTarget)) {
				return
			}
		}
		if (browser.indexOf("MSIE")>0 || browser.indexOf("Presto")>=0){
	        if (document.getElementById('contentid').contains(event.toElement)) {
			    return; 
		    }
		}
	  }
	  document.getElementById("meumid").style.display = "block";
	  document.getElementById("contentid").style.display = "none";
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
	padding: 0px;
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
	width: 244px;
	margin: 0px auto;
	padding: 0px;
	text-align: left;
	border: 0px;
}
fieldset label {
	float: left;
	width: 70px;
	text-align: right;
	padding: 4px;
	padding-left:-10px;
	padding-right:10px;
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
.qqbox a:link {
	color: #000;
	text-decoration: none;
}
.qqbox a:visited {
	color: #000;
	text-decoration: none;
}
.qqbox a:hover {
	color: #f80000;
	text-decoration: underline;
}
.qqbox a:active {
	color: #f80000;
	text-decoration: underline;
}
.qqbox {
	width:132px;
	height:auto;
	overflow:hidden;
	position:absolute;
	right:0;
	top:100px;
	color:#000000;
	font-size:12px;
	letter-spacing:0px;
}
.qqlv {
	width:25px;
	height:256px;
	overflow:hidden;
	position:relative;
	float:right;
	z-index:50px;
}
.qqkf {
	width:120px;
	height:auto;
	overflow:hidden;
	right:0;
	top:0;
	z-index:99px;
	border:6px solid #138907;
	background:#fff;
}
.qqkfbt {
	width:118px;
	height:20px;
	overflow:hidden;
	background:#138907;
	line-height:20px;
	font-weight:bold;
	color:#fff;
	position:relative;
	border:1px solid #9CD052;
	cursor:pointer;
	text-align:center;
}
.qqkfhm {
	width:112px;
	height:22px;
	overflow:hidden;
	line-height:22px;
	padding-right:8px;
	position:relative;
	margin:3px 0;
}
.bgdh {
	width:102px;
	padding-left:10px;
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
<!--<div class="qqbox" id="divQQbox">
  <div class="qqlv" id="meumid" onMouseOver="show()"><img src="<%=path %>/img/qq.gif"></div>
  <div class="qqkf" style="display:none;" id="contentid" onMouseOut="hideMsgBox(event)">
    <div class="qqkfbt" onMouseOut="showandhide('qq-','qqkfbt','qqkfbt','K',1,1);" id="qq-1" onfocus="this.blur();">�� �� �� ��</div>
    <div id="K1">
      <div class="qqkfhm bgdh"> <a href="tencent://message/?uin=383374237" title="���߿ͷ�1"><img src="http://wpa.qq.com/pa?p=1:981389008:4" border="0">���߿ͷ�1</a><br/>
      </div>
      <div class="qqkfhm bgdh"> <a href="tencent://message/?uin=396093540" title="���߿ͷ�2"><img src="http://wpa.qq.com/pa?p=1:981389008:4" border="0">���߿ͷ�2</a></div>
    </div>
  </div>
</div>
--><table class="skd" background="<%=path %>/img/all_bg.jpg">
  <tr>
    <td><table width="100%">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <table width="100%">
        <tr>
          <td width="245" height="417" align="center" background="<%=path %>/img/login.gif"><%
          ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
			if(userlogin == null || userlogin.size() == 0){
           %>
            <div id="formwrapper">
              <form action="<%=path %>/UserLoginServlet" method="post" name="form1" onSubmit="return login()">
                <fieldset style="border:0px; padding-top:10px">
                  <div>
                    <label for="name"> �û����� </label>
                    <input type="text" class="it1" onBlur="this.className='it1';" style="WIDTH: 120px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="name">
                    <br />
                  </div>
                  <div>
                    <label for="pwd"> ���룺 </label>
                    <input type="password" class="it1" onBlur="this.className='it1';" style="WIDTH: 120px; FONT-FAMILY: Arial" onFocus="this.className='it2';" name="pwd">
                    <br />
                  </div>
                  <div class="enter">
                    <input type="submit" class="buttom" value="��¼" />
                  </div>
                </fieldset>
              </form>
            </div>
            <%}else{ %>
            ��ӭ����<%=userlogin.get(1) %><br>
            <a href="<%=path %>/users/user_zhongxin.jsp">�û�����</a><br>
            <a href="<%=path %>/users/user_zhiliao.jsp">�޸�����</a><br>
            <a href="<%=path %>/users/user_pwd.jsp">�޸�����</a><br>
            <a href="<%=path %>/users/orders.jsp">�ҵĶ���</a><br>
            <a href="<%=path %>/RemoveServlet?mark=user">ע���˳�</a>
            <%} %></td>
          <td valign="top"><table width="100%">
             
              <tr>
                <td><%
                ArrayList products = array.getXianhua();
                 %>
                  <table>
                    <tr>
                    <%
                    for(int i = 1;i < products.size();i++){
                    	if(i==9){
                    		break;
                    	}
                    	ArrayList alRow = (ArrayList)products.get(i);
                     %>
                     
                     
                      <td><table>
                          <tr>
                            <td><a href="<%=path %>/users/products_show.jsp?id=<%=alRow.get(0) %>"><img src="<%=path %>/<%=alRow.get(9) %>" width="180px" height="170px" border="0"/></a></td>
                          </tr>
                          <tr>
                            <td align="center"><a href="<%=path %>/users/products_show.jsp?id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
                          </tr>
                          <tr>
                            <td align="center"><font color="red">��Ա�ۣ�</font><%=alRow.get(7) %></td>
                          </tr>
                    </table></td>
                    
                    
                    
                     
                        <%
                      if(i%4!=0){
                       %>
                      <TD width=10></TD>
                      <%}else{ %>
                      
                      </tr>
                             <tr><td height="3"></td></tr>
                      
                      <tr>
                      
                      <%} %>
                         <%} %>
                       </TR>  
                   
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%">
        <tr>
          <td height="5"></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>
<jsp:include flush="true" page="/users/bottom.jsp"/>
