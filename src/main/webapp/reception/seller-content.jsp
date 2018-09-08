<%@page import="eleme.entity.Business"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>店铺界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sell-icon/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/seller.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/sell-shop.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<!--头部导航栏-->
<div class="header">
    <div class="header-nav">
        <div class="nav">
            <ul>
                <h3>
                    <a href="index.html" class="icon-logo" >
                        <i class="icon iconfont icon-changyonglogo40"></i>
                        <span>饿了么</span>
                    </a>

                </h3>
                <li>
                    <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage">我的订单</a>
                </li>
                <li>
                    <a href="/">加盟合作</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="header-shop">
        <div class="header_inner">
            <!--左侧商家logo-->
            <div class="header_left" id="header-left">
                <img src="${pageContext.request.contextPath}/image/seller/shop-logo.jpg" alt="加载中">
                <div class="shopinfo" id="shopinfo">
                    <div class="shop_name">${business.bname}</div>
                    <div class="shop_evaluate">
                        <div id="star">(${business.months_amount})</div>
                    </div>
                </div>
            </div>
            <!--商家logo悬浮显示-->
            <div class="hid-shop" id="hid-shop">
                <ul>
                    <li class="shopguide-compete1">
                        <div class="guide-left">
                            <h3>${business.evaluation_score}</h3>
                            <p>综合评价</p>
                            <p>高于周边商家 <span>58.3%</span></p>
                        </div>
                        <div class="guide-right">
                            <p>服务态度${business.service_evaluation}分</p>
                            <p>菜品评价${business.good_evaluation}分</p>
                        </div>
                    </li>
                    <li class="shopguide-compete2">
                        <p>商家地址：${business.address}</p>
                        <p>营业时间：${business.business_hour }</p>
                    </li>
                    <li class="shopguide-compete3">
                        由<span>${business.bname}</span>提供配送服务
                    </li>
                </ul>
            </div>
            <!--配送信息-->
            <div class="header_right">
                <span class="distribution">
                    <em>起送价</em>
                    <em class="info">${business.offer_price}元</em>
                </span>
                <span class="distribution">
                    <em>配送费</em>
                    <em class="info">配送费￥${business.distribution_fee}</em>
                </span>
                <span class="distribution">
                    <em>平均送达时间</em>
                    <em class="info">${business.distribution_time}分钟</em>
                </span>
            </div>
            <c:if test="${business.collection == 1}" >
	            <a class="favorite favorite-active">
	                <i class="icon iconfont icon-shoucang"></i>
	                <span class="scope">收藏</span>
	            </a>
            </c:if>
            <c:if test="${business.collection == 0}">

            </c:if>
              <a class="um-favorite">
	              <i class="icon iconfont icon-collection"></i>
	              <span class="scope" >取消收藏</span>
          	   </a>
            <!-- <a class="favorite favorite-active">
                <i class="icon iconfont icon-shoucang"></i>
                <span class="scope">收藏</span>
            </a>
            <a class="um-favorite">
                <i class="icon iconfont icon-collection"></i>
                <span class="scope">取消收藏</span>
            </a> -->
        </div>
    </div>
</div>
<!--头部导航栏-->
<div class="main">
    <!--头部导航栏-->
    <div class="main_nav">
        <div class="nav_left">
            <a class="shopnav-tab shopnav-tab-active">所有商品</a>
            <a class="shopnav-tab shop_line">商品评价</a>
            <a class="shopnav-tab shop_line">商家资质</a>
            <span class="shopnav-filter">
                <a class="shop_line_active"><span class="">默认排序</span></a>
                <a class="shop_line"><span>评分</span>
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a class="shop_line"><span>销量</span>
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a class="shop_line"><span title="desc">价格</span>
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
            </span>
        </div>
        <div class="nav_right">
            <form class="shopnav-search" action="javascript:formSearch()">
                <button class="search_btn">
                    <i class="icon iconfont icon-sousuo" id="icon-sousuo"></i>
                </button>
                <label for="globalsearch"></label>
                <input class="globalsearch" id="globalsearch" placeholder="搜索商家，美食..." >
            </form>
        </div>
    </div>
</div>
<!-- 中间内容块 -->
<div class="container shopmain ">
    <div class="shopmenu">
        <!--导航栏-->
        <div class="shopmenu-nav" id="shopmenu-nav">
        	<c:forEach items="${goodsTypes}" var="goodsType">
        		<a href="">${goodsType.gtname}</a>
        	</c:forEach>
        </div>
        <!--分类菜单-->
        <div class="shopmenu-list clear" >
            <c:forEach items="${businessDtos}" var="businessDto">
	            <div class="shopmenu-main">
	                <h3 class="shopmenu-title">${businessDto.gtname}
		                <c:if test="${businessDto.explain != null}">
		                	<span class="shopmenu-des">${businessDto.explain}</span>
		                </c:if>
	                </h3>
	                <c:set value="${businessDto.goods}" var="goodsDtos"></c:set>
	                <c:forEach items="${goodsDtos}" var="goodsDto">
		                <div class="shopmenu-food">
		                    <span><a href="#"><img src="${pageContext.request.contextPath}/${goodsDto.pimage}" alt="鸡腿"></a></span>
		                    <div class="shopmenu-tro">
		                        <h3 class="food">${goodsDto.gname}</h3>
		                        <span class="material">双层鸡腿堡 主要原料：${goodsDto.gname}</span>
		                        <div>
		                            <span class="star"></span>
		                            <span class="number">(${goodsDto.shop_evaluation })</span>
		                            <span class="month-number">月售${goodsDto.months_amount}份</span>
		                        </div>
		                        <div class="price">￥${goodsDto.price}</div>
		                    </div>
		                    <div class="addCart" id="${goodsDto.gid}">加入购物车</div>
		                </div>
		             </c:forEach>
	            </div>
	            <div style="clear:both"></div>
            </c:forEach>
        </div>
    </div>

    <div class="shopmain-right">
        <div class="notice">商家公告</div>
        <div class="clear"></div>
        <div class="distribution">
            <ul>
                <h4>配费说明</h4>
                <p>配送费￥1</p>
            </ul>
        </div>
        <a class="report" href="#">举报商家</a>
    </div>
</div>
<%--评价内容--%>
<!--右侧购物车-->
<div class="cart">
    <div class="cartbasket" id="cartbasket">
        <div class="shop-groupswitcher">
            <p>购物车 <a class="clearShop">[清空]</a></p>
            <a class="icon iconfont icon-gouwuchekong"></a>
        </div>
        <c:if test="${cart != null}">
            <c:forEach items="${cart.map}" var="map">
                <c:set var="gid" value="${map.key}"></c:set>
                <c:set var="cartDetails" value="${map.value}"></c:set>
                <div class="shopCart" id="${cartDetails.goods.gid}" name="${cartDetails.goods.price}">
                    <div class="item-name" name="${cartDetails.goods.gname}">${cartDetails.goods.gname}</div>
                    <div class="item-quali">
                        <button class="cell subnum">-</button>
                        <input type="text" value="${cartDetails.subCount}" class="cell shop-number">
                        <button class="cell addnum">+</button>
                    </div>
                    <div class="item-subtotal">￥${cartDetails.subTotal}</div>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <div class="cartfoooter" id="cartfooter">
        <div class="footerToggle">
            <span class="icon iconfont icon-gouwuchekong">
                <c:if test="${cart != null}">
                    <span class="totalCount">${cart.totalCount}</span>
                </c:if>
            </span>
            <c:if test="${cart != null}">
                <c:set var = "price" value="${cart.totalMoney}"></c:set>
                <p class="totalMoney">${price}</p>
            </c:if>
            <div class="shop-cartfooter-text">配送费￥${business.distribution_fee}</div>
        </div>
        <a class="shop-cartfooter-checkout" href="${pageContext.request.contextPath}/ordersServlet?method=queryConsignee">立即结算</a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        //引入头文件
        $("#header").load("seller.html");

        //滚轮滚动，导航栏固定
        var doc = $(document);
        var win = $(window);
        win.scroll(function () {
            if(doc.scrollTop() >= 275){
                $("#shopmenu-nav").addClass("shopmenu-nav-fix");
            }else{
                $("#shopmenu-nav").removeClass("shopmenu-nav-fix");
            }
        });

      //购物车的滑入和滑出
        $(".footerToggle ").click(function () {
            $("#cartbasket").slideToggle();
        });


        //实现添加购物车功能
        $(".addCart").click(function () {
        	var idAttr = $(this).attr("ID");  //商品id
        	var shop_name = $(this).prev().children("h3").html();  //商品名称
            var shop_price = $(this).prev().children("div.price").html().substring(1);  //商品价格e
            var subTotal = 0.0;  //商品小计
            var subCount = 0;  //商品数量
            var totalCount = 0;  //商品总数
            var totalMoney = 0.0; //商品总价
            var len = $(".cartbasket input").length;
            if (len == 0){
                $(".cartbasket").append("<div class=\"shopCart\" id='"+idAttr+"' name='"+shop_price+"'>\n" +
                    "                    <div class=\"item-name\" name='"+shop_name+"'>"+shop_name+"</div>\n" +
                    "                    <div class=\"item-quali\">\n" +
                    "                        <button class=\"cell subnum\">-</button>\n" +
                    "                        <input type=\"text\" value=\"1\" class=\"cell shop-number\">\n" +
                    "                        <button class=\"cell addnum\">+</button>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"item-subtotal\">"+"￥"+shop_price+"</div>\n" +
                    "                </div>");
                subTotal = shop_price;
                subCount = 1;
                totalCount = 1;
                totalMoney = shop_price;
                $(".footerToggle .icon-gouwuchekong").append("<span class=\"totalCount\">"+totalCount+"</span>");
                $(".footerToggle .icon-gouwuchekong").after("<p class=\"totalMoney\">"+totalMoney+"</p>");
            }else {
                var bool = 1;
                //该商品已经存在，则数量加1，
                $(".cartbasket input").each(function (key, value) {
                    if (shop_name==$(this).parent().prev().html()){
                        var n = $(this).val();
                        subCount = parseInt(n) + 1;
                        $(this).val(subCount);
                        subTotal = parseFloat(shop_price) * parseInt(subCount);
                        $(this).parent().next().html("￥"+subTotal);
                        bool = 2;
                    }
                });
                //该商品不存在，则追加
                if (bool != 2){
                    $(".cartbasket").append("<div class=\"shopCart\" id='"+idAttr+"' name='"+shop_price+"'>\n" +
                        "                    <div class=\"item-name\" name='"+shop_name+"'>"+shop_name+"</div>\n" +
                        "                    <div class=\"item-quali\">\n" +
                        "                        <button class=\"cell subnum\">-</button>\n" +
                        "                        <input type=\"text\" value=\"1\" class=\"cell shop-number\">\n" +
                        "                        <button class=\"cell addnum\">+</button>\n" +
                        "                    </div>\n" +
                        "                    <div class=\"item-subtotal\">"+"￥"+shop_price+"</div>\n" +
                        "                </div>");
                    subCount = 1;
                    subTotal = shop_price;
                }
                $(".cartbasket input").each(function (key, value){
                    totalMoney += parseFloat($(this).val());
                    totalCount += parseInt($(this).parent().next().html().substring(1));
                });
                $(".icon-gouwuchekong span").html(totalMoney);
                $(".icon-gouwuchekong").next().html(totalCount);
            }

            /*  添加购物车 */
            $.getJSON(
            		"${pageContext.request.contextPath}/business?method=addCart",
            		{"gid":idAttr,"bid":"${business.bid}"},
            		function() {
            		    //保存数据，不用有回调函数
					});

            $(".addnum").off('click').on('click',function () {
                //获得商品id
                var gid = $(this).parent().parent().attr("ID");
                var price = parseFloat($(this).parent().parent().attr("name"));
                var n = $(this).prev().val();
                var num = parseInt(n) + 1;
                $(this).prev().val(num);
                var totalCount = parseInt($("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html())+1;
                var totalMoney = parseFloat($("#cartfooter .footerToggle .totalMoney").html())+price;
                var subTotal = num * price;
                $(this).parent().next().html("￥"+subTotal);
                $("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html(totalCount);
                $("#cartfooter .footerToggle .totalMoney").html(totalMoney);
                /*  增商品 */
                $.getJSON(
                    "${pageContext.request.contextPath}/business?method=updateGoods",
                    {"gid":gid,
                        "bid":"${business.bid}",
                        "subTotal":subTotal,
                        "subCount":num,
                        "totalMoney":totalMoney,
                        "totalCount":totalCount
                    },
                    function() {
                        //保存数据，不用有回调函数
                    });
            });
            //购物车中减少商品
            $(".subnum").off('click').on('click',function () {
                //获得商品id
                var gid = $(this).parent().parent().attr("ID");
                var price = parseFloat($(this).parent().parent().attr("name"));
                var n = $(this).next().val();
                var num = parseInt(n) - 1;
                if (num == 0){
                    $(this).parent().parent().hide();
                }
                $(this).next().val(num);
                var totalCount = parseInt($("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html())-1;
                var totalMoney = parseFloat($("#cartfooter .footerToggle .totalMoney").html())-price;
                var subTotal = num * price;
                $(this).parent().next().html("￥"+subTotal);
                $("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html(totalCount);
                $("#cartfooter .footerToggle .totalMoney").html(totalMoney);
                /*  减商品 */
                $.getJSON(
                    "${pageContext.request.contextPath}/business?method=updateGoods",
                    {"gid":gid,
                        "bid":"${business.bid}",
                        "subTotal":subTotal,
                        "subCount":num,
                        "totalMoney":totalMoney,
                        "totalCount":totalCount
                    },
                    function() {
                        //保存数据，不用有回调函数
                    });
            });

        });
        //购物车中减少商品
        $(".subnum").off('click').on('click',function () {
            //获得商品id
            var gid = $(this).parent().parent().attr("ID");
            var price = parseFloat($(this).parent().parent().attr("name"));
            var n = $(this).next().val();
            var num = parseInt(n) - 1;
            if (num == 0){
                $(this).parent().parent().hide();
            }
            $(this).next().val(num);
            var totalCount = parseInt($("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html())-1;
            var totalMoney = parseFloat($("#cartfooter .footerToggle .totalMoney").html())-price;
            var subTotal = num * price;
            $(this).parent().next().html("￥"+subTotal);
            $("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html(totalCount);
            $("#cartfooter .footerToggle .totalMoney").html(totalMoney);
            /*  减商品 */
            $.getJSON(
                "${pageContext.request.contextPath}/business?method=updateGoods",
                {"gid":gid,
                 "bid":"${business.bid}",
                 "subTotal":subTotal,
                 "subCount":num,
                 "totalMoney":totalMoney,
                 "totalCount":totalCount
                },
                function() {
                    //保存数据，不用有回调函数
                });
        });

        $(".addnum").off('click').on('click',function () {
            alert(1);
            //获得商品id
            var gid = $(this).parent().parent().attr("ID");
            var price = parseFloat($(this).parent().parent().attr("name"));
            var n = $(this).prev().val();
            var num = parseInt(n) + 1;
            alert(num);
            $(this).prev().val(num);
            var totalCount = parseInt($("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html())+1;
            var totalMoney = parseFloat($("#cartfooter .footerToggle .totalMoney").html())+price;
            var subTotal = num * price;
            $(this).parent().next().html('￥'+subTotal);
            $("#cartfooter .footerToggle .icon-gouwuchekong .totalCount").html(totalCount);
            $("#cartfooter .footerToggle .totalMoney").html(totalMoney);
            /*  增商品 */
            $.getJSON(
                "${pageContext.request.contextPath}/business?method=updateGoods",
                {"gid":gid,
                 "bid":"${business.bid}",
                 "subTotal":subTotal,
                 "subCount":num,
                 "totalMoney":totalMoney,
                 "totalCount":totalCount
                },
                function() {
                    //保存数据，不用有回调函数
                });
        });

        //清空购物车
        $(".clearShop").click(function () {
            $(this).parent().parent().siblings().hide();
            $(".totalCount").hide() ;
            $(".totalMoney").hide();
            $.getJSON(
                "${pageContext.request.contextPath}/business?method=deleteGoods",
                {"bid":"${business.bid}"},
                function (){

                }
            )
        });
    });

    $(document).ready(function () {
        //收藏
        $(".favorite").click(function () {
            $(this).hide();
            $(".um-favorite").show();
        });
        $(".um-favorite").click(function () {
            $(this).hide();
            $(".favorite").show();
        });

        //切换所有商品和评价
        $(".main .nav_left .shopnav-tab").click(function () {
            $(this).addClass("shopnav-tab-active");
            $(this).siblings("a.shopnav-tab").removeClass("shopnav-tab-active");
            var item = $(this).html();
            if(item=="所有商品"){
                location.href="${pageContext.request.contextPath}/business?method=getBusinessInfo&bid=${business.bid}";
            }
            if (item=="商品评价"){
                location.href="${pageContext.request.contextPath}/business?method=getEvaluation&bid=${business.bid}"
            }
        });


        //搜索框
        //切换评分、销量、价格的颜色
        var temp;      //存放搜索框的值
        $(".shopnav-filter a").click(function () {
            $(this).addClass("shop_line_active");
            $(this).siblings().removeClass("shop_line_active");
            var item = $(this).children("span").html();
            var searchVal = $(".globalsearch").val();
            //如果搜索框为空
            if(searchVal == null || searchVal == undefined || searchVal== ""){
                if (temp){
                    //如果临时存储值不为空
                    searchVal = temp;
                    search(searchVal,item);
                }else{
                    //如果临时存储值为空
                    search(searchVal,item);
                }
            }else{
                //如果搜索框不为空
                temp = searchVal;
                search(searchVal,item);
            }
        });

    })
    function search(searchVal,item) {
        $.getJSON(
            "${pageContext.request.contextPath}/business?method=search",
            {
                "bname":"${business.bname}",
                "searchVal":searchVal
            },
            function(data) {
                loadGoods(data,item);
            });
    };
    function formSearch() {
        var searchVal = $(".globalsearch").val();
        $.getJSON(
            "${pageContext.request.contextPath}/business?method=search",
            {
                "bname":"${business.bname}",
                "searchVal":searchVal
            },
            function(data) {
                show(data);
            });
    }
    //根据条件排序
    function loadGoods(goods,item) {

        //按照商品评价进行排序
        function sortPrice(a,b) {
            return a.price - b.price;
        }

        //按照评分进行排序
        function sortScore(a,b){
            return a.shop_evaluation - b.shop_evaluation;
        }
        
        //按照销量进行排序
        function  sortNumber(a,b) {
            return a.months_amount - b.months_amount;
        }

        if (item == "价格"){
            goods.sort(sortPrice);
        }

        if (item == "销量"){
            goods.sort(sortNumber);
        }

        if (item == "评分"){
            goods.sort(sortScore);
        }
        show(goods);
    }
    //显示查询结果
    function show(goods) {
        if (goods != null){
            var contents = "<div class=\"shopmenu\">\n" +
                "        <div class=\"shopmenu-list\">\n" +
                "            <div class=\"shopmenu-main\" >\n" +
                "               ";
            $.each(goods,function (index,good) {
                var content = "<div class=\"shopmenu-food\">\n" +
                    "    <span><a href=\"#\"><img src=\"${pageContext.request.contextPath}/"+good.pimage+"\" alt=\"鸡腿\"></a></span>\n" +
                    "    <div class=\"shopmenu-tro\">\n" +
                    "        <h3 class=\"food\">"+good.gname+"</h3>\n" +
                    "        <span class=\"material\">双层鸡腿堡 主要原料："+good.gname+"</span>\n" +
                    "        <div>\n" +
                    "            <span class=\"star\"></span>\n" +
                    "            <span class=\"number\">("+good.shop_evaluation+")</span>\n" +
                    "            <span class=\"month-number\">月售"+good.months_amount+"份</span>\n" +
                    "        </div>\n" +
                    "        <div class=\"price\">￥"+good.price+"</div>\n" +
                    "    </div>\n" +
                    "    <div class=\"addCart\" id='"+good.gid+"'>加入购物车</div>\n" +
                    "</div>";
                contents += content;
            })
            contents += "        </div>\n" +
                "    </div>\n" +
                "</div>";
            $(".container").html(contents);
            $(".container").append("</div>\n" +
                "    <div class=\"shopmain-right\">\n" +
                "        <div class=\"notice\">商家公告</div>\n" +
                "        <div class=\"clear\"></div>\n" +
                "        <div class=\"distribution\">\n" +
                "            <ul>\n" +
                "                <h4>配费说明</h4>\n" +
                "                <p>配送费￥1</p>\n" +
                "            </ul>\n" +
                "        </div>\n" +
                "        <a class=\"report\" href=\"#\">举报商家</a>\n" +
                "    </div>\n" +
                "</div>");
        }
    }
</script>

</body>
</html>