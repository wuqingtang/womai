window.onload = function () {

    //图片点击,设置cookie
    $('.shoplist a').click(function () {



        //图片点击,设置cookie
        $.cookie('index',$(this).index(),{path:'/'})
    })
    
}