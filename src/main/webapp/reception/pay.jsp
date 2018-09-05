<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>支付页面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Orderbasic.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/pay/pay.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/pay/pay.js" charset="utf-8"></script>
</head>
<body>
    <!--头部-->
    <div class="header">
        <!--<i class="fa fa-credit-card-alt"></i>-->
        <img src="${pageContext.request.contextPath }/image/pay/ele.png">
        <h3 class="title">收银台</h3>
    </div>

    <!--body内容区-->
    <div class="main_container">
        <div class="container">
            <!-- 订单内容-->
            <div class="content order">
                <h3>订单详情</h3>
                <div class="oder_detail">
                    <div class="pull-left user_box">
                        <p class="text-muted order_seller">获取店家的名字</p>
                        <p class="" id="look_order_info">
                            <span class="text-muted order_user">罗(先生) 17875511823 南沙科技创新中心A4栋4楼-3个小腿+1个翅中  x2汉堡+鸡肉卷  x2辣子鸡块  x2</span>
                            <a class="a_css look_order" href="javascript:">
                                <span class="look_order">查看详情</span>
                                <span class="fa fa-angle-down"></span>
                            </a>
                        </p>
                        <!-- 隐藏部分-->
                        <div class="order_detail text-muted hidden" id="look_order_msg">
                            <p class="user_info">罗(先生) 17875511823
南沙科技创新中心A4栋4楼
-
3个小腿+1个翅中x2&nbsp;&nbsp;汉堡+鸡肉卷x2&nbsp;&nbsp;辣子鸡块x2</p>
                            <a class="a_css look_up" href="javascript:">
                                <span class="look_order">收起</span>
                                <span class="fa fa-angle-up"></span>
                            </a>
                        </div>
                    </div>


                    <p class="pull-right order_rigth">
                        <span>
                            <span>支付金额:</span>
                            <strong class="oder_money">
                                <span>￥</span>
                                <span>200</span>
                            </strong>
                        </span>
                    </p>
                    <div style="clear: both"></div>
                </div>
                <div style="clear: both"></div>
            </div>
            <!-- 支付确认-->
            <div class="content pay_method">
                <header>
                    <h3>请选择支付方式</h3>
                    <p class="text-color">
                        <span>剩余支付时间</span>
                        <span id="pay_time1" class="pay_color">14</span>
                        <span class="pay_color">分</span>
                        <span id="pay_time2" class="pay_color">59</span>
                        <span class="pay_color">秒</span>
                        <span>，逾期订单将自动取消</span>
                    </p>
                </header>
                <!--选择支付-->
                <div class="pay_box">
                    <p class="pay_title text-muted">
                        <span>第三方支付</span>
                        <span class="text-money">￥200</span>
                    </p>
                    <div class="alipay">
                        <div class="alipay_foot">
                            <h4>支付宝</h4>
                        </div>
                        <div class="after"></div>
                    </div>
                </div>
                <!-- 确认支付-->
                <div>
                    <button class="btn">确认支付</button>
                </div>
            </div>
        </div>
    </div>

    <!--生成二维码-->
 <%--    <div class="QRcode" id="QRcode">
        <div class="QRcode_close" id="QRcode_close"></div>
        <div class="QRcode_header">请扫二维码</div>
        <div class="QRcode_content">
            <img src="${pageContext.request.contextPath }image/pay/QRCODE.png">
        </div>
    </div> --%>
</body>
<script type="text/javascript">
$(document).ready(function(){
    //点击支付,跳转到二维码页面
    $(".btn").click(function(){
		//请求的路径
		window.location.href="${pageContext.request.contextPath }/payServlet?method=pay"; 
    });
	
})
</script>
</html>