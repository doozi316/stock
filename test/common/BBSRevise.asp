<%@ CodePage='949' Language="VBScript"%>

<!--#include file="../dbcon.asp" -->
<% 
	width="600"
	titleB="<a href='BBSList.asp'>공지사항</a>"
	title="수정하기"


	BCode=request("BCode")

	sql="select * from BBS where BCode='"&BCode&"'"
	set rs=dbconn.execute(sql)
	BContent = replace(rs("BContent"),chr(13) & chr(10),"")
	BContent = replace(BContent,chr(10) & chr(13),"")

	BContent = replace(BContent, chr(32)," ") 
	BContent = replace(BContent, "<br><T", "<T")
	BContent = replace(BContent, "<P", "<SPAN")
	BContent = replace(BContent, "</P>", "</SPAN>")

	BContents = replace(BContents, "<br><T", "<T")
	BContents = replace(BContents, "<P", "<SPAN")
	BContents = replace(BContents, "</P>", "</SPAN>")


	
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<title><%=title%></title>
<style type="text/css">

a:link   {text-decoration:none; color:<%=LinkColor%>}
a:visited  {text-decoration:none; color:<%=LinkColor%>}
a:hover  {text-decoration:none; color:<%=VisitColor%>}

TABLE  
{ color: <%=textcolor%>; }


</style>
<script language=javascript>

function ReviseOk()
{
	//putSource();
	document.form.action="BBSReviseOk.asp";
	document.form.target="_self";
	document.form.method="post";
	document.form.submit();
}
	
		
	
</script>
</head>
<body leftmargin=0 topmargin=0>
<form name="form">
<INPUT TYPE="hidden" name=BCode value=<%=BCode%>>
<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="font-size:9pt;margin-left:20;margin-top:0">
	<tr>
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=widthM-20%>" style="margin-left=40;margin-top=5;">
	<tr>
		<td><FONT SIZE="1" color=darkgreen>▶</FONT> <FONT COLOR="darkgreen"><B><%=title%></B></FONT>  </td>
	</tr>
	<tr>
		<td><IMG SRC="images/intranet_01.PNG" WIDTH="400" HEIGHT="150" BORDER=0 ALT=""></td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="<%=width%>" bgcolor="" style="margin-left:50;margin-top:5;">
    
 
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">수정자 :</td>
		<td id=tdgr01 style="padding-left:10" >
            <input type="text" size="60" name="Bwriter" value="<%=rs("Bwriter")%>">
        </td> 
        <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">부 서 :</td>
		<td id=tdgr01 style="padding-left:10" >
            <input type="text" size="60" name="Bdepartment" value="<%=rs("Bdepartment")%>">
        </td> 
        <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">제 목 :</td>
		<td id=tdgr01 style="padding-left:10" >
            <input type="text" name="BSubject" value="<%=rs("BSubject")%>" size="60" >
           
        </td> 
        <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">내 용 :</td>
		<td id=tdgr01 style="padding-left:10" >
            <textarea type="text" rows="30" cols="50" size="60" name="Bcontent" value="<%=rs("Bcontent")%>"></textarea>
        </td> 
	</tr>        


	<tr >
		<td  style="border-top:1  <%=GrayLine%> solid;padding-top:5 "  align=center colspan=2 >
			<input type="button" value="목록보기"  onclick="javascript:location.href='BBSList.asp'">
			<input type="submit" name="B1" value="수정확인" onClick="javascript:ReviseOk();">
		</td>
	</tr>

</table>
 <iframe name="DeleteFrm"  width="0" height="0">
</form>


</body>
</html>