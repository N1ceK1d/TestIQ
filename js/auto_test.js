$(document).ready(() => {
    // $('.answer_input').each((index, element) => {
    //     if($(element).val() == 1) {
    //         $(element).prop('checked', true)
    //     }
    // })   
    let res = 0;
    $('.questions').on('change', (event) => {
        if($(event.target).hasClass('answer_input')) {
            res = 0;
            $('.answer_input').each((index, element) => {
                if($(element).val() == 1 && $(element).prop('checked')) {
                    res += parseInt($(element).val());
                }
            })
            // res += parseInt($(event.target).val());
            console.log(res);
        }
    });
})