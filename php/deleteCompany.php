<?php 
require("conn.php");

$company_id = $_POST['company_id'];
$users = $conn->query("SELECT * FROM Users WHERE company_id = $company_id");
if($users->num_rows > 0)
{
    foreach ($users as $user) {
        if($conn->query("DELETE FROM UsersResults WHERE user_id = ".$user['id']))
        {
            if($conn->query("DELETE FROM Users WHERE id = ".$user['id']))
            {
                
            } else {
                echo $conn->error."<br>";
            }
        } else {
            echo $conn->error."<br>";
        }
    }
}
$sql = "DELETE FROM Companies WHERE id = $company_id";
if($conn->query($sql))
{
    header("Location: ../pages/_admin/companies.php");
} else {
    echo $conn->error."<br>";
}

