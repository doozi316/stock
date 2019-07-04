<!--#include file="dbcon.asp" -->

<%
	width1="210"
	FormName=request("FormName")

	If Request("ChangeDate") <> "" Or Isnull(Request("ChangeDate")) Then
		ToDate = Request("ChangeDate")
		ToYear = Year(ToDate)
		ToMonth = Month(ToDate)
		ToDay = 1
		PrintToDate = ToYear & "년 " & Tomonth & "월"
		StartToDate = DateSerial(ToYear,ToMonth , 1)
		LastToDate = DateSerial(ToYear , ToMonth + 1 , 1 - 1)
		StartDay = Day(StartToDate)
		LastDay = Day(LastToDate)
	Else
		'올해연도
		ToYear = Year(Now)
		'이번달
		ToMonth = Month(Now)
		'오늘날짜
		ToDay = Day(Now)
		'오늘날짜  예)2001-11-21
		ToDate = Date()
		'오늘날짜의 형식을 바꿈  예)2001/11/21
		PrintToDate = ToYear & "년 " & ToMonth & "월"
		'이번달의 시작일을 구함
		StartToDate = DateSerial(ToYear,ToMonth , 1)
		'이번달의 마지막일을 구함
		LastToDate = DateSerial(ToYear , ToMonth + 1 , 1 - 1)
		'시작날짜의 일만을 변수에 할당한다.
		StartDay = Day(StartToDate)
		'마지막날짜의 일만을 변수에 할당한다.
		LastDay = Day(LastToDate)
	End If

'요일에 대한 숫자값을 문자로 변환한다.
'Select Case WeekDay(StartToDate)
'	Case  1
'		ToDateWeek = "일요일"
'	Case  2
'		ToDateWeek = "월요일"	
'	Case  3
'		ToDateWeek = "화요일"
'	Case  4
'		ToDateWeek = "수요일"
'	Case  5
'		ToDateWeek = "목요일"
'	Case  6
'		ToDateWeek = "금요일"
'	Case  7
'		ToDateWeek = "토요일"
'End Select

%>
<HTML>
<HEAD>

<style type="text/css">

TABLE  
{ FONT-SIZE: 9pt; }

</style>

<SCRIPT LANGUAGE="JavaScript">
function goBackMonth(Field) {
		form = document.forms[0];
		form.ChangeDate.value = Field;
		form.action = "CallCalender.asp";
		form.submit();
	}

function goNextMonth(Field) {
		form = document.forms[0];
		form.ChangeDate.value = Field;
		form.action = "CallCalender.asp";
		form.submit();
	}

function PutDate(y,m,d)

	{

	if (m < 10)
		m="0"+m
	if (d < 10)
		d="0"+d
//	alert(y) ;
//	alert(m);
//	alert(d);

		window.opener.form.<%=FormName%>.value = y+m+d;
		//window.opener.form.<%=FormName%>.style.color="#000000";
		window.close();
	}
</SCRIPT>
<TITLE> <%=PrintToDate%> </TITLE>
</HEAD>
<BODY topmargin=5>
<FORM METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="ChangeDate" VALUE="<%=ChangeDate%>">
<INPUT TYPE="HIDDEN" NAME="FormName" VALUE="<%=FormName%>">

<TABLE align=center BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="<%=width1%>">
	<TR align=center>
		<TD><B><%=ChkPrintToDate(ToYear,ToMonth,1)%></B></TD>
	</TR>
</table>

<TABLE align=center BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="<%=width1%>" style= "BORDER-RIGHT:   <%=Color3%> 1px solid;BORDER-Bottom: <%=Color3%> 1px solid;">
	<TR height=18 align=center bgcolor="<%=color1%>" style="color=white">
		<TD id=td01 width="30">일</TD>
		<TD id=td01 width="30">월</TD>
		<TD id=td01 width="30">화</TD>
		<TD id=td01 width="30">수</TD>
		<TD id=td01 width="30">목</TD>
		<TD id=td01 width="30">금</TD>
		<TD id=td01 width="30">토</TD>
	</TR>
	<TR height=18 align=center>
		<%
		Dim DayDount
		DayCount = 0
		'처음시작하는 날의 요일에 맞는 칸에 출력하기 위한 루틴
		If WeekDay(StartToDate) <> 1 Then
			For i = 1 to WeekDay(StartToDate) - 1
				Response.Write("<TD id=td01 height='18' BGCOLOR='aliceblue'>&nbsp;</TD>")
				DayCount = DayCount + 1
			Next
		End If
		For i = StartDay To LastDay
			Response.Write("<TD id=td01 height='18' align=center BGCOLOR='ivory'>")
			If DayCount = 0 Then
				If ToDay = i Then 
					Call SubToDay()
				Else

					ToYear1= right(ToYear,2)

					Response.Write("<a href='javascript:PutDate("& right(ToYear,2) &","& ToMonth &","& i &")'><u><FONT COLOR='red'> " & i & "</FONT></u></a>")
					DayCount = DayCount + 1
				End If
			Else
				If DayCount = 6 Then
					If ToDay = i Then 
						Call SubToDay()
					Else
						Response.Write("<a href='javascript:PutDate("& right(ToYear,2) &","& ToMonth &","& i &")'><u><FONT COLOR='darkgreen'> " & i & "</FONT></u></a>")
						DayCount = DayCount + 1
					End If
					If DayCount >= 7 Then
						Response.Write("</TD></TR>")
						DayCount = 0
					Else
						Response.Write("</TD>")
					End If
				Else
					If ToDay = i Then 
						Call SubToDay()
					Else
						

						Response.Write("<a href='javascript:PutDate("& right(ToYear,2) &","& ToMonth &","& i &")'><u><FONT COLOR='blue'> " & i & "</FONT></u></a>")
						DayCount = DayCount + 1

					End If
					If DayCount >= 7 Then
						Response.Write("</TD></TR>")
						DayCount = 0
					Else
						Response.Write("</TD>")
					End If
				End If
			End If
		Next
		If DayCount < 7 Then
			For i = 1 To (7 - DayCount)
				Response.Write("<TD id=td01 height='18' BGCOLOR='aliceblue'>&nbsp;</TD>")
			Next
		End If
		%>
			</TR>

<%
Function SubToDay()
	Response.Write("<a href='javascript:PutDate("& right(ToYear,2) &","& ToMonth &","& i &")'><u><font color=red><B> " & i & "</font></B></u></a>")
	DayCount = DayCount + 1
End Function
%>

</TABLE>
<TABLE align=center BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="<%=width1%>" style="margin-top=5">

	<TR>
		<TD style="padding-left=5">
			<a href="javascript:goBackMonth('<%=DATEADD("m",-1,ToDate)%>');">◀ 이전달</a>
		</TD>
		<TD align=right style="padding-right=5">
			<a href="javascript:goBackMonth('<%=DATEADD("m",1,ToDate)%>');">다음달 ▶</a>
		</TD>
	</TR>

</table>
</FORM>
</BODY>
</HTML>
<%
	Function ChkPrintToDate(y,m,d)
		DIM temp
		temp = "<SELECT Name=ToYear onchange=goBackMonth(this.value+'-" & m & "-" & d & "') style='font-size:8pt;'>"
		temp = temp & "<option value='" & y & "' selected>" & y & "</option>"
		for i=2000 to 2020
			temp = temp & "<option value='" & i & "'>" & i & "</option>"
		next
		temp = temp & "</SELECT>"
		temp = temp & "년 "
		temp = temp & "<SELECT Name=ToMonth onchange=goBackMonth('" & y & "-'+this.value+'-" & d & "')  style='font-size:8pt;'>"
		temp = temp & "<option value='" & m & "' selected>" & m & "</option>"
		for i=1 to 12
			temp = temp & "<option value='" & i & "'>" & i & "</option>"
		next
		temp = temp & "</SELECT>"
		temp = temp & "월 "
		ChkPrintToDate = temp

	End Function
%>