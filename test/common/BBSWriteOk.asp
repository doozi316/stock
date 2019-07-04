<!--#include file="../dbcon.asp" -->

<%	
	
	sql="select Max(BCode)MaxCode from BBS"
	set rsb=dbconn.execute(sql)

	sql="select * from BBS where BCode='"&rsb("MaxCode")&"' "
	SQL = SQL & " and BSubject = '" & BSubject & "' "
'	SQL = SQL & " and BContent = '" & BContent & "' "
'response.write SQL
'response.end
	set rsc=dbconn.execute(sql)

	if rsc.eof then
		SQL = "INSERT INTO BBS(Bdepartment ,BWriteDate,BWriter,BSubject,BContent,BCount) VALUES ("		
		SQL = SQL & "'" &  request("BDepartment") & "'"
		SQL = SQL & ",now()"
		SQL = SQL & ",'" &request("BWriter") & "'"
		SQL = SQL & ",'" &request("BSubject") & "'"
		SQL = SQL & ",'" &request("BContent") & "'"
		SQL = SQL & ",'" & 0 & "')"
		dbconn.Execute SQL
		response.write sql
	end if
%>

<script language=javascript>
	alert("공지사항이 입력되었습니다.");
	window.location.href="../Common/BBSList.asp";
</script>
