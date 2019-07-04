<%
'---일반 최신
	Function FEmty(arg,str1)
		if arg <> "" then
			FEmty = arg
		else
			FEmty = str1
		end if
	end function

	Function FNull(arg,div) ' 최신
		if div="z" then
			if ISNULL(arg) or arg = "" or arg = "0" then
				FNull = 0
			else
				FNull = arg
			end if
		elseif div="z2n" then
			if ISNull(arg) or arg = "" or arg = "0" then
				FNull = "&nbsp;"
			Else
				If IsNumeric(arg) Then
					FNull = FormatNumber(arg,0)
				else
					FNull = arg
				End if
			end if
		elseif div="z2u" then
			if arg = "0" then
				FNull = ""
			Else
				FNull = arg
			end if
		elseif div="e" then
			if ISNull(arg) or arg = "" then
				FNull = "&nbsp;"
			Else
				FNull = arg
			end If
		elseif div="s" then
			if ISNull(arg) or arg = "" then
				FNull = " "
			Else
				FNull = arg
			end if
		Else
			if ISNULL(arg) Or IsEmpty(arg) or arg = "0" or arg = "null"  then
				FNull = "&nbsp;"
			elseif arg = "1900-01-01" then
				FNull = "&nbsp;"
			elseif replace(arg," ","")="" then
				FNull = "&nbsp;"
			else
				SELECT Case Div
					Case "n"
						FNull = arg
					Case "d"
						FNull = mid(arg,3,8)
					Case "d0"
						if len(arg) > 6 then
							FNull = replace(mid(arg,3,8),"-","")
						else
							FNull = arg
						end if

					Case "d1"
						FNull = left(arg,4) & "년" & mid(arg,6,2) & "월" & mid(arg,9,2) & "일"
					Case "d2"
						FNull = mid(replace(mid(arg,3,8),"-",""),3,4)
					Case "d3"
						SplitArg = Split(arg," ")
						If Len(SplitArg(0)) = 6 Then
							tArg = FCDate(SplitArg(0)) & " " & SplitArg(1)
						Else
							tArg = arg
						End If
						FNull = replace(mid(tArg,3,8),"-","") & " " & Formatdatetime(tArg,4)
					Case "d4"
						FNull = left(arg,4) & "년 " & mid(arg,6,2) & "월 " & mid(arg,9,2) & "일 "
					Case "d5"
						FNull = left(arg,4) & "년 " & mid(arg,6,2) & "월 " & mid(arg,9,2) & "일 " & ToWeek(arg) & "요일"
					Case "d6"
						FNull = replace(mid(arg,5,6),"-","") & " " & Formatdatetime(arg,4)
					Case "d7"
						FNull = mid(replace(mid(arg,3,8),"-","/"),4,5)
					Case "d8"
						FNull = replace(mid(arg,5,6),"-","") & " " & Formatdatetime(arg,3)
					Case "d9"
'					response.write arg
'					response.write hour24(Formatdatetime(arg,4))
						FNull = replace(mid(arg,3,8),"-","") & " " & hour24(Formatdatetime(arg,4)) & ":" & Second0(Second(arg))
					Case "d12"
						FNull = left(arg,4) & "년 " & mid(arg,6,2) & "월 " & mid(arg,9,2) & "일 " &  Formatdatetime(arg,3)
					Case "d13"
						FNull = replace(mid(arg,5,7),"-","") & "<br> " & replace(Formatdatetime(arg,4),":","")
					Case "d14"
						FNull = left(arg,4) & ". " & CInt(mid(arg,6,2)) & ". " & CInt(mid(arg,9,2))
					Case "d15"
						FNull = left(arg,4) & ". " & CInt(mid(arg,6,2)) & ". " & CInt(mid(arg,9,2)) & " " &  Formatdatetime(arg,3)
					Case "d16"
'					response.write arg
'					response.write hour24(Formatdatetime(arg,4))
						FNull = mid(arg,3,8) & " " & hour24(Formatdatetime(arg,4))
					Case "d17"
						FNull = CInt(mid(arg,6,2)) & ". " & CInt(mid(arg,9,2))
					Case "m"
						FNull = Formatdatetime(arg,4)
					Case "m1"
						FNull = Formatdatetime(arg,3)
					Case "c"
						FNull = left(replace(replace(arg,"(주)",""),"(유)",""),7)
					Case "c3"
						FNull = left(replace(replace(arg,"(주)",""),"(유)",""),3)
					Case ELse
						FNull = arg
				END SELECT
			end if
		end if
	End Function



	'넘어온 파라미터 값을 나열해 보여준다.
	'사용법 : 페이지 맨 위에 CALL SubQueryLink()
	SUB SubQueryLink()
		QueryLink = ""
		response.write  "[GET] : "
		For each QueryItemName in Request.QueryString
			Execute(QueryItemName & " = Request.QueryString(""" & QueryItemName & """)")
			QueryLink = QueryLink & "&" & QueryItemName & "=" & Request.QueryString(QueryItemName)
		Next
		response.write "<br>"

		response.write "[POST] : "
		For each QueryItemName in Request.Form
			Execute(QueryItemName & " = Request.Form(""" & QueryItemName & """)")
			QueryLink = QueryLink & "&" & QueryItemName & "=" & Request.Form(QueryItemName)
		Next

		response.write QueryLink & "<br>"
	END SUB


	Function FTime(arg,div)
		If IsNull(arg) Or arg = "" Or arg = "null" Or IsEmpty(arg) Then
			FTime = "&nbsp;"
		Else
			ArrTime = right(arg,Len(arg)-3)
			ArrTime = Split(ArrTime,":")
			Select Case div
			Case "t1"	'오전 10:30	(시:분)
				FTime = Left(arg,3) & FixNum(ArrTime(0),2) & ":" & FixNum(ArrTime(1),2)
			Case "t2"	'오전 10:30	(시:분:초)
				FTime = Left(arg,3) & FixNum(ArrTime(0),2) & ":" & FixNum(ArrTime(1),2) & ":" & FixNum(ArrTime(2),2)
			End Select
		End if
	End Function
	Function ToWeek(arg)
		SELECT CASE DatePart("w", arg)
		CASE 1
			ToWeek = "<FONT COLOR=RED>일</FONT>"
		CASE 2
			ToWeek = "월"
		CASE 3
			ToWeek = "화"
		CASE 4
			ToWeek = "수"
		CASE 5
			ToWeek = "목"
		CASE 6
			ToWeek = "금"
		CASE 7
			ToWeek = "<FONT COLOR=BLUE>토</FONT>"
		END SELECT
	End Function

'	FLen(rs("DShape"),4)
	Function FLen1(rs,rslen)
		if ISNULL(rs) or rs="0" then
			FLen1 = "&nbsp;"
		elseif  replace(rs," ","") ="" then
			FLen1 = "&nbsp;"
		else
			FLen1= left(rs,rslen)
		end if
	End Function

	Function FLen(val,vallen)
		if ISNULL(val) or val="0" then
			FLen = "&nbsp;"
		elseif  replace(val," ","") ="" then
			FLen = "&nbsp;"
		else
			if LEN(val) > CINT(vallen) then
				FLen= left(val,vallen)
			else
				FLen= val
			end if
		end if
	End Function

	Function FRate(upper,down)
'		response.write down
		if down = "0" or down = 0 or down = "" or ISNULL(down) or ISEMPTY(down) then
			FRate = 0
		else
			FRate= upper/down
		end if
	End Function

	Function FDate(rs)
		if rs < 10 then
			FDate = "0"&rs
		else
			FDate= rs
		end if
	End Function


	'고정문자 070424를 -> 날짜 2007-4-24로 변환
	Function FCDate(FixNum6)
		FCDate = CDate("20" & Left(FixNum6,2) & "-" & Mid(FixNum6,3,2) & "-" & Right(FixNum6,2))
	End Function

	'FCode(rs("GoodsName"),rs("CoilCode"),rs("TGCode"))
	Function FCode(GoodsName,CoilCode,TGCode)
		if GoodsName="SQUARE" or GoodsName="ROUND" or GoodsName="bSQUARE" or GoodsName="bROUND" then
			FCode = TGCode
		elseif GoodsName="COIL" or GoodsName="SKELP"  then
			FCode = CoilCode
		else
			FCode = "&nbsp;"
		end if
	End Function

	Function FUnitWeight(GoodsName,arg)
'response.write "-->" & arg & "<br>"
		if GoodsName="ROUND" or GoodsName="SQUARE" or GoodsName="bROUND" or GoodsName="bSQUARE" then
			FUnitWeight = formatnumber(arg,2)
		else
			if arg >= 100 then
				FUnitWeight = formatnumber(arg,0)
			elseif arg >= 10 then
				FUnitWeight = formatnumber(arg,2)
			elseif arg >= 1 then
				FUnitWeight = formatnumber(arg,2)
			elseif IsNull(arg) or arg=0 then
				FUnitWeight = "&nbsp;"
			else
				FUnitWeight = formatnumber(arg,0)
			end if
		end if
	End Function

	Function FLength(goods,L)
		if goods="COIL" or goods="SKELP"then
			FLength="C"
		else
			FLength=L
		end if
	End Function

	'고정자리 숫자 예) 입력 : FixNum(134,5), 출력 : 00134
	Function FixNum(n,c)
		Dim i
		Dim zero
		i=1
		n="" & n
		do until i>Cint(c)
'			response.write "i=" & i & " | " & "C=" & c & " | " & "N=" & n & "<br>"
			if len(n) <= c-i then
				zero = "0" & zero
			else
				zero = zero
			end if
			i=i+1
		loop
		FixNum = zero + n
	End Function

	'고정자리 문자 예) 입력 : FixVal(134,5,'0'), 출력 : 00134
	Function FixVal(n,c,v)
		Dim i
		Dim val
		i=1
		n="" & n
		do until i>Cint(c)
'			response.write "i=" & i & " | " & "C=" & c & " | " & "N=" & n & "<br>"
			if len(n) <= c-i then
				val = v & val
			else
				val = val
			end if
			i=i+1
		loop
		FixVal = val + n
	End Function

	Function Zero2(val,n)
		if trim(val) = "0" then
			Zero2 = n
		else
			Zero2 = val
		end if
	End Function

	Function Zero2nbsp(val)
		if CStr(val) = "0" Or CStr(val) = "0.0" Or CStr(val) = "0.00" Or CStr(val) = "0.000" then
			Zero2nbsp = "&nbsp;"
		else
			Zero2nbsp = val
		end if
	End Function

	Function nbsp2Empty(str)
		if str = "&nbsp;" then
			nbsp2Empty = ""
		else
			nbsp2Empty = str
		end if
	End Function

	Function Empty2nbsp(str)
		if str <> "" then
			Empty2nbsp = str
		else
			Empty2nbsp = "&nbsp;"
		end if
	End Function

	Function RChecked(rs,val)
		if rs=val then
			RChecked = "checked"
		else
			RChecked = ""
		end if
	End Function

	Function FSelected(arg1,arg2)
		If arg1 = arg2 Then
			FSelected = "selected style='color:blue;'"
		Else
			Fselected = ""
		End if
	End Function

	Function FSelectedColor(arg1,arg2)
		If arg1 = arg2 Then
			FSelectedColor = "selected "
		Else
			FselectedColor = ""
		End if
	End Function

	Function FChecked(arg1,arg2)
		If arg1 = arg2 Then
			FChecked = "checked"
		Else
			FChecked = ""
		End if
	End Function

	Function FInChecked(arg1,arg2)
		If INSTR(arg1,arg2) > 0 Then
			FInChecked = "checked"
		Else
			FInChecked = ""
		End if
	End Function

	Function FRemarks(str,CutLen)
		if ISNULL(str) or ISEmpty(str) or str = "" then
			FRemarks = "&nbsp;"
		else
			CutRowNum = CINT(Len(Str) / CutLen)
			for i=0 to CutRowNum
				if i=0 then
					CutStr = Mid(Str,CutLen*i+1,CutLen)
				else
					CutStr = CutStr & "<br>" & Mid(Str,CutLen*i+1,CutLen)
				end if
			next
			FRemarks = CutStr
		end if
	End Function

	'유효숫자
	Function PositNum(Posit, ReqNum)

		IntNum = ROUND(ReqNum,0) '정수

		if CInt(Posit) > Len(IntNum) then	'소수점이하수
			if ReqNum < 1 then
				BPosit=CInt(Posit)-Len(IntNum)+1 '잔여 소숫점 이하 자리수
			else
				BPosit=CInt(Posit)-Len(IntNum) '잔여 소숫점 이하 자리수
			end if
			UnderNum = Round(ReqNum,BPosit) - IntNum '소수점이하 숫자 추출
		end if

		PositNum = IntNum + UnderNum

	End Function


	Function IsNBSP(Source,Target)
		If Source="&nbsp;" Then
			IsNBSP = Target
		Else
			IsNBSP = Source
		End if
	End Function

	Function Second0(arg)
		If arg = "0" Then
			Second0 = "00"
		Else
			Second0 = arg
		End If
	end function

	Function hour24(arg)
		If arg = "24:00" Then
			hour24 = "00:00"
		Else
			hour24 = arg
		End If
	end function


	'--HTML인코딩

	Function HTMLIncoding(arg)

		arg = replace(arg,"&","&amp;")
		arg = replace(arg,"&","&amp;")

		HTMLIncoding = arg
	end Function

	Function URLIncoding(arg)
		If arg <> "" then
			URLIncoding = replace(arg,"&","%26")
			URLIncoding = replace(arg,"#","%23")
		End If
	end Function

	'--관종 색깔구분

	Function PipeDivColor(arg)
		if arg = "흑관" then
			PipeDivColor = arg
		elseif arg = "쇼트" then
				PipeDivColor = "<font color=blue>" & arg & "</font>"
		elseif arg = "백관" then
				PipeDivColor = "<font color=green>" & arg & "</font>"
		else
				PipeDivColor = "<font color=orange>" & arg & "</font>"
		end if
	end function

	'올림함수
	function ceil(Pnanum,nanum)
		result1 = Pnanum/nanum
		result2 = round(Pnanum/nanum)
		if result1 <> result2 then
			variant_return = fix(result1) + 1
		else
			variant_return = result1
		end if
		ceil = variant_return
	end function

'--------------------실중량 계산 함수---------------------------------
Function ActualityWeight(width,thick,length)
	ActualityWeight = (width-thick) * thick * 0.02466 * length /1000
end Function


'------------------정수 반올림 함수--------------------------------
Function Yround(arg)
	Yround = Cdbl(Replace(FormatNumber(arg,0),",",""))
end function


Function ReplaceChar(str)
	ReplaceChar = ""
	If str <> "" Then
	str = replace(str, "<", "&lt")
	str = replace(str, ">", "&gt")
	str = replace(str, """", "&#34;")
	str = replace(str, "|", "&#124;")
	str = replace(str, "$", "&#36;")
	str = replace(str, "%", "&#37;")
	str = replace(str, "'", "&#39;")
	str = replace(str, "/", "&#47;")
	str = replace(str, "(", "&#40;")
	str = replace(str, ")", "&#41;")
	str = replace(str, ",", "&#44;")
	str = replace(str, " ", "&nbsp;")
	End If
	ReplaceChar = str
End Function

	Function LocationCodeToName(LCode)
		select case LCode
			case "A1","A2","A3","A4","A5"
				LocationCodeToName = LCode & "(본사1)"
			case "B1","B2","B3","B4","B5","B6"
				LocationCodeToName = LCode & "(본사2)"
			case "C1","C2","C3","C4","C5"
				LocationCodeToName = LCode & "(포항3공장)"
			case "E1"
				LocationCodeToName = LCode & "(경주1공장)"
			case "F1"
				LocationCodeToName = LCode & "(포항2공장)"
			case "D1"
				LocationCodeToName = LCode & "(Y.POHANG)"
			case else
				LocationCodeToName = LCode
		end select
	End Function

	'CreateSelect 함수 : HTML에 SELECT 를 자동으로 생성함
	'GetSql = 쿼리 (쿼리) 쿼리문의 값의 명청을 항상 value로 해주어야 함
	'GetName = select name (이름)
	'GetValue = select value (값)
	Function CreateSelect(GetSql,GetName,GetValue)
			Set rsTemp = Server.CreateObject("ADODB.Recordset")
			'response.write GetSql
			rsTemp.Open GetSql, dbcon,3
			response.write "<select name="&GetName&">"
			if GetValue <> "" then
				response.write "<option value="""&GetValue&""" >"&GetValue&"</option>"
			end if
			response.write "<option value="""">전체</option>"
			if not rsTemp.eof then  
				do until rsTemp.eof
					response.write "<option value="""&rsTemp.Fields(0).value&""">"&rsTemp.Fields(0).value&"</option>"
					rsTemp.movenext
				loop
			end if 
			rsTemp.close
			set rsTemp=nothing
			response.write  "</select>"
	end function
	
	'영업소는 영업소별 담당업체만 접근이 가능하게 에러체크 함수
	'고객사명 : BuyerName
	function CheckSalesOffice(BuyerName)
		'페이지 접근 권한 점검 시작(20170222, 오동언)
			'업체명이 없이 접근하는 경우가 있는지 점검
			checkDBuyer = BuyerName
			If checkDBuyer = "" then
				response.write "잘못된 접근입니다.(업체명이 없음) 잘못된 접근이 아닌데 이메시지가 보이는 경우 정보시스템팀으로 연락주시기 바랍니다. "
				response.end 
			end if 
		
			'업체의 담당영업소가 일치하는지 확인
				'1. id로 소속팀을 알아본다.
				'2. 업체명으로 담당영업소를 알아본다.	
				'3. 두개를 비교하여 동일하면 볼 수 있게 한다.
		
					'1. id로 소속팀을 알아본다.
						sql = ""
						sql = sql & "select XGCusOffice,XGTeam,XGDept,ETeam,EID,egno,EName,XGNameK " & chr(13)
						sql = sql & "from IntraMember left join XGeneral on egno = xgno " & chr(13)
						sql = sql & "where XGQuit = '재직' or XGQuit = '대기' " & chr(13)  '(열처리팀)'대기' 추가
						sql = sql & "and EID = '"&session("EID")&"' " & chr(13)
						Set pre_rs1 = Server.CreateObject("ADODB.Recordset")
						pre_rs1.Open SQL, dbcon,3	
		
					'2. 업체명으로 담당영업소를 알아본다.	
						sql = ""
						sql = sql & "select CName,CCArea,CSalesCon " & chr(13)
						sql = sql & "from BCustomer  " & chr(13)
						sql = sql & "	where  " & chr(13)
						sql = sql & "		CName = '"&checkDBuyer&"' " & chr(13)						
						Set pre_rs2 = Server.CreateObject("ADODB.Recordset")
						pre_rs2.Open SQL, dbcon,3	
		
					'3. 두개를 비교하여 동일하면 볼 수 있게 한다.(서울영업소와 부산영업소인 경우만 적용)
					
						'response.write  pre_rs1("XGTeam") &"/"&pre_rs2("CCArea") 
					
						if pre_rs1("XGTeam") = "서울영업소" or pre_rs1("XGTeam") = "부산영업소" or pre_rs1("XGTeam") = "열처리팀"  then '(열처리팀)'열처리팀'추가
							If pre_rs1("XGTeam") <> pre_rs2("CCArea")  then
								response.write "잘못된 접근입니다.(영업소 담당업체가 아닙니다.) 잘못된 접근이 아닌데 이메시지가 보이는 경우 정보시스템팀으로 연락주시기 바랍니다. "
								response.end 
							end if 				
						end if 		
		'페이지 접근 권한 점검 끝 		 
	end function 
	
%>

<!--#include file="../inc/class.asp"-->

