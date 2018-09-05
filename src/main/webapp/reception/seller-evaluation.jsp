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
                    <a href="index.html">首页</a>
                </li>
                <li>
                    <a href="order.html">我的订单</a>
                </li>
                <li>
                    <a href="order.html">加盟合作</a>
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
            <a href="#" class="shopnav-tab shopnav-tab-active">所有商品</a>
            <a href="#" class="shopnav-tab shop_line">商品评价</a>
            <a href="#" class="shopnav-tab shop_line">商家资质</a>
            <span class="shopnav-filter">
                <a href="#" class="shop_line_active">默认排序</a>
                <a href="#" class="shop_line">评分
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a href="#" class="shop_line">销量
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
                <a href="#" class="shop_line">价格
                    <i class="icon iconfont icon-jiantouarrow505"></i>
                </a>
            </span>
        </div>
        <div class="nav_right">
            <form action="#" class="shopnav-search">
                <button class="search_btn">
                    <i class="icon iconfont icon-sousuo"></i>
                </button>
                <label for="globalsearch"></label>
                <input class="globalsearch" id="globalsearch" placeholder="搜索商家，美食..." >
            </form>
        </div>
    </div>
</div>
<!-- 评价内容 -->
<div class="container shopmain ">
    <div class="shopmenu">
        <!--导航栏-->
        <div class="shopmenu-nav" id="shopmenu-nav">
            <c:forEach items="${goodsTypes}" var="goodsType">
                <a href="">${goodsType.gtname}</a>
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
<script type="text/javascript">
    $(document).ready(function () {
        //引入头文件
        $("#header").load("seller.html");

        //是否收藏
        $(".favorite").click(function () {
            $(this).hide();
            $(".um-favorite").show();
        });
        $(".um-favorite").click(function () {
            $(this).hide();
            $(".favorite").show();
        });

        //切换评分、销量、价格的颜色
        $(".shopnav-filter a").click(function () {
            $(this).addClass("shop_line_active");
            $(this).siblings().removeClass("shop_line_active");
        })

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
    })
</script>
</body>
</html>