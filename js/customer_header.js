
    $('.copied_text_btn').click(function() {
        // Находим родительский элемент кнопки, чтобы добавить поле с URL в него
        var parent = $(this).closest('.company-item');
        // Проверяем, существует ли уже поле с URL в родительском элементе
        var urlField = parent.find('.copied_url');
        if (urlField.length === 0) {
            // Если поле не существует, создаем новое поле с URL
            urlField = $('<input>');
            urlField.attr('type', 'text');
            urlField.attr('readonly', true);
            urlField.addClass('form-control mt-2 copied_url');
            parent.append(urlField);
        }
        // Находим скрытое поле с URL в родительском элементе
        var copiedText = parent.find('.copied_text');
        // Заполняем поле с URL значением из скрытого поля
        urlField.val(copiedText.val());
        // Показываем поле с URL
        urlField.show();
    });

    $(document).ready(function() {

    function checkConditionsAndToggleButton() {
        // Получение количества вопросов и оставшегося времени
        var questionsCount = <?php echo getTestCount($res['company_id'], $conn); ?>;
        var remainingTime = $('.zero_time').text().trim();

        // Проверка, равно ли количество вопросов нулю
        var isQuestionsCountZero = questionsCount == 0;
        
        // Проверка, равно ли оставшееся время нулю
        var isTimeZero = remainingTime == "00 лет, 00 месяцев, 00 дней, 00 часов, 00 минут, 00 секунд";

        console.log(questionsCount);
        console.log(isTimeZero);
        console.log(isQuestionsCountZero);
        // Блокировка или разблокировка кнопки на основе условий
        if (isQuestionsCountZero || isTimeZero) {
            $('.copied_text_btn').prop('disabled', true);
        } else {
            $('.copied_text_btn').prop('disabled', false);
        }
    }
    // Вызов функции при загрузке страницы
    checkConditionsAndToggleButton();
});