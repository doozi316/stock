<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Response.ContentType="text/html;charset=euc-kr"
	Session.codepage="949"
%>
<%
	const authorizedUsername = ""
	const authorizedPassword = " "
	
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
	
	if authorizeStatus = true then
		session("membershipUsername") = membershipUsername
		session("membershipPassword") = membershipPassword
		session.timeout = 12 * 60
	end if
	%>
	
<!Doctype html>
<html lang="ko")
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<title> 1 �ܰ� : �α��� </title>
	</head>
		<body>
		<header>
		<h1> 1 �ܰ� : �α��� </h1>
		</header>
		<hr/>
		<section>
			<% If authorizeStatus = true then%>
			<%'�α��� ���� �Ǿ��ٸ�' %>
			<p> �̹� �α��� �Ǿ� �ֽ��ϴ�. </p>
			<span><a href="./intraleft.asp"> Ŀ�´�Ƽ </a></span>
			<% else %>
			<%'�α��� ���� �Ǿ��ٸ�' %>
			<p> ����� �̸��� ��ȣ�� �Է��ϼ���. </p>
			<form action="./step2.asp" metho="post">
			<label for="trialUsername"> ����� �̸� : </label>
			<input type="text" id="trialUsername" name="TrialUsername"/>
			<label for="trialPassword"> ����� ��ȣ : </label>
			<input type="text" id="trialPassword" name="trialPassword"/>
			<input type="submit" value="�α���"/>
			</form>
			<% end if%>
			</section>
			<hr/>
			<footer>
			<p>
			<span><strong> 1�ܰ� (�α���)  </strong> | </span>			
			<span><a href="./step2.asp"> 2�ܰ� (����� ����)</a>|</span>
			<span><a href="./step3.asp"> 3�ܰ� (ȸ��������)</a>|</span>
			<span><a href="./step4.asp"> 4�ܰ� (�α׾ƿ�)</a>|</span>
			</p>
		</footer>
	</body>
</html>
  