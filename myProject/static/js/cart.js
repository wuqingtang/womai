// $(function(){
// 	$(".mycount-wrap, .mycount").mouseenter(function(){
// 		$(".mycount").show();
// 		$(".mycount-wrap").addClass(".activebg");
// 	})
// 	$(".mycount-wrap, .mycount").mouseleave(function(){
// 		$(".mycount").hide();
// 		$(".mycount-wrap").removeClass(".activebg");
// 	})
// 	refresh();
// 	function refresh(){
// 		var arr = $.cookie("cart");
// 		if(arr){
// 			arr = JSON.parse(arr);
// 			if(arr.length>0){
// 				$(".ordercontent-content").remove();
// 				$(".cart-empty").hide();
// 				$(".full-cart").show();
// 				var sum = 0;
// 				var number = 0;
// 				for (var i=0; i<arr.length; i++){
// 					var obj = arr[i];
// 					$('<div class="ordercontent-content"><div class="content-type clearfix"><div class="content-cont1 ct"><div class="clearfix"><input type="checkbox" class="fl checkitem"/><a href="#"><img src=" ' +arr[i].zoom[0] +
// 						' "/></a><div class="content1-cent fl"><a href="#">'+arr[i].name +
// 						'</a></div></div></div><div class="content-cont2 ct">￥<span>' +arr[i].price +
// 						'</span></div><div class="content-cont3 ct"><div class="dec"></div><div class="input_goods"><input type="text" value="'+ arr[i].num +
// 						'" /></div><div class="add"></div></div><div class="content-cont4 ct">￥<span>' + (arr[i].price*arr[i].num).toFixed(2) +
// 						'</span></div><div class="content-cont5 ct"><a href="#">收藏</a><div class="del-bot"><a href="#">删除</a></div></div></div></div>').appendTo(".ordercontent");
// 					$(".checkitem").eq(i).prop("checked",obj.checked);
// 					if(arr[i].checked){
// 						sum += arr[i].price*arr[i].num;
// 						number ++;
// 					}
// 				}
// 				$(".total-mid em").html(sum.toFixed(2));
// 				$(".totalprice-top em").html(sum.toFixed(2));
// 				$(".oar-money span").html(sum.toFixed(2));
// 				$(".ora-tol-money span").html(sum.toFixed(2));
// 				$(".order-nav ul li em").html(arr.length);
// 				$(".to-num em").html(number);
// 			}
// 			else{
// 				$(".cart-empty").show();
// 				$(".full-cart").hide();
// 			}
// 		}
// 		else{
// 			$(".cart-empty").show();
// 			$(".full-cart").hide();
// 		}
// 	}
// 	$(".showcart").on("click", ".add", function(){
// 		var index = $(this).index(".showcart .add");
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].num++;
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		refresh();
// 	})
// 	$(".showcart").on("click", ".dec", function(){
// 		var index = $(this).index(".showcart .dec");
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].num--;
// 		if (arr[index].num < 1) {
// 			arr[index].num = 1;
// 		}
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		refresh();
// 	})
// 	$(".showcart").on("click", ".del-bot", function(){
// 		var index = $(this).index(".showcart .del-bot");
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr.splice(index, 1);
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		isAllSelect();
// 		refresh();
// 	})
// 	$(".showcart").on("click", ".checkitem", function(){
// 		var index = $(this).index(".showcart .checkitem");
// 		console.log(index);
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].checked = !arr[index].checked;
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		isAllSelect();
// 		refresh();
// 	})
// 	isAllSelect();
// 	function isAllSelect(){
// 		var arr = $.cookie("cart");
// 		if (!arr) {
// 			return;
// 		}
// 		var arr = JSON.parse($.cookie("cart"));
// 		var sum = 0;
// 		for (var i=0; i<arr.length; i++) {
// 			sum += arr[i].checked;
// 		}
// 		if (arr.length!=0 && sum==arr.length) {
// 			$(".all").prop("checked", true);
// 		}
// 		else {
// 			$(".all").prop("checked", false);
// 		}
// 	}
// 	$("#all").click(function(){
// 		if($("#allcheck").prop("checked")){
// 			$("#allcheck").prop("checked",false);
// 		}
// 		else{
// 			$("#allcheck").prop("checked",true);
// 		}
// 		var arr = $.cookie("cart");
// 		if (!arr) {
// 			return;
// 		}
// 		var arr = JSON.parse($.cookie("cart"));
// 		for (var i=0; i<arr.length; i++) {
// 			if ($(this).prop("checked")){
// 				arr[i].checked = true;
// 			}
// 			else {
// 				arr[i].checked = false;
// 			}
// 		}
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		refresh();
// 	})
// 	$("#allcheck").click(function(){
// 		if($("#all").prop("checked")){
// 			$("#all").prop("checked",false);
// 		}
// 		else{
// 			$("#all").prop("checked",true);
// 		}
// 		var arr = $.cookie("cart");
// 		if (!arr) {
// 			return;
// 		}
// 		var arr = JSON.parse($.cookie("cart"));
// 		for (var i=0; i<arr.length; i++) {
// 			if ($(this).prop("checked")){
// 				arr[i].checked = true;
// 			}
// 			else {
// 				arr[i].checked = false;
// 			}
// 		}
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		refresh();
// 	})
// 	$(".pos").on("click",function(){
// 		var arr = JSON.parse($.cookie("cart"));
// 		for (var i=0; i<arr.length; i++) {
// 			if (arr[i].checked){
// 				arr.splice(i,1);
// 				i--;
// 			}
// 		}
// 		$.cookie("cart", JSON.stringify(arr), {expires:30, path:"/"});
// 		refresh();
// 	})
// 	$(".logo").click(function(){
// 		location.href = "../index.html";
// 	})
// 	$(".ind").click(function(){
// 		location.href = "../index.html" ;
// 	})
// 	$(".reg").click(function(){
// 	location.href = "../html/register.html" ;
// 	})
// 	$(".log").click(function(){
// 		location.href = "../html/Login.html" ;
// 	})
// 	$(".trip-div a").click(function(){
// 		location.href = "../index.html" ;
// 	})
// })
window.onload = function () {
    $('.add').click(function () {


        var goodid = parseInt($(this).prev().find('span').attr('goodid'));

        var $that = $(this).prev().find('span');
        data = {
            'goodid': goodid
        };
        $.get('/addgoodsnumber/', data, function (response) {
            $that.html(response.number)

        });
        //触发事件,改变状态,调用函数计算价格
        accounts()

    });

    $('.cut').click(function () {
        var $that = $(this).prev().prev().find('span');
        if (parseInt($that.html()) > 1) {
            var goodid = parseInt($that.attr('goodid'));
            data = {
                'goodid': goodid
            };
            $.get('/cutgoodsnumber/', data, function (response) {
                $that.html(response.number)
            })
        } else {
            alert('数量已经是最少值了,若不需要,请点击删除')
        }
        //触发事件,改变状态,调用函数计算价格
        accounts()
    });

    $('.del').click(function () {
        //获取到商品id

        var $that = $(this).prev().prev().prev().find('span');
        var goodid = parseInt($that.attr('goodid'));

        data = {
            'goodid': goodid
        };
        $.get('/delgoodsnumber/', data, function (response) {
            window.open('/cart/', target = '_self')
        });
        //触发事件,改变状态,调用函数计算价格
        accounts()

    });

    $('.isselect').click(function () {
        $(this).find('.goodsbox').hasClass('ok') ? $(this).find('div').removeClass('ok'):$(this).find('div').addClass('ok');
        //同时发起ajax请求,改变数据库中购物车的状态
        var cartid = $(this).attr('cartid');

        data = {
            'cartid':cartid
        };
        $.get('/changestatus/',data,function (response) {
            console.log(response)
        });
        //触发事件,改变状态,调用函数计算价格
        accounts()
    });





    $('.order .allselect').click(function () {

        var resulut = true;
        $('.goods .isselect').find('div').each(function () {
            if(!$(this).hasClass('ok')){
            resulut = false
            }
        });

        if(resulut){
            $('.goods .isselect').find('div').removeClass('ok')
        }else{
            $('.goods .isselect').find('div').addClass('ok')
        }

        //并且发起一个ajax请求,改变该用户,所有购物车记录的状态
        $.get('/changeallstatus/',function (response) {
            console.log(response)
        })

        //触发事件,改变状态,调用函数计算价格
        accounts()

    });


    //计算总价的函数
    function accounts() {
        var sum = 0;

        $('.goods').each(function () {
            var result = $(this).find('.goodsbox').hasClass('ok');

            if(result){
                var num = parseInt($(this).find('.bottom').html());

                var pri = parseInt($(this).find('.goodprice').html());

                sum += num * pri
            }
        });

        $('.order i').html(sum + '元')
    }


    $('.order .success').click(function () {
        //发起ajax请求
       $.get('/order/',function (response) {

           if(response.status){
               window.open('/orderdetail/' + response.identifier + '/',target='_self')
           }
       })

    });


};




