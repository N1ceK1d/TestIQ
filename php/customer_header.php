<?php
    session_start();
    require("../../php/conn.php");
    require("../../php/getTestCount.php");
    $res = mysqli_fetch_assoc($conn->query("SELECT Customers.*, Companies.name as company_name, Companies.id as company_id
    FROM Customers
    INNER JOIN Companies ON Customers.company_id = Companies.id 
    WHERE Customers.id = ".$_SESSION['customer_id']));    
?>
<header class="my-2 border-bottom py-1">
    <div class="access_info border p-1 bg-light">
        <h2><?php echo $res['login']; ?></h2>
        <h3><?php echo $res['company_name']; ?></h3>
        
        <p><b>Количество вопросов:</b> <?php 
        if(mysqli_fetch_assoc($conn->query("SELECT * FROM Customers WHERE company_id = ".$res['company_id']))['answers_count'] != null )
        {
            echo getTestCount($res['company_id'], $conn, $_SESSION['customer_id']) ?> / <?php echo $res['answers_count'];
        } else {
            echo '-';
        }
         ?></p>
        <p><b>Оставшееся время:</b> <label class='zero_time'><?php
        // Установка временной зоны для объекта DateTime
        // Создание объекта DateTime для текущего времени
        $now = new DateTime();

        // Предполагается, что $row['time_count'] содержит дату в формате 'Y-m-d H:i:s'
        // Преобразование строки в объект DateTime
        if ($res['time_count'] != null) {
            $ref = DateTime::createFromFormat('Y-m-d H:i:s', $res['time_count']);
            // Проверка на корректность создания объекта DateTime
            if ($ref === false) {
                echo "Некорректный формат времени";
            } else {
                // Если текущее время больше или равно времени события, устанавливаем разницу в ноль
                if ($now >= $ref) {
                    echo "00 лет, 00 месяцев, 00 дней, 00 часов, 00 минут, 00 секунд";
                } else {
                    // Вычисление разницы между двумя датами
                    $diff = $now->diff($ref);

                    // Вывод разницы в формате 'Y-m-d H:i:s'
                    echo $diff->format('%y лет, %m месяцев, %d дней, %h часов, %i минут, %s секунд');
                }
            }
        } else {
            echo "-";
        }?></label></p>
        <div class="company-item cart w-75 my-1">
            <button type='button' class='btn btn-primary my-1 copied_text_btn liveToastBtn'>Скопировать ссылку</button>
            <?php $url = ((!empty($_SERVER['HTTPS'])) ? 'https' : 'http').'://'.$_SERVER['HTTP_HOST'].'?company_id='.urlencode(base64_encode($res['company_id'])); ?>
            <input type="hidden" class='copied_text' value='<?php echo $url ?>'>
        </div>
    </div>
    <nav>
        <a class='btn btn-outline-primary my-1' href="index.php">Результаты сотрудников</a>
        <a class='btn btn-outline-danger float-end my-1' href="../../php/exit.php?customer=1">Выйти</a>
    </nav>
</header>
<script>
$(document).ready(function() {
    console.log(<?php echo getTestCount($res['company_id'], $conn, $_SESSION['customer_id']); ?>);
    // Функция для проверки условий и переключения кнопки
    function checkConditionsAndToggleButton() {
        // Получение количества вопросов и оставшегося времени
        var questionsCount = <?php echo getTestCount($res['company_id'], $conn, $_SESSION['customer_id']); ?>;
        var remainingTime = $('.zero_time').text().trim();
        console.log(<?php echo getTestCount($res['company_id'], $conn, $_SESSION['customer_id']); ?>);

        // Проверка, равно ли количество вопросов нулю
        var isQuestionsCountZero = questionsCount == 0;
        
        // Проверка, равно ли оставшееся время нулю
        var isTimeZero = remainingTime == "00 лет, 00 месяцев, 00 дней, 00 часов, 00 минут, 00 секунд";

        // Блокировка или разблокировка кнопки на основе условий
        if (isQuestionsCountZero || isTimeZero) {
            $('.copied_text_btn').prop('disabled', true);
        } else {
            $('.copied_text_btn').prop('disabled', false);
        }
    }

    // Вызов функции при загрузке страницы
    checkConditionsAndToggleButton();

    // Обработчик клика для кнопки 'Скопировать ссылку'
    $('.copied_text_btn').click(function() {
        var parent = $(this).closest('.company-item');
        var urlField = parent.find('.copied_url');
        if (urlField.length === 0) {
            urlField = $('<input>');
            urlField.attr('type', 'text');
            urlField.attr('readonly', true);
            urlField.addClass('form-control mt-2 copied_url');
            parent.append(urlField);
        }
        var copiedText = parent.find('.copied_text');
        urlField.val(copiedText.val());
        urlField.show();
    });
});
</script>
