<!--#include file="../dbcon.asp" -->

	


<%
	response.write request("BDepartment") &"111"
	sql = "UPDATE BBS SET "
	sql = sql & " BWriteDate = now()"
	sql = sql & ", BWriter = '" & request("BWriter") & "' "
	sql = sql & ", BDepartment = '" & request("BDepartment") &"' "
	sql = sql & ", BSubject = '" &request("BSubject") &"' "
	sql = sql & ", BContent = '" &request("BContent") &"' "
	sql = sql & " where BCode ='" &request("Bcode") & "'"

	response.write sql
	'response.end

	dbconn.execute sql	
%>



<script language=javascript>
	alert("�ش� ������ �����Ǿ����ϴ�.");
	window.location.href="../Common/BBSList.asp";
	window.close();
</script>



