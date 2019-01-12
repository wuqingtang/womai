
//index.html的img

window.onload = function (ev) {
    $('img').each(function () {
        var imgPath = $(this).attr('src');


        imgPath = "{% static '" + imgPath + "' %}";

        $(this).attr('src',imgPath)

    });
    console.log($('body').html())

};


//detail.html 里面的img

// window.onload = function (ev) {
//     $('img').each(function () {
//         var imgPath = $(this).attr('src');
//
//         var arrimg = imgPath.split('/');
//
//         imgPath = arrimg[1] + '/' + arrimg[2] + '/' + arrimg[3];
//
//         imgPath = "{% static '" + imgPath + "' %}";
//         $(this).attr('src',imgPath);
//
//     });
//       console.log($('body').html())
//
// };



