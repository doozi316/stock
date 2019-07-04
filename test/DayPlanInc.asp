<%
	tdate=ToYear &"/"& ToMonth &"/"& i

'response.write tdate & "<br>"


'response.write i &"<br>1111"

	sql="select * from ZDiary where DRCode> 0 "
	sqle= " and DRDiv ='학교주요일정' " 
	sqlc= " and DRDiv ='학교업무일정' " 
	sqli= " and DRDiv ='개인일정' "
	sqlp=" and DRDate ='"&tdate&"' " 
	sqlo=" order by DRDate " 

	sqle=sql & sqle & sqlp & sqlo
'response.write sqle
'response.end
	set rse=dbcon.execute(sqle)
	
	if not rse.eof then
		do until rse.eof

		DRMemo = left(rse("DRMemo"),6)
		response.write "&nbsp;<a href=""javascript:Revise('"&rse("DRCode")&"','학교주요일정','"&ToYear&"','"&ToMonth&"','"&i&"','"&Name&"')""><FONT COLOR='darkgreen' style='font-size:9pt;'>"&DRMemo&"</FONT></A><br>"

		rse.movenext
		loop
	else
		response.write "<br>"
	end if

	sqlc=sql & sqlc & sqlp & sqlo
'response.write sqlc
'response.end
	set rsc=dbcon.execute(sqlc)
	
	if not rsc.eof then
		do until rsc.eof

		DRMemo = left(rsc("DRMemo"),20)
		response.write "<a href=""javascript:Revise('"&rsc("DRCode")&"','학교업무일정','"&ToYear&"','"&ToMonth&"','"&i&"','"&Name&"')""><IMG SRC='../Images/diaryS1.gif' WIDTH='62' HEIGHT='16' BORDER=0 ALT=''><br><FONT COLOR='#838383' style='font-size:8pt;'>"&DRMemo&"</FONT></A><br>"

		rsc.movenext
		loop
	end if
	sqli=sql & sqli & sqlp & sqlo
'response.write sqli
'response.end
	set rsi=dbcon.execute(sqli)
	
	if not rsi.eof then
		do until rsi.eof
		DRMemo = left(rsi("DRMemo"),20)

			response.write "<a href=""javascript:Revise('"&rsi("DRCode")&"','개인일정','"&ToYear&"','"&ToMonth&"','"&i&"','"&Name&"')""><IMG SRC='../Images/diary2.gif' WIDTH='57' HEIGHT='16' BORDER=0 ALT=''><br><FONT COLOR='#838383' style='font-size:8pt;'>"&DRMemo&"</FONT></a><br>"


		rsi.movenext
		loop
	end if


%>
