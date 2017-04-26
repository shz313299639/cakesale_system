<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML><HEAD><TITLE>上传文件</TITLE>
<style type="text/css">
<!--
td{font-size:12px}
a{color:#000000;text-decoration: none}
a:hover{text-decoration: underline}
.tx{height:16px;width:30px;border-color:black black #000000;border-top-width:0px;border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 12px; background-color: #eeeeee; color: #0000FF}
.button{font-size:12px;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1{height:20px;width:30px;font-size:12px;border:1px solid;border-color:black black #000000;color: #0000FF}
-->
</style>
<script language="javascript">
<!--
function mysub()
{
  var strFileName=form1.file1.value;
  if (strFileName=="")
  {
    alert("请选择要上传的文件");
    return false;
  }
	esave.style.visibility="visible";
}
-->
</script>
</head>
<%
	String message = (String)request.getAttribute("message");
	String typename = request.getParameter("typename");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
	String filepath = (String)request.getAttribute("filepath");
		out.println("<script language='javascript'>");
		out.println("window.opener.document.form1."+typename+".value="+"'"+filepath+"'");	
		out.println("alert('"+message+"');");
		out.println("window.close()");
		out.println("</script>");	
	}
	String message2 = (String)request.getAttribute("message2");
	if(message2 == null){
		message2 = "";
	}
	if (!message2.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message2+"');");
		out.println("</script>");	
	}
	request.removeAttribute("message2");
%>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="<%=path %>/UploadServlet?typename=<%=typename %>" enctype="multipart/form-data"  onSubmit="return mysub()">
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<TR> 
	          <td bgcolor=#eeeeee align=center><font color=red>正在上传文件，请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr>
    </table>
  </div>
  <table width="400" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#39867B">
    <tr>
      <td height="22" align="center" valign="middle" width="400">&nbsp;<strong>图片上传</strong> 
        <input type="hidden" name="weburl" value="">
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td align="left" id="upid" height="80" width="400" bgcolor="#FFFFFF"> 选择文件: 
        <input type="file" name="file1" style="width:300'" class="tx1" value="">
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td height="24" width="400"> 
        <input type="submit" value="开始上传" class="button">
      </td>
    </tr>
  </table>
</form>
</body>
</html>