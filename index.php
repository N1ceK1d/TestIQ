<?php
session_start();
require("php/conn.php");
require("php/getTestCount.php");
$res = mysqli_fetch_assoc($conn->query("SELECT * FROM Companies LIMIT 1"));

$company_id = $res['id'];

if(isset($_GET['company_id']))
{
  $company_id = base64_decode($_GET['company_id']);
}
if(isset($_GET['is_free']))
{
  $is_free = base64_decode($_GET['is_free']);
}
$test_count = mysqli_fetch_assoc($conn->query("SELECT * FROM Customers WHERE company_id = $company_id"));
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тест IQ</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="icon" href="favicon.ico">
</head>
<body>
    <div class="container">
    <?php if(isset($_GET['company_id'])): ?>
      <?php if((getTestCount2($company_id, $conn) > 0 && timeIsEnd($test_count['time_count'])) || isset($_GET['is_free'])): ?>
        <div class="test-intro bg-light p-1 rounded border my-1 mx-auto w-75">
            <h1>Тест на IQ</h1>
            <p>
                Это - тест для определения Вашей способности решать задачи <br>
                В тесте - <b>80 вопросов</b> <br><br>
                Не задерживайтесь на каком-то одном вопросе. Если вопрос кажется
                слишком трудным, переходите к следующему вопросу. Может быть,
                у Вас останется время вернуться к этому трудному вопросу. <br><br>
                Пример вопроса: <br><br>
                <b>1. </b>Какой из ниже перечисленных предметов является "твёрдым"? <br>
                <b>a.</b> хлопок  <b>b.</b> железо <b>c.</b> шерсть <b>d.</b> бинт <b>e.</b> шёлк <br><br>
                У Вас <b>30 минут</b> на этот тест.
            </p>
            <button class='btn btn-primary' data-bs-toggle="modal" data-bs-target="#exampleModal">Начать тест</button>
        </div>
        <!--Modal start-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Данные сотрудника</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="php/addPerson.php" method="POST">
                    <div class="mb-3">
                      <label for="exampleInputName" class="form-label">Имя</label>
                      <input type="text" name='first_name' class="form-control" id="exampleInputName" aria-describedby="nameHelp">
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label">Фамилия</label>
                      <input type="text" name='second_name' class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3">
                      <input type="hidden" name="company_id" class="company_id" value="<?php echo $company_id ?>">
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputName" class="form-label">Пол</label>
                      <select name="gender_id" class="form-select">
                        <?php foreach ($conn->query("SELECT * FROM Genders") as $gender) :?>
                          <option value="<?php echo $gender['id'] ?>"><?php echo $gender['name'] ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                    <div class="btn-submit text-center">
                        <button type="submit" class="btn btn-primary">Начать тест</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!--Modal end-->
        <script>
          var myModal = document.getElementById('myModal')
          var myInput = document.getElementById('myInput')

          myModal.addEventListener('shown.bs.modal', function () {
            myInput.focus()
          })
        </script>
        <?php else: ?>
          <div class="container">
            <h2 class='text-center'>На данный момент тест закрыт</h2>
          </div>
        <?php endif; ?>
      <?php else :?>
        <div class="container">
          <h2 class='text-center'>Получите ссылку от руководства</h2>
        </div>
    <?php endif; ?>
    </div>
    <script>localStorage.clear()</script>
</body>
</html>