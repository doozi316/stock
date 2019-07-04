<!--#include file="../Login/sessionOut.asp" -->
<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../CSS/greenColor.asp" -->

<%
	server.execute("/LogPage/LogPage.asp")

	response.expires=0


	title="업무일지수정/삭제"

	sql="select * from DayReport where DRCode='"&request("DRCode")&"'"
'response.write sql &"<br>"
	set rs=dbcon.execute(sql)

	if rs("DREndDate")="1900-01-01" then
		DREndDate=""
	else
		DREndDate=rs("DREndDate")
	end if

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<title><%=title%></title>
<script language=javascript>

	function ReviseOk()
	{

		document.form.action="DayPlanReviseOk.asp";
		document.form.method="post";
		document.form.submit();
	}
	function WriteOk()
	{
		document.form.action="DayPlanWriteOk.asp";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function Delete()
	{
		result=confirm("해당 정보를 삭제하시겠습니까?")
		if(result==true)
		{
			document.form.action="DayPlanDelete.asp";
			document.form.method="post";
			document.form.target="_self";
			document.form.submit();
		}
		else return;
	}
	function CallCalander1()
	{
		window.open("../inc/CallCalender.asp?FormName=DRStartDate",""," width=240,height=170,top=20,left=20")
    }

	function CallCalander2()
	{
		window.open("../inc/CallCalender.asp?FormName=DREndDate","", "width=240,height=170,top=20,left=20")
    }

</script>
</head>
<body topmargin=0 leftmargin=0>
<form name="form">

<INPUT TYPE="hidden" name="DRCode" value="<%=request("DRCode")%>">
<INPUT TYPE="hidden" name="DRWriter" value="<%=rs("DRWriter")%>">
<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr>
		<td width="360" style="color:white;" height="20">&nbsp; ▒ &nbsp;<%=title%>&nbsp;</td>
	</tr>
</table>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height=25>
		<td id=tdg01 width=32% align=right bgcolor="<%=color5%>" style="padding-right=10">부서/성명/등록일:</td>
		<td id=tdg01 style="padding-left=10">
			<input type=hidden name="DRDept" value="<%=rs("DRDept")%>">
			<%=rs("DRDept")%>&nbsp;&nbsp;<%=rs("DRWriter")%>&nbsp;&nbsp;<%=date()%>

		</td>
	</tr>
	<tr height=25>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=10">업무구분/일자:</td>
		<td id=tdg01 style="padding-left=10">
			<SELECT NAME="DRDiv" style="font-size=9pt">
				<option value="<%=rs("DRDiv")%>"><%=rs("DRDiv")%></option>
				<option value="회사업무일정">회사업무일정</option>
<%	if session("ETeam") = "전략기획팀" or session("ETeam") = "정보시스템팀" or session("ETeam") = "총무안전팀" or session("ETeam") = "전략기획팀" then	%>
				<option value="회사주요일정">회사주요일정(전체공개)</option>
<%	end if	%>
				<option value="개인일정">개인일정</option>
				<option value="이달의목표">이달의목표</option>
				<option value="휴무">휴무</option>
				<option value="외주생산계획">외주생산계획</option>
			</SELECT>
			<SELECT NAME="DRWork" style="font-size=9pt">
				<option value="<%=rs("DRWork")%>"><%=rs("DRWork")%></option>
				<option value="근무">근무</option>
				<option value="휴무">휴무</option>
			</SELECT>
			<input type=text name="DRStartDate" value="<%=rs("DRStartDate")%>" class=calendar size=10 style="text-align:center;">
		</td>
	</tr>

	<tr height=25>
		<td id=tdg01 colspan=3 align=center bgcolor="<%=color5%>">일정메모</td>
	</tr>
	<tr>
		<td id=tdg01 colspan=3 align=center style="padding:2"><TEXTAREA NAME="DRMemo" ROWS="20" COLS="80" style="font-size=9pt;/"><%=rs("DRMemo")%></TEXTAREA></td>
	</tr>
</table>

<table width="100%" cellSpacing="0" cellPadding="0" border="0" style="margin-top=10">
	<tr >
		<td align=center>
			<input type="button" name="B1" value=" 수 정 " onclick="javascript:ReviseOk()">
			<input type="button" name="B1" value="추가등록" onclick="javascript:WriteOk()">
			<input type="button" name="B1" value=" 삭 제 " onclick="javascript:Delete()">
			<input type="button" name="B1" value=" 닫 기 "  onclick="javascript:window.close();">
		</td>
	</tr>
</table>

</form>
</body>
</html>