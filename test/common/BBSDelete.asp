<!--#include file="../dbcon.asp" -->
<%
	


	Bcode=request("BCode")
	

	
sql="delete from BBS where BCode ='"& BCode &"'"
'response.write sql & "<br>"
	dbconn.execute(sql)
%>

<script language="javascript">
	alert("삭제되었습니다.");
	window.opener.location.reload();
	window.close();
</script>