<!--#include file="../dbcon.asp" -->
<%

	width="720"
	titleB="<a href='MailList.asp?Div=����������'>���ڿ���</a>"
	title="��Ϻ���"

	div=request("div")
	mwriter=request("mwriter")
	mreceiver=request("MReceiver")

	Search=request("Search")
	SearchString=request("SearchString")
	BBSDate1	=	request("BBSDate1")
	BBSDate2	=	request("BBSDate2")

	if BBSDate1 <> "" and BBSDate2 ="" then
		BBSDate2 = BBSDate1
	end if

	title=Div


	thispage ="MailList.asp"

	if Request("GotoPage") = "" then
			GotoPage = 1
		else
			GotoPage = Request("GoTopage")
	end if



	sql = "SELECT * "
	sql = sql & "FROM Mailbox "
	sql = sql & "WHERE MCode > 0  "

	sql=sql & " order by MReadCheck, MCode desc"
				if BBSDate1 <> ""  then
					sql=sql & " and MWriteDate BETWEEN '" & BBSDate1 & " 00:00' AND '" & BBSDate2 & " 23:59' "
				end if

'response.write "<pre>" & sql & "</pre>"
'response.end

Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL,dbconn,1
'	rs.pagesize=12

	if request("PageSize") = ""  then
		PageSize=20
		rs.pagesize=PageSize
	end if
	RecordCnt = rs.RecordCount

	title=Div
%>

<head>

<title><%=title%></title>
<style type="text/css">

a:link   {text-decoration:none; color:<%=LinkColor%>}
a:visited  {text-decoration:none; color:<%=LinkColor%>}
a:hover  {text-decoration:none; color:<%=VisitColor%>}

TABLE
{ color: <%=textcolor%>; }

</style>

<script language="JavaScript">

function Delete(arg)

{
	result=confirm("���õ� ������ �����Ͻðڽ��ϱ�?");
	if(result==true)
	{
		document.form.method="post";
		document.form.target="_self";
		document.form.action="MailDelete.asp";
		document.form.submit();
}
		else return;
	}



function search()
{

	document.form.gotopage.value="";
	document.form.method="post";
	document.form.target="_self";
	document.form.action="./MailList.asp";
	document.form.submit();
}
function searchall()
{

	document.form.gotopage.value="";
	document.form.Search.value="";
	document.form.SearchString.value="";
	document.form.method="post";
	document.form.target="_self";
	document.form.action="./MailList.asp";
	document.form.submit();
}

function ChkAllSel()
{
	for(i=1;i<document.form.DelCode.length;i++)
	{
		document.form.DelCode[i].checked = true;
	}
}
	function CallCalender(dstr)
	{
		window.open("../CallCalender.asp?FormName="+dstr,"","width=240, height=170,top=10,left=10");
    }
	function EnterChk()
	{
		if(event.keyCode == 13)
		{
			search();
		}
	}
		function popupOpen(){

	var popUrl = "../Common/popMessenger.asp";	//�˾�â�� ��µ� ������ URL

	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //�˾�â �ɼ�(optoin)

		window.open(popUrl,"",popOption);
	}
	
</script>
<a href="javascript:popupOpen();" > ���� Ȯ��! </a>
</head>

<body leftmargin=0 topmargin=0>
<form name=form>
<input type=hidden name=DelCode>

<input type=hidden name=div value="<%=div%>">
<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="margin-left:20;margin-top:20">
	<tr>
		<%if div="����������" then%><td><IMG SRC="../images/����������.PNG" WIDTH="450" HEIGHT="80" BORDER=0 ALT=""></td><%else%><td><IMG SRC="../images/����������.PNG" WIDTH="450" HEIGHT="80" BORDER=0 ALT=""></td><%end if%></td>
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="550" style="margin-left=30;margin-top=15;">
	<tr>
		<td  align="right" style="padding-bottom:2;">&nbsp;&nbsp; ������:	&nbsp;&nbsp;
			<SELECT NAME="PageSize" onChange="javascript:search()" style="font-size=9pt; margin-right:50;">
					<option value="<%=PageSize%>"><%=Cint(PageSize)%></option>
					<% for i=10 to 1000 step 10%>
						<option value="<%=i%>"><%=i%></option>
					<%next%>
			</SELECT></td>

	</tr>
	<tr>
		<td colspan=3><IMG SRC="../../images/lineA550.gif" WIDTH="650" HEIGHT="5" BORDER=0 ALT=""></td>
	</tr>
</table>
<table border="0" cellPadding="0" cellSpacing="0" width="<%=width-70%>" style="margin-top=2;margin-left=30;">

	<tr align=center height=20 bgcolor="<%=color5%>" >
        <td id=tdg01>��ȣ</td>
        <td id=tdg01>�� ��</td>
        <td id=tdg01>�� ��</td>
		<td id=tdg01>
			  <%if div="����������" then%>�޴���<%else%>������<%end if%></td>
        <td id=tdg01>�� ¥</td>
        <td id=tdg01>����</td>
        <td id=tdgr01><a href="javascript:ChkAllSel()">����</a></td>

	</tr>


<%if rs.eof or rs.bof then%>
	<tr align="middle" height=25 >
		<td colspan=10 height=22 style="color=darkgreen; border-top:1 solid <%=GrayLine%>">����Ÿ�� �����ϴ�.</td>
	</tr>
<%
	else
	recordcnt = rs.RecordCount '�� ���ڵ��� ������ recordcnt��� ������ �����Ѵ�.
	totalpage = rs.pagecount
	

	i=1

	do until rs.eof or i>rs.pagesize


%>
	<tr height=20 align=center >
        <td id=tdg01 width=40><%=rs("MCode")%></font></td>
        <td id=tdg01 width=250 align=center style="cursor:hand;" onMouseOver="this.style.background='<%=graycolor2%>'" onMouseOut="this.style.background='transparent'" onClick="javascript:location.href='MailContent.asp?Mcode=<%=rs("MCode")%>&div=<%=div%>'">
				&nbsp;<%=left(rs("MSubject"),30)%>
		</td>
		<td id=tdg01 width=60>
			  <%if div="����������" then%>	
				<%=rs("MWriterteam")%>
			  <%else%>
				<%=rs("MReceiverteam")%><%end if%></font>
		</td>
		<td id=tdg01 width=60>
			  <%if div="����������" then%>	
				<%=rs("MWriter")%>
			  <%else%>
				<%=rs("MReceiver")%><%end if%></font>
		</td>
        <td id=tdg01 width=70>
				<%=MID(rs("MWritedate"),3,8)%>
		</td>
        <td id=tdg01 width=50>
			  <%if rs("MReadCheck")=0 then%>������<%elseif rs("MReadCheck")=1 then%>����<%end if%>
		</td>
        <td id=tdgr01 width=40>
			  <input type=checkbox name=DelCode value="<%=rs("MCode")%>">
		</td>
  </tr>
<%
			rs.movenext
			i=i+1
			loop
		end if

%>

</table>
<table width="<%=width-70%>" border="0" cellPadding="0" cellSpacing="0" bgcolor="<%=color5%>" style="margin-top=0;margin-left=30;border:1 solid <%=LineColorG%> ">
	<tr height=28 >

 		<td width=45 >&nbsp;�˻���:</td>
		<td align=center width=110>
			<INPUT TYPE="text" NAME="BBSDate1" value="<%=BBSDate1%>" SIZE="8" id=fromDt style="text-align=center" onClick="CallCalender('BBSDate1');">~<INPUT TYPE="text" NAME="BBSDate2" value="<%=BBSDate2%>" SIZE="8" id=toDt style="text-align=center" onClick="CallCalender('BBSDate2');">
		</td>
		
	  <td align="left" style="padding-left=20">			  
			  <SELECT NAME="Search" OnKeyDown="EnterChk(this)" style="font-size=9pt;">
					<option value="" selected></option>
					<option value="����">��ü</option>
					<option value="����">����</option>
					<option value="�μ�">�μ�</option>  
					<option value="�̸�">�̸�</option>  
			</SELECT>
			
				
			  <input maxLength="15" name="SearchString" size="15" onKeyDown="EnterChk();" value="<%=SearchString%>">
			  <input type="submit" value=" �� �� " onClick="search();" >
			  <input type="button" value=" �� ü " onClick="searchall();" >
	
		</td>
		<td>
			<input type="button" name="B1" value="�۾���"  onclick="location.href='MailWrite.asp?Reply=1'">
			<input type="BUTTON" value=" �� �� " onClick="Delete();">



		</td>

    </tr>
</table>

</form>

</html>