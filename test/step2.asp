<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%
	Const authorizedUsername ="ȫ�浿"
	Const AuthorizedPassword = "1234"
	
	Dim authorizeStatus
	authorizeStatus = false
	
	authorizeMembership trialUsername, trialPassword
	'TrialUsername : '�α��� �Ϸ��� �����'
	'TrialPassword : '�α��� �Ϸ��� ������� �н�����'
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
	
	Dim trialUsername
	Dim trialPassword
	
	authorizeStatus = false
	
	If not isnull(Request.Form("trialUsername")) then
		TrialUsername= Request.Form("trialUsername")
	If not isnull(Request.Form("trialPassword")) then
		trialPassword= Request.Form("trialPassword")
		
		authorizeStatus = authorizeMembership(trialUsername,trialPassword)
		end if
	end if
	
	if authorizeStatus = true then
		Session("membershipUsername")= trialUsername
		Session("membershipPassword")= trialPassword
		Session.Timeout = 12 * 60
	End if
	%>
	
	<!DOCTYPE html>
	<html lang="ko">
	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
			<title> 2�ܰ� : ����� ���� </title>
			<style> a {color : #0000FF;} </style>
	</head>
		<body>
				<header>
					<h1> 2 �ܰ� : ����� ���� </h1>
				</header>
				<hr />
				<section>
					<% if authorizeStatus = ture then %>
						<%'�α��� ���� �Ǿ��ٸ�' %>
						<p> �α��� �Ǿ����ϴ�. </p>
						<span><a href="./intraleft.asp"> Ŀ�´�Ƽ </a></span>
					<% else %>
						<%'�α��� �ź� �Ǿ��ٸ�' %>
						<p> �α��� �����߽��ϴ�. </p>
						<p><a href="./step1.asp"> �α��� ȭ�� </a></p>
					<% end if%>
			</section>
			</hr>
			<footer>
					<p>
					<span><a href="./step1.asp"> 1�ܰ� (�α���)</a>|</span>			
					<span><strong> 2�ܰ� (����� ����)  </strong> | </span>
					<span><a href="./step3.asp"> 3�ܰ� (ȸ��������)</a>|</span>
					<span><a href="./step4.asp"> 4�ܰ� (�α׾ƿ�)</a>|</span>
			</p>
		</footer>
	</body>
</html>
	