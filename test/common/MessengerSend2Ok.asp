<!--#include file="../inc/dbcon.asp"-->
<!--#include file="../login/sessionOut.asp" -->
<%
	server.execute("/LogPage/LogPage.asp")

	DIM MCode			'�Ϸù�ȣ(SQL �ڵ����� ID)
	DIM MWriteDate		'�������
	DIM MWriterCom		'������� �Ҽ�ȸ��
	DIM MWriterTeam		'������� �Ҽ���
	DIM MWriter			'������� �۽���
	DIM MWriterID		'������� �۽���ID
	DIM MReceiverCom	'�޴»�� �Ҽ�ȸ��
	DIM MReceiverTeam	'�޴»�� �Ҽ���
	DIM MReceiver		'�޴»�� ������
	DIM MReceiverID		'�޴»�� ������ID
	DIM MSubject		'���� ����
	DIM MContent		'���� ����
	DIM MFile1			'���� ����1
	DIM MFileSize1		'���� ���� ������1
	DIM MFile2			'���� ����2
	DIM MFileSize2		'���� ���� ������2
	DIM MReadCheck		'���� ����
	DIM	MReserveChk		'����üũ
	DIM MReserveDate	'��������
	DIM MReserveHour	'�����
	DIM MReserveMin		'�����
	Dim memberch		'�޴»��

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
		MFileSize1		=	Chk_MFileSize(MFile1,"MFile1")'���ε������� ������ ���ϻ�����(KB)�� ��ȯ
		MFile2			=	FileUpLoad("MFile2","3145728","/Down/","")
		MFileSize2		=	Chk_MFileSize(MFile2,"MFile2")'���ε������� ������ ���ϻ�����(KB)�� ��ȯ

		Memberch		=   FileForm("memberch")
		MReceiver		=	FileForm("MReceiver")

		MReserveChk		=	FileForm("MReserveChk")
		MReserveDate	=	FileForm("MReserveDate")
		MReserveHour	=	FileForm("MReserveHour")
		MReserveMin		=	FileForm("MReserveMin")
		
		

		MSendCnt		=	1	'�߼ۼ� ���


	
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
	'DEXT.FileUpload ������Ʈ�� �̿��Ͽ� ���ε� ����� �Ѵ�.
	'Writer : �ѽ¸�
	Function FileUpLoad(ReqName,MaxSize,VitualPath,ChangeName)
		'ReqName : ���ϸ�����Ʈ ����
		'MaxSize : ���ε����뷮(KB)
		'VitualPath : ���� ���� ���
		'ChangeName : ������ ���ϸ� (����"" �̸� ���ε��ϴ� ���ϸ��� ����Ʈ)

		if FileForm(ReqName) <> "" then
			Files=Split(FileForm(ReqName).FileName,".")
			Select Case UCASE(Files(UBound(Files)))
			Case "ASP", "PHP", "HTM", "HTML", "XML", "JS", "PL", "JSP", "CGI"
	%>
				<script language=javascript>
					alert("�� ���α׷� ������ ���ε� ��ų�� �����ϴ�.\n\n�ٽ� Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.");
					history.back();
				</script>
	<%
				FileUpLoad = false
				response.end
			Case else
				if FileForm(ReqName).FileLen <= CLng(MaxSize) then
						'������ ���� ��ο� ���� ����
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
						alert("������ �뷮�� <%=formatnumber(MaxSize,0)%> Byte ���� �۾ƾ� �մϴ�.\n\n�ٽ� Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.");
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
			Chk_MFileSize = FileForm(ReqName).FileLen 'KB ����
		end if
	End Function
%>
