<?php

    include '../connection.php';

    $userEmail = $_POST['email'];

    $sqlQuery = "SELECT * FROM user_details WHERE email='$userEmail'";


    $resultOfQUery = $connectNow->query($sqlQuery);
    
    if($resultOfQUery->num_rows > 0){
        echo json_encode(array("emailFound"=>true));
    }
    else{
        echo json_encode(array("emailFound"=>false));
    }

?>