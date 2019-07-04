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
	alert("쪽지가 발송되었습니다.");
	window.location.href="MailList.asp?div=보낸쪽지함"
</script>

