<?php
    require("../php/conn.php");
    $questions = $conn->query("SELECT * FROM Questions;");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест "НОВИС"</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="timer position-sticky top-0 p-1 z-index-100">
            <div class="card bg-primary text-white">
              <div class="card-body">
                <h5 class="card-title">Таймер обратного отсчета</h5>
                <p class="card-text" id="timer">30:00</p>
              </div>
            </div>
        </div>
        <div class="questions mx-auto p-1">
            <?php foreach($questions as $question):?>
                <div class="question bg-light border rounded p-1 w-75 my-1">
                    <p><b><?= $question['id'] ?>. </b><?= $question['question_text'] ?></p>
                </div>
            <?php endforeach; ?>
            <button class='btn btn-primary'>Закончить тест</button>
        </div>
    </div>
    <script src="../js/timer.js"></script>
</body>
</html>