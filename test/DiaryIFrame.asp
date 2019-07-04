<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../css/greenColor2.asp" -->
<script language="javascript" src="../js/WinOpen.js"></script>
<script language=javascript>
	function DiaryRevise1(div,code)
	{
		window.open("./DayPlanContent.asp?Div="+div+"&Code="+code,"", "resizable=yes,scrollbars=yes,width=550,height=500,top=10,left=10")
    }
	function DiaryRevise(div,y,m,i,name)
	{
		GoUrl("../IntraHome/DayPlanContent.asp?Y="+y+"&M="+m+"&I="+i+"&Div="+div+"&Name="+name, 550,500,"","get");
    }
</script>

		<table width="180" align=center border="0" style="margin-top=5;">
			<tr>
			  <td width="100%"><!--#include file="./Calender.asp" --></td>
			</tr>
		</table>
		<table align=center width="180" border="0" cellspacing="0" cellpadding=0  STYLE="margin-left=5;MARGIN-TOP=5;">
<%
' 이달의 주요일정
			sql="select * from DayReport where Year(DRStartDate)= "&year(now)&" and month(DRStartDate)= "&month(now)&" "
			sql=sql & "and DRStartDate >='"&date()&"' "
			sql=sql & "and DRDiv='회사주요일정'"
			sql=sql & "and DRMemo not like '%일요일%' "
			sql=sql & "and DRMemo not like '%토요일%' "
			sql=sql & " order by DRStartDate"
'response.write sql & "<br><br>"

			Set rsda = dbcon.execute (sql)
			If session("ename")="김대우" Then
				'response.write sql & "<br><br>"
			End if


			if rsda.bof then
%>
			<TR height=20>
				<TD align=center>
					<font color=darkgreen>등록된 일정이 없습니다.</font>
				</td>
			</TR>
			<%
			else
			cnt=0
			do until rsda.eof

%>
		<a href="javascript:DiaryRevise1('회사주요일정','<%=rsda("DRCode")%>')" >
			<tr height=16 bgcolor="<%=trbg%>" style="cursor:hand;" onMouseOver="this.style.background='aliceblue'" onMouseOut="this.style.background='<%=trbg%>'">
				<td width=13  align=left valign=top><IMG SRC="../Images/bu_06.gif" WIDTH="13" HEIGHT="10" BORDER=0 ALT=""></td>
				<td style="padding-left=2;"><%=mid(rsda("DRStartDate"),3,8)%>&nbsp;<%=left(rsda("DRMemo"),13)%></TD>
			</TR>
		</a>

			</a>

			<%
				rsda.movenext
				cnt=cnt+1
				loop
			end if
			%>
		</TABLE>