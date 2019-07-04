<!--#include file="dbcon.asp" -->
<%


	width="780"

	thispage="DayPlan.asp"

	ThisDate=request("ThisDate")
	ChangeDate=Request("ChangeDate")

	Name=request("Name")
	Eid	= request("Eid")
	if Eid = "undefined" then
		Eid = " ' or '1'='1"
	end if
	menu=request("menu")

	title=title1&"이달의 일정표"

'response.write Name &"<br>"
'response.write Request("ThisDate") &"<br>"

	If request("ThisDate")="" then
		ThisDate=formatdatetime(now,1)
		ThisDate1=date()
	else
		ThisDate=formatdatetime(request("ThisDate"),1)
		ThisDate1=request("ThisDate")
	end if
	k=weekday(date())

'response.end

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
		PrintToDate = ToYear & "년 " & Tomonth & "월"
		'이번달의 시작일을 구함
		StartToDate = DateSerial(ToYear,ToMonth , 1)
		'이번달의 마지막일을 구함
		LastToDate = DateSerial(ToYear , ToMonth + 1 , 1 - 1)
		'시작날짜의 일만을 변수에 할당한다.
		StartDay = Day(StartToDate)
		'마지막날짜의 일만을 변수에 할당한다.
		LastDay = Day(LastToDate)
	End If

	sql = "select * from Diary where DCode > 0 "
	
'response.write sql &"<br>"
Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL,dbconn,1
	response.write sql

	if rs.eof then
		Target = "&nbsp;"
	end if

%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<TITLE> <%=title%> </TITLE>
<script language=javascript src="../JS/WinOpen.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	function Print(name)
	{
		document.form.action="DayPlanPrint2.asp?Name="+name+"&menu=jo";
		document.form.method="post";
		document.form.target="_blank";
		document.form.submit();
	}
	function Schedule()
	{
		document.form.action="PipeDiary.asp?Tmenu=S";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function goBackMonth(Field)
	{
//		form = document.forms[0];
		form.ChangeDate.value = Field;
		form.action = "<%=ThisPage%>";
		form.target = "_self";
		form.submit();
	}

	function goNextMonth(Field)
	{
//		form = document.forms[0];
		form.ChangeDate.value = Field;
		form.action = "<%=ThisPage%>";
		form.target = "_self";
		form.submit();
	}
	function GoMonth()
	{
		var GoYear = document.form.ToYear.value;
		var GoMonth = document.form.ToMonth.value;
		var GoDay = document.form.ToDay.value;
		var GoDate = GoYear + "-" + GoMonth + "-" + GoDay
		goNextMonth(GoDate);

	}
	function SetDate(y,m,d)

	{
	y="0"+y
	if (m < 10)
		m="0"+m
	if (d < 10)
		d="0"+d


		document.form.ThisDate.value=+y+"-"+m+"-"+d;

		document.form.action="<%=ThisPage%>";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
	function CallCalander()
	{
	window.open("../inc/CallCalender.asp?FormName=DADate","openwin","width=240,height=170,top=200,left=100")
    }

	function Dmenu(div)

	{
		document.form.Dmenu.value=div
		document.form.action="<%=ThisPage%>";
		document.form.method="post";
		document.form.target="_self";
		document.form.submit();
	}
//	function Write(y,m,i)
//	{
//		GoUrl("./DayPlanWrite.asp?Y="+y+"&M="+m+"&I="+i,600,450,"","get");
//	}
	function Revise(code,div,y,m,i,name)
	{
		GoUrl("./DayPlanContent.asp?code="+code+"&Y="+y+"&M="+m+"&I="+i+"&Div="+div+"&Name="+name,550,450,"","get");
    }
	function CallRevise(code)
	{
	window.open("DiaryRevise.asp?DACode="+code,"openwin","scrollbars=no,width=350,height=345,top=100,left=300")
    }
	function Plan(name,yy,mm)
	{
		GoUrl("../Management/DirPlanContent.asp?DP_Name="+name+"&DP_Year="+yy+"&DP_Month="+mm,645,600,"","get");
	}
	function Search()
	{
		window.open("./DayPlanSearch.asp?SearchField=Total&SearchString="+document.form.SearchString.value,"openwin","status=1,scrollbars=1,resizable=yes,width=600,height=480,top=100,left=150")
	}

</SCRIPT>
<html>
<head>
<title><%=title%></title>
</head>
<body topmargin=0 leftmargin=0>
<form name=form>
<INPUT TYPE="hidden" NAME="ChangeDate" VALUE="<%=ChangeDate%>">
<INPUT TYPE="HIDDEN" NAME="ThisDate">
<input type=hidden name="Name" value="<%=Name%>">
<input type=hidden name="menu" value="<%=menu%>">
<input type="hidden" name="eid" value="<%=eid%>">

<table align=center width="<%=width+100%>" border="0" cellSpacing="0" cellPadding="0"  style="margin-top=5;">
	<tr >
		<td width=180>&nbsp;</td>
		<td align=center><IMG SRC="../Images/diary<%=menu%>.gif" WIDTH="126" HEIGHT="28" BORDER=0 ALT=""></td>
		<td align=right nowrap width=180><a href="javascript:Print('<%=session("EName")%>');">[프린트]</a></td>
	</tr>
	<tr height=16>
		<td nowrap>
			<!--<A HREF="./DayPlan.asp?menu=jo&Name=<%=Name%>"><IMG SRC="../Images/diary10.gif" WIDTH="79" HEIGHT="18" BORDER=0 ALT=""></A>
			<A HREF="./DayPlan.asp?menu=ce&Name=<%=Name%>"><IMG SRC="../Images/diary11.gif" WIDTH="69" HEIGHT="18" BORDER=0 ALT=""></A>-->

			<A HREF="./DayPlan.asp?menu=jo&Name=<%=Name%>">이달의일정표</A> 
			
			
		</td>
		<td width=400 align=center nowrap>
			<INPUT TYPE=hidden name=SearchField value="Total">
			<INPUT TYPE="text" NAME="SearchString" value="" size=20>
			<INPUT TYPE="button" value="검색" onClick="Search();">&nbsp;&nbsp;&nbsp;
			<input type="button" name="B1" value="일정등록"  onclick="javascript:location.href='DayplanWrite.asp'">
		</td>
		<td width=180 align="right" nowrap>
			<select name=ToYear>
				<option value="<%=ToYear%>" selected><%=ToYear%></option>
<%
			for i=2010 to 2020
%>
				<option value="<%=i%>"><%=i%></option>
<%
			next
%>
			</select>년
			<select name=ToMonth>
				<option value="<%=ToMonth%>" selected><%=ToMonth%></option>
<%
			for i=1 to 12
%>
				<option value="<%=i%>"><%=i%></option>
<%
			next
%>
			</select>월
			<input type=hidden name=ToDay value="<%=ToDay%>">
			&nbsp;
			<button onClick="GoMonth()">&nbsp;이동&nbsp;</button>
		</td>
	</tr>
</table>
<% response.flush %>
<table align=center cellSpacing="0" cellPadding="0" border="0" style="margin-top=0;">
	<TR>
		<TD width=110 valign=top >
			<table align=center width="100%" cellSpacing="0" cellPadding="0" border="0"  style="margin-top=0;font-size=9pt;">
				<TR height=28 align=center bgcolor="#D2D2D2">
					<TD id=tdg01 style="font-size=12pt;"><B><%=TOYear%></B></TD>
				</TR>
				<TR height=103 align=center bgcolor="#99CC66">
					<TD id=tdg01 style="color=white;font-size=60"><B><%=TOMonth%><br><FONT SIZE="2" COLOR="white"><%=name%></FONT></B></TD>
				</TR>
				<TR align=center>
					<TD id=tdg01><IMG SRC="../Images/diaryimage<%=ToMonth%>.jpg" WIDTH="110" HEIGHT="206" BORDER=0 ALT=""></TD>
				</TR>
				<TR height=33 align=center>
					<TD style="border-left:1 solid <%=grayline%>"><A HREF="javascript:Plan('<%=name%>','<%=ToYear%>','<%=ToMonth%>')"><IMG SRC="../Images/diarygoal.gif" WIDTH="100" HEIGHT="33" BORDER=0 ALT=""></a></TD>
				</TR>
				<TR height=71>
					<TD valign=top style="border-left: 1 solid <%=grayline%>;border-bottom: 1 solid <%=grayline%>;padding:5;">
						<FONT style="font-size:9pt" COLOR="#838383"><%=Target%>&nbsp;</FONT>
					</TD>
				</TR>
				
			</table>
		</TD>
		<TD>
			<table align=center width="<%=width%>" cellSpacing="0" cellPadding="0" border="0" style="margin-top=0;font-size=9pt; border-right=<%=grayline%> 1px solid; border-bottom=<%=grayline%> 1px solid;">
				<TR height=28 align=center >
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diarysun.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diarymon.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diarytue.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diarywed.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diarythu.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><IMG SRC="../Images/diaryfri.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></TD>
					<TD id=tdg01 width="14.3%"><font color=darkgreen><IMG SRC="../Images/diarysat.gif" WIDTH="90" HEIGHT="28" BORDER=0 ALT=""></font></TD>
				</TR>
				<TR>
			<%
					Dim DayDount
					DayCount = 0
					'처음시작하는 날의 요일에 맞는 칸에 출력하기 위한 루틴

					If WeekDay(StartToDate) <> 1 Then
						For i = 1 to WeekDay(StartToDate) - 1
							Response.Write("<TD id=tdg01 height='103' BGCOLOR='#F5F5F5' style='padding:5'>&nbsp;</TD>")
							DayCount = DayCount + 1

						Next
					End If

					For i = StartDay To LastDay
						Response.Write("<TD id=tdg01 height='103' valign=top BGCOLOR='white'" & TodayColor(ToYear & "-" & ToMonth & "-" & i,"#99CC66","white") & " style='padding-left:10;line-height:1.2'>")
						If DayCount = 0 Then
							If ToDay = i Then
								Call SubToDay()
							Else
								ToYear1= ToYear
'일요일
								Response.Write"<a href='javascript:Write("&ToYear&","&ToMonth&","&i&")'><FONT style='font-size:11pt' COLOR='red'> <U><B>" & i & "</B></U></FONT></a>"
								DayCount = DayCount + 1
			%>
			
			<%

							End If
						Else
							If DayCount = 6 Then
								If ToDay = i Then
									Call SubToDay()
								Else
'토요일
									Response.Write"<a href='javascript:Write("&ToYear&","&ToMonth&","&i&")'><FONT style='font-size:11pt' COLOR='darkgreen'> <U><B>" & i & "</B></U></FONT></a>"
									DayCount = DayCount + 1
			%>
			
			<%
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
'평일
									Response.Write"<a href= ./dayplancontent.asp><FONT style='font-size:11pt' COLOR='#4B4B4B'> <U><B>" & i & "</B></U></a></FONT>"
									
									DayCount = DayCount + 1

			%>
			<p height=17 align=center style="cursor:hand;" onClick="javascript:location.href='Dayplancontent.asp?dcode=<%=rs("DCOde")%>&gotopage=<%=gotopage%>'" onMouseOver="this.style.background='<%=graycolor2%>'" onMouseOut="this.style.background='transparent'">
			</p>
			<%


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
							Response.Write("<TD id=tdg01 height='18' BGCOLOR='#F5F5F5'>&nbsp;</TD>")
						Next
					End If
			%>
						</TR>

			<%
					Function SubToDay()
						Response.Write "<a href='javascript:Write("&ToYear&","&ToMonth&","&i&")'><u><font size=3 color=blue><B> " & i & "</font></B></u></a>"
						DayCount = DayCount + 1
			%>
			
			<%
					End Function
			%>

			</TABLE>
		</TD>
	</TR>
</TABLE>


<table align=center width="<%=width%>" cellSpacing="0" cellPadding="0" border="0" style="margin-top=5;">
	<tr height=25 >
		<td align=center colspan=2>
			<a href="<%=thispage%>">현재</a>&nbsp;&nbsp;
			<a href="javascript:goBackMonth('<%=DATEADD("m",-1,ToDate)%>');">◀ 이전달</a>
			&nbsp;<b><%=PrintToDate%></b>&nbsp;
			<a href="javascript:goBackMonth('<%=DATEADD("m",1,ToDate)%>');">다음달 ▶</a>&nbsp;&nbsp;
			<a href="<%=thispage%>?name=<%=name%>&menu=<%=menu%>">현재</a>
		</td>
	</tr>
</table>

</form>
</body>
</html>
<%
	'VDay : 출력날짜
	'SelCol : 선택색깔
	'DefCol : 기본색깔
	Function TodayColor(Vday, SelCol, DefCol)
		if CDate(VDay) = Date() then
			TodayColor = " style='border:2px solid " & SelCol & "'; "
		else
			TodayColor = ""
		end if
	End Function

%>