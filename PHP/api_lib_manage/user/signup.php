<?php
    include '../connection.php'; 

    //POST = send/save data to mysql db
    //GET = retrieve/read data from mysql db

    $userName = $_POST['username'];
    $userGender = $_POST['gender'];
    // $userDob = $_POST['Dob'];
    $userEmail =  $_POST['email'];
    $userPhone = $_POST['phone_no'];
    $userId = $_POST['student_id'];
    $userPassword = md5($_POST['pswd']);

    $sqlQuery = "INSERT INTO user_details SET username = '$userName', gender = '$userGender', email = '$userEmail', phone_no = '$userPhone', student_id = '$userId', pswd = '$userPassword'";

    $resultOfQUery = $connectNow->query($sqlQuery);
    
    if($resultOfQUery){
        echo json_encode(array("success"=>true));
    }
    else{
        echo json_encode(array("success"=>false));
    }

?>