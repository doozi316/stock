<!--#include file="dbcon.asp" -->
<%
	dexedate = request("dexedate")

	response.write dexedate
'response.end
	DRMemo=replace(request("DRMemo"),"'","''")
	DRMemo=Replace(DRMemo, Chr(34), "&#34;")

	SQL = "INSERT INTO Diary(dwritetime,dwriter,dsubject,ddiv, dwork, dcontent) VALUES ("
	sql = sql & " now() "
	SQL = SQL & ",'" & request("dwriter") & "' "
	SQL = SQL & ",'" & request("dsubject") & "' "
	SQL = SQL & ",'" & request("ddiv") & "' "
	SQL = SQL & ",'" & request("dwork") & "' "
	SQL = SQL & ",'" & request("dcontent") & "' "
	SQL = SQL & ")"
response.write SQL
'response.end
	dbconn.Execute SQL


%>

<script language=javascript>
	alert("�ش��ڷᰡ �ԷµǾ����ϴ�.");
	self.close();
	window.opener.location.reload();
</script>



