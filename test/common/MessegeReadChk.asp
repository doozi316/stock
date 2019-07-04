<!--#include file="../dbcon.asp" -->
<%
	

	MCode = request("MCode")
	ReadChk = request("ReadChk")
'	response.write ReadCHk & "<br>"

	if ReadChk = "true" then
		SQL = "Update mailbox Set MReadCheck = 1 "
		SQL = SQL & " where MCode = " & MCode
'	response.write  SQL & "<br>"
		dbconn.Execute SQL
%>
	<SCRIPT language=JavaScript>
		self.close();
	</SCRIPT>
		
<%
	else
%>
<HTML>
<HEAD>
	<TITLE>넥스틸(주) 사내쪽지 - 쪽지 읽음 확인</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
	<SCRIPT language=JavaScript>
	<!--
		function autoclose()
		{
		  setTimeout('close_win()',3000)              
		}

		function close_win()
		{
		  self.close();
		}
	-->
	</SCRIPT>
</HEAD>
<BODY bgColor=#213e7e leftMargin=0 topMargin=4 onload="autoclose();">
<FORM name=form>
<TABLE class=jks01 height="100%" cellSpacing=0 cellPadding=0 bgColor=white 
border=0>
	<TBODY>
		<TR bgColor=#5574b7>
			<TD style="FONT-SIZE: 9pt; COLOR: #ffffff" width=350 colSpan=3 height=22>
				<IMG height=11 hspace=6 src="inc/ico4.gif" width=11 align=absMiddle border=0><B>사내쪽지 </B>(<i>Nexteel Messenger</i>)</TD>
		</TR>
		<TR>
			<TD vAlign=bottom align=middle colSpan=3 height=13>
				<IMG height=3 src="inc/t_bg.gif" width=330 border=0></TD>
		</TR>

		<TR>
			<TD width=10 rowSpan=3></TD>
			<TD style="BORDER-RIGHT: #6585c9 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 3px; BORDER-LEFT: #6585c9 1px solid; PADDING-TOP: 5px" bgColor=#e1ebfd height=22><FONT color=#fd8305><B>≫</B></FONT> <B>쪽지 수신 확인</B></TD>
			<TD width=10 rowSpan=3></TD>
		</TR>

		<TR vAlign=top>
			<TD style="BORDER-RIGHT: #6585c9 1px solid; BORDER-LEFT: #6585c9 1px solid; PADDING-TOP: 10px; BORDER-BOTTOM: #6585c9 1px solid" align=middle width=330>
			<!-- 본론 -->
				<TABLE style="FONT-SIZE: 9pt; LINE-HEIGHT: 13pt" cellSpacing=0 cellPadding=1 width=310 border=0>
					<TBODY>
						<TR>
							<TD style="BORDER-TOP: #6585c9 2px solid" align=center height="150">
메시지를 읽지 않으셨습니다.
<br><br>
읽지 않으신 메시지는 받은쪽지함에 자동 저장 되며<br>
<br><br>
잠시 후 다시 띄워집니다.
							</TD>
						</TR>
						<TR>
							<TD bgColor=#6585c9 height=2></TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD colSpan=3 height=10></TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>
</body>
</html>
<%
	end if

%>
