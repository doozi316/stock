<%@ Language=VBScript %>
<!--#include file="../dbcon.asp" -->

<%
		
		SQL = "INSERT INTO Mailbox(MWriteDate,MWriter,MWriterTeam,MReceiver,MReceiverTeam,MSubject,MContent,MReadCheck) VALUES ("
		SQL = SQL & "now()"
		SQL = SQL & ",'" & request("Mwriter") & "'" 
		SQL = SQL & ",'" & request("MwriterTeam") & "'"
		SQL = SQL & ",'" & request("Mreceiver") & "'"  
		SQL = SQL & ",'" & request("MreceiverTeam") & "'"  
		SQL = SQL & ",'" & request("Msubject") & "'" 
		SQL = SQL & ",'" & request("Mcontent")& "'" 
		SQL = SQL & ",'" & 0 & "')" 
response.write sql

		dbconn.Execute SQL

%>

<script language=javascript>
	alert("������ �߼۵Ǿ����ϴ�.");
	window.location.href="MailList.asp?div=����������"
</script>

