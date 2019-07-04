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
		<title> 1 단계 : 로그인 </title>
	</head>
		<body>
		<header>
		<h1> 1 단계 : 로그인 </h1>
		</header>
		<hr/>
		<section>
			<% If authorizeStatus = true then%>
			<%'로그인 승인 되었다면' %>
			<p> 이미 로그인 되어 있습니다. </p>
			<span><a href="./intraleft.asp"> 커뮤니티 </a></span>
			<% else %>
			<%'로그인 승인 되었다면' %>
			<p> 사용자 이름과 암호를 입력하세요. </p>
			<form action="./step2.asp" metho="post">
			<label for="trialUsername"> 사용자 이름 : </label>
			<input type="text" id="trialUsername" name="TrialUsername"/>
			<label for="trialPassword"> 사용자 암호 : </label>
			<input type="text" id="trialPassword" name="trialPassword"/>
			<input type="submit" value="로그인"/>
			</form>
			<% end if%>
			</section>
			<hr/>
			<footer>
			<p>
			<span><strong> 1단계 (로그인)  </strong> | </span>			
			<span><a href="./step2.asp"> 2단계 (사용자 인증)</a>|</span>
			<span><a href="./step3.asp"> 3단계 (회원페이지)</a>|</span>
			<span><a href="./step4.asp"> 4단계 (로그아웃)</a>|</span>
			</p>
		</footer>
	</body>
</html>
  