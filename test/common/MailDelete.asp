<!--#include file="../dbcon.asp" -->
<%

	DelCode = request("DelCode")
	div = request("div")




	DelCode=split(DelCode,", ")
	k=ubound(DelCode)
'response.write k &"<br>"

			for i=1 to k 
'response.write "<" & i & "><BR><BR>"

		sql="select Mreadcheck from mailbox where MCode ='"& DelCode(i) & "' "	
'	response.write sql & "<br>"
		set rs=dbconn.execute(sql)




			if not rs.eof then


				

							sql1 = "delete from mailbox  "
							sql1 = sql1 & "WHERE MCode = '" & DelCode(i) & "' "

							'response.write ">>" & sql1 & "<br>"
							'response.end
							dbconn.execute sql1
							
			
			end if

		next



'Response.End
%>
<script language="javascript">
    alert('<%=div%>'+"���� ���õ� ���� "+<%=k%>+"���� �����Ǿ����ϴ�.")
	location.href="MailList.asp?div=<%=div%>"
</script>