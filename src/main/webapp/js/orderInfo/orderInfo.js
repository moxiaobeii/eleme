$(document).ready(function() {
    //控制用户列表的显示功能
    $(".top_bar_rigth").mouseenter(function () {
        $("#dropbox").show();
    }).mouseleave(function () {
        $("#dropbox").hide();
    });

    //选中地址栏改变样式
    $(".checkout_address").click(function () {
        //移除掉之前的样式
        $(".checkout_address").removeClass("active");
        $(this).addClass("active");
    });

    //点击收起收货地址栏
    $(".checkout_showmoreaddress").click(function () {
        var $result = $(".address1").nextAll("li");
        if ($result.is(":hidden")) {
            $result.show();
            $(this).html("收起<i class='fa fa-angle-up'><i/>")
        } else {
            $result.hide();
            $(this).html("显示更多地址<i class='fa fa-angle-down'><i/>")
        }
    });

    //订单区
    var $money = parseFloat($(".good_money").text()); //获取商品单价
    var $df = parseFloat($("#deliverfee").text());   //获取配送费
    //点击增加商品或者减少商品
    $("#add_goodCount").click(function () {
        var $goodCount = parseFloat($(".oder_car_goodCount").val());
        var result = $goodCount + 1;
        if(result>0) {
            $(".oder_car_goodCount").val(result);
            setMoney(result);
        }
    });

    //点击减少
    $("#sub_goodCount").click(function(){
        var $goodCount = parseFloat($(".oder_car_goodCount").val());
        if($goodCount==1){
            result = $goodCount;
        }else{
            result = $goodCount-1;
        }
        if(result>0) {
            $(".oder_car_goodCount").val(result);
            setMoney(result);
        }
    });

    //当手动输入数量,控制商品总价
    $(".oder_car_goodCount").change(function(){
        var result = parseFloat($(this).val());
        if(result>0){
            setMoney(result);
        }
    });
    function setMoney(result){
        var money = parseFloat($money * result);    //获取商品总价
        $(".good_money").text(money);       //设置商品总价
        //改变总的金额
        var $df = parseFloat($("#deliverfee").text());   //获取配送费
        var $allmoney = parseFloat($(".good_money").text());    //获取商品总价
        var ordermoney = $df + $allmoney;
        $(".num").text(ordermoney);      //订单总价
    };

    //对订单总额默认设置
    var ordermoney = $df + $money;
    $(".num").text(ordermoney);      //订单总价


    //控制配送时间列表的显示
    $(".formselect").mouseenter(function () {
        $(".formselect_data").show();
    }).mouseleave(function () {
        $(".formselect_data").hide();
    });
    //点中配送时间后,覆盖时间
    $(".formselect_data span").click(function(){
        var value = $(this).text(); //获取点击的值
        $(".formselect .firstVal").text(value); //将点击的值设置到默认显示
        $(".formselect_data").hide();   //同时隐藏选择框
    });

    //添加地址
    $(".checkout_addaddress").click(function(){
       $(".addressdialog").toggle(500);
    });
    //关闭添加地址栏
    $(".addressdialog_close,#exit").click(function(){
        $(".addressdialog").hide();
    });

  
    	
	//获取浏览器滚动条
	var h = $(window).scrollTop;
	if(h>1){
	    $("#sroll_show").show();
	}
	
	
//	//保存地址,将获取地址信息,将信息传入servlet里,同时将更改后的信息显示出来
//	$("#saveAddress").click(function(){
//		alert("点击成功")
//		var name = $("#name").val();
//		var sex = $("input[name='sex']:checked").val();
//		var city = $("#city").val();
//		var adress = $("#adress").val();
//		var telphone = $("#telphone").val();
//		
//		//请求的路径
//		var url = "${pageContext.request.contextPath }/OrdersServlet?method=insertConsignee";
//		var param = {"name":name,"sex":sex,"location":city,"adress":adress,"telphone":telphone};
//		$.post(
//			url,
//			param,
//			function(){
//		        $(".addressdialog").hide();
//				window.location.reload(true);
//			});
//		
//	});
    
    
    //确认订单,将订单数据获取,存入数据库,并将当前订单号跳转到支付页面,支付页面处理订单信息
   /* $(".btn_order").click(function(){
    	var orderNo = 
    });
    */

    
    
    
});
