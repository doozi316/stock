<!--#include file="dbcon.asp" -->
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%



	title="업무일지등록"
	Y=request("Y")
	M=request("M")
	I=request("I")
	'response.write Y&M&I
	menu=request("menu")

		if Y <> "" and M <> "" and I <> "" then
			ReqDay = CDate(Y&"-"&M&"-"&I)
		else
			ReqDay = date()
		end if

		sql = "SELECT * FROM Diary "
		sql = sql & "WHERE DCode > 0  "
		set prs = dbconn.execute(sql)
		if prs.eof then
		else
			StartPoint = INSTR(prs("dcontent"),"[금일 진행예정]")
		end if

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title><%=title%></title>
<script language="javascript" src="../js/WinOpen.js"></script>
<script language="javascript">
	function WriteOk()
	{
		document.form.action="DayPlanWriteOk.asp";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function CallCalender(dstr)
	{
		window.open("../CallCalender.asp?FormName="+dstr,"","width=240, height=170,top=10,left=10");
    }
	function ChkWorkStartTime()
	{
		WinGoUrl('../IntraHome/ChkWorkStart.asp',200,200,352,400,'ChkWorkStartTime','post');
	}
	function ChkCallClick(th)
	{
		if(th.checked)
		{
//			PutString = "(작성일시 : <%=now%>)" + "\n\n";
			PutString = "[전일 업무실적]\n\n"
			PutString = PutString + document.form.PRMemo.value + "\n\n";
			PutString = PutString + "[금일 진행예정]\n\n"
			document.form.DRMemo.value = PutString;
			document.form.DRMemo.focus();
		}else document.form.DRMemo.value = "";
	}
</script>
</head>
<body topmargin=0 leftmargin=0>


<form name="form">
<INPUT TYPE="hidden" name="PRMemo" value="<%=PRMemo%>">
<INPUT TYPE="hidden" name="DRCode" value="<%=request("DCode")%>">


<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr>
		<td width="360" style="color:white;" height="20">&nbsp; ▒ &nbsp;<%=title%>&nbsp;</td>
	</tr>
</table>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height=25>
			<input type=hidden name="dexedate" value="<%=Y&"/"&M&"/"&I%>">
		</td>
	</tr>
	<tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">등록자 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="dwriter" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">제 목 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="dsubject" >
         </td>
    </tr>
	<tr height=25>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=10">일지구분:</td>
		<td id=tdg01 style="padding-left=10">
			<SELECT NAME="ddiv" style="font-size=9pt">
				<option value="<%=ddiv%>"><%=ddiv%></option>
				<option value="회사업무일정">회사업무일정</option>
				<option value="회사주요일정">회사주요일정</option>
				<option value="개인일정">개인일정</option>
				<option value="이달의목표">이달의목표</option>
				<option value="휴무">휴무</option>
			</SELECT>
			<SELECT NAME="dwork" style="font-size=9pt">
				<option value="<%=dwork%>"><%=dwork%></option>
				<option value="근무">근무</option>
				<option value="휴무">휴무</option>
			</SELECT>
<%

	XAYear= year(now)
	XAMonth= month(now)
	XADay=day(now)
%>
	<tr height=25>
		<td id=tdg01 colspan=3 align=center bgcolor="<%=color5%>">일정메모</td>
	</tr>
	<tr>
		<td id=tdg01 colspan=3 align=center style="padding:2"><TEXTAREA NAME="DRMemo" ROWS="17" COLS="92" style="font-size=9pt;"><%=DRMemo%></TEXTAREA></td>
	</tr>
</table>

<table width="100%" cellSpacing="0" cellPadding="0" border="0" style="margin-top=10">
	<tr>
		<td align=center>							
			<input type="button" name="B1" value=" 등 록 " onClick="javascript:WriteOk()">
			<input type="button" name="B1" value=" 닫 기 "  onclick="javascript:window.close();">

		</td>
	</tr>
</table>
</form>

</body>
</html>