<% 
Dim dbConn    ' Connection ��ü ����
Dim rcdst          ' Record Set ��ü ����
 

Set dbConn = Server.CreateObject("ADODB.Connection")  ' ADODB
    
dbConn.Open "Driver={MySQL ODBC 3.51 driver}; Server=mirpasec.ddns.net;Port=50106; Database=extern_user; Uid=extern_user; Pwd=extern_pass;" ' Driver�� �ݵ�� MySQL ODBC 3.51 drvier �� ���ּ���!

dbConn.execute("set names euckr")   ' Caracter Set ���� �մϴ�.! (������ EUC-KR�� ���, �ѱ� ���� ������ �ذ��մϴ�.) UTF-8 ���� ���� ������� ������ �������� �����ŵ� �˴ϴ�.
    
 
%> 
