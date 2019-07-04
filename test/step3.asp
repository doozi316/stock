<%@ LANGUAGE="VBScript" Codepage="949" %>
<%
	Response.CharSet="euc-kr"
	Response.CodePage="949"
	Session.codepage="949"
%>
<%

	Const authorizedUsername ="입력할 ID"
	Const AuthorizedPassword = "패스워드"
	
	Dim authorizeStatus
	authorizeStatus = false
	
	authorizeMembership trialUsername, trialPassword
	'TrialUsername : 로그인 하려는 사용자
	'TrialPassword : 로그인 하려는 사용자의 패스워드
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
					<title> 3 단계 : 회원 페이지 </title>
			</head>
			<body>
				<header>
					<h1> 3 단계 : 회원 페이지 </h1>
				</header>
				<hr/>
				<section>
					<% if authorizeStatus = true then %>
					<%' 로그인 승인 되었다면' %>
					<p> 회원 전용 페이지 </p>
					<p> 환영합니다. <%=membershipUsername%> 님. </p>
					<p> 쿠키 문자열 : </p>
					<pre><code><%=Request.ServerVariables("HTTP_COOKIE")%></code></pre>
					<p><a href="./step4.asp"> 로그아웃 </a><p>
					<% else %>
					<% '로그인 거부 되었다면'%>
					<p> 이 페이지를 보려면 로그인이 필요합니다.</p>
					<p><a href="./step1.asp"> 로그인 </a></p>
					<% end if%>
				</section>
				</hr>
				<footer>
					<p>
					<span><a href="./step1.asp"> 1단계 (로그인)</a>|</span>			
					<span><a href="./step2.asp">2단계 (사용자 인증)</a>|</span>
					<span><strong> 3단계 (회원 페이지)  </strong> | </span>
					<span><a href="./step4.asp"> 4단계 (로그아웃)</a>|</span>
			</p>
		</footer>
	</body>
</html>
	
	