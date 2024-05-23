<?php
require('conn.php');

$first_name = $_POST['first_name'];
$second_name = $_POST['second_name'];
$company_id = $_POST['company_id'];
$gender_id = $_POST['gender_id'];

$hasUser = $conn->query("SELECT * FROM Users WHERE first_name = '$first_name' AND second_name = '$second_name' AND company_id = $company_id AND gender_id = $gender_id")->num_rows;
if($hasUser == 0)
{
    $sql = "INSERT INTO Users (first_name, second_name, company_id, gender_id)
    VALUES ('$first_name', '$second_name', $company_id, $gender_id)";
    
    if($conn->query($sql))
    {
        session_start();
        $_SESSION['user_id'] = $conn->insert_id;
        header("Location: ../pages/test.php?gender=".$_POST['gender']); 
    }
    
} else 
{
    header("Location: ../pages/have_user_test.php");
}
?>