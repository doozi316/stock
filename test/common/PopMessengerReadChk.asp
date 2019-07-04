<!--#include file="../dbcon.asp" -->
<%
	Mcode = request("Mcode")
	ReadChk = request("ReadChk")

	SQL = "Update Mailbox Set MReadCheck = '" & ReadChk & "' " & Chr(13) & Chr(10)
	SQL = SQL & " where MCode = '" & Mcode & "' " & Chr(13) & Chr(10) 
	Response.write sql
	dbconn.Execute SQL

%>