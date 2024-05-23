<?php
    require("../php/conn.php");
    $questions = $conn->query("SELECT * FROM Questions;");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест IQ</title>
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
        <form class="questions mx-auto p-1" method='POST' action='../php/calculatePoints.php'>
            <input type="hidden" name="gender" value="<?= $_GET['gender']; ?>" />
            <?php foreach($questions as $question):?>
                <div class="question bg-light border rounded p-1 w-75 my-1">
                    <p><b><?= $question['id'] ?>. </b><?= $question['question_text'] ?></p>
                    <div class="answers row">
                            <?php
                            $filename = $conn->query("SELECT * FROM QuestionImages WHERE question_id = ".$question['id']);
                            if($filename->num_rows > 0):?>
                                <img class='img-fluid w-75' src="../images/<?= $filename->fetch_assoc()['image_name'];?>" />
                            <?php endif; ?>
                        <?php foreach ($conn->query("SELECT * FROM Answers WHERE question_id = ".$question['id'].";") as $answer):?>
                            <div class="answer-item">
                                <input type="radio" name="question[<?= $question['id'] ?>]" value="<?= $answer['is_correct'] ?>">
                                <label><b><?= $answer['answer_char'] ?>.</b> <?= $answer['answer_text'] ?></label>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
            <input class='end_test_btn btn btn-primary' type="submit" value="Закончить тест">
            <!-- <button >Закончить тест</button> -->
        </form>
    </div>
    <script src="../js/timer.js"></script>
</body>
</html>