<%@ CodePage='949' Language="VBScript"%>

<!--#include file="../dbcon.asp" -->

<%
	
	Response.ChaRset = "euc-kr"


	width="600"

	titleB="<a href='BBSList.asp'>공지사항</a>"
	title="글쓰기"
	BBSType = request("BBSType")


%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title><%=title%></title>
	<style type="text/css">

	a:link   {text-decoration:none; color:<%=LinkColor%>}
	a:visited  {text-decoration:none; color:<%=LinkColor%>}
	a:hover  {text-decoration:none; color:<%=VisitColor%>}
	TABLE {color: <%=textcolor%>; }
	</style>
<script language=javascript>

	function WriteOk()
	{
		//putSource();

			document.form.action="BBSWriteOk.asp";
			document.form.method="post";
			document.form.submit();
	}
	

</script>

</head>
<body leftmargin=0 topmargin=0>
<form name="form" method="post" >

<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="margin-left:20;margin-top:20">
	<tr>
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=widthM-20%>" style="margin-left=30;margin-top=15;">
	<tr>
		<td WIDTH="20%"></td>
		<td align=left style="padding-bottom:0"><fONT COLOR="#708090">☞ 공지사항 입력해주시길 바랍니다.</FONT></br></td>
	</tr>

</table>

<table cellpadding="0" cellspacing="0" width="<%=width%>" bgcolor="" style="margin-left:40;margin-top:10;border-right:1 solid <%=grayline%>;border-bottom:1 solid <%=grayline%>">

	<tr height="25">
		<td id=tdg01 width=25% align="right" bgcolor="<%=color5%>" style="padding-right=10">
			공지사항구분 :
		</td>
		<td id=tdg01 width=75% style="padding-left=10">
			<INPUT TYPE="checkbox" NAME="BDiv" value="사내" checked> 사내공지
			<INPUT TYPE="checkbox" NAME="BDiv" value="사외"> 사외공지

		</td>
	</tr>
  
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">등록자 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="BWriter" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">부서 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="30" name="Bdepartment" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=10">제 목 :</td>
		<td id=tdg01 style="padding-left=10">
            <input type="text" size="55" name="BSubject" >
         </td>
    </tr>
    <tr height="23">
		<td id=tdg01 height="50" align="right" bgcolor="<%=color5%>" style="padding-right=10">내 용 :</td>
		<td id=tdg01 height="50"  style="padding-left=10">
            <textarea rows="30" cols="50" type="text" size="55" name="Bcontent" ></textarea>
         </td>
    </tr>
  
 

</table>
<table cellpadding="0" cellspacing="0" width="<%=width%>" bgcolor="" style="margin-left:40;margin-top:10;">
	<tr>
		<td  align=center colspan=2 style="padding-top:10">
			<input type="button" name="B1" value="등록확인" onClick="javascript:WriteOk();">
			<input type="BUTTON" value=" 닫 기 " onclick="javascript:window.close();">
		</TD>
	</tr>

</table>

</form>

</body>
</html>