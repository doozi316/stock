<!--#include file="../Login/sessionOut.asp" -->
<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../CSS/greenColor.asp" -->

<%
	server.execute("/LogPage/LogPage.asp")

	response.expires=0


	title="������������/����"

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
		result=confirm("�ش� ������ �����Ͻðڽ��ϱ�?")
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
		<td width="360" style="color:white;" height="20">&nbsp; �� &nbsp;<%=title%>&nbsp;</td>
	</tr>
</table>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height=25>
		<td id=tdg01 width=32% align=right bgcolor="<%=color5%>" style="padding-right=10">�μ�/����/�����:</td>
		<td id=tdg01 style="padding-left=10">
			<input type=hidden name="DRDept" value="<%=rs("DRDept")%>">
			<%=rs("DRDept")%>&nbsp;&nbsp;<%=rs("DRWriter")%>&nbsp;&nbsp;<%=date()%>

		</td>
	</tr>
	<tr height=25>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=10">��������/����:</td>
		<td id=tdg01 style="padding-left=10">
			<SELECT NAME="DRDiv" style="font-size=9pt">
				<option value="<%=rs("DRDiv")%>"><%=rs("DRDiv")%></option>
				<option value="ȸ���������">ȸ���������</option>
<%	if session("ETeam") = "������ȹ��" or session("ETeam") = "�����ý�����" or session("ETeam") = "�ѹ�������" or session("ETeam") = "������ȹ��" then	%>
				<option value="ȸ���ֿ�����">ȸ���ֿ�����(��ü����)</option>
<%	end if	%>
				<option value="��������">��������</option>
				<option value="�̴��Ǹ�ǥ">�̴��Ǹ�ǥ</option>
				<option value="�޹�">�޹�</option>
				<option value="���ֻ����ȹ">���ֻ����ȹ</option>
			</SELECT>
			<SELECT NAME="DRWork" style="font-size=9pt">
				<option value="<%=rs("DRWork")%>"><%=rs("DRWork")%></option>
				<option value="�ٹ�">�ٹ�</option>
				<option value="�޹�">�޹�</option>
			</SELECT>
			<input type=text name="DRStartDate" value="<%=rs("DRStartDate")%>" class=calendar size=10 style="text-align:center;">
		</td>
	</tr>

	<tr height=25>
		<td id=tdg01 colspan=3 align=center bgcolor="<%=color5%>">�����޸�</td>
	</tr>
	<tr>
		<td id=tdg01 colspan=3 align=center style="padding:2"><TEXTAREA NAME="DRMemo" ROWS="20" COLS="80" style="font-size=9pt;/"><%=rs("DRMemo")%></TEXTAREA></td>
	</tr>
</table>

<table width="100%" cellSpacing="0" cellPadding="0" border="0" style="margin-top=10">
	<tr >
		<td align=center>
			<input type="button" name="B1" value=" �� �� " onclick="javascript:ReviseOk()">
			<input type="button" name="B1" value="�߰����" onclick="javascript:WriteOk()">
			<input type="button" name="B1" value=" �� �� " onclick="javascript:Delete()">
			<input type="button" name="B1" value=" �� �� "  onclick="javascript:window.close();">
		</td>
	</tr>
</table>

</form>
</body>
</html>