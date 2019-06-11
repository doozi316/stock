
<?php
  header('Content-Type: application/json');
  $con = mysqli_connect('mirpasec.ddns.net:50106', 'extern_user', 'extern_pass', 'extern_user');	

     $userID = $_POST["userID"];
     $userPassword = $_POST["userPassword"];

     $statement = mysqli_prepare($con, "SELECT * FROM USER WHERE userID = ? AND userPassword = ?");
     mysqli_stmt_bind_param($statement, "ss", $userID, $userPassword);
     mysqli_stmt_execute($statement);
     mysqli_stmt_store_result($statement);
     mysqli_stmt_bind_result($statement, $userID, $userPassword, $userEmail, $userName, $userPhone);

     $response = array();
     $response["success"] = false;

     while(mysqli_stmt_fetch($statement)){
      $response["success"] = true;
      $response["userID"] = $userID;
      $response["userPassword"] = $userPassword;
      $response["userEmail"] = $userEmail;
      $response["userName"] = $userName;
      $response["userPhone"] = $userPhone;
     }

     echo json_encode($response);
?>
