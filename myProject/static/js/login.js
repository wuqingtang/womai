
window.onload = function () {
    //验证手机号
    $(".long-input input[name='phonenum']").blur(function () {
        var phonenum = $(this).val();

        var reg = /^1[3-9]\d{9}$/;

        var resulut = reg.test(phonenum);
        if(resulut){
            $('#phonenum').html('手机号输入正确').removeClass('error').addClass('correct');

        }else {
            $('#phonenum').html('手机号输入错误').removeClass('correct').addClass('error');

        }
    });


    //验证密码
    $(".long-input input[name='password']").blur(function () {
        var password = $(this).val();
        var reg = /^\w{6,20}$/;
        var resulut = reg.test(password);
        if(resulut){
            $('#password').html('密码输入正确').removeClass('error').addClass('correct');

        }else {
            $('#password').html('密码输入有误').removeClass('correct').addClass('error');
        }
    });


    $('#btn').click(function () {

        console.log(10);
        var islogin = true;
        $('.sp').each(function () {
            if(!$(this).hasClass('correct')){
                islogin = false
            }
        });

        if(islogin){
            $('#login').submit()
        }
    })

};


