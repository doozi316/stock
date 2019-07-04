<%

	Color="#009966"
	Color1="#417C85" '
	Color2="#529EA9" '
	Color3="#9FCAD0" 
	Color4="#C6E0E3" 
	Color5="#EEF5F7"
	trbgcolor="#F6F6F6"

	TextColor="#414141"
	TextColor1="#888888"
	VisitColor="#004891"
	LinkColor="#004993" 
	HoverColor="#004891" 
	GrayLine="#CDCDCD"
	PrintLine="#616161"

	GrayColor="#dcdcdc" '회색"
	GrayColor0="#797979" '진한 회색'
	GrayColor1="#E5E5E5" '회색"
	GrayColor2="#F5F5F5" '여린회색"
	GrayColor3="#FfFfFf" '여린회색"
	Input="border:solid 1px white;" 
	Input1="border:solid 1px #5C8E3E;"

	TrOverColor="#F5EFB4"
	TdOverColor="#FFCC00"
	TrOvC = "#F5EFB4"
	TdOvC = "#FFCC00"
'테이블 선택시 색변경 함수
	Function MOver(onMouseOverColor, onMouseOutColor)

		MOver = "onMouseOver=""this.style.backgroundColor='" & onMouseOverColor & "'"" onMouseOut=""this.style.backgroundColor='" & onMouseOutColor & "'"" " 
	End Function

%>

<style type="text/css">


	a:link   {text-decoration:none; color:<%=LinkColor%>;}
	a:visited  {text-decoration:none; color:<%=LinkColor%>;}
	a:hover  {text-decoration:underline; color:#C64F00;}

	input.calendar { behavior:url(../JS/htc_calendar4.htc);color:blue; }

	input.text{color:blue;}
	button.text{color:blue;}

	
	TABLE  
	{
		FONT-SIZE: 9pt;
		color: <%=textcolor%>;
		cursor:default;
	}
	INPUT
	{
		FONT-SIZE: 9pt; 
	}
	SELECT
	{
		FONT-SIZE: 9pt; 
	}

	#TDG01 
	{
		BORDER-LEFT:   <%=GrayLine%> 1px solid;
		BORDER-TOP:    <%=GrayLine%> 1px solid;
	}
	#TDG02 
	{
		BORDER-LEFT:   <%=GrayLine%> 1px solid;
		BORDER-TOP:    <%=GrayLine%> 1px solid;
		BORDER-Bottom:   <%=GrayLine%> 1px solid;
	}
	#TDG03 
	{
		BORDER-LEFT:   <%=GrayLine%> 1px solid;
		BORDER-RIGHT:    <%=GrayLine%> 1px solid;
		BORDER-TOP:    <%=GrayLine%> 1px solid;
		BORDER-Bottom:   <%=GrayLine%> 1px solid;
	}
	#TDGR01 
	{
		BORDER-LEFT:   <%=GrayLine%> 1px solid;
		BORDER-TOP:    <%=GrayLine%> 1px solid;
		BORDER-RIGHT:    <%=GrayLine%> 1px solid;
	}
	#TDGT01 
	{
		BORDER-Top:   <%=GrayLine%> 1px solid;
	}
	#TDGB01 
	{
		BORDER-Bottom:   <%=GrayLine%> 1px solid;
	}
	#TDL01 
	{
		BORDER-Left:   <%=GrayLine%> 1px solid;
	}

	#TDK01 
	{
		BORDER-LEFT:   black 1px solid;
		BORDER-TOP:    black 1px solid;
	}
	#TDKR01 
	{
		BORDER-LEFT:   black 1px solid;
		BORDER-TOP:    black 1px solid;
		BORDER-RIGHT:    black 1px solid;
	}
	#TD01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;
		BORDER-TOP:    <%=Color3%> 1px solid;
	}
	#TD01r 
	{
		BORDER-LEFT:   red 1px solid;
		BORDER-TOP:    <%=Color3%> 1px solid;
	}
	#TDR01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;
		BORDER-TOP:    <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
	}
	#TDTR
	{
		BORDER-TOP:    <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
	}
	#TDTR01
	{
		BORDER-TOP:    <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
		BORDER-Bottom:   <%=Color3%> 1px solid;
	}
	#TDTR02
	{
		BORDER-LEFT:    <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
		BORDER-Bottom:   <%=Color3%> 1px solid;
	}

	#TDL 
	{
		BORDER-Left:   <%=Color3%> 1px solid;
	}
	#TDB 
	{
		BORDER-Bottom:   <%=Color3%> 1px solid;
	}
	#TDBL 
	{
		BORDER-Left:   <%=Color3%> 1px solid;
		BORDER-Bottom:   <%=Color3%> 1px solid;
	}
	#TDR 
	{
		BORDER-RIGHT:   <%=Color3%> 1px solid;
	}
	#TDLR 
	{
		BORDER-Left:   <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
	}

	#TDB01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;
		BORDER-TOP:    <%=Color3%> 1px solid;
		BORDER-BOTTOM:   <%=Color3%> 1px solid;
	}
	#TDBR01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;
		BORDER-TOP:    <%=Color3%> 1px solid;
		BORDER-BOTTOM:   <%=Color3%> 1px solid;
	}
	#TT01 
	{
		BORDER-TOP:    <%=Color3%> 1px solid;
	}
	#TDT01 
	{
		BORDER-TOP:    <%=Color3%> 1px solid;
	}
	#TB01 
	{
		BORDER-Bottom:    <%=Color3%> 1px solid;
	}


	#TR01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;

	}
	#TRR01 
	{
		BORDER-LEFT:   <%=Color3%> 1px solid;
		BORDER-RIGHT:   <%=Color3%> 1px solid;

	}
	#TD03 
	{
		BORDER-RIGHT:   <%=Color3%> 1px solid;
		BORDER-Bottom:    <%=Color3%> 1px solid;

	}
	#TD02 
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-TOP:    <%=Color1%> 1px solid;

	}

	#TDR02
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-TOP:    <%=Color1%> 1px solid;
		BORDER-RIGHT:   <%=Color1%> 1px solid;
	}
	#TDB02 
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-TOP:    <%=Color1%> 1px solid;
		BORDER-BOTTOM:   <%=Color1%> 1px solid;
	}
	#TDBR02
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-RIGHT:   <%=Color1%> 1px solid;
		BORDER-TOP:    <%=Color1%> 1px solid;
		BORDER-BOTTOM:   <%=Color1%> 1px solid;
	}
	#L02
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;

	}
	#LR02
	{
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-RIGHT:   <%=Color1%> 1px solid;

	}#BLR02
	{
		BORDER-BOTTOM:   <%=Color1%> 1px solid;
		BORDER-LEFT:   <%=Color1%> 1px solid;
		BORDER-RIGHT:   <%=Color1%> 1px solid;

	}
	#TDGR05 
	{
		BORDER-LEFT:   <%=Color5%> 1px solid;
		BORDER-TOP:    <%=Color5%> 1px solid;
		BORDER-RIGHT:    <%=Color5%> 1px solid;
	}


</style>




