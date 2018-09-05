<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>首页</title>
    <!--导入jQuery文件-->
    <script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--外部引入公共css样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/basic.css">
    <!--外部引入小图标css样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
    <!--外部引入私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index.css">
    <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/header.css">
    <!--外部引入低部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/footer.css">
    <!--外部引入右边购物车私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/sidebar.css">
    <!--外部引入搜索框信息私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-SearchBar.css">
    <!--外部引入搜索框找不到商家信息私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-SearchBar2.css">
    <!--导入js文件 <script src="../js/index.js"></script>-->
    <!--外部引入导航栏搜索的私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-NavigationBar-out.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-NavigationBar-in.css">
   
   
</head>
<body>
	<%
		//处理请求（浏览器到服务器）的编码
		request.setCharacterEncoding("UTF-8");
	%>
    <!-- 头部 -->
    <div class="header"></div>


    <div class="sidebar"></div>

    <!--主要内容-->
    <div class="main-content">
        <div class="OrdAddress">
            <div class="location">
                <span>当前位置</span>
                <span class="location-current">
                    <a>南沙科技创新中心</a>
                </span>
                <span>
                    <a>[切换地址]</a>
                </span>
            </div>
            <div class="place-search">
                <a src="/" class="fa fa-search" id="search-btn" title="搜索美食"></a>
                <input id="global-search" class="place-search-input" placeholder="搜索商家,美食...">
            </div>
        </div>
        <div class="getOrd">
            <div class="postOrd">
                <img src="${pageContext.request.contextPath }/image/index-1.png" alt="谁去拿外卖" id="postOrd-who">
            </div>
        </div>
        <!-- 通过导航栏选中显示到结果的整个内容区和搜索框搜索商家商品信息都放在这个div里 -->
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
		        	<c:forEach var="listIndex" items="${LISTINDEX}" >
		        		<a href="/" class="sellers">
					        <div class="seller-logo">
					            <img src=${listIndex.logo}  alt=${listIndex.bname}>
					            <span>${listIndex.distribution_time}分钟</span>
					        </div>
					        <div class="seller-mes">
					            <div class="seller-title">${listIndex.bname}</div>
					            <div class="star">
					                <span class="fa fa-star"></span>
					                <span class="fa fa-star"></span>
					                <span class="fa fa-star"></span>
					                <span class="fa fa-star"></span>
					                <span class="fa fa-star-half-full"></span>
					            </div>
					            <div class="seller-cost">配送费￥${listIndex.distribution_fee}</div>
					            <div class="seller-activity"></div>
					        </div>
					        <div class="seller-mes-hide-out hide">
					            <div class="seller-mes-hide-in">
					                <div class="seller-mes-hide-name">${listIndex.bname}</div>
					                <div class="seller-mes-hide-type">${listIndex.category}</div>
					                <ul class="seller-mes-hide-other">
					                    <li>配送费￥${listIndex.distribution_fee}</li>
					                    <li>
					                        平均
					                        <span class="service-time">${listIndex.distribution_time}</span>
					                        分钟送达
					                    </li>
					                </ul>
					            </div>
					        </div>
					    </a>
		        	</c:forEach>
		        </div>
	    	</div>
        	
        	
        	
        	
        </div>
    </div>

    <!-- 低部 -->
    <div class="footer"></div>
    
    
    <script type="text/javascript">
    	var indexT;
	    $(function(){
	        //<!-- 头部-->
	        $(document).ready(function(){
	            $.ajax({
	                type: "POST", //用post方式传输
	                data:'{}',
	                dataType: "html", //数据格式：html
	                url: "${pageContext.request.contextPath }/reception/header.jsp", //目标地址
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
	                url: '${pageContext.request.contextPath }/reception/sidebar.jsp', //目标地址
	                contentType: "application/json",
	                success: function(date) {
	                    $(".sidebar").html(date);
	                }
	            });
	        });
	
	        //<!--导航栏选中显示餐馆的整个内容-->
	        /* $(document).ready(function(){
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
	        }); */
	
	        //<!--底部-->
	        $(document).ready(function(){
	            $.ajax({
	                type: "POST", //用post方式传输
	                data:'{}',
	                dataType: "html", //数据格式：html
	                url: '${pageContext.request.contextPath }/reception/footer.jsp', //目标地址
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
		    
		    //搜索回车实现单击效果
    	    $("#global-search").keydown(function(){
             if (event.keyCode == "13") {
            	//keyCode=13是回车键
            	//获取搜索框的值
  		    	var searchValue = $("#global-search").val();
  		    	//判断搜索框是否为空，不为空才传数据去ctrl层
  		    	if(searchValue != ""){
  		    		//首先清除当前内容区的全部内容
  		    		$(".ordMes-all").empty();
  		    		//先找到div标签的父节点
 	            	var $parent = $(".ordMes-all");
 	            	//显示一个加载中的文字
             		var $div = $("<div></div>").addClass("seller-small-mes-container").css({"width":"1190px", "height":"140px"});
      				var $div1 = $("<div></div>").addClass("search-nodata");           				
      				/*var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata"); */
      				var $div12 = $("<div></div>").addClass("typo-small").html("正在载入更多商家...").css("font-size","15");
      				$parent.append($div);
      				$div.append($div1);
      				/* $div1.append($img11); */
      				$div1.append($div12);
  		    		setTimeout(function(){
  		    			//将要搜索的值通过ajax传到SearchServlet层
      			    	$.post(
      			            	//把索引值传过去给indexServlet层index方法
      			            	"${pageContext.request.contextPath}/indexServlet?method=indexSearch", 
      			            	"searchValue="+searchValue, 
      			            	//回调函数拿到查询到的商家信息
      			            	function(searchJson){
      			            		//首先清除当前内容区的全部内容
      			            		$(".ordMes-all").empty();
      			            		//判断搜索出来的json是否有内容（即搜索框的东西在数据库是否能匹配上）
      			            		//先找到div标签的父节点
      			            		var $parent = $(".ordMes-all");
      			            		if(searchJson != ""){
      			            			//创建节点并循环展示出商家和其部分商品
      			            			for(var i=0; i<searchJson.length; i++){
      			            				var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");

      			            				var $table = $("<table></table>").addClass("seller-mes");
      			            				
      			            				var $tbody = $("<tbody></tbody>");
      			            				
      			            				var $tr1 = $("<tr></tr>");
      			            				var $th11 = $("<th></th>").attr("colspan","4");
      			            				
      			            				var $h4111 = $("<h4></h4>").addClass("seller-h4");
      			            				
      			            				var $a1111 = $("<a></a>").addClass("seller-name").html(searchJson[i].bname);
      			            				
      			            				var $div112 = $("<div></div>").addClass("star");
      			            				
      			            				var $span1121 = $("<span></span>").addClass("fa fa-star");
      			            				var $span1122 = $("<span></span>").addClass("fa fa-star");
      			            				var $span1123 = $("<span></span>").addClass("fa fa-star");
      			            				var $span1124 = $("<span></span>").addClass("fa fa-star");
      			            				var $span1125 = $("<span></span>").addClass("fa fa-star-half-full");
      			            				var $small113 = $("<small></small>");
      			            				
      			            				var $small114 = $("<small></small>").html("平均");
      			            				
      			            				var $span1141 = $("<span></span>").addClass("service-time").html(searchJson[i].distribution_time + "分种送达");
      			            				$parent.append($div);
      			            				$div.append($table);
      			            				$table.append($tbody);
      			            				$tbody.append($tr1);
      			            				$tr1.append($th11);
      			            				$th11.append($h4111);
      			            				$h4111.append($a1111);
      			            				$th11.append($div112);
      			            				$div112.append($span1121);
      			            				$div112.append($span1122);
      			            				$div112.append($span1123);
      			            				$div112.append($span1124);
      			            				$div112.append($span1125);
      			            				$th11.append($small113);
      			            				$th11.append($small114);
      			            				$small114.append($span1141);
      			            				
      			            				
      			            				if(searchJson[i].goods != ""){
      			            					for(var j=0; j<3; j++){
      				            					var $tr2 = $("<tr></tr>").addClass("food-mes");
      					            				var $td21 = $("<td></td>").addClass("food-td");			            				
      					            				var $a211 = $("<a></a>");			            				
      					            				var $span2111 = $("<span></span>").addClass("food-mes-in").html(searchJson[i].goods[j].gname);			            				
      					            				var $br2112 = $("<br/>");		
      					            				var $td22 = $("<td></td>").addClass("search-col2 food-td");
      					            				var $a221 = $("<a></a>").addClass("food-price").html("¥ " + searchJson[i].goods[j].price);
      					            				
      					            				var $td23 = $("<td></td>").addClass("search-col3  food-td");
      					            				var $a231 = $("<a></a>").addClass("btn").html("去购买");
      					            				var $td24 = $("<td></td>").addClass("search-col4  food-td");
      					            				var $div241 = $("<div></div>").addClass("star");
      					            				var $span2411 = $("<span></span>").addClass("fa fa-star");
      					            				
      					            				var $span2412 = $("<span></span>").addClass("fa fa-star");
      					            				var $span2413 = $("<span></span>").addClass("fa fa-star");
      					            				var $span2414 = $("<span></span>").addClass("fa fa-star");
      					            				var $span2415 = $("<span></span>").addClass("fa fa-star");
      					            				var $div242 = $("<div></div>").addClass("food-months-amount").html("月售"+ searchJson[i].goods[j].months_amount +"份");
      					            				$tbody.append($tr2);
      					            				$tr2.append($td21);
      					            				$td21.append($a211);
      					            				$a211.append($span2111);
      					            				$a211.append($br2112);
      					            				$tr2.append($td22);
      					            				$td22.append($a221);
      					            				$tr2.append($td23);
      					            				$td23.append($a231);
      					            				$tr2.append($td24);
      					            				$td24.append($div241);
      					            				$div241.append($span2411);
      					            				$div241.append($span2412);
      					            				$div241.append($span2413);
      					            				$div241.append($span2414);
      					            				$div241.append($span2415);
      					            				$td24.append($div242);
      			            					}
      			            				}
      			            				
      			            			}

      			            		}else{
      			            			//显示一个找不到指定内容的商家
      			            			var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");
      		            				var $div1 = $("<div></div>").addClass("search-nodata");	            				
      		            				var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata");
      		            				var $div12 = $("<div></div>").addClass("typo-small").html("附近没有符合您的关键字的商家和美食，换个关键字试试吧");
      		            				$parent.append($div);
      		            				$div.append($div1);
      		            				$div1.append($img11);
      		            				$div1.append($div12);
      			            		}
      			            	}, "json"
      			         );
  		    		}, 100);
  		    	}
            		
             	}
         	});
		    
		    
    	  //点击搜索按钮，获取文本框的值
 		    $("#search-btn").click(function(){
 		    	//获取搜索框的值
 		    	var searchValue = $("#global-search").val();
 		    	//判断搜索框是否为空，不为空才传数据去ctrl层
 		    	if(searchValue != ""){
 		    		//首先清除当前内容区的全部内容
 		    		$(".ordMes-all").empty();
 		    		//先找到div标签的父节点
	            	var $parent = $(".ordMes-all");
	            	//显示一个加载中的文字
            		var $div = $("<div></div>").addClass("seller-small-mes-container").css({"width":"1190px", "height":"100px"});
     				var $div1 = $("<div></div>").addClass("search-nodata");           				
     				/*var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata"); */
     				var $div12 = $("<div></div>").addClass("typo-small").html("正在载入更多商家...").css("font-size","15");
     				$parent.append($div);
     				$div.append($div1);
     				/* $div1.append($img11); */
     				$div1.append($div12);
 		    		setTimeout(function(){
 		    			//将要搜索的值通过ajax传到SearchServlet层
     			    	$.post(
     			            	//把索引值传过去给indexServlet层index方法
     			            	"${pageContext.request.contextPath}/indexServlet?method=indexSearch", 
     			            	"searchValue="+searchValue, 
     			            	//回调函数拿到查询到的商家信息
     			            	function(searchJson){
     			            		//首先清除当前内容区的全部内容
     			            		$(".ordMes-all").empty();
     			            		//判断搜索出来的json是否有内容（即搜索框的东西在数据库是否能匹配上）
     			            		//先找到div标签的父节点
     			            		var $parent = $(".ordMes-all");
     			            		if(searchJson != ""){
     			            			//创建节点并循环展示出商家和其部分商品
     			            			for(var i=0; i<searchJson.length; i++){
     			            				var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");

     			            				var $table = $("<table></table>").addClass("seller-mes");
     			            				
     			            				var $tbody = $("<tbody></tbody>");
     			            				
     			            				var $tr1 = $("<tr></tr>");
     			            				var $th11 = $("<th></th>").attr("colspan","4");
     			            				
     			            				var $h4111 = $("<h4></h4>").addClass("seller-h4");
     			            				
     			            				var $a1111 = $("<a></a>").addClass("seller-name").html(searchJson[i].bname);
     			            				
     			            				var $div112 = $("<div></div>").addClass("star");
     			            				
     			            				var $span1121 = $("<span></span>").addClass("fa fa-star");
     			            				var $span1122 = $("<span></span>").addClass("fa fa-star");
     			            				var $span1123 = $("<span></span>").addClass("fa fa-star");
     			            				var $span1124 = $("<span></span>").addClass("fa fa-star");
     			            				var $span1125 = $("<span></span>").addClass("fa fa-star-half-full");
     			            				var $small113 = $("<small></small>");
     			            				
     			            				var $small114 = $("<small></small>").html("平均");
     			            				
     			            				var $span1141 = $("<span></span>").addClass("service-time").html(searchJson[i].distribution_time + "分种送达");
     			            				$parent.append($div);
     			            				$div.append($table);
     			            				$table.append($tbody);
     			            				$tbody.append($tr1);
     			            				$tr1.append($th11);
     			            				$th11.append($h4111);
     			            				$h4111.append($a1111);
     			            				$th11.append($div112);
     			            				$div112.append($span1121);
     			            				$div112.append($span1122);
     			            				$div112.append($span1123);
     			            				$div112.append($span1124);
     			            				$div112.append($span1125);
     			            				$th11.append($small113);
     			            				$th11.append($small114);
     			            				$small114.append($span1141);
     			            				
     			            				
     			            				if(searchJson[i].goods != ""){
     			            					for(var j=0; j<3; j++){
     				            					var $tr2 = $("<tr></tr>").addClass("food-mes");
     					            				var $td21 = $("<td></td>").addClass("food-td");			            				
     					            				var $a211 = $("<a></a>");			            				
     					            				var $span2111 = $("<span></span>").addClass("food-mes-in").html(searchJson[i].goods[j].gname);			            				
     					            				var $br2112 = $("<br/>");		
     					            				var $td22 = $("<td></td>").addClass("search-col2 food-td");
     					            				var $a221 = $("<a></a>").addClass("food-price").html("¥ " + searchJson[i].goods[j].price);
     					            				
     					            				var $td23 = $("<td></td>").addClass("search-col3  food-td");
     					            				var $a231 = $("<a></a>").addClass("btn").html("去购买");
     					            				var $td24 = $("<td></td>").addClass("search-col4  food-td");
     					            				var $div241 = $("<div></div>").addClass("star");
     					            				var $span2411 = $("<span></span>").addClass("fa fa-star");
     					            				
     					            				var $span2412 = $("<span></span>").addClass("fa fa-star");
     					            				var $span2413 = $("<span></span>").addClass("fa fa-star");
     					            				var $span2414 = $("<span></span>").addClass("fa fa-star");
     					            				var $span2415 = $("<span></span>").addClass("fa fa-star");
     					            				var $div242 = $("<div></div>").addClass("food-months-amount").html("月售"+ searchJson[i].goods[j].months_amount +"份");
     					            				$tbody.append($tr2);
     					            				$tr2.append($td21);
     					            				$td21.append($a211);
     					            				$a211.append($span2111);
     					            				$a211.append($br2112);
     					            				$tr2.append($td22);
     					            				$td22.append($a221);
     					            				$tr2.append($td23);
     					            				$td23.append($a231);
     					            				$tr2.append($td24);
     					            				$td24.append($div241);
     					            				$div241.append($span2411);
     					            				$div241.append($span2412);
     					            				$div241.append($span2413);
     					            				$div241.append($span2414);
     					            				$div241.append($span2415);
     					            				$td24.append($div242);
     			            					}
     			            				}
     			            				
     			            			}

     			            		}else{
     			            			//显示一个找不到指定内容的商家
     			            			var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");
     		            				var $div1 = $("<div></div>").addClass("search-nodata");	            				
     		            				var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata");
     		            				var $div12 = $("<div></div>").addClass("typo-small").html("附近没有符合您的关键字的商家和美食，换个关键字试试吧");
     		            				$parent.append($div);
     		            				$div.append($div1);
     		            				$div1.append($img11);
     		            				$div1.append($div12);
     			            		}
     			            	}, "json"
     			         );
 		    		}, 100);
 		    	}
 		    	
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
		        
		        //查询商家前先提示加载中缓冲一下
	    		//先找到div标签的父节点
	           	var $parent = $(".ordMes-main-in");
	           	//显示一个加载中的文字
          		var $div = $("<div></div>").addClass("seller-small-mes-container").css({"width":"1190px", "height":"100px"});
   				var $div1 = $("<div></div>").addClass("search-nodata");           				
   				/*var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata"); */
   				var $div12 = $("<div></div>").addClass("typo-small").html("正在载入更多商家...").css("font-size","15");
   				$parent.append($div);
   				$div.append($div1);
   				/* $div1.append($img11); */
   				$div1.append($div12);
	    		setTimeout(function(){
	    			$.post(
	   		        	//把索引值传过去给indexServlet层的index方法
	   		        	"${pageContext.request.contextPath }/indexServlet?method=indexOut", 
	   		        	"indexT="+(indexT-1), 
	   		        	function(json) {
	   		        		//先把提示加载中的内容清空
	   		        		$(".ordMes-main-in").empty();
	   						//创建标签存放商家数据
	   						//找到a标签的父节点
	   						var $parent = $(".ordMes-main-in");
	   						if(json != ""){
	   							for(var i=0; i<json.length; i++){
	   						    	var $a = $("<a></a>").addClass("sellers");
	   						    	var $div1 = $("<div></div>").addClass("seller-logo");
	   						    	
	   								var $img = $("<img/>").attr({"src":"${pageContext.request.contextPath }/"+json[i].logo+"", "alt":json[i].bname});
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
	   						}else{
	   							//显示一个找不到指定内容的商家
	   	            			var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");
	               				var $div1 = $("<div></div>").addClass("search-nodata");	            				
	               				var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata");
	               				var $div12 = $("<div></div>").addClass("typo-small").html("找不到相关商家");
	               				$parent.append($div);
	               				$div.append($div1);
	               				$div1.append($img11);
	               				$div1.append($div12);
	   						}
	   					}, "json"
	   		        );
	    		}, 100);  
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
		        
		        //查询商家前先提示加载中缓冲一下
	    		//先找到div标签的父节点
	           	var $parent = $(".ordMes-main-in");
	           	//显示一个加载中的文字
          		var $div = $("<div></div>").addClass("seller-small-mes-container").css({"width":"1190px", "height":"130px"});
   				var $div1 = $("<div></div>").addClass("search-nodata");           				
   				/*var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata"); */
   				var $div12 = $("<div></div>").addClass("typo-small").html("正在载入更多商家...").css("font-size","15");
   				$parent.append($div);
   				$div.append($div1);
   				/* $div1.append($img11); */
   				$div1.append($div12);
	    		setTimeout(function(){
	    			$.post(
	    		        	//把索引值传过去给indexServlet层index方法
	    		        	"${pageContext.request.contextPath }/indexServlet?method=indexIn", 
	    		        	{"indexT":indexT-1, "indexB":indexB},
	    		        	//回调函数拿到查询到的商家信息
	    		        	function(json){
	    		        		//先把提示加载中的内容清空
		   		        		$(".ordMes-main-in").empty();
	    		        		//创建标签存放商家数据
	    						//找到a标签的父节点
	    						var $parent = $(".ordMes-main-in");
	    						if(json != ""){
	    							for(var i=0; i<json.length; i++){
	    						    	var $a = $("<a></a>").addClass("sellers");
	    						    	var $div1 = $("<div></div>").addClass("seller-logo");
	    						    	
	    								var $img = $("<img/>").attr({"src":"${pageContext.request.contextPath }/"+json[i].logo+"", "alt":json[i].bname});
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
	    						}else{
	    							//显示一个找不到指定内容的商家
	    	            			var $div = $("<div></div>").addClass("seller-small-mes-container").css("width", "1190px");
	                				var $div1 = $("<div></div>").addClass("search-nodata");	            				
	                				var $img11 = $("<img/>").attr({"src":"${pageContext.request.contextPath }/image/index-SearchBar2-1.png", "alt":"找不到商家"}).addClass("nodata");
	                				var $div12 = $("<div></div>").addClass("typo-small").html("找不到相关商家");
	                				$parent.append($div);
	                				$div.append($div1);
	                				$div1.append($img11);
	                				$div1.append($div12);
	    						}
	    						
	    		        	}, "json"
	    		        );
	    		},100);
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