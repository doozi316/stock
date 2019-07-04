<% 
Dim dbConn    ' Connection 객체 선언
Dim rcdst          ' Record Set 객체 선언
 

Set dbConn = Server.CreateObject("ADODB.Connection")  ' ADODB
    
dbConn.Open "Driver={MySQL ODBC 3.51 driver}; Server=mirpasec.ddns.net;Port=50106; Database=extern_user; Uid=extern_user; Pwd=extern_pass;" ' Driver는 반드시 MySQL ODBC 3.51 drvier 로 해주세요!

dbConn.execute("set names euckr")   ' Caracter Set 설정 합니다.! (서버가 EUC-KR인 경우, 한글 깨짐 문제를 해결합니다.) UTF-8 문자 집합 서버라면 별도로 지정하지 않으셔도 됩니다.
    
 
%> 
