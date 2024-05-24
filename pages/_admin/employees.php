<?php
    session_start();
    if(!isset($_SESSION['admin_id']))
    {
        header("Location: login.php");
    }
    require("../../php/conn.php");
    $company_id = 0;
    if(isset($_GET['company_id']))
    {
        $company_id = $_GET['company_id'];
    }
    $user_type = 0;
    if(isset($_GET['user_type']))
    {
        $user_type = $_GET['user_type'];
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Работники</title>
    <link rel="icon" href="../../favicon.ico">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../js/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="../../js/getPDF.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
    <div class="container p-1">
        <h1>Сотрудники</h1>
        <?php require("../../php/admin_header.php"); ?>
        <button class='pdf_export btn btn-primary'>Экспорт PDF</button>
        <form class="search form border w-25 p-2 m-auto text-center" action="" method="GET">
            <select name="company_id" class="form-select form-select-sm my-1 w-100" aria-label="Default select example">
                <option value="0" selected>Все компании</option>
                <?php
                    $companies = $conn->query("SELECT * FROM Companies;");
                    foreach ($companies as $row):?>
                        <option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
                <?php endforeach ?>
            </select>
            <input type="submit" value="Найти" class="btn btn-primary my-1">
        </form>
        <div class="diagramms">
            <?php 
                $sql = "SELECT *, Users.id as user_id,
                CONCAT(Users.second_name, ' ', Users.first_name) as fullname
                FROM Users
                INNER JOIN Companies ON Users.company_id = Companies.id";
                if($company_id > 0)
                {
                    $sql .= " WHERE company_id = $company_id";
                }
            ?>
            <?php foreach($users = $conn->query($sql) as $row):?>
                <div class="employee-item border my-1 w-75" id='user_<?php echo $row['user_id']; ?>'>
                    <div class="employee_header bg-primary text-white p-1">
                        <p class="name h3 mb-0"><?php echo $row['fullname']; ?></p>
                        <p class="lead"><?php echo $row['name']; ?></p>
                    </div>
                    <div class="employee-body p-1">
                        <?php
                            $answers = $conn->query("SELECT * FROM UsersResults WHERE user_id = ".$row['user_id']." LIMIT 1");
                            foreach($answers as $answer):?>
                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <td><b>КИ</b></td>
                                        <td><b>Описательная классификация</b></td>
                                        <td><b>% населения</b></td>
                                        <td><b>Описание</b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <?php getUserResult2($answer['points']); ?>
                                    </tr>
                                </tbody>
                            </table>
                        <?php endforeach; ?>
                    </div>
                    <div class="employee-footer p-1 bg-light">
                        <button class='btn btn-primary get_pdf'>Скачать</button>
                        <form action="../../php/deleteUser.php" method="post" class="my-1 delete_form">
                            <input type="hidden" name="user_id" value="<?php echo $row['user_id']; ?>">
                            <input type="submit" class="btn btn-danger" value="Удалить">
                        </form>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <?php 
            $name = "Все компании";
            $company_name = $conn->query("SELECT * FROM Companies WHERE id = $company_id");
            
            if($company_name->num_rows > 0)
            {
                $name = mysqli_fetch_assoc($company_name)['name'];
            }
        ?>
    </div>
    
    <script>
        $('.pdf_export').on('click', () => {
            $('.get_pdf').hide();
            $('.delete_form').hide();
            generatePDF2('<?php echo $name; ?>', 'PDF');
            $('.get_pdf').show();
            $('.delete_form').show();
        })
        
        $('.get_pdf').on('click', (event) => {
            $('.get_pdf').hide();
            $('.delete_form').hide();
            generateSolidPDF('<?php echo $name; ?>', 'PDF', $(event.target).parent().parent().attr('id'));
            $('.get_pdf').show();
            $('.delete_form').show();
        })
    </script>
</body>
</html>
<?php 
function getUserResult($points)
{
    switch ($points) {
        case $points >= 135 && $points <= 200:
            echo "Очень высокий";
            break;
        case $points >= 110 && $points <= 134:
            echo "Высокий";
            break;
        case $points >= 100 && $points <= 109:
            echo "Выше среднего";
            break;
        case $points >= 90 && $points <= 99:
            echo "Ниже среднего";
            break;
        case $points >= 80 && $points <= 89:
            echo "Низкий";
            break;
        case $points >= 0 && $points < 80:
            echo "Очень низкий";
            break;
    }
}

function getUserResult2($points)
{
    echo "<td>$points</td>";
    switch ($points) {
        case $points >= 135 && $points <= 200:
            echo "<td>Очень высокий</td>";
            echo "<td>5%</td>";
            echo "<td>Старший руководитель</td>";
            break;
        case $points >= 110 && $points <= 134:
            echo "<td>Высокий</td>";
            echo "<td>10%</td>";
            echo "<td>Старший или младший руководитель</td>";
            break;
        case $points >= 100 && $points <= 109:
            echo "<td>Выше среднего</td>";
            echo "<td>35%</td>";
            echo "<td>Не руководящий пост</td>";
            break;
        case $points >= 90 && $points <= 99:
            echo "<td>Ниже среднего</td>";
            echo "<td>35%</td>";
            echo "<td>Не руководящий пост, рекомендуется назначать в область
            , которая хорошо известна и в которой есть опыт работы</td>";
            break;
        case $points >= 80 && $points <= 89:
            echo "<td>Низкий</td>";
            echo "<td>10%</td>";
            echo "<td>Не руководящий пост, рекомендуется назначать в область, 
            где доказано предварительное обучение или квалификация</td>";
            break;
        case $points >= 0 && $points < 80:
            echo "<td>Очень низкий</td>";
            echo "<td> 5%</td>";
            echo "<td>Следует поручать только 
            область, в которой доказаны компетентность и квалификация</td>";
            break;
    }
}
?>