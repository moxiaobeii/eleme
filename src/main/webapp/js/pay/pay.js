$(document).ready(function(){
    //点击支付,改变支付框的边框
    $(".alipay").click(function(){
        $(this).css("border","1px solid #f74342");
        $(".after").show();
    });

    //支付时间限定在15分钟
    setInterval(payTime,1000);
    var m = 14;
    var ms = 59;
    function payTime(){
        if(m>=0){
            ms--;
        }if(ms<0){
            ms=59;
            m--;
            if((m==0)&&(ms==0)){    //当过了15分钟,清除定时器
                clearInterval(payTime);
            }
        }
        $("#pay_time1").text(m);
        $("#pay_time2").text(ms);
    }

    //查看订单详情
    $(".look_order").click(function(){
        $("#look_order_info").hide();   //隐藏上一个样式
        $("#look_order_msg").show();
    });
    //收起订单详情
    $(".look_up").click(function(){
        $("#look_order_info").show();   //隐藏上一个样式
        $("#look_order_msg").hide();
    });



});
