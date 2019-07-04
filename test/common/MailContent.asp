<!--#include file="../dbcon.asp" -->
<%
	width="600"
	titleB="<a href='MailList.asp?Div=받은쪽지함'>전자우편</a>"
	title="내용보기"

	MCode=request("MCode")
	div=request("div")

	sql="select * from Mailbox where MCode='"&MCode&"'"
	set rs=dbconn.execute(sql)

	MContent = replace(rs("MContent"),chr(13) & chr(10),"<br>")
'	MContent = replace(MContent, chr(32),"&nbsp;")


'response.end

	if rs("Mreceiver") <>"" then

		UpdateSQL = "Update mailbox Set mreadcheck = 1 "
		UpdateSQL = UpdateSQL & " where MCode = " & MCOde
		dbconn.Execute UpdateSQL

	end if


%>

<html>
<head>
<title><%=title%></title>

<style type="text/css">
	a:link   {text-decoration:none; color:<%=LinkColor%>}
	a:visited  {text-decoration:none; color:<%=LinkColor%>}
	a:hover  {text-decoration:none; color:<%=VisitColor%>}
	TABLE {color: <%=textcolor%>; }
</style>
<script language="javascript" src="../js/WinOpen.js">
</script>
<script language="javascript">
		function openURL(url,KPI_EID,KPI_XGTeam)
		{

			window.open(url+"?KPI_EID="+KPI_EID+"&KPI_XGTeam="+KPI_XGTeam, "팝업", "scrollbars = yes, resizable=yes, width=1250,height=700")
		}
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name=form>
<input type=hidden name=MCode>
<input type=hidden name="ReadChk" value="1">
<input type=hidden name="ReadChk" value="0">
<input type=hidden name="ButClose">
</form>
<form name="form1" action="MailWrite.asp" method="POST" >
<INPUT TYPE="hidden" NAME="MReplyTeam" value="<%=rs("MWriterTeam")%>" >
<INPUT TYPE="hidden" NAME="MReply" value="<%=rs("MWriter")%>"  >


<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="font-size:9pt;margin-left:20;margin-top:0">
	<tr>
		<td><IMG SRC="../images/쪽지확인.PNG" WIDTH="450" HEIGHT="80" BORDER=0 ALT=""></td>
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=widthM-20%>" style="margin-left=30;margin-top=5;">
	<tr>
		<td><FONT SIZE="1" color=darkgreen>▶</FONT> <FONT COLOR="darkgreen"><B><%=title%></B></FONT>
		&nbsp;수정은 할 수 없으며 삭제는 쪽지함에서 일괄 처리 가능합니다.</td>
	</tr>
	<tr>
		<td><IMG SRC="../../images/line520.gif" WIDTH="520" HEIGHT="1" BORDER=0 ALT=""></td>
	</tr>
</table>

<table cellpadding="0" cellspacing="0" width="<%=width-40%>" style="margin-left:30;margin-top:2;border-right:1 solid <%=GrayLine%>;border-bottom:1 solid <%=GrayLine%>">
<%
	if div = "" then
%>
	<tr height="25">
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">받은이 :</td>
		<td id=tdg01 width=35% style="padding-left=10">
			<%=rs("Mreceiver")%>&nbsp;(<%=rs("MReceiverTeam")%>)
		</td>
		<td id=tdg01 width=35% align="right" bgcolor="<%=color5%>" style="padding-right=5">일시 :</td>
		<td id=tdg01 width=35% style="padding-left=10"><%=rs("MWriteDate")%></td>
	</tr>
	<tr height="25">
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">보낸이 :</td>
		<td id=tdg01 width=35% style="padding-left=10">
			<%=rs("Mwriter")%>&nbsp;(<%=rs("MWriterTeam")%>)
		</td>
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">일시 :</td>
		<td id=tdg01 width=35% style="padding-left=10"><%=rs("MWriteDate")%></td>
	</tr>
<%
	else
%>
<%

		if div = "보낸쪽지함" then
%>
	<tr height="25">
		<td id=tdg01 width=30% align="right" bgcolor="<%=color5%>" style="padding-right=5">받은이/받은 부서 :</td>
		<td id=tdg01 width=35% style="padding-left=10">
			<%=rs("Mreceiver")%>&nbsp;(<%=rs("MReceiverTeam")%>)
		</td>
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">일시 :</td>
		<td id=tdg01 width=35% style="padding-left=10"><%=rs("MWriteDate")%></td>
	</tr>
<%
		else
%>
	<tr height="25">
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">보낸이/보낸부서 :</td>
		<td id=tdg01 width=35% style="padding-left=10">
			<%=rs("Mwriter")%>&nbsp;(<%=rs("MWriterTeam")%>)
		</td>
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">일시 :</td>
		<td id=tdg01 width=35% style="padding-left=10"><%=rs("MWriteDate")%></td>
	</tr>
<%
		end if
	end if
%>
	<tr height="25">
		<td id=tdg01 align="center" bgcolor="<%=color5%>" style="padding-right=5">제 목 :</td>
		<td id=tdg01 colspan=3 style="padding-left=10"><%=rs("MSubject")%></td>
	</tr>
	<tr height="150">
		<td colspan="4" id=tdg01 valign=top style="padding:10;line-height=1.3" >
			<%=MContent%>
		</td>
	</tr>
</table>
 <table width="<%=width%>" border="0" cellPadding="0" cellSpacing="0" style="margin-top=5;margin-left=10">
	<tr align="center">
		<td height=22 >
			<input type="submit" name="B1" value="답장하기"  onclick="javasript:location.href='MailWrite.asp'">
			<input type="button" name="B1" value="목록보기"  onclick="javasript:location.href='MailList.asp?no=0&div=<%=div%>'">
		</td>
	</tr>
</table>


</body>

</html>