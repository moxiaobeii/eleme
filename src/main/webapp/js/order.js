


//    <!--近三个月订单-->
    function recentlyOrderFunction(){
        $.ajax({
            type: "POST", //用post方式传输
            data:'{}',
            dataType: "html", //数据格式：html
            url: 'order-recentlyOrder.jsp', //目标地址
            contentType: "application/json",
            success: function(date) {
                $(".center-box").html(date);
            }
        });
    }

//    <!--个人中心-->
    function personFun(){
        $.ajax({
            type: "POST", //用post方式传输
            data:'{}',
            dataType: "html", //数据格式：html
            url: 'order-person.jsp', //目标地址
            contentType: "application/json",
            success: function(date) {
                $(".center-box").html(date);
            }
        });
    }

//  个人资料
    function myMessage(){

    	$.ajax({
            type: "POST", //用post方式传输
            data:'{}',
            dataType: "html", //数据格式：html
            url: 'order-message.jsp', //目标地址
            contentType: "application/json",
            success: function(date) {
                $(".center-box").html(date);
            }
        });
       
    }
//        地址管理
    function myAddress(){
        $.ajax({
            type: "POST", //用post方式传输
            data:'{}',
            dataType: "html", //数据格式：html
            url: 'order-address.jsp', //目标地址
            contentType: "application/json",
            success: function(date) {
                $(".center-box").html(date);
            }
        });
    }

//        我的收藏
        function myCollection(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: 'order-mycollection.jsp', //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".center-box").html(date);
                }
            });
        }

        //近三月订单中的 订单详情 跳转
        function orderDetails(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: 'order-details.jsp', //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".center-box").html(date);
                }
            });
        }

        function evaluationFun(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: 'evalation.jsp', //目标地址s
                contentType: "application/json",
                success: function(date) {
                    $(".center-box").html(date);
                }
            });
        }
        
        //再来一份
        $(document).ready(function(){
            $(".td-six-a2").click(function(){
            	window.location.href="order-info.jsp";  
            });
        });

//		<!--鼠标点击改变颜色-->
        $(document).ready(function(){
            $(".slideBarOption").click(function(){
                $(".slideBarOption").removeClass("buleColor");
                $(this).addClass("buleColor");
                var value =  $(this).html();
                $("#span4 span").html("  " + value);
            });
        });
        
        
  //header导航栏js代码
        function personalCenter(){
        	
        	$.ajax({
          	  type:"post",
          	  url:"order-person.jsp",
          	  data:'{}',
          	  dataType: "html",
          	  success : function(data){   
          		  window.location.href="order.jsp";             		  
          	  }
        	});   
  	
        }
        
       
        