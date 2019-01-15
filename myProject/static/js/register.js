// $(function(){
// 	$(":text").val(null);
// 	var user = $.cookie("user");
// 	var pwd = $.cookie("pwd");
// 	$("input").eq(1).val(user);
// 	$("input").eq(2).val(pwd);
// 	var flag1 = false; //表示邮箱/手机是否正确
// 	var flag2 = false; //表示用户名是否正确
// 	var flag3 = false; //表示密码是否正确
// 	var flag4 = false; //表示确认密码是否正确
// 	var flag5 = false; //表示手机号是否正确
// 	var flag6 = false; //表示验证码是否正确
// 	var flag7 = false; //表示是否同意服务条款
// 	var value;
// 	detect();
// 	$("input").eq(7).prop("checked",false);
// 	function detect(){
// 		value = $("input").eq(1).val();
// 		var val = $("input").eq(2).val();
// 		var reg1 = /^[a-zA-Z_]\w{5,14}$/;
// 		var reg2 = /^.{6,20}$/;
// 		if (reg1.test(value)){
// 			flag2 = true;
// 		}
// 		else{
// 			flag2 = false;
// 		}
// 		if (reg2.test(val)){
// 			flag3 = true;
// 		}
// 		else{
// 			flag3 = false;
// 		}
// 	}
// 	$("input").eq(0).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		var reg1 = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[0-9])|(18[0-9])|199)\d{8}$/;
// 		var reg2 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/ig;
// 		if (reg1.test(value) || reg2.test(value)){
// 			$(this).parent().find(".error-msg").hide();
// 			flag1 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("请输入正确的手机号或者邮箱");
// 		}
// 	})
// 	$("input").eq(1).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		var reg = /^[a-zA-Z_]\w{5,14}$/;
// 		if (reg.test(value)){
// 			$(this).parent().find(".error-msg").hide();
// 			flag2 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("用户名只能由6到16位字符组成");
// 		}
//
// 	})
// 	$("input").eq(2).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		var reg = /^.{6,20}$/;
// 		if (reg.test(value)){
// 			$(this).parent().find(".error-msg").hide();
// 			flag3 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("密码只能由6到20位字符组成");
// 		}
//
// 	})
// 	$("input").eq(3).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		if (value == $("input").eq(2).val()){
// 			$(this).parent().find(".error-msg").hide();
// 			flag4 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("密码必须与第一次输入一致");
// 		}
// 	})
// 	$("input").eq(4).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		var reg = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[0-9])|(18[0-9])|199)\d{8}$/;
// 		if (reg.test(value)){
// 			$(this).parent().find(".error-msg").hide();
// 			flag5 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("请输入正确的手机号");
// 		}
//
// 	})
// 	$("input").eq(5).keyup(function(){
// 		isEmpty()
// 		value = $(this).val();
// 		if (value){
// 			$(this).parent().find(".error-msg").hide();
// 			flag6 = true;
// 		}
// 		else{
// 			$(this).parent().find(".error-msg").show().find("p").html("请输入验证码");
// 		}
// 	})
// 	$("input").eq(6).click(function(){
// 		if ($(this).prop("checked")){
// 			$(this).parent().find(".error-msg").hide();
// 			flag7 = true;
// 		}
// 		else{
// 			flag7 = false;
// 		}
// 	})
//
// 	$("input").eq(7).click(function(){
// 		if(!flag1){
// 			$("input").eq(0).parent().find(".error-msg").show().find("p").html("请输入正确的手机号或者邮箱");
// 		}
// 		else if(!flag2){
// 			$("input").eq(1).parent().find(".error-msg").show().find("p").html("请输入用户名");
// 		}
// 		else if(!flag3){
// 			$("input").eq(2).parent().find(".error-msg").show().find("p").html("请输入密码");
// 		}
// 		else if(!flag4){
// 			$("input").eq(3).parent().find(".error-msg").show().find("p").html("密码必须与第一次输入一致");
// 		}
// 		else if(!flag5){
// 			$("input").eq(4).parent().find(".error-msg").show().find("p").html("请输入正确的手机号");
// 		}
// 		else if(!flag6){
// 			$("input").eq(5).parent().find(".error-msg").show().find("p").html("请输入验证码");
// 		}
// 		else if(!flag7){
// 			$("input").eq(6).parent().find(".error-msg").show().find("p").html("请阅读并同意服务条款");
// 		}
// 		else{
// 			var xhr = new XMLHttpRequest();
//             xhr.open("post", "../PHP/register.php", true);
//             xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//             var str = "username=" + $("input").eq(1).val() + "&pwd=" + $("input").eq(3).val();
//             xhr.send(str);
//             xhr.onreadystatechange = function () {
//                 if (xhr.readyState==4 && xhr.status==200){
//                     console.log(xhr.responseText);
//                     var obj = JSON.parse(xhr.responseText);
//                     console.log(obj);
//                     if(obj.status == 1){
//                     	$.cookie("user", $("input").eq(1).val(), {expires:30, path:"/"});
// 						$.cookie("pwd", $("input").eq(2).val(), {expires:30, path:"/"});
//                     	alert("注册成功！");
// 						location.href = "../html/Login.html";
//                     }
//                     else{
//                     	alert("注册失败,用户名已被使用");
//                     }
//                 }
//             }
// 		}
// 	})
//
// 	$(".msg").show();
// 	$("input").click(function(){
// 		$(this).parent().find(".msg").hide();
//
// 	})
// 	$("input").blur(function(){
// 		if(!$(this).val()){
// 			$(this).parent().find(".msg").show();
// 		}
// 	})
// 	$(".msg").click(function(){
// 		$(this).hide();
// 		$(this).parent().find("input").focus();
// 	})
// 	isEmpty();
// 	function isEmpty(){
// 		$("input").each(function(){
// 			if($(this).val()){
// 				$(this).parent().find(".msg").hide();
// 			}
// 			else{
// 				$(this).parent().find(".msg").show();
// 			}
// 		})
// 	}
// 	$(".main-tit p a").click(function(){
// 		location.href = "../html/Login.html";
// 	})
// 	$(".header-logo").click(function(){
// 		location.href = "../index.html";
// 	})
// })
window.onload = function () {


    //验证用户名
    $(".long-input input[name='username']").blur(function () {
        var namevalue = $(this).val();
        if(namevalue.length>=3 && namevalue.length<=10){
            $('#username').html('用户名输入正确').removeClass('error').addClass('correct');

        }else {
            $('#username').html('用户名输入错误').removeClass('correct').addClass('error');

        }
    });


    //验证手机号
    $(".long-input input[name='phonenum']").blur(function () {
        var phonenum = $(this).val();

        var reg = /^1[3-9]\d{9}$/;

        var resulut = reg.test(phonenum);
        if (resulut) {
            $.get('/check/',{'phone':$(this).val()},function (response) {
                if(response.status){
                     $('#phonenum').html(response.msg).removeClass('error').addClass('correct')
                }else {
                     $('#phonenum').html(response.msg).removeClass('correct').addClass('error')
                }

            })

        } else {
            $('#phonenum').html('手机号格式不正确').removeClass('correct').addClass('error')
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
    })

    //验证邮箱
    $(".long-input input[name='email']").blur(function () {
        var email = $(this).val();

        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/

        var resulut = reg.test(email);
        if(resulut){
            $('#email').html('邮箱输入正确').removeClass('error').addClass('correct');

        }else {
            $('#email').html('邮箱输入有误').removeClass('correct').addClass('error');

        }

    })

    $('#btn').click(function () {

        console.log(10)
        var isregister = true;
        $('.sp').each(function () {
            if(!$(this).hasClass('correct')){
                isregister = false
            }
        })
        console.log(isregister)
        if(isregister){
            $('#register').submit()
        }
    })

}


