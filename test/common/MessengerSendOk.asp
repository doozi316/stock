<!--#include file="../dbcon.asp" -->
<%

	DIM MCode			'일련번호(SQL 자동생성 ID)
	DIM MWriteDate		'등록일자
	DIM MWriterTeam		'보낸사람 소속팀
	DIM MWriter			'보낸사람 송신자
	DIM MReceiverTeam	'받는사람 소속팀
	DIM MReceiver		'받는사람 수신자
	DIM MSubject		'쪽지 제목
	DIM MContent		'쪽지 내용
	DIM MReadCheck		'읽음 여부


	
		
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
'response.end

		dbconn.Execute SQL


%>

<script language=javascript>
	alert("쪽지가 발송되었습니다.");
	window.location.href="MailList.asp?div=보낸쪽지함"
</script>

