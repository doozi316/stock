<!--#include file="dbcon.asp" -->
<%
	


	width="550"
	title="업무일지"
	titleB="<a href='DayReportSelect.asp'>업무일지</a>"
	DRCode=request("Code")
	Div=request("Div")
	Y=request("Y")
	M=request("M")
	I=request("I")

'response.write DRCode &"<br>"
	sql="select * from diary where DDiv='"&Div&"' "
	if DRCode <> ""  then
		sql=sql & " and DCode = '"&DCode&"' "
	end if
		if Div = "개인일정" or Div = "회사업무일정" then
			sql=sql & " and DRWriter='"&request("Name")&"' "
		end if
		if Y <> "" then
		sql=sql & " and year(DRStartDate)='"&request("Y")&"' "
		end if
		if Y <> "" then
		sql=sql & " and Month(DRStartDate)='"&request("M")&"' "
		end if

		if Div <> "이달의목표" and  I <> ""  then
			sql=sql & " and day(DRStartDate)='"&request("I")&"' "
		end if


'response.write sql &"<br>"
	set rs=dbconn.execute(sql)

	if rs.eof then
		DRCode=""
		DRDiv="회사업무일정"
		DRStartDate=request("Y")&"년"&request("M")&"월"&request("I")&"일"
		DRWriteDate="&nbsp;"
		DRMemo= "등록된 업무일정이 없습니다."
		DRWriter= "&nbsp;"
	else
		if Y <> "" and M <> "" and I <> "" then
			ReqDay = CDate(Y&"-"&M&"-"&I)
		else
			ReqDay = CDate(rs("DRStartDate"))
			Y = Year(ReqDay)
			M = Month(ReqDay)
			I = Day(ReqDay)
		end if


		DRCode=rs("DRCode")
		DRWriteDate=left(rs("DRWriteDate"),10)
		DRDiv=rs("DRDiv")
		DRStartDate=formatdatetime(rs("DRStartDate"),1)
		DRMemo = replace(rs("DRMemo"),chr(13)&chr(10),"<br>")
		DRMemo = replace(DRMemo,"&","&amp")
		DRMemo = replace(DRMemo, chr(32),"&nbsp;")
		DRMemo = replace(DRMemo,"chr(124)_pipe","|")
		DRWriter= rs("DRWriter")
	end if

%>

<html>
<head>
<script language="javascript" src="../js/WinOpen.js"></script>
<script language="javascript">

	function Revise()
	{
		document.form.action="DayPlanRevise.asp";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function Write()
	{
		document.form.action="DayPlanWrite.asp";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function Print()
	{
		window.open('', 'winopen', 'scrollbars=1,width=750,height=650,top=10,left=10');
		document.form.action="DayPlanPrint.asp";
		document.form.method="post";
		document.form.target="winopen";
		document.form.submit();
	}
	function ChkWorkStartTime()
	{
		WinGoUrl('../IntraHome/ChkWorkStart.asp',200,200,352,400,'ChkWorkStartTime','post');
	}
	function ChkWorkEndTime()
	{
		WinGoUrl('../IntraHome/ChkWorkEnd.asp',200,200,352,400,'ChkWorkEndTime','post');
	}
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name=form>
<INPUT TYPE="hidden" name="DRCode" value="<%=DRCode%>">
<INPUT TYPE="hidden" name="Y" value="<%=Y%>">
<INPUT TYPE="hidden" name="M" value="<%=M%>">
<INPUT TYPE="hidden" name="I" value="<%=I%>">

<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr height=25>
		<td style="border-bottom:1 solid <%=GrayLine%>;padding-left:10;color:white;" >&nbsp;▒
		 &nbsp;<B><%=DRDiv%>&nbsp;</B></FONT>(<%=DRStartDate%>)
		</td>
		<td align=right style="border-bottom:1 solid <%=GrayLine%>;color:white;padding-right=10">&nbsp;등록자: <%=DRWriter%>&nbsp;&nbsp;등록일시: <%=DRWriteDate%>
		</TD>
    </tr>

</table>


<table cellpadding="0" cellspacing="0" border="0"  width="100%" style="margin-top:5;" >
	<tr >
		<td align=center>

			<input type="button" name="B1" value=" 수 정 "  onclick="Revise();">
			<input type="button" name="B2" value="프린트"  onclick="Print()">

			<input type="button" name="B1" value=" 입 력 "  onclick="Write();">
		</td>

	</tr>
</table>
<P>&nbsp;</p>
</form>
</body>
</html>
