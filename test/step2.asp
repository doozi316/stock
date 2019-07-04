<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%
	Const authorizedUsername ="홍길동"
	Const AuthorizedPassword = "1234"
	
	Dim authorizeStatus
	authorizeStatus = false
	
	authorizeMembership trialUsername, trialPassword
	'TrialUsername : '로그인 하려는 사용자'
	'TrialPassword : '로그인 하려는 사용자의 패스워드'
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
			<title> 2단계 : 사용자 인증 </title>
			<style> a {color : #0000FF;} </style>
	</head>
		<body>
				<header>
					<h1> 2 단계 : 사용자 인증 </h1>
				</header>
				<hr />
				<section>
					<% if authorizeStatus = ture then %>
						<%'로그인 승인 되었다면' %>
						<p> 로그인 되었습니다. </p>
						<span><a href="./intraleft.asp"> 커뮤니티 </a></span>
					<% else %>
						<%'로그인 거부 되었다면' %>
						<p> 로그인 실패했습니다. </p>
						<p><a href="./step1.asp"> 로그인 화면 </a></p>
					<% end if%>
			</section>
			</hr>
			<footer>
					<p>
					<span><a href="./step1.asp"> 1단계 (로그인)</a>|</span>			
					<span><strong> 2단계 (사용자 인증)  </strong> | </span>
					<span><a href="./step3.asp"> 3단계 (회원페이지)</a>|</span>
					<span><a href="./step4.asp"> 4단계 (로그아웃)</a>|</span>
			</p>
		</footer>
	</body>
</html>
	