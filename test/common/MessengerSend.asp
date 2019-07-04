<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../login/sessionOut.asp" -->
<!--#include file="../css/greenColor.asp" -->
<!--#include file="../inc/desNull.asp"-->
<%
	server.execute("/LogPage/LogPage.asp")

	Title="쪽지보내기"
	response.expires = 0
	MReceiverTeam = request("MReceiverTeam")
	MReceiver = request("MReceiver")
	MSubject = request("MSubject")
	MContent = request("MContent")

	PageType = request("PageType")
	if PageType = "Reply" then
		MCode = request("MCode")
		SQL = "Update IntraMail Set MReadCheck = 1 "
		SQL = SQL & " where MCode = " & MCOde
'	response.write  SQL & "<br>"
		dbcon.Execute SQL

		MCode = request("MCode")
		sql = "SELECT * FROM [IntraMail] WHERE MCode = " & MCode & " "
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
	<TITLE>넥스틸(주) 사내쪽지 - 쪽지 보내기</TITLE>
	<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
	<SCRIPT language=JavaScript src="inc/popup.js"></SCRIPT>
	<SCRIPT language=javascript>
	<!--
	function SendIt()
	{
		if(document.form.MReceiver.value=="")
		{
			alert("받는 사람을 입력해주세요.");
			document.form.MReceiver.focus();
			return ;
		}else if(document.form.MSubject.value=="")
		{
			alert("쪽지 제목을 입력해주세요.");
			document.form.MSubject.focus();
			return ;
		}else if(document.form.MContent.value=="")
		{
			alert("쪽지 내용을 입력해주세요.");
			document.form.MContent.focus();
			return ;
		} else
		{
			var constring = document.form.MContent.value;
			constring = rtrim(constring);
			if(constring.length<1)
			{
				alert("쪽지 내용을 올바르게 입력해주세요.");
				return ;
			}else
			{
				document.form.target = "_self"
				document.form.method = "post"
				document.form.action="MessengerSendOk.asp";
				document.form.submit();
			}
		}
	}

	function confirmFilename(str)
	{
		if(str.indexOf("'")>=0)return true;
		if(str.length>80)return true;
		return false;
	}

	function rtrim(str)
	{
		var endPoint = 0;
		var tmpPoint = 0;
		for(i=0; i<str.length; i++){
			if(str.substring(i,i+1)==" "){
				tmpPoint = tmpPoint + 1;
			}else{
				endPoint = endPoint + tmpPoint + 1;
				tmpPoint = 0;
			}
		}
		return str.substring(0, endPoint);
	}
	function CallCalender(th)
	{
		window.open("../inc/CallCalender.asp?FormName="+th,"CallCalender","width=240, height=170,top=10,left=10")
    }
	function Reserve(th)
	{
		if(th.checked)	CallCalender('MReserveDate');
		else{
			document.form.MReserveDate.value = "";
			document.form.MReserveHour.value = "";
			document.form.MReserveMin.value = "";
		}
	}
	function ChangeRTeam(th)
	{
//		location.href="MessengerSend.asp?MReceiverTeam="+th.value;
		document.form.target = "_self"
		document.form.method = "get"
		document.form.action="MessengerSend.asp";
		document.form.submit();		

	}
	-->

	</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0>

<FORM name=form encType="multipart/form-data">
<INPUT type="hidden" name=MWriterCom value="<%=MWriterCom%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriterTeam value="<%=MWriterTeam%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriter value="<%=MWriter%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverID value="<%=MReceiverID%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverCom value="<%=MReceiverCom%>" size="20" maxlength="20">

<!--제목-->
<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr>
		<td style="color:white;" height="20">&nbsp; ▒ &nbsp;<%=title%>&nbsp;</td>
		<td align=right style="color:white;" ><%=now()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>

</table>
<!--제목-->
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height=25>
		<td id=tdg01 width=25% align=right bgcolor="<%=color5%>" style="padding-right=5">받는사람</TD>
		<td id=tdg01 style="padding-left=10">
			<SELECT Name="MReceiverTeam" OnChange="ChangeRTeam(this)">
<%
			sql = "SELECT XGDept FROM ("
			sql = sql & "SELECT * FROM [XGeneral] "
			sql = sql & "WHERE XGQuit = '재직' "
			sql = sql & "AND XGNameK IN (SELECT EName FROM IntraMember WHERE ECheck = 1) "
			sql = sql & ")XGeneral "
			sql = sql & "GROUP BY XGDept "
			sql = sql & "ORDER BY (SELECT TOP 1 XDOrder FROM XDept WHERE XDept = XGDept) "
'response.write sql
			set xrs=dbcon.execute(sql)
%>

				<option value="">부서명</option>
<%
			do until xrs.eof
%>
			<option value="<%=xrs("XGDept")%>" <%=FSelected(MReceiverTeam,xrs("XGDept"))%>><%=xrs("XGDept")%></option>
<%
				xrs.movenext
			loop
%>

			<option value="고객업체">고객업체</option>
<%
	if session("EName") = "한승만" or session("EName")="김남인" or session("EName")="김경선" then
%>
			<option value="컴퓨터">컴퓨터동호회</option>
<%
	end if
%>
			</SELECT>
<select name="MReceiver">
			<option value="<%=MReceiverTeam%>">전체</option>
<%
	if MReceiverTeam <> "" then
		if MReceiverTeam <> "고객업체" then
			sql = "SELECT XGFacDiv,XGNameK FROM [XGeneral] "
			sql = sql & "WHERE XGQuit = '재직' "
			sql = sql & "AND XGNameK IN (SELECT EName FROM IntraMember WHERE ECheck = 1) "
			sql = sql & "AND XGDept = '" & MReceiverTeam & "' "
'			sql = sql & "ORDER BY XGOrder "
If session("EName")="송솔잎" Or session("ETeam")="생산팀" Then
			sql = sql & "ORDER BY XGNameK "
ElseIf session("ETeam")="전략기획팀"  Then
			sql = sql & "or XGNameK = '강정수' "
			sql = sql & "ORDER BY XGFacDiv asc, XGDiv , XGOrder, XGNameK "
Else 
'			sql = sql & "ORDER BY XGFacDiv, XGOrder, XGNameK "
			sql = sql & "ORDER BY XGFacDiv asc, XGDiv , XGOrder, XGNameK "
End If 

			set xrs=dbcon.execute(sql)
			do until xrs.eof
			
				If chkfac <> "" Then 
					If chkFac <> xrs("XGFacDiv") Then 
			%>								  
						<option value="----" >------</option>
			<%
					End If 
				End If 
%>
			<option value="<%=xrs("XGNameK")%>" <%=FSelected(MReceiver,xrs("XGNameK"))%>><%=xrs("XGNameK")%></option>
<%
					chkFac = xrs("XGFacDiv")
				xrs.movenext
			loop
		else
			sql="SELECT ECom, EName FROM IntraMember WHERE ECom <> '넥스틸(주)' ORDER BY replace(replace(ECom,'(주)',''),'(유)','') "
			Set RS_Name = dbcon.execute(sql)
			if NOT RS_Name.eof then
				do until RS_Name.eof
%>
			<option value="<%=RS_Name("EName")%>" <%=FSelected(MReceiver,RS_Name("EName"))%>><%=RS_Name("EName")%>&nbsp;&nbsp;&nbsp;&nbsp;<%=RS_Name("ECom")%></option> 
<%	
					RS_Name.movenext
				loop
			end if
		end if
	end if

%>

</select> 
<%
'If session("EName")="김남인" Or session("EName")="오동언" Then 
'	response.write "" & sql & ""
'End If 
%>
		</TD>
	</TR>

	<TR>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">제&nbsp;&nbsp;&nbsp;목</TD>
		<td id=tdg01 style="padding-left=10">
			<INPUT type=text name="MSubject" value="<%=MSubject%>" size="35" maxlength="100">
		</TD>
	</TR>

	<TR>
		<TD id=tdg01  align=center colSpan=2><TEXTAREA name=MContent rows=12 cols=48  style="font-size=9pt;"><%=MContent%></TEXTAREA></TD>
	</TR>
	<TR>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5" nowrap>첨부1(3M이하)</TD>
		<td id=tdg01 style="padding-left=10"><INPUT type=file name=MFile1 size="15" ></TD>
	</TR>
	<TR>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5" nowrap>첨부2(3M이하)</TD>
		<td id=tdg01 style="padding-left=10"><INPUT type=file name=MFile2 size="15" ></TD>
	</TR>
	<TR>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">예 약
			<INPUT TYPE=checkbox Name=MReserveChk onclick="Reserve(this);">
		</TD>
		<td id=tdg01 style="padding-left=10">
			<INPUT type=text name=MReserveDate size=6 class=calendar >일
			<SELECT name=MReserveHour>
				<option value=""></option>
<%				for i=0 to 23	%>
				<option value="<%=i%>"><%=i%></option>
<%				next	%>
			</select>시
			<SELECT name=MReserveMin>
				<option value=""></option>
<%				for i=0 to 59	%>
				<option value="<%=i%>"><%=i%></option>
<%				next	%>
			</select>분
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
