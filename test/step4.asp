<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%

	'Const authorizedUsername ="�Է��� ID"
	'Const AuthorizedPassword = "�н�����"
	
	Dim authorizeStatus
	authorizeStatus = false
	
	authorizeMembership trialUsername, trialPassword
	
	function authorizeMembership(trialUsername, trialPassword)
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
	Dim memebershipUsername
	Dim membershipPassword
	
	authorizeStatus = false
	
	If not isnull(session("membershipUsername")) then
		If not isnull(session("membershipPassword")) then
		
			membershipUsername = Session("membershipUsername")
			membershipPassword = Session("membershipPassword")	
			
			authorizeStatus = authorizeMembership(membershipUsername, membershipPassword)
		end if
	end if
	session("membershipUsername") ="<undefined>"
	session("membershipPassword") ="<membershipPassword>"
	
	session.Abandon()
	%>
	<!Doctype html>
<html lang="ko")
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<style> a { color:#0000ff;} </style>
	</head>
		<body>
		<header>
		<h1> 4 �ܰ� : �α� �ƿ� </h1>
			</header>
				<hr />
				<section>
					<% if authorizeStatus = ture then %>
						<%'�α��� ���� �Ǿ��ٸ�' %>
						<p> �α��� �Ǿ����ϴ�. </p>
						<span><a href="./step1.asp"> �α��� </a></span>
					<% else %>
						<%'�α��� �ź� �Ǿ��ٸ�' %>
						<p> �α� �ƿ� �Ǿ����ϴ�. </p>
						<span><a href="./step1.asp"> �α��� </a></span>
					<% end if%>
			</section>
			</hr>
			<footer>
			<p>
			<span><a href="./step1.asp"> 1�ܰ� (�α���)</a>|</span>
			<span><a href="./step2.asp"> 2�ܰ� (����� ����)</a>|</span>
			<span><a href="./step3.asp"> 3�ܰ� (ȸ��������)</a>|</span>
			<span><strong> 4�ܰ� (�α׾ƿ�)  </strong> | </span>	
			</p>
		</footer>
	</body>
</html>