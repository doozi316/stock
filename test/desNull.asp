<%
'---�Ϲ� �ֽ�
	Function FEmty(arg,str1)
		if arg <> "" then
			FEmty = arg
		else
			FEmty = str1
		end if
	end function

	Function FNull(arg,div) ' �ֽ�
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
						FNull = left(arg,4) & "��" & mid(arg,6,2) & "��" & mid(arg,9,2) & "��"
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
						FNull = left(arg,4) & "�� " & mid(arg,6,2) & "�� " & mid(arg,9,2) & "�� "
					Case "d5"
						FNull = left(arg,4) & "�� " & mid(arg,6,2) & "�� " & mid(arg,9,2) & "�� " & ToWeek(arg) & "����"
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
						FNull = left(arg,4) & "�� " & mid(arg,6,2) & "�� " & mid(arg,9,2) & "�� " &  Formatdatetime(arg,3)
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
						FNull = left(replace(replace(arg,"(��)",""),"(��)",""),7)
					Case "c3"
						FNull = left(replace(replace(arg,"(��)",""),"(��)",""),3)
					Case ELse
						FNull = arg
				END SELECT
			end if
		end if
	End Function



	'�Ѿ�� �Ķ���� ���� ������ �����ش�.
	'���� : ������ �� ���� CALL SubQueryLink()
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
			Case "t1"	'���� 10:30	(��:��)
				FTime = Left(arg,3) & FixNum(ArrTime(0),2) & ":" & FixNum(ArrTime(1),2)
			Case "t2"	'���� 10:30	(��:��:��)
				FTime = Left(arg,3) & FixNum(ArrTime(0),2) & ":" & FixNum(ArrTime(1),2) & ":" & FixNum(ArrTime(2),2)
			End Select
		End if
	End Function
	Function ToWeek(arg)
		SELECT CASE DatePart("w", arg)
		CASE 1
			ToWeek = "<FONT COLOR=RED>��</FONT>"
		CASE 2
			ToWeek = "��"
		CASE 3
			ToWeek = "ȭ"
		CASE 4
			ToWeek = "��"
		CASE 5
			ToWeek = "��"
		CASE 6
			ToWeek = "��"
		CASE 7
			ToWeek = "<FONT COLOR=BLUE>��</FONT>"
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


	'�������� 070424�� -> ��¥ 2007-4-24�� ��ȯ
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

	'�����ڸ� ���� ��) �Է� : FixNum(134,5), ��� : 00134
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

	'�����ڸ� ���� ��) �Է� : FixVal(134,5,'0'), ��� : 00134
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

	'��ȿ����
	Function PositNum(Posit, ReqNum)

		IntNum = ROUND(ReqNum,0) '����

		if CInt(Posit) > Len(IntNum) then	'�Ҽ������ϼ�
			if ReqNum < 1 then
				BPosit=CInt(Posit)-Len(IntNum)+1 '�ܿ� �Ҽ��� ���� �ڸ���
			else
				BPosit=CInt(Posit)-Len(IntNum) '�ܿ� �Ҽ��� ���� �ڸ���
			end if
			UnderNum = Round(ReqNum,BPosit) - IntNum '�Ҽ������� ���� ����
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


	'--HTML���ڵ�

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

	'--���� ���򱸺�

	Function PipeDivColor(arg)
		if arg = "���" then
			PipeDivColor = arg
		elseif arg = "��Ʈ" then
				PipeDivColor = "<font color=blue>" & arg & "</font>"
		elseif arg = "���" then
				PipeDivColor = "<font color=green>" & arg & "</font>"
		else
				PipeDivColor = "<font color=orange>" & arg & "</font>"
		end if
	end function

	'�ø��Լ�
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

'--------------------���߷� ��� �Լ�---------------------------------
Function ActualityWeight(width,thick,length)
	ActualityWeight = (width-thick) * thick * 0.02466 * length /1000
end Function


'------------------���� �ݿø� �Լ�--------------------------------
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
				LocationCodeToName = LCode & "(����1)"
			case "B1","B2","B3","B4","B5","B6"
				LocationCodeToName = LCode & "(����2)"
			case "C1","C2","C3","C4","C5"
				LocationCodeToName = LCode & "(����3����)"
			case "E1"
				LocationCodeToName = LCode & "(����1����)"
			case "F1"
				LocationCodeToName = LCode & "(����2����)"
			case "D1"
				LocationCodeToName = LCode & "(Y.POHANG)"
			case else
				LocationCodeToName = LCode
		end select
	End Function

	'CreateSelect �Լ� : HTML�� SELECT �� �ڵ����� ������
	'GetSql = ���� (����) �������� ���� ��û�� �׻� value�� ���־�� ��
	'GetName = select name (�̸�)
	'GetValue = select value (��)
	Function CreateSelect(GetSql,GetName,GetValue)
			Set rsTemp = Server.CreateObject("ADODB.Recordset")
			'response.write GetSql
			rsTemp.Open GetSql, dbcon,3
			response.write "<select name="&GetName&">"
			if GetValue <> "" then
				response.write "<option value="""&GetValue&""" >"&GetValue&"</option>"
			end if
			response.write "<option value="""">��ü</option>"
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
	
	'�����Ҵ� �����Һ� ����ü�� ������ �����ϰ� ����üũ �Լ�
	'����� : BuyerName
	function CheckSalesOffice(BuyerName)
		'������ ���� ���� ���� ����(20170222, ������)
			'��ü���� ���� �����ϴ� ��찡 �ִ��� ����
			checkDBuyer = BuyerName
			If checkDBuyer = "" then
				response.write "�߸��� �����Դϴ�.(��ü���� ����) �߸��� ������ �ƴѵ� �̸޽����� ���̴� ��� �����ý��������� �����ֽñ� �ٶ��ϴ�. "
				response.end 
			end if 
		
			'��ü�� ��翵���Ұ� ��ġ�ϴ��� Ȯ��
				'1. id�� �Ҽ����� �˾ƺ���.
				'2. ��ü������ ��翵���Ҹ� �˾ƺ���.	
				'3. �ΰ��� ���Ͽ� �����ϸ� �� �� �ְ� �Ѵ�.
		
					'1. id�� �Ҽ����� �˾ƺ���.
						sql = ""
						sql = sql & "select XGCusOffice,XGTeam,XGDept,ETeam,EID,egno,EName,XGNameK " & chr(13)
						sql = sql & "from IntraMember left join XGeneral on egno = xgno " & chr(13)
						sql = sql & "where XGQuit = '����' or XGQuit = '���' " & chr(13)  '(��ó����)'���' �߰�
						sql = sql & "and EID = '"&session("EID")&"' " & chr(13)
						Set pre_rs1 = Server.CreateObject("ADODB.Recordset")
						pre_rs1.Open SQL, dbcon,3	
		
					'2. ��ü������ ��翵���Ҹ� �˾ƺ���.	
						sql = ""
						sql = sql & "select CName,CCArea,CSalesCon " & chr(13)
						sql = sql & "from BCustomer  " & chr(13)
						sql = sql & "	where  " & chr(13)
						sql = sql & "		CName = '"&checkDBuyer&"' " & chr(13)						
						Set pre_rs2 = Server.CreateObject("ADODB.Recordset")
						pre_rs2.Open SQL, dbcon,3	
		
					'3. �ΰ��� ���Ͽ� �����ϸ� �� �� �ְ� �Ѵ�.(���￵���ҿ� �λ꿵������ ��츸 ����)
					
						'response.write  pre_rs1("XGTeam") &"/"&pre_rs2("CCArea") 
					
						if pre_rs1("XGTeam") = "���￵����" or pre_rs1("XGTeam") = "�λ꿵����" or pre_rs1("XGTeam") = "��ó����"  then '(��ó����)'��ó����'�߰�
							If pre_rs1("XGTeam") <> pre_rs2("CCArea")  then
								response.write "�߸��� �����Դϴ�.(������ ����ü�� �ƴմϴ�.) �߸��� ������ �ƴѵ� �̸޽����� ���̴� ��� �����ý��������� �����ֽñ� �ٶ��ϴ�. "
								response.end 
							end if 				
						end if 		
		'������ ���� ���� ���� �� 		 
	end function 
	
%>

<!--#include file="../inc/class.asp"-->

