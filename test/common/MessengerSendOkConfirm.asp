<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../css/greenColor1.asp" -->
<%
	server.execute("/LogPage/LogPage.asp")

	response.expires=0


	MReceiver = request("MReceiver")
	MSendCnt	= request("MSendCnt")
	Se_Code = request("Se_Code")
%>
<HTML>
<HEAD>
	<TITLE>�ؽ�ƿ(��) Messenger - ���� Ȯ��</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
	<SCRIPT language=JavaScript>
	<!--
		function autoclose(sec)
		{
		  setTimeout('close_win()',sec)              
		}

		function close_win()
		{
		  self.close();
		}
	-->
	</SCRIPT>
</HEAD>
<BODY bgColor=#213e7e leftMargin=0 topMargin=4>
<FORM name=form>
<TABLE class=jks01 height="100%" cellSpacing=0 cellPadding=0 bgColor=white 
border=0>
	<TBODY>
		<TR bgColor=#5574b7>
			<TD style="FONT-SIZE: 9pt; COLOR: #ffffff" width=350 colSpan=3 height=22>
				<IMG height=11 hspace=6 src="inc/ico4.gif" width=11 align=absMiddle border=0><B>�系���� </B>(<i>Nexteel Messenger</i>)</TD>
		</TR>
		<TR>
			<TD vAlign=bottom align=middle colSpan=3 height=13>
				<IMG height=3 src="inc/t_bg.gif" width=325 border=0></TD>
		</TR>

		<TR>
			<TD width=10 rowSpan=3></TD>
			<TD style="BORDER-RIGHT: #6585c9 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 3px; BORDER-LEFT: #6585c9 1px solid; PADDING-TOP: 5px" bgColor=#e1ebfd height=22><FONT color=#fd8305><B>��</B></FONT> <B>���� Ȯ��</B></TD>
			<TD width=10 rowSpan=3></TD>
		</TR>

		<TR vAlign=top>
			<TD style="BORDER-RIGHT: #6585c9 1px solid; BORDER-LEFT: #6585c9 1px solid; PADDING-TOP: 10px; BORDER-BOTTOM: #6585c9 1px solid" align=middle width=330>
			<!-- ���� -->
				<TABLE style="FONT-SIZE: 9pt; LINE-HEIGHT: 13pt" cellSpacing=0 cellPadding=1 width=310 border=0>
					<TBODY>
						<TR>
							<TD style="BORDER-TOP: #6585c9 2px solid" align=center height="150">
<%
	if Se_Code <> "" then
		sql = "SELECT * FROM [SendOut] "
		sql = sql & "WHERE SE_Code = '" & Se_Code & "' "
	'response.write sql
		set rs=dbcon.execute(sql)
		if rs.eof then
		else
%>
			�� �۽Ź�ȣ : <%=rs("Se_SendNum")%><br>

				 <table cellpadding="0" cellspacing="0" width="150" align="center">
						<tr>
							<td width="155" height="180" background="image/n_cell_play.gif">
                <p align="center"><br><br><br><textarea name="to_message" rows="5" cols="16" style="font-size:12px; background-color:rgb(123,255,255); border-width:0; border-style:none;" onChange="CheckLen(this.form);" onKeyUp="CheckLen(this.form);" onKeydown="CheckLen(this.form);"><%=rs("SE_Message")%></textarea><br>&nbsp;<br>&nbsp;
							<table cellpadding="0" cellspacing="0" width="61" height="20" align="center">
								<tr>
									<td width="61" background="sms/image/aekjoung.gif" align=center>��������</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
			�� ���Ź�ȣ : <%=rs("Se_HandPhone")%><br>
<%
		end if
%>
		<script language=javascript>
//			autoclose(3000);
		</script>
<%
	else

%>
		<script language=javascript>
			autoclose(2000);
		</script>
<%
		if MSendCnt = "" then
%>
			���ۼ����� ���� ���� �ʾ� ������ �߻��߽��ϴ�.
			<br>
			�����ڿ��� �����Ͽ� �ֽñ� �ٶ��ϴ�.
<%
		else
			if CInt(MSendCnt) = 1 then
%>
				<%=MReceiver%>�Բ� ������ �� ���۵Ǿ����ϴ�.
				<br><br>
				������ ������ ���������Կ��� Ȯ���Ͻ� �� �ֽ��ϴ�.
<%
			else
%>
				��� <%=MSendCnt%>���� ������ ���۵Ǿ����ϴ�.
				<br><br>
				������ ������ ���������Կ��� Ȯ���Ͻ� �� �ֽ��ϴ�.

<%
			end if
%>
<%
		end if
%>

<%
	end if

%>

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