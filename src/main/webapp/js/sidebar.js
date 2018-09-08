// $(function(){
//
//
//     //右边导航栏-鼠标点击右边导航栏实现选项卡和显示和隐藏
//     $("#up-cartbtn").click(function(){
//         if($(".sidebar").hasClass("show")) {
//             if($(this).hasClass("choice-left")){
//                 $(".sidebar").animate({
//                     right:'-295'
//                 }).removeClass("show");
//             }
//         }else{
//             $(".sidebar").animate({
//                 right:'0'
//             }).addClass("show");
//         }
//
//         $(this).addClass("choice-left").siblings().removeClass("choice-left");
//         $("#sidebar-contentop-cart").addClass("choice-right").siblings().removeClass("choice-right");
//     });
//
//     $("#myMes").click(function(){
//         //判断有无被选中，有则显示右边导航栏
//         if($(".sidebar").hasClass("show")) {
//             if($(this).hasClass("choice-left")){
//                 $(".sidebar").animate({
//                     right:'-295'
//                 }).removeClass("show");
//             }
//         }else{
//             $(".sidebar").animate({
//                 right:'0'
//             }).addClass("show");
//         }
//
//         $(this).addClass("choice-left").siblings().removeClass("choice-left");
//         $("#sidebar-content-mes").addClass("choice-right").siblings().removeClass("choice-right");
//     });
//
//     //点击了body隐藏右边导航栏
//     $(".sidebar").nextAll().click(function(){
//         $(".sidebar").animate({
//             right:'-295px'
//         }).removeClass("show");
//         $("#up-cartbtn").removeClass("choice-left");
//         $("#myMes").removeClass("choice-left");
//     });
//     $(".header").click(function(){
//         $(".sidebar").animate({
//             right:'-295px'
//         }).removeClass("show");
//         $("#up-cartbtn").removeClass("choice-left");
//         $("#myMes").removeClass("choice-left");
//     });
//     //点击了隐藏按钮隐藏右边导航栏
//     $("#hide").click(function () {
//         $(".sidebar").animate({
//             right:'-295px'
//         }).removeClass("show");
//         $("#up-cartbtn").removeClass("choice-left");
//         $("#myMes").removeClass("choice-left");
//     });
//     $("#hide2").click(function () {
//         $(".sidebar").animate({
//             right:'-295px'
//         }).removeClass("show");
//         $("#up-cartbtn").removeClass("choice-left");
//         $("#myMes").removeClass("choice-left");
//     });
//
//
//     //右边导航栏购物车一个菜式的份数
//     var num = parseFloat($("#num").val());
//     //右边导航栏购物车点加减按钮实现某个菜式数量的加减
//     $("#sub").click(function () {
//         if(num>=0){
//             $("#num").text(num-1);
//         }
//
//     });
//     $("#add").click(function () {
//         $("#num").text(num+1);
//     });
//
//
//     //右边导航栏购物车一个菜式的总价（这里假设单价是12元）
//     var price = num*12;
//     $("#price").html(price);
//     //右边导航栏购物车总份数
//     var allNum = $("#allNum").html(num);
//     //设置右边导航栏购物车总价钱
//     $("#allPrice").html(price);
// });