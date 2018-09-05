$(function(){
    //如果是4的倍数个位置的商家就在左边显示隐藏内容
    //$(".ordMes-main-in .sellers:nth-child(4)").mouseenter(function(){
    //    $(this).lastChild.css("left", "-300px");
    //    alert("aaaa");
    //});



    //鼠标移动上去某个商家信息模块，显示内容
    $(".ordMes-main-in .sellers").mouseenter(function(){
//        $(".ordMes-main-in .sellers:nth-child(4) .seller-mes-hide-out").css("left", "-300px");
        $(this).find(".seller-mes-hide-out").removeClass("hide");

    }).mouseleave(function(){
        $(this).find(".seller-mes-hide-out").addClass("hide");
    });
    $(".sellers .seller-mes-hide-out").mouseenter(function(){
        $(this).addClass("hide");
    });


});
