
<?php


$con = mysqli_connect('mirpasec.ddns.net:50106', 'extern_user', 'extern_pass', 'extern_user');
   if (!$con)
  {
     echo "MySQL 접속 에러 : ";
     echo mysqli_connect_error();
     exit();
  }



   //post방식으로 데이터를 받는다.
    $userID = $_POST["userID"];
    $userPassword = $_POST["userPassword"];
    $userEmail = $_POST["userEmail"];
    $userName = $_POST["userName"];
    $userPhone = $_POST["userPhone"];

    //데이터베이스에 값을 넣는부분
    $statement = mysqli_prepare($con, "INSERT INTO USER VALUES(?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($statement, "sssss", $userID, $userPassword, $userEmail, $userName, $userPhone);
    mysqli_stmt_execute($statement);

    //배열 선언후
    $response = array();
    $response["success"] = true;//success라는 인덱스에 true값을 넣어줌
	


    echo json_encode($response);//JSON형식으로 출력

  ?>
