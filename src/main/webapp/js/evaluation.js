/**
 * Created by wu on 2018/8/13.
 */
$(function(){

   var re = 0; //为了控制点击评分后，鼠标移除不会有影响

   //鼠标移动和点击书剑
   var $len = 0;
   $(".icon-pingfenhui").mouseover(function(){
      //鼠标移入颜色改变，后面兄弟节点不变
      $(this).nextAll().css("color","#dbdbdb").end().add($(this).prevAll()).css("color","#eb6643");
      $len = $(this).add($(this).prevAll()).length;
      updateText($len);

   }).click(function(){
      $(this).nextAll().css("color","#dbdbdb").end().add($(this).prevAll()).css("color","#eb6643");
      re = 1;
      $(".service-text").css("display","block");
      updateText($len);
   });

   //根据鼠标移动和点击，修改相应文和显示评价框
      var updateText = function(len){
         if(len == 1){
            $(".score-text").html("极差").css("color","rgb(163, 166, 175)");
            $(".service-area").attr("placeholder","说说哪里做的不好，帮助商家改进");

            var txt1=$("<span>服务态度差</span>").addClass("eval");
            var txt2=$("<span>送餐慢</span>").addClass("eval");
            var txt3=$("<span>菜品少或送错</span>").addClass("eval");
            $(".service-text").children("span").remove().end().append(txt1,txt2,txt3).children("span").click(function(){
            	var text1 = $(this).text();
                var text2 = $(".service-area").text();
                $(".service-area").text(text2+" "+text1);
                $(this).remove();
            });

         }else if(len == 2){
            var txt4=$("<span>服务态度一般</span>").addClass("eval");
            var txt5=$("<span>送餐一般</span>").addClass("eval");
            var txt6=$("<span>味道一般</span>").addClass("eval");
            $(".score-text").html("失望").css("color","rgb(163, 166, 175)");
            $(".service-area").attr("placeholder","说说哪里做的不好，帮助商家改进");

            $(".service-text").children("span").remove().end().append(txt4,txt5,txt6).children("span").click(function(){
            	var text1 = $(this).text();
                var text2 = $(".service-area").text();
                $(".service-area").text(text2+" "+text1);
                $(this).remove();
            });
         }else if(len == 3){
            var txt17=$("<span>服务态度一般</span>").addClass("eval");
            var txt18=$("<span>送餐一般</span>").addClass("eval");
            var txt19=$("<span>味道一般</span>").addClass("eval");
            $(".score-text").html("一般").css("color","rgb(241, 139, 27)");
            $(".service-area").attr("placeholder","说说哪里做的不好，帮助商家改进");
            $(".service-text").children("span").remove().end().append(txt17,txt18,txt19).children("span").click(function(){
            	var text1 = $(this).text();
                var text2 = $(".service-area").text();
                $(".service-area").text(text2+" "+text1);
                $(this).remove();
            });
         }else if(len == 4){
            $(".score-text").html("满意").css("color","rgb(241, 139, 27)");
            $(".service-area").attr("placeholder","说说哪里做的好，帮助小伙伴选择");
            var txt7=$("<span>送餐快</span>").addClass("eval");
            var txt8=$("<span>味道棒</span>").addClass("eval");
            var txt9=$("<span>服务好</span>").addClass("eval");
            var txt10=$("<span>分量足</span>").addClass("eval");
            var txt11=$("<span>干净卫生</span>").addClass("eval");
            $(".service-text").children("span").remove().end().append(txt7,txt8,txt9,txt10,txt11).children("span").click(function(){
            	var text1 = $(this).text();
                var text2 = $(".service-area").text();
                $(".service-area").text(text2+" "+text1);
                $(this).remove();
            });

         }else if(len == 5){
            $(".score-text").html("惊喜").css("color","rgb(235, 102, 67)");
            $(".service-area").attr("placeholder","说说哪里做的好，帮助小伙伴选择");
            var txt12=$("<span>送餐快</span>").addClass("eval");
            var txt13=$("<span>味道棒</span>").addClass("eval");
            var txt14=$("<span>服务好</span>").addClass("eval");
            var txt15=$("<span>分量足</span>").addClass("eval");
            var txt16=$("<span>干净卫生</span>").addClass("eval");
            $(".service-text").children("span").remove().end().append(txt12,txt13,txt14,txt15,txt16).children("span").click(function(){
            	var text1 = $(this).text();
                var text2 = $(".service-area").text();
                $(".service-area").text(text2+" "+text1);
                $(this).remove();
            });

         }else{
            $(".score-text").html("点击星星打分");
         }
      };
      //鼠标移出事件
      $(".service-item").mouseout(function(){
         if(re === 0) {
            $(this).children('a').css("color", "#dbdbdb");
         }
      });
      
  
      //送餐速度拖拽时间
      //获得图标原始位置
      var ox = 0;
      var left = 0;
      var time = 0;
      var  statu =false;
      $(".timeslider-handle").mousedown(function(e){
         ox = e.pageX - left;
         statu = true;
      });

      $(document).mouseup(function(){
         statu = false;
      });

      $(".appraise-driver-progress").mousemove(function(e){
         if(statu){
            left = e.pageX - ox;
            if(left < 0){
               left = 0;
            }

         }
         if(left > 240){
            left = 240
         }
         $(".timeslider-handle").css("left",left);
         $(".bar").width(left);
         time = Math.round((left/240)*120);
         if(time == 0){
            $(".appraise-driver-time").html(" 请评价送餐速度").css("color",'#999');
         }else{
            $(".appraise-driver-time").html(time+"分钟").css("color",'#0089dc');
         }
       

      });
    
    

});



