<?php

$con = mysqli_connect('mirpasec.ddns.net:50106', 'extern_user', 'extern_pass', 'extern_user');

$result = mysqli_query($con, "SELECT * FROM STAT;");

$response = array();//배열 선언

while($row = mysqli_fetch_array($result)){
//response["userID"]=$row[0] ....이런식으로 됨.

array_push($response, array("productName"=>$row[0], "productNum"=>$row[1], "productManu"=>$row[2], "productDate"=>$row[3]));
}
//response라는 변수명으로 JSON 타입으로 $response 내용을 출력

echo json_encode(array("response"=>$response));

mysqli_close($con);
?>
