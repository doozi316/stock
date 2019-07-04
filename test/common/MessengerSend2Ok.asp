<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../login/sessionOut.asp" -->
<%
	server.execute("/LogPage/LogPage.asp")

	DIM MCode			'일련번호(SQL 자동생성 ID)
	DIM MWriteDate		'등록일자
	DIM MWriterCom		'보낸사람 소속회사
	DIM MWriterTeam		'보낸사람 소속팀
	DIM MWriter			'보낸사람 송신자
	DIM MWriterID		'보낸사람 송신자ID
	DIM MReceiverCom	'받는사람 소속회사
	DIM MReceiverTeam	'받는사람 소속팀
	DIM MReceiver		'받는사람 수신자
	DIM MReceiverID		'받는사람 수신자ID
	DIM MSubject		'쪽지 제목
	DIM MContent		'쪽지 내용
	DIM MFile1			'쪽지 파일1
	DIM MFileSize1		'쪽지 파일 사이즈1
	DIM MFile2			'쪽지 파일2
	DIM MFileSize2		'쪽지 파일 사이즈2
	DIM MReadCheck		'읽음 여부
	DIM	MReserveChk		'예약체크
	DIM MReserveDate	'예약일자
	DIM MReserveHour	'예약시
	DIM MReserveMin		'에약분
	Dim memberch		'받는사람

	SET FileForm = Server.CreateObject("DEXT.FileUpload")
		FileForm.DefaultPath="C:\TEMP"
		MWriteDate		=	"GETDATE()"
		MWriterCom		=	session("ECom")
		MWriterTeam		=	session("ETeam")
		MWriter			=	session("EName")
		MWriterID		=	session("EID")

		MSubject		=	replace(FileForm("MSubject"),"'","''")
		MContent		=	replace(FileForm("MContent"),"'","''")
		MFile1			=	FileUpLoad("MFile1","3145728","/Down/","")
		MFileSize1		=	Chk_MFileSize(MFile1,"MFile1")'업로드파일이 있으면 파일사이즈(KB)를 반환
		MFile2			=	FileUpLoad("MFile2","3145728","/Down/","")
		MFileSize2		=	Chk_MFileSize(MFile2,"MFile2")'업로드파일이 있으면 파일사이즈(KB)를 반환

		Memberch		=   FileForm("memberch")
		MReceiver		=	FileForm("MReceiver")

		MReserveChk		=	FileForm("MReserveChk")
		MReserveDate	=	FileForm("MReserveDate")
		MReserveHour	=	FileForm("MReserveHour")
		MReserveMin		=	FileForm("MReserveMin")
		
		

		MSendCnt		=	1	'발송수 계산


	
	SET FileForm = Nothing
	Memberp = Split(Memberch,",")
	Memcount = UBound(Memberp)

	For i = 0 To Memcount
		sql = "SELECT EName,ETeam FROM IntraMember where EID = '" & Trim(Memberp(i)) & "' "
		Set rsInfo = dbcon.execute(sql)

	
		SQL = "INSERT INTO IntraMail(MWriteDate,MWriterTeam,MWriter,MWriterID,MReceiver,MReceiverID,MReceiverTeam,MSubject,MContent,MFile1,MFileSize1,MFile2,MFileSize2,MReadCheck,MReserveChk,MReserveDate,MReserveHour,MReserveMin) VALUES ("
		sql = sql & "GETDATE()"
		SQL = SQL & ",'" & MWriterTeam & "'"  
		SQL = SQL & ",'" & MWriter & "'" 
		SQL = SQL & ",'" & MWriterID & "'"
		SQL = SQL & ",'" & rsInfo("EName") & "'"  
		SQL = SQL & ",'" & Trim(Memberp(i)) & "'"  
		SQL = SQL & ",'" & rsInfo("ETeam") & "'"
		SQL = SQL & ",'" & MSubject & "'" 
		SQL = SQL & ",'" & MContent & "'" 
		SQL = SQL & ",'" & MFile1 & "'" 
		SQL = SQL & ",'" & MFileSize1 & "'" 
		SQL = SQL & ",'" & MFile2 & "'" 
		SQL = SQL & ",'" & MFileSize2 & "'" 
		SQL = SQL & ",'" & 0 & "'" 
		SQL = SQL & ",'" & MReserveChk & "'" 
		SQL = SQL & ",'" & MReserveDate & "'" 
		SQL = SQL & ",'" & MReserveHour & "'" 
		SQL = SQL & ",'" & MReserveMin & "'"
		SQL = SQL & ")" 
'response.write sql & "<br><br>"
		dbcon.Execute SQL		

	Next
	
%>

<script language=javascript>
		location.href="MessengerSendOkConfirm2.asp?memberch=<%=memberch%>&MSendCnt=<%=MSendCnt%>";
</script>

<%
	'DEXT.FileUpload 컴포넌트를 이용하여 업로드 기능을 한다.
	'Writer : 한승만
	Function FileUpLoad(ReqName,MaxSize,VitualPath,ChangeName)
		'ReqName : 파일리퀘스트 변수
		'MaxSize : 업로드허용용량(KB)
		'VitualPath : 서버 로컬 경로
		'ChangeName : 저장할 파일명 (공백"" 이면 업로드하는 파일명이 디폴트)

		if FileForm(ReqName) <> "" then
			Files=Split(FileForm(ReqName).FileName,".")
			Select Case UCASE(Files(UBound(Files)))
			Case "ASP", "PHP", "HTM", "HTML", "XML", "JS", "PL", "JSP", "CGI"
	%>
				<script language=javascript>
					alert("웹 프로그램 파일은 업로드 시킬수 없습니다.\n\n다시 확인하여 주시기 바랍니다.");
					history.back();
				</script>
	<%
				FileUpLoad = false
				response.end
			Case else
				if FileForm(ReqName).FileLen <= CLng(MaxSize) then
						'지정된 가상 경로에 파일 저장
	'response.write UpLoadPath & "<br><br>"
					if ChangeName <> "" then
						CutDot = split(FileForm(ReqName).FileName,".")
						ChkFileName = ChangeName& "." & CutDot(UBOUND(CutDot))
					else
						ChkFileName = FileForm(ReqName).FileName
					end if
					PathName = VitualPath & replace(ChkFileName,",","")

					ServerFilePath = FileForm(ReqName).SaveAsVirtual(PathName,false)
					CutFilePath = split(ServerFilePath,"\")
					FileUpLoad = CutFilePath(UBOUND(CutFilePath))
				else
	%>
					<script language=javascript>
						alert("파일의 용량은 <%=formatnumber(MaxSize,0)%> Byte 보다 작아야 합니다.\n\n다시 확인하여 주시기 바랍니다.");
						history.back();
					</script>
	<%
					FileUpLoad = false
					response.end
				end if
			End Select
	'response.write "[Uploaded File Information] <BR>"
	'response.write "FileName : " & FileForm(ReqName).FileName & "<BR>" 
	'response.write "FullPath : " & FileForm(ReqName).FilePath & "<BR>" 
	'response.write "FileLength : " & FileForm(ReqName).FileLen & " Byte(s)<BR>" 
	'response.write "MimeType : " & FileForm(ReqName).MimeType & "<BR>"
		else
			FileUpLoad = ""
		end if
	End Function

	Function Chk_MFileSize(FileUpLoad,ReqName)

		if FileUpload = "" or FileUpload = false then
			Chk_MFileSize = "0"
		else
			Chk_MFileSize = FileForm(ReqName).FileLen 'KB 단위
		end if
	End Function
%>
