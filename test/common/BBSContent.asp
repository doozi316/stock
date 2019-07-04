<!--#include file="../dbcon.asp" -->
<%
	


	width="640"
	BCode=request("BCode")
	titleB="<a href='BBSList.asp'>공지사항</a>"
	title="내용보기"
	gotopage = request("gotopage")
	sql = "SELECT * "
	sql = sql & "FROM ( "
	sql = sql & "		SELECT * "
	sql = sql & "				, (SELECT top 1 XGHead FROM XGeneral WHERE XGDept = BTeam AND XGNameK=BWriter ) XGHead "
	sql = sql & "				, CASE WHEN BIsApp=1 AND BOTCheck<>1 THEN '비공개' ELSE '공개' END 공개여부 "
	sql = sql & "		FROM IntraBBS "
	sql = sql & "		where BCode!='17690' "
	sql = sql & ")공지사항 "
	sql = sql & "WHERE BCode > 0 "

	if BBSDate1 <> "" then
		SQL = SQL & "AND BWriteDate BETWEEN '" & BBSDate1 & " 00:00' AND '" & BBSDate2 & " 23:59' "
	end if

	if str <> "" then
		sql= sql & " and (BWriter like '%"&str&"%' or BTeam like '%"&str&"%' or BSubject like '%"&str&"%' or BContent like '%"&str&"%')"
	end if




	sql= " SELECT * "
	sql= sql & " FROM BBS main WHERE BCode='"&BCode&"'"


	set rs=dbconn.execute(sql)


		BCount = rs("BCount")
'response.write BCount & "<br>"

	UpdateSQL = "Update BBs Set BCount = BCount+1 "
	UpdateSQL = UpdateSQL & " where BCode = " & BCode
	dbconn.Execute UpdateSQL



%>

<html>
<title><%=title%></title>

<style type="text/css">
	a:link   {text-decoration:none; color:<%=LinkColor%>}
	a:visited  {text-decoration:none; color:<%=LinkColor%>}
	a:hover  {text-decoration:none; color:<%=VisitColor%>}
	TABLE {color: <%=textcolor%>; }
</style>

<script language="javascript">
	
	function Delete(arg)
	{
		result=confirm("해당 정보를 삭제하시겠습니까?")
		if(result==true)
		{
			document.form.action="BBSDelete.asp";
			document.form.method="post";
			document.form.target="_self";
			document.form.submit();
		}
		else return;
	}
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name=form>
<input type="hidden" name=BCode value="<%=rs("BCode")%>">
<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="margin-left:20;margin-top:20">
	<tr>
		<td><IMG SRC="../images/Titlebar_bbs.gif" WIDTH="620" HEIGHT="40" BORDER=0 ALT=""></td>
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=widthM-20%>" style="margin-left=30;margin-top=15;">
	<tr>
		<td WIDTH="15%"><IMG SRC="../Images/titleBBS2.gif" WIDTH="110" HEIGHT="20" BORDER=0 ALT=""></td>
		<td  valign="bottom" style="padding-bottom:2;"><font COLOR="#708090">☞본인이 올린 글만 수정/삭제가 가능합니다.</font></td>
	</tr>
	<tr>
		<td colspan=2><IMG SRC="../../images/linebbs720.gif" WIDTH="605" HEIGHT="5" BORDER=0 ALT=""></td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="<%=width-30%>" style="margin-left:30;margin-top:10;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>;">
	<tr height="25">
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">작성자 :</td>
		<td id=tdg01 width=35% style="padding-left=10"><%=rs("BWriter")%></td>
		<td id=tdg01 width=15% align="right" bgcolor="<%=color5%>" style="padding-right=5">작성일 :</td>
		<td id=tdg01 width=40% style="padding-left=10"><%=rs("BWriteDate")%></td>
	</tr>
		</td>
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=5">
			조회횟수/ 조회인원수:
		</td>
		<td id=tdg01 style="padding-left=10">
			<%=BCount%>
			
		</td>
	</tr>
	<tr height="25">
		<td id=tdg01 align="right" bgcolor="<%=color5%>" style="padding-right=5">제목 :</td>
		<td id=tdg01 colspan=3 style="padding-left=10"><%=rs("Bsubject")%></td>
	</tr>
	<tr height="100">
		<td id=tdg01 style="padding-left=10">내용 :<%=BContent%></td>
		<td id=tdg01 style="align="left""valign=top colspan=4 style="padding=15px;line-height:1.4"><%=rs("Bcontent")%></td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="<%=width-20%>" style="margin-left:40;margin-top:5;">
	<tr >
		<td  colspan=4 align=center style="padding-top=5;padding-bottom=5;">
			<input type="BUTTON" value=" 삭 제 " onClick="Delete();">
			<input type="button" name="B1" value=" 수 정 "  onclick="location.href='BBSRevise.asp?BCode=<%=rs("BCode")%>'">

		</td>
	</tr>
</table>

<iframe id=ifrm name=ifrm width="0" height="0"></iframe>
</form>
</body>
</html>

