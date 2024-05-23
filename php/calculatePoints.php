<?php
require('conn.php');
session_start();

if(isset($_POST['user_id']))
{
    $user_id = $_POST['user_id'];
} else {
    $user_id = $_SESSION['user_id'];
}

$answers = isset($_POST['question']) ? $_POST['question'] : 0;

$gender = mysqli_fetch_assoc($conn->query("SELECT Genders.name as gender FROM Users
INNER JOIN Genders ON Users.gender_id = Genders.id
WHERE Users.id = $user_id"))['gender'];

$result = 0;
foreach ($answers as $answer) {
    $result += $answer;
}
$result += ($gender == 'Мужчина' ? 75 : 70);

if($conn->query("INSERT INTO UsersResults (user_id, points) VALUES ($user_id, $result)"))
{
    header("Location: ../pages/endTest.php");
} else {
    echo $conn->error;
}
?>
