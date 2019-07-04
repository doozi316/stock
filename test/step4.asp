<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%

	'Const authorizedUsername ="입력할 ID"
	'Const AuthorizedPassword = "패스워드"
	
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
		<h1> 4 단계 : 로그 아웃 </h1>
			</header>
				<hr />
				<section>
					<% if authorizeStatus = ture then %>
						<%'로그인 승인 되었다면' %>
						<p> 로그인 되었습니다. </p>
						<span><a href="./step1.asp"> 로그인 </a></span>
					<% else %>
						<%'로그인 거부 되었다면' %>
						<p> 로그 아웃 되었습니다. </p>
						<span><a href="./step1.asp"> 로그인 </a></span>
					<% end if%>
			</section>
			</hr>
			<footer>
			<p>
			<span><a href="./step1.asp"> 1단계 (로그인)</a>|</span>
			<span><a href="./step2.asp"> 2단계 (사용자 인증)</a>|</span>
			<span><a href="./step3.asp"> 3단계 (회원페이지)</a>|</span>
			<span><strong> 4단계 (로그아웃)  </strong> | </span>	
			</p>
		</footer>
	</body>
</html>