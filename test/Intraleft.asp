<!--#include file="dbcon.asp" -->
<%
	ThisPage = "Intraleft.asp"
	width="135"
%>

<html>

<head>



 <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Community</title>


</head>
<body topmargin="0">
<form name=form>
			<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:0;">
				<tr >

			<td><IMG SRC="images/intranet_01.PNG" WIDTH="400" HEIGHT="150" BORDER=0 ALT=""></td>
			</tr>
			</table>

			<!-- 공지사항 -->
				<table width="400" height="200 cellpadding="0" cellspacing="0" style="margin-top:100; margin-left:20;margin-left:0; ">
					
					<tr>
							<td align=center ><a href="../Common/BBSList.asp" target="_self"><IMG SRC="images/공지사항.PNG"  WIDTH="142" HEIGHT="22" BORDER=0 ALT=""></a></td>
					</tr>			
			<!-- 사내쪽지 -->
					
					<tr>
							<td align=center ><a href="../Common/MailList.asp?Div=받은쪽지함" target="_self"><IMG SRC="images/받은쪽지함.PNG"  WIDTH="142" HEIGHT="22" BORDER=0 ALT=""></a></td>
					</tr>

						
					<tr>
							<td align=center ><a href="../Common/MessengerSend2.asp" target="_self"><IMG SRC="images/쪽지보내기.PNG"  WIDTH="142" HEIGHT="22" BORDER=0 ALT=""></a></td>
					</tr>
					
					<tr>
							<td align=center ><a href="../Common/MailList.asp?Div=보낸쪽지함" target="_self"><IMG SRC="images/보낸쪽지함.PNG"  WIDTH="142" HEIGHT="22" BORDER=0 ALT=""></a></td>
					</tr>
					
					<tr>
							<td align=center ><a href="../DayPlan.asp" target="_self"><IMG SRC="images/월별계획.PNG"  WIDTH="142" HEIGHT="22" BORDER=0 ALT=""></a></td>
					</tr>
					
				 </table>
			
		</form>

	</body>

</html>

