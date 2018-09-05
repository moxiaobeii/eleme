<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
                <img src="../image/seller/shop-logo.jpg" alt="加载中">
                <div class="shopinfo" id="shopinfo">
                    <div class="shop_name">麦德乐炸鸡汉堡</div>
                    <div class="shop_evaluate">
                        <div id="star">(285)</div>
                    </div>
                </div>
            </div>
            <!--商家logo悬浮显示-->
            <div class="hid-shop" id="hid-shop">
                <ul>
                    <li class="shopguide-compete1">
                        <div class="guide-left">
                            <h3>4.5</h3>
                            <p>综合评价</p>
                            <p>高于周边商家 <span>58.3%</span></p>
                        </div>
                        <div class="guide-right">
                            <p>服务态度3.8分</p>
                            <p>菜品评价3.8分</p>
                        </div>
                    </li>
                    <li class="shopguide-compete2">
                        <p>商家地址：广州市南沙区江南路126号104铺</p>
                        <p>营业时间：10：20-23：00</p>
                    </li>
                    <li class="shopguide-compete3">
                        由<span>麦德乐炸鸡汉堡</span>提供配送服务
                    </li>
                </ul>
            </div>
            <!--配送信息-->
            <div class="header_right">
                <span class="distribution">
                    <em>起送价</em>
                    <em class="info">55元</em>
                </span>
                <span class="distribution">
                    <em>配送费</em>
                    <em class="info">配送费￥2</em>
                </span>
                <span class="distribution">
                    <em>平均送达时间</em>
                    <em class="info">28分钟</em>
                </span>
            </div>
            <a class="favorite favorite-active">
                <i class="icon iconfont icon-shoucang"></i>
                <span class="scope">收藏</span>
            </a>
            <a class="um-favorite">
                <i class="icon iconfont icon-collection"></i>
                <span class="scope">取消收藏</span>
            </a>
        </div>
    </div>
</div>
<!--头部导航栏-->
<div class="main">
    <!--头部导航栏-->
    <div class="main_nav">
        <div class="nav_left">
            <a href="#" class="shopnav-tab active">所有商品</a>
            <a href="#" class="shopnav-tab shop_line">评价</a>
            <a href="#" class="shopnav-tab shop_line">商家资质</a>
            <span class="shopnav-filter">
                <a href="#" class="">默认排序</a>
                <a href="#" class="shop_line">评分
                <i class="icon iconfont icon-jiantouarrow505"></i></a>
                <a href="#" class="shop_line">销量
                <i class="icon iconfont icon-jiantouarrow505"></i></a>
                <a href="#" class="shop_line">价格
                <i class="icon iconfont icon-jiantouarrow505"></i></a>
            </span>
        </div>
        <div class="nav_right">
            <form action="#" class="shopnav-search">
                <button class="search_btn">
                    <i class="icon iconfont icon-sousuo"></i>
                </button>
                <label for="globalsearch"></label>
                <input class="globalsearch" id="globalsearch" placeholder="搜索商家，美食...">
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".favorite").click(function () {
            $(this).hide();
            $(".um-favorite").show();
        });
        $(".um-favorite").click(function () {
            $(this).hide();
            $(".favorite").show();
        })
    })
</script>
</body>
</html>