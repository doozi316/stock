<!--#include file="../dbcon.asp" -->

<%
	width="600"

	titleB="<a href='MailList.asp?Div=����������'>���ڿ���</a>"
	title="��������"

	ThisPage="MailWrite.asp"
	Div=request("Div")
	ETeam=request("Eteam")
	Reply=request("Reply")
	MReplyTeam=request("MReplyTeam")
	MReply=request("MReply")
	Mwriter=request("Mwriter")
	Mwriterteam=request("Mwriterteam")
	Mreceiver=request("Mreceiver")
	Mreceiverteam=request("Mreceiverteam")
	Msubject=request("Msubject")
	Mcontent=request("Mcontent")
'response.write ETeam &"<br>"


%>
<html>
<head>

<title><%=title%></title>

<style type="text/css">

a:link   {text-decoration:none; color:<%=LinkColor%>}
a:visited  {text-decoration:none; color:<%=LinkColor%>}
a:hover  {text-decoration:none; color:<%=VisitColor%>}

TABLE
{ color: <%=textcolor%>; }
</style>

<script language="javascript">

	function DelVal()
	{
		document.form.Mwriterteam.value="";
		document.form.Mwriter.value="";
		document.form.Mreceiver.value="";
		document.form.Mreceiverteam.value="";
		document.form.Msubject.value="";
		document.form.Mcontent.value="";
		document.form.action="<%=thispage%>";
		document.form.target="_self";
		document.form.method="post";
		document.form.submit();
	}

	function WriteOk()
	{
		if(document.form.Mwriterteam.value == "")
		{
			alert("������ ��� �Ҽ����� �Է��Ͻʽÿ�")
			document.form.Mwriterteam.focus();
			return
		}
		if(document.form.Mwriter.value == "")
		{
			alert("�����»���� �Է��Ͻʽÿ�")
			document.form.Mwriter.focus();
			return
		}
		if(document.form.Mreceiverteam.value == "")
		{
			alert("�޴»�� �Ҽ����� �Է��Ͻʽÿ�")
			document.form.Mreceiverteam.focus();
			return
		}
		if(document.form.Mreceiver.value == "")
		{
			alert("�޴� ����� �Է��Ͻʽÿ�")
			document.form.Mreceiver.focus();
			return
		}
		document.form.action="MailWriteOk.asp";
		document.form.method="post";
		document.form.submit();

	}
	

</script>

</head>

<body topmargin=0 leftmargin=0>
<form name="form">

<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="font-size:9pt;margin-left:20;margin-top:20">
	<tr>
		<!--<td><IMG SRC="../images/TitleEMail.gif" WIDTH="550" HEIGHT="80" BORDER=0 ALT=""></td>-->
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=widthM-20%>" style="margin-left=30;margin-top=15;">
	<tr>
		<!--<td WIDTH="13%"><IMG SRC="../images/titlebar_mgn.gif" WIDTH="130" HEIGHT="20"></td>-->
		<td valign="bottom" style="padding-bottom:2"><FONT COLOR="#708090">�� �Ҽ����� �����Ͻø� �Ҽ��� ��ü�� ������ �߼۵ǿ��� ���ǹٶ��ϴ�.</FONT></td>
	</tr>
	<tr>
		<td colspan=2><IMG SRC="../../images/lineA550.gif" WIDTH="550" HEIGHT="5" BORDER=0 ALT=""></td>
	</tr>
</table>
<table>
<tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">������ /�����μ�</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="Mwriter" >  <input type="text" size="30" name="Mwriterteam" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">�޴���/�޴ºμ� :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="Mreceiver" >  <input type="text" size="30" name="Mreceiverteam" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">�� �� :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="55" name="Msubject" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 height="50" align="right" bgcolor="<%=color5%>" style="padding-right=10">�� �� :</td>
		<td id=tdg01 height="50"  style="padding-left=10">
            <textarea rows="30" cols="50" type="text" size="55" name="Mcontent" ></textarea>
         </td>
    </tr>
	<tr >
		<td  height="30" align="center" colspan="3">
			<input type="button" name="B1" value="��Ϻ���"  onclick="javasript:location.href='MailList.asp?no=0&div=����������'">
			<input type="button" name="B1" value="����������"  onclick="WriteOk()">
			<input type="reset" value=" �ٽ� ���� " name="B2">
		</td>
    </tr>
</table>
</form>

</body>
</html>