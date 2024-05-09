<?php
require('conn.php');
session_start();

if(isset($_POST['user_id']))
{
    $user_id = $_POST['user_id'];
} else {
    $user_id = $_SESSION['user_id'];
}

$answers = $_POST['question'];
$gender = $_POST['gender'];

$result = 0;
foreach ($answers as $answer) {
    $result += $answer;
}
$result += ($gender == 'male' ? 75 : 70);

if($conn->query("INSERT INTO UsersResults (user_id, points) VALUES ($user_id, $result)"))
{
    header("Location: ../pages/endTest.php");
} else {
    echo $conn->error;
}
