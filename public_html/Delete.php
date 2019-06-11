<?php
  $con = mysqli_connect('mirpasec.ddns.net:50106', 'extern_user', 'extern_pass', 'extern_user');
     $productNum = $_POST["productNum"];
     $statement = mysqli_prepare($con, "DELETE FROM stat WHERE productNum = ?");
     mysqli_stmt_bind_param($statement, "s", $productNum);


     mysqli_stmt_execute($statement);
     //배열 선언 후
     $response = array();
     //success에 true라는 값을 넣어줌
     $response["success"] = true;
     echo json_encode($response);
?>
