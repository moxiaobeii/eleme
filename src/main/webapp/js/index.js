$(function(){
        //<!-- 头部-->
        $(document).ready(function(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: "../reception/header.jsp", //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".header").html(date);
                }
            });
        });

        //<!--右边购物车-->
        $(document).ready(function(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: '../reception/sidebar.jsp', //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".sidebar").html(date);
                }
            });
        });

        //<!--导航栏选中显示餐馆的整个内容-->
        $(document).ready(function(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: '../reception/index-NavigationBar-out.jsp', //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".ordMes-all").html(date);
                }
            });
        });

        //<!--底部-->
        $(document).ready(function(){
            $.ajax({
                type: "POST", //用post方式传输
                data:'{}',
                dataType: "html", //数据格式：html
                url: '../reception/footer.jsp', //目标地址
                contentType: "application/json",
                success: function(date) {
                    $(".footer").html(date);
                }
            });
        });





    //搜索框获取焦点时变长，失去焦点时恢复
    $("#global-search").focus(function(){
        $(this).css("width", "320px");
    }).blur(function(){
        $(this).css("width", "236px");
    });
    
    //点击搜索按钮，获取文本框的值
    $("#search-btn").click(function(){
    	//去前后空格
    	var searchValue = $.trim($("#global-search").val());
    	alert(searchValue);
    	//将要搜索的值通过ajax传到SearchServlet层
    	/*$.post(
            	//把索引值传过去给indexServlet层index方法
            	"${pageContext.request.contextPath}/indexServlet?method=search", 
            	"searchValue="+searchValue, 
            	//回调函数拿到查询到的商家信息
            	function(searchJson){
            		alert(searchJson);
            	}, "json"
         );*/
    });

    //鼠标移入“谁去拿外卖”变大
    $("#postOrd-who").mouseenter(function(){
        $(this).animate({
            width: '190px',
            height: '60px'
        },"slow");
    }).mouseleave(function(){
        $(this).animate({
            width: '186px',
            height: '55px',
        },"slow");
    });

});