<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%

	Const authorizedUsername ="�Է��� ID"
	Const AuthorizedPassword = "�н�����"
	
	Dim authorizeStatus
	authorizeStatus = false
	
	authorizeMembership trialUsername, trialPassword
	'TrialUsername : �α��� �Ϸ��� �����
	'TrialPassword : �α��� �Ϸ��� ������� �н�����
	Function authorizeMembership(trialUsername, trialPassword)
	
	if StrComp(trialUsername,authorizedUsername) = 0 then
		if StrComp(trialPassword, authorizedPassword) = 0 then
		authorizeMembership = true
		Exit function
		end if
	end if
	authorizeMembership = false
	End function
	%>
	<%
	Dim membershipUsername
	Dim membershipPassword
	
	authorizeStatus = false
	
		if not isnull(session("membershipUsername")) then
			If not isnull(session("membershipPassword")) then
				membershipUsername = session("membershipUsername")
				membershipPassword = session("membershipPassword")
				
				authorizeStatus = authorizeMembership(membershipUsername,membershipPassword)
			end if
		end if
		
		if authorizeStatus = true then
		session("membershipUsername") = membershipUsername
		session("membershipPassword") = membershipPassword
		session.Timeout = 12 * 60
		end if
		%>
		<!DOCTYPE html>
		<html lang="ko">
			<head>
					<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
					<title> 3 �ܰ� : ȸ�� ������ </title>
			</head>
			<body>
				<header>
					<h1> 3 �ܰ� : ȸ�� ������ </h1>
				</header>
				<hr/>
				<section>
					<% if authorizeStatus = true then %>
					<%' �α��� ���� �Ǿ��ٸ�' %>
					<p> ȸ�� ���� ������ </p>
					<p> ȯ���մϴ�. <%=membershipUsername%> ��. </p>
					<p> ��Ű ���ڿ� : </p>
					<pre><code><%=Request.ServerVariables("HTTP_COOKIE")%></code></pre>
					<p><a href="./step4.asp"> �α׾ƿ� </a><p>
					<% else %>
					<% '�α��� �ź� �Ǿ��ٸ�'%>
					<p> �� �������� ������ �α����� �ʿ��մϴ�.</p>
					<p><a href="./step1.asp"> �α��� </a></p>
					<% end if%>
				</section>
				</hr>
				<footer>
					<p>
					<span><a href="./step1.asp"> 1�ܰ� (�α���)</a>|</span>			
					<span><a href="./step2.asp">2�ܰ� (����� ����)</a>|</span>
					<span><strong> 3�ܰ� (ȸ�� ������)  </strong> | </span>
					<span><a href="./step4.asp"> 4�ܰ� (�α׾ƿ�)</a>|</span>
			</p>
		</footer>
	</body>
</html>
	
	