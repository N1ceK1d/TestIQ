function generatePDF2(filename = 'Компания', format = 'PNG', quality = 0.7) {
    const pdf = new jsPDF('p', 'pt', 'a4');
    
    // Собираем все элементы с классом "employee-item"
    const elements = document.querySelectorAll('.employee-item');

    // Проходимся по каждому элементу и добавляем его содержимое в PDF
    elements.forEach((element, index) => {
        // Конвертируем HTML в Canvas
        html2canvas(element)
            .then(canvas => {
                const imgData = canvas.toDataURL('image/png');

                // Получаем размеры элемента
                const width = element.offsetWidth / 2;
                const height = element.offsetHeight / 2;

                var xPos = (pdf.internal.pageSize.getWidth() - width) / 2;
                var yPos = (pdf.internal.pageSize.getHeight() - height) / 2;

                // Добавляем изображение в PDF
                pdf.addImage(imgData, 'PNG', xPos, 10, width, height);

                // Если это не последний элемент, добавляем новую страницу
                if (index < elements.length - 1) {
                    pdf.addPage();
                } else {
                    // Если это последний элемент, сохраняем PDF
                    pdf.save(filename + '.pdf');
                }
            });
    });
}


