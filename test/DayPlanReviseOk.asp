<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../Login/sessionOut.asp" -->
<%
	server.execute("/LogPage/LogPage.asp")

	DRMemo=replace(request("DRMemo"),"'","''")
	DRMemo=Replace(DRMemo, Chr(34), "&#34;")

	sql = "UPDATE DayReport SET "
	sql = sql & " DRWriteDate = getdate()  "
	sql = sql & ", DRCom = '" & Session("ECom") & "' "
	sql = sql & ", DRDept = '" & Request("DRDept")& "' "
	sql = sql & ", DRWriter = '" & session("EName")& "' "
	sql = sql & ", DRDiv = '" & Request("DRDiv")& "' "
	sql = sql & ", DRWork = '" & Request("DRWork")& "' "
	sql = sql & ", DRStartDate = '" & Request("DRStartDate")& "' "
	sql = sql & ", DREndDate = '" & Request("DREndDate")& "' "
	sql = sql & ", DRMemo = '" & DRMemo& "' "
	sql = sql & " where DRCode ='"& Request("DRCode") &"'"

'response.write sql
'response.end
	dbcon.execute sql

%>

<script language=javascript>
	alert("해당 정보가 수정되었습니다.");
	window.opener.location.reload();
	window.close();
</script>

