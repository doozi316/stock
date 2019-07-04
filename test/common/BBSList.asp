<!--#include file="../dbcon.asp" -->
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Response.ContentType="text/html;charset=euc-kr"
	Session.codepage="949"
%>

<%
	width="680"
	titleB="<a href='BBSList.asp'>공지사항</a>"
	title="공지사항 목록보기"
	%>
<%
	if Request("gotopage") = "" then
		gotopage = 1
	else
		gotopage = Request("gotopage")
	end if
	thispage ="BBSList.asp"

	str=request("str")

	BBSDate1 = request("BBSDate1")
	BBSDate2 = request("BBSDate2")

   
	if BBSDate1 <> "" and BBSDate2 <> "" then
		BBSDate1 = BBSDate1
		BBSDate2 = BBSDate2
	elseif BBSDate1 <> "" and BBSDate2 = "" then
		BBSDate1 = BBSDate1
		BBSDate2 = BBSDate1
	elseif BBSDate2 <> "" and BBSDate1 = "" then
		BBSDate1 = BBSDate2
		BBSDate2 = BBSDate2
	Else
		
		BBSDate2 = Mid(date(),3,2) & Mid(date(),6,2) & Mid(date(),9,2)
	end If


	sql = "SELECT * "
	sql = sql & "FROM BBS "
	sql = sql & "WHERE BCode > 0  "




	if str <> "" then
		sql= sql & " and (BWriter like '%"&str&"%' or  like Bdepartment '%"&str&"%' or BSubject like '%"&str&"%' or BContent like '%"&str&"%')"
	end if

	sql=sql & " order by BWriteDate desc"


	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL,dbconn,1
	'response.write sql

	if request("PageSize") = ""  then
		PageSize=20
		rs.pagesize=PageSize
	else
		PageSize=Cint(request("PageSize"))
		rs.pagesize = PageSize
	end if
	RecordCnt = rs.RecordCount
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title><%=title%></title>
<style type="text/css">
	a:link   {text-decoration:none; color:<%=LinkColor%>}
	a:visited  {text-decoration:none; color:<%=LinkColor%>}
	a:hover  {text-decoration:none; color:<%=VisitColor%>}

	TABLE
	{ color: <%=textcolor%>; }
</style>
<link rel="stylesheet" href="../js/jquery-ui-1.12.0-rc.2/jquery-ui.css">
 <script src="../js/jquery-1.12.4.js"></script>
 <script src="../js/jquery-ui-1.12.1.js"></script>
 <script language=javascript src="../JS/DatePicker.js" charset="utf-8"></script>
<script language="JavaScript">

	
	    function search() {
           document.form.action = "<%=thispage%>";
           document.form.target = "_self";
           document.form.method = "post";
           document.form.submit();
       }
	function searchall()
	{
		document.form.gotopage.value="";
		document.form.PageSize.value="";
		document.form.BBSDate1.value = "";
		document.form.BBSDate2.value = "";
		document.form.str.value="";
		document.form.action="./BBSList.asp";
		document.form.submit();
	}
	function CallCalender(dstr)
	{
		window.open("../CallCalender.asp?FormName="+dstr,"","width=240, height=170,top=10,left=10");
    }
    
</script>
</head>
<body topmargin=0 leftmargin=0>
<form name=form method="post" >
<input type="hidden" name="bbsType" value="<%=session("BBSType")%>">
<table cellpadding="0" cellspacing="0" width="<%=width%>"  style="margin-left:20;margin-top:20">
	<tr>
		<td align=cener>
			&nbsp;&nbsp;
		<td >&nbsp;</td>
	</tr>
</table>
<table border=0 cellpadding="0" cellspacing="0" width="<%=width%>" style="margin-left=30;margin-top=15;">
	<tr>
		<td WIDTH="15%"></td>
		<td align=left valign="bottom" style="padding-bottom:2;"><FONT COLOR="#708090">☞ 본인이 올린 글만 수정/삭제가 가능합니다.</FONT></td>
	</tr>
	<tr>
		<td colspan=2></td>
	</tr>
</table>
<table width="<%=width%>" border="0" cellPadding="0" cellSpacing="0" bgcolor="<%=color5%>" style="margin-top=5;margin-left=30;border:1 solid <%=LineColorG%> ">
	<tr >
 		<td width=45 title="기본적으로 최근3개월간만 표시됩니다. 과거공지자료를 보시려면 일자를 수정해주시기 바랍니다.">&nbsp;검색일:</td>
		<td align=center width=200>
			<INPUT TYPE="text" NAME="BBSDate1" value="<%=BBSDate1%>" SIZE="8" id=fromDt style="text-align=center" onClick="CallCalender('BBSDate1');">~<INPUT TYPE="text" NAME="BBSDate2" value="<%=BBSDate2%>" SIZE="8" id=toDt style="text-align=center" onClick="CallCalender('BBSDate2');">
			
		</td>
		<td height=25 align=center width=60 title="공지자, 공지부서, 공지제목, 공지내용중 검색어가 들어가 있는 자료를 추출해 보여줍니다.">&nbsp;통합검색:</td>
		<td align="left">
			<input name="str" value="<%=str%>" size="15">
		</td>
		<td align=cener>
			&nbsp;&nbsp;<input type="submit" value=" 검 색 " onClick="search();" >
					
		</td>
		<td align=cener>

			<input type="button" name="B1" value="글쓰기"  onclick="javasript:location.href='BBSWrite.asp?BBSType=<%=session("BBSType")%>'">
		</td>
		<td align=center width=60>페이지</td>
		<td align=center style="padding-right=15">
			<SELECT NAME="PageSize" onChange="javascript:search()" style="font-size=9pt">
				<option value="<%=PageSize%>"><%=Cint(PageSize)%></option>
				<% for i=2 to 20 %>
					<option value="<%=i*5%>"><%=i*5%></option>
				<%next%>
			</SELECT>
		</td>
	</tr>

<table  border="0" cellPadding="0" cellSpacing="0" width="<%=width%>" style="margin-top=2;margin-left=30; margin-top=2;border-bottom=1 solid <%=GrayLine%>;border-right=1 solid <%=GrayLine%>">
	<tr align=center bgcolor="<%=color5%>" height="22">
		<td id=tdg01>부서</td>
		<td id=tdg01>공지자</td>
		<td id=tdg01>공지일</td>
		<td id=tdg01>제목</td>
		<td id=tdg01>내용</td>
	</tr>
<%
   if rs.eof or rs.bof then
%>
   <tr align=center>
      <td colspan=20 align=center height=22 id=tdg01>
         <font color=darkgreen>해당내역이 없습니다.</font>
      </td>
   </tr>
<%
   else

      totalpage = rs.pagecount
 

      cnt=1
      do until rs.eof or cnt>rs.pagesize

      acnt=(gotopage-1)*PageSize+cnt

      Select Case cnt Mod 2
      Case "0"
         trbg="aliceblue"
      Case "1"
         trbg=""
      end select

%>

		<tr height=17 align=center style="cursor:hand;" onClick="javascript:location.href='BBScontent.asp?bcode=<%=rs("BCOde")%>&gotopage=<%=gotopage%>'" onMouseOver="this.style.background='<%=graycolor2%>'" onMouseOut="this.style.background='transparent'">

			<td id=tdg01><%=rs("BDepartment")%></td>
			<td id=tdg01><%=rs("BWriter")%></td>
			<td id=tdg01><%=mid(rs("BWriteDate"),3,8)%></td>
			<td id=tdg01><%=rs("BSubject")%></td>
			<td id=tdg01><%=rs("BContent")%></td>
		</tr>

		<%
      rs.movenext
      cnt=cnt+1
      loop
   end if

%>

	
			</table>
		</form>
	</body>
</html>