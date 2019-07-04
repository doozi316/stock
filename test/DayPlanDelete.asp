<!--#include file="../inc/dbcon.asp"-->
<%	
	server.execute("/LogPage/LogPage.asp")

'response.write request("DRWriter")
	sql="Delete from DayReport where DRCode='"&request("DRCode")&"'"
'response.write sql
'response.end
	dbcon.execute sql
%>

<script language=javascript>
	alert("해당 정보가 삭제되었습니다.");
	window.opener.location.reload();
	window.close();	
</script>

