<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!--导入jQuery文件-->
    <script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <%-- <script src="${pageContext.request.contextPath }/js/index-NavigationBar-out.js"></script> --%>
<%--<script src="${pageContext.request.contextPath }/js/index-NavigationBar-in.jsp"></script>--%>    
	<!--外部引入公共css样式-->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/basic.css"> --%>
    <!--外部引入小图标css样式-->
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"> --%>
    <!--外部引入导航栏搜索的私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-NavigationBar-out.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-NavigationBar-in.css">
</head>
<body>
<%
		//处理请求（浏览器到服务器）的编码
		request.setCharacterEncoding("UTF-8");
%>

<div class="ordMes-all">
    <div class="ordMes-search">
        <div class="ordMes-search-main">
            <span>商家分类</span>
            <a class="item choice-out">全部商家</a>
            <a class="item">美食</a>
            <a class="item">快餐便当</a>
            <a class="item">特色菜系</a>
            <a class="item">小吃夜宵</a>
            <a class="item">果蔬生鲜</a>
            <a class="item">甜品饮品</a>
            <a class="item">商店超市</a>
            <a class="item">鲜花绿植</a>
            <a class="item">早餐</a>
            <a class="item">午餐</a>
            <a class="item">下午茶</a>
            <a class="item">晚餐</a>
            <a class="item">夜宵</a>
            <div class="ordMes-search-main-next choice-in-show">
                <a class="item choice-in">全部</a>
                <a class="item">简餐便当</a>
                <a class="item">小吃炸串</a>
                <a class="item">地方菜系</a>
                <a class="item">汉堡披萨</a>
                <a class="item">面食粥点</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">简餐</a>
                <a class="item">汉堡</a>
                <a class="item">烧腊饭</a>
                <a class="item">米粉面馆</a>
                <a class="item">煲仔饭</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">川湘菜</a>
                <a class="item">东北菜</a>
                <a class="item">其他菜系</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">地方小吃</a>
                <a class="item">烧烤</a>
                <a class="item">小龙虾</a>
                <a class="item">炸鸡炸串</a>
                <a class="item">鸭脖卤味</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">水果</a>
                <a class="item">海鲜水产</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">甜品</a>
                <a class="item">奶茶果汁</a>
                <a class="item">面包蛋糕</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">大型超市</a>
                <a class="item">休闲零食</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">鲜花</a>
                <a class="item">绿植</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">奶茶果汁</a>
                <a class="item">汉堡</a>
                <a class="item">米粉面馆</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">简餐</a>
                <a class="item">汉堡</a>
                <a class="item">面包蛋糕</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">甜品</a>
                <a class="item">奶茶果汁</a>
                <a class="item">面包蛋糕</a>
                <a class="item">炸鸡小吃</a>
                <a class="item">鸭脖卤味</a>
                <a class="item">水果</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">简餐</a>
                <a class="item">奶茶果汁</a>
                <a class="item">川湘菜</a>
                <a class="item">汉堡</a>
                <a class="item">地方小吃</a>
                <a class="item">米粉面馆</a>
                <a class="item">炸鸡炸串</a>
            </div>
            <div class="ordMes-search-main-next">
                <a class="item choice-in">全部</a>
                <a class="item">汉堡</a>
                <a class="item">地方小吃</a>
                <a class="item">米粉面馆</a>
                <a class="item">小龙虾</a>
                <a class="item">烧烤</a>
                <a class="item">炸鸡炸串</a>
            </div>
        </div>
    </div>
    <div class="ordMes-main-out">
        <div class="ordMes-main-in">
        </div>
    </div>
</div>

<script type="text/javascript">
	
	$(function(){
		var indexT;
	    <!--导航栏选中显示餐馆的结果-->
	    /* $(document).ready(function(){
	        $.ajax({
	            type: "POST", //用post方式传输
	            data:'{}',
	            dataType: "html", //数据格式：html
	            url: 'index-NavigationBar-in.jsp', //目标地址
	            contentType: "application/json",
	            success: function(date) {
	                $(".ordMes-main-in").html(date);
	            }
	        });
	    }); */
	
	    //商家导航栏选项卡
	    //上
	    $(".ordMes-search-main>.item").click(function(){
	    	//一点击就把上次的内容清空
	    	$(".ordMes-main-in").empty();
	        //通过 .index()方法获取元素下标，从0开始，赋值给某个变量	
	        indexT = $(this).index();
	        //被选中的追加一个类（即获得指定属性）
	        $(this).addClass("choice-out");
	        //其他的有该类的移除
	        $(this).siblings(".item").removeClass("choice-out");
	        $(".ordMes-search-main-next :first-child").addClass("choice-in").siblings().removeClass("choice-in");
	        //如果选中的是全部商品则下面的导航栏隐藏
	        if(indexT == 1 ){
	            $(this).siblings("div").hide();
	        }else{
	            //让内容框的第 (indexT - 2) 个 div显示出来，其他的被隐藏
	            $(".ordMes-search-main>.ordMes-search-main-next").eq(indexT -2).show().siblings("div").hide();
	        }
	        //把上面大的导航栏选项卡某个索引值indexT通过ajax传递到indexServlet层
	        //(indexT-1)得到当前点击的是第几个选项(0就是代表全部商家，其他代表某个选项指定的商家)
	        
	        $.post(
	        	//把索引值传过去给indexServlet层的index方法
	        	"${pageContext.request.contextPath }/indexServlet?method=indexOut", 
	        	"indexT="+(indexT-1), 
	        	function(json) {
					//创建标签存放商家数据
					//找到a标签的父节点
					var $parent = $(".ordMes-main-in");
					for(var i=0; i<json.length; i++){
				    	var $a = $("<a></a>").addClass("sellers");
				    	var $div1 = $("<div></div>").addClass("seller-logo");
				    	
						var $img = $("<img/>").attr({"src":"../"+json[i].logo+"", "alt":json[i].bname});
				  		var $span11 = $("<span></span>").html(json[i].distribution_time+"分钟");
				  		
				  		var $div2 = $("<div></div>").addClass("seller-mes");
				  		var $div21 = $("<div></div>").addClass("seller-title").html(json[i].bname);
				  		var $div22 = $("<div></div>").addClass("star");
				  		var $span21 = $("<span></span>").addClass("fa fa-star");
				  		var $span22 = $("<span></span>").addClass("fa fa-star");
				  		var $span23 = $("<span></span>").addClass("fa fa-star");
				  		var $span24 = $("<span></span>").addClass("fa fa-star");
				  		var $span25 = $("<span></span>").addClass("fa fa-star-half-full");
				  		var $div23 = $("<div></div>").addClass("seller-cost").html("配送费￥"+ json[i].distribution_fee);
				  		var $div24 = $("<div></div>").addClass("seller-activity");
				  		
				  		var $div3 = $("<div></div>").addClass("seller-mes-hide-out").addClass("hide");
				  		var $div31 = $("<div></div>").addClass("seller-mes-hide-in");
				  		var $div311 = $("<div></div>").addClass("seller-mes-hide-name").html(json[i].bname);
				  		var $div312 = $("<div></div>").addClass("seller-mes-hide-type").html(json[i].category);
				  		var $ul = $("<ul></ul>").addClass("seller-mes-hide-other");
				  		var $li1 = div23 = $("<li></li>").html("配送费￥"+ json[i].distribution_fee);
				  		var $li2 = $("<li></li>").html("平均");
				  		var $span31 = $("<span></span>").addClass("service-time").html(json[i].distribution_time +"分钟");
	        
	        			$parent.append($a);
				        $a.append($div1);
				    	$a.append($div2);
				    	$a.append($div3);
				    	$div1.append($img);
				    	$div1.append($span11);
				    	$div2.append($div21);
				  		$div2.append($div22);
				  		$div2.append($div23);
				  		$div2.append($div24);
				  		$div22.append($span21);
				  		$div22.append($span22);
				  		$div22.append($span23);
				  		$div22.append($span24);
				  		$div22.append($span25);
				  		$div3.append($div31);
				  		$div31.append($div311);
				  		$div31.append($div312);
				  		$div31.append($ul);
				  		$ul.append($li1);
				  		$ul.append($li2);
				  		$li2.append($span31);
					}
				}, "json"
	        );
	        
	    });
	    
	    
	    //下
	    $(".ordMes-search-main-next>.item").click(function(){
	    	//一点击就把上次的内容清空
	    	$(".ordMes-main-in").empty();
	    	
	        //被选中的追加一个类（即获得指定属性）
	        $(this).addClass("choice-in");
	        //其他的有该类的移除
	        $(this).siblings(".item").removeClass("choice-in");
	        
	        //把下面小的导航栏选项卡某个索引值indexT通过ajax传递到indexServlet层
	        //获取当前选中的节点的索引值
	        var indexB = $(this).index();
	        //(indexB)得到当前点击的是第几个选项(0就是代表全部商家，其他代表某个选项指定的商家)
	        $.post(
	        	//把索引值传过去给indexServlet层index方法
	        	"${pageContext.request.contextPath }/indexServlet?method=indexIn", 
	        	{"indexT":indexT-1, "indexB":indexB},
	        	//回调函数拿到查询到的商家信息
	        	function(json){
	        		//创建标签存放商家数据
					//找到a标签的父节点
					var $parent = $(".ordMes-main-in");
					for(var i=0; i<json.length; i++){
				    	var $a = $("<a></a>").addClass("sellers");
				    	var $div1 = $("<div></div>").addClass("seller-logo");
				    	
						var $img = $("<img/>").attr({"src":"../"+json[i].logo+"", "alt":json[i].bname});
				  		var $span11 = $("<span></span>").html(json[i].distribution_time+"分钟");
				  		
				  		var $div2 = $("<div></div>").addClass("seller-mes");
				  		var $div21 = $("<div></div>").addClass("seller-title").html(json[i].bname);
				  		var $div22 = $("<div></div>").addClass("star");
				  		var $span21 = $("<span></span>").addClass("fa fa-star");
				  		var $span22 = $("<span></span>").addClass("fa fa-star");
				  		var $span23 = $("<span></span>").addClass("fa fa-star");
				  		var $span24 = $("<span></span>").addClass("fa fa-star");
				  		var $span25 = $("<span></span>").addClass("fa fa-star-half-full");
				  		var $div23 = $("<div></div>").addClass("seller-cost").html("配送费￥"+ json[i].distribution_fee);
				  		var $div24 = $("<div></div>").addClass("seller-activity");
				  		
				  		var $div3 = $("<div></div>").addClass("seller-mes-hide-out").addClass("hide");
				  		var $div31 = $("<div></div>").addClass("seller-mes-hide-in");
				  		var $div311 = $("<div></div>").addClass("seller-mes-hide-name").html(json[i].bname);
				  		var $div312 = $("<div></div>").addClass("seller-mes-hide-type").html(json[i].category);
				  		var $ul = $("<ul></ul>").addClass("seller-mes-hide-other");
				  		var $li1 = div23 = $("<li></li>").html("配送费￥"+ json[i].distribution_fee);
				  		var $li2 = $("<li></li>").html("平均");
				  		var $span31 = $("<span></span>").addClass("service-time").html(json[i].distribution_time +"分钟");
	        
	        			$parent.append($a);
				        $a.append($div1);
				    	$a.append($div2);
				    	$a.append($div3);
				    	$div1.append($img);
				    	$div1.append($span11);
				    	$div2.append($div21);
				  		$div2.append($div22);
				  		$div2.append($div23);
				  		$div2.append($div24);
				  		$div22.append($span21);
				  		$div22.append($span22);
				  		$div22.append($span23);
				  		$div22.append($span24);
				  		$div22.append($span25);
				  		$div3.append($div31);
				  		$div31.append($div311);
				  		$div31.append($div312);
				  		$div31.append($ul);
				  		$ul.append($li1);
				  		$ul.append($li2);
				  		$li2.append($span31);
					}
	        	}, "json"
	        );
	    });
	    
	    
	  //如果是4的倍数个位置的商家就在左边显示隐藏内容
	    //$(".ordMes-main-in .sellers:nth-child(4)").mouseenter(function(){
	    //    $(this).lastChild.css("left", "-300px");
	    //    alert("aaaa");
	    //});



	    //鼠标移动上去某个商家信息模块，显示内容
	    $(".ordMes-main-in .sellers").mouseenter(function(){
 	        $(".ordMes-main-in .sellers:nth-child(4) .seller-mes-hide-out").css("left", "-300px");
	        $(this).find(".seller-mes-hide-out").removeClass("hide");

	    }).mouseleave(function(){
	        $(this).find(".seller-mes-hide-out").addClass("hide");
	    });
	    $(".sellers .seller-mes-hide-out").mouseenter(function(){
	        $(this).addClass("hide");
	    });
	
	});

</script>
</body>
</html>