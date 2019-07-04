<!--#include file="../dbcon.asp" -->


<%



	title="넥스틸(주) 사내 쪽지 도착 알림"

	MCode=request("MCode")
	div=request("div")

	sql="select * from Mailbox where MCode='"&MCode&"'"
	set rs=dbconn.execute(sql)
	if rs.eof then
'response.write "에러"
	else
		MWriteDate		=	rs("MWriteDate")
		MWriterTeam		=	rs("MWriterTeam")
		MWriter			=	rs("MWriter")
		MReceiverTeam	=	rs("MReceiverTeam")
		MReceiver		=	rs("MReceiver")
		MSubject		=	rs("MSubject")
		MContent		=	rs("MContent")
		MContent = replace(MContent,chr(13) & chr(10),"<br>")	
'response.write MWriterTeam & "<br>"
'response.write MWriter & "<br>"

	end if
%>
<HTML>
<HEAD>
	<TITLE><%=title%></TITLE>
	<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
	<script language="javascript" src="../js/WinOpen.js"></script>
	<SCRIPT language=JavaScript src="inc/popup.js"></SCRIPT>
	<SCRIPT language=JavaScript>
		function MessageReply()
		{
			document.form.action="MessengerSend.asp?PageType=Reply";
			document.form.method="post";
			document.form.target="_self";
			document.form.submit();
		}
		function MessengerCheck(Mcode,ReadChk)
		{
			//document.form.action="PopMessengerReadChk.asp?MCode="+MCode+"&ReadChk="+ReadChk.value;
			//document.form.target="ifrm";
			//document.form.method="post";
			//document.form.submit();	
			document.form.action="PopMessengerReadChk.asp?Mcode="+Mcode+"&ReadChk="+ReadChk.value;
			document.form.method="post";
			document.form.target="ifrm";
			document.form.submit();


		}
		function popup(goPageURL,goPageName,goPageWidth,goPageHeight)
{
		window.open(goPageURL,goPageName,'width='+goPageWidth+',height='+goPageHeight+',menubar=no, scrollbars=no, resizable=no');
}


function popup1(goPageURL,goPageName,goPageWidth,goPageHeight)
{
		window.open(goPageURL,goPageName,'width='+goPageWidth+',height='+goPageHeight+',menubar=no, scrollbars=auto, resizable=no');
}
function popup2(goPageURL,goPageName,goPageWidth,goPageHeight)
{
		window.open(goPageURL,goPageName,'width='+goPageWidth+',height='+goPageHeight+',menubar=no, scrollbars=no, resizable=no');
}
function popupPhoto(goPageURL,goPageName,goPageWidth,goPageHeight)
{
		window.open(goPageURL,goPageName,'width='+goPageWidth+',height='+goPageHeight+',menubar=no, scrollbars=yes, resizable=yes');
}

function popuptarget(goPageURL,goPageName,goPageWidth,goPageHeight)
{	
	var nid = 0;
	var nch = 0;
	var tid = goPageName.toLowerCase();
	for(var i=0;i<tid.length;i++){
		nch = tid.charCodeAt(i);
		nid += (nch*(i+1));
	}
	
	window.open(goPageURL,nid,'width='+goPageWidth+',height='+goPageHeight+',menubar=no, scrollbars=auto, resizable=no');
}

		
		function openURL(url,KPI_EID,KPI_XGTeam)
		{
			
			window.open(url+"?KPI_EID="+KPI_EID+"&KPI_XGTeam="+KPI_XGTeam, "팝업", "scrollbars = yes, resizable=yes, width=1300,height=600")
		}


		function WinClose(mcode)
		{
			if(document.form.ReadChk[0].checked == true)
			{
				location.href="MessegeReadChk.asp?MCode="+mcode+"&ReadChk=true";
			}else
			{
				var result=confirm("메시지를 읽으셨습니까?");
				location.href="MessegeReadChk.asp?MCode="+mcode+"&ReadChk="+result;
			}
		}
		
function GoUrl(url,w,h,t,m)
{
	if (m=="post")
	{
		var ChildWin=window.open( '' , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,left=160,top=20,width="+w+",height="+h);
		document.form.action=url;
		document.form.method=m;
		document.form.target=t;
		document.form.submit();
		ChildWin.focus();
	}else{
		var ChildWin=window.open( url , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1 menubar=0,scrollbars=1,resizable=1,left=10,top=10,width="+w+",height="+h);
		ChildWin.focus();
	}
}
function WinGoUrl(url,left,top,w,h,t,m)
{
	if (m=="post")
	{
		var ChildWin=window.open('' , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,left="+left+",top="+top+",width="+w+",height="+h);
		document.form.action=url;
		document.form.method=m;
		document.form.target=t;
		document.form.submit();
		ChildWin.focus();
	}
	else
	{
		var ChildWin=window.open( url , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,left="+left+",top="+top+",width="+w+",height="+h);
		ChildWin.focus();
	}
}

function WinGoUrlM(url,left,top,w,h,t,m,mb)
{
	if (m=="post")
	{
		var ChildWin=window.open('' , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1,menubar="+mb+",scrollbars=1,resizable=1,left="+left+",top="+top+",width="+w+",height="+h);
		document.form.action=url;
		document.form.method=m;
		document.form.target=t;
		document.form.submit();
		ChildWin.focus();
	}
	else
	{
		var ChildWin=window.open( url , t,"fullscreen=0,toolbar=0,location=0,directories=0,status=1,menubar="+mb+",scrollbars=1,resizable=1,left="+left+",top="+top+",width="+w+",height="+h);
		ChildWin.focus();
	}
}






</script>








	</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0>
<FORM name=form>
<INPUT type="hidden" name=MCode value="<%=MCode%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriterCom value="<%=MReceiverCom%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriterTeam value="<%=MReceiverTeam%>" size="20" maxlength="20">
<INPUT type="hidden" name=MWriter value="<%=MReceiver%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiver value="<%=MWriter%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverID value="<%=MWriterID%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverCom value="<%=MWriterCom%>" size="20" maxlength="20">
<INPUT type="hidden" name=MReceiverTeam value="<%=MWriterTeam%>" size="20" maxlength="20">
<table align=center border=0 cellspacing="0" cellpadding=0 width="100%" bgcolor=#6E6E6E style="border-bottom:1 solid #414141">
	<tr>
		<td width="360" style="color:white;" height="20">&nbsp; ▒ &nbsp;<%=title%>&nbsp;</td>
	</tr>
</table>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5;border-bottom:1 solid <%=GrayLine%>;border-right:1 solid <%=GrayLine%>">
	<tr height=22>
		<td id=tdg01 width=25% align=right bgcolor="<%=color5%>" style="padding-right=5">보낸일시</TD>
		<td id=tdg01 style="padding-left=10">&nbsp;&nbsp;&nbsp;2019-06-14 19:55</TD>
		<!--<td id=tdg01 style="padding-left=10"><%=MWriteDate%></TD>-->
	</TR>
	<tr height=22>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">보낸사람/보낸부서</TD>
		<td id=tdg01 style="padding-left=10">&nbsp;&nbsp;홍길동/재무팀</TD>
		<!--<td id=tdg01 style="padding-left=10"><%=MWriterTeam%>&nbsp;<%=MWriter%></TD>-->
	</TR>
	<tr height=22>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">받는사람/받는부서</TD>
		<td id=tdg01 style="padding-left=10">&nbsp;&nbsp;이길동/기획팀</TD>
		<!--<td id=tdg01 style="padding-left=10"><%=MWriterTeam%>&nbsp;<%=MWriter%></TD>-->
	</TR>
	<tr height=22>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</TD>
		<td id=tdg01 style="padding-left=10">&nbsp;&nbsp;쪽지</TD>
		<!--<td id=tdg01 style="padding-left=10"><%=MSubject%></TD>-->
	</TR>
	</TR>
	<tr height=22>
		<td id=tdg01 align=right bgcolor="<%=color5%>" style="padding-right=5">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</TD>
		<td id=tdg01 style="padding-left=10">&nbsp;&nbsp;쪽지 확인부탁</TD>
		<!--<td id=tdg01 style="padding-left=10"><%=MSubject%></TD>-->
	</TR>
	<TR bgcolor="<%=color5%>"height=22>
		<TD colSpan=2 id=tdg01 align=center>
			<input type=radio name=ReadChk value="1" onclick="MessengerCheck('<%=MCode%>',this)"> 읽음
			<input type=radio name=ReadChk value="0" onclick="MessengerCheck('<%=MCode%>',this)" checked> 읽지않음
		</TD>
	</TR>
</TABLE>
<table align=center width="95%" border="0" cellspacing="0" cellpadding="0" style="margin-top:0">
	<TR>
		<TD style="PADDING-TOP: 10px" align=middle colSpan=2>
			<input type="BUTTON" value=" 답 장 " onClick="MessageReply();">
			<input type="button" name="B1" value="창닫기 "  onclick="javascript:window.close();">

		</TD>
	</TR>
</table>

</FORM>

<iframe id=ifrm name=ifrm align="left" width="0" height="0"></iframe>

</body>
</html>