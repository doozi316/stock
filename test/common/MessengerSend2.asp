<!--#include file="../dbcon.asp" -->
<%
	
	Title="쪽지보내기"
	MReceiverTeam = request("MReceiverTeam")
	MReceiver = request("MReceiver")
	MContent = request("MContent")
	SendContent = request("SendContent")
	memberch = request("memberch")

	If request("SendSubject") <> "" then
	MSubject =request("SendSubject")
	End if

	'response.write memberch


	PageType = request("PageType")
	if PageType = "Reply" then
		MCode = request("MCode")
		SQL = "Update mailbox Set MReadCheck = 1 "
		SQL = SQL & " where MCode = " & MCOde
response.write  SQL & "<br>"
		dbconn.Execute SQL

		MCode = request("MCode")
		sql = "SELECT * FROM [mailbox] WHERE MCode = " & MCode & " "
		set rsRead=dbcon.execute(sql)
		if rsRead.eof then

		else
			MSubject = "Re:" & rsRead("MSubject")
			MContent =  chr(13) & chr(10)  & chr(13) & chr(10)  & chr(13) & chr(10)  & chr(13) & chr(10) & "-----------------------------" & chr(13) & chr(10) & rsRead("MContent")

		end if
	else
		MSubject = MSubject
		MContent = MContent

	end if
%>
<HTML>
<HEAD>
	<TITLE>쪽지 보내기</TITLE>
	<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
	<SCRIPT language=JavaScript src="inc/popup.js"></SCRIPT>
	<SCRIPT language=javascript>
	window.name = "s2"

	function SendIt()
	{
		
				document.form.target = "_self"
				document.form.method = "post"
				document.form.action="MessengerSendOk.asp";
				document.form.submit();
			}
		
	
	function CallCalender(th)
	{
		window.open("../inc/CallCalender.asp?FormName="+th,"CallCalender","width=240, height=170,top=10,left=10")
    }
	function ChangeRTeam(th)
	{
		document.form.target = "_self"
		document.form.method = "get"
		document.form.action="MessengerSend2.asp";
		document.form.submit();

	}



	</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0>

<FORM name=form >
<INPUT type="hidden" name=MWriterCom value="<%=MWriterCom%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriterTeam value="<%=MWriterTeam%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriter value="<%=MWriter%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverID value="<%=MReceiverID%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverCom value="<%=MReceiverCom%>" size="20" maxlength="20">
<% if session("Eid")="luckyboy" then  %>
<INPUT type="text" name=memberch value="<%=memberch%>" size="20" maxlength="20">
<% else  %>
<INPUT type="hidden" name=memberch value="<%=memberch%>" size="20" maxlength="20">
<% end if %>
<INPUT type="hidden" name=memberDiv value="<%=memberDiv%>" size="20" maxlength="20">
<!--제목-->
<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr>
		<td style="color:white;" height="20">&nbsp; ▒ &nbsp;<%=title%>&nbsp;</td>
		<td align=right style="color:white;" ><%=now()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>

</table>
<!--제목-->
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">보낸이 /보낸부서</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="Mwriter" >  <input type="text" size="30" name="Mwriterteam" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">받는이/받는부서 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="Mreceiver" >  <input type="text" size="30" name="Mreceiverteam" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">제 목 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="55" name="Msubject" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 height="50" align="right" bgcolor="<%=color5%>" style="padding-right=10">내 용 :</td>
		<td id=tdg01 height="50"  style="padding-left=10">
            <textarea rows="30" cols="50" type="text" size="55" name="Mcontent" ></textarea>
         </td>
    </tr>

		</TD>
	</TR>

</TBODY>
</TABLE>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5">
	<TR>
		<TD style="PADDING-TOP: 10px" align=middle colSpan=2>

			
			<input type="BUTTON" value="보내기" onclick="SendIt();">
			<input type="BUTTON" value="재입력" onclick="javascript:document.form.reset();">
			<input type="BUTTON" value="창닫기" onclick="javascript:window.close();">
		</TD>
	</TR>
</table>
</FORM>


</BODY>
</HTML>
