<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>订单评价</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/evaluation.css" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_6nzu1y9fx3o/iconfont.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/evaluation.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_6z27e4k1iup/iconfont.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_le04b8lo41o/iconfont.css"/>

</head>
<body>
<div class="content">
    <h3 class="title">
        <span>待评价订单</span>
        <span class="subtitle">带(*)标志为必须填</span>
    </h3>
    <!--订单部分信息-->
    <!--商家名字，部分下单商品名-->
    <div class="rsinfoCon-rsname">
        <div class="rsinfoCon-item">
            <a href="javascript:">
                <img src="" />
            </a>
            <div class="rsinfo">
                <h3>
                    <a>蒸品店</a>
                </h3>
                <p>
                           <span>
                                蒸韭菜饺子2份共2个菜品
                           </span>
                </p>
            </div>
        </div>
        <!--下单时间-->
        <span class="rsinfoCon-item"></span>
        <!--收藏商家-->
        <a href="javascript:" class="rsinfoCon-item favor">收藏商家</a>
    </div>


    <!--对商家进行评价-->
    <div class="appraise">
        <!--商家服务评价-->
        <div class="appraise-service">
                <span class="appraise-service-item">
                    <span>*</span>
                    商家服务
                </span>
            <div class="appraise-service-score">
                <p>
                        <span class="service-item">
                            <a href="javascript:" class="iconfont icon-pingfenhui " style="font-size: 27px"></a>
                            <a href="javascript:" class="iconfont icon-pingfenhui sc" style="font-size: 27px"></a>
                            <a href="javascript:" class="iconfont icon-pingfenhui sc" style="font-size: 27px"></a>
                            <a href="javascript:" class="iconfont icon-pingfenhui sc" style="font-size: 27px"></a>
                            <a href="javascript:" class="iconfont icon-pingfenhui sc" style="font-size: 27px"></a>
                        </span>
                    <span class="score-text">点击星星评分</span>
                </p>
                <div class="service-text">
                    <textarea class="service-area" placeholder=""></textarea>
                </div>
            </div>
        </div>
        <!--送餐速度-->
        <div class="appraise-driver">
                <span class="appraise-service-item">
                    <span>*</span>
                    送餐速度
                </span>
            <div class="appraise-driver-content">
                <div class="appraise-driver-progress">
                    <div class="time-bar">
                        <div class="bar"></div>
                    </div>
                    <i class="iconfont icon-eliaomo timeslider-handle" style="color:#0089dc;" ></i>
                   
                </div>
                    <span class="appraise-driver-time">
                        请评价送餐速度
                    </span>
            </div>
        </div>
        <!--评价菜品-->
        <div class="appraise-food">
            <span class="appraise-food-label">评价菜品</span>
            <div class="appraise-food-info">

                <div class="appraise-food-item">
                	<p class="food-item">
                        <span class="food-name">蒸韭菜饺子</span>
                        <span>
                            <a href="javascript:" class="iconfont icon-pingjia"></a>
                            <a href="javascript:" class="iconfont icon-pingjia"></a>
                            <a href="javascript:" class="iconfont icon-pingjia"></a>
                            <a href="javascript:" class="iconfont icon-pingjia"></a>
                            <a href="javascript:" class="iconfont icon-pingjia"></a>
                        </span>
                        <span class="food-text">
                           	 评价美食
                        </span>
                    </p>
                </div>

            </div>
        </div>
        <!--评价提交-->
        <div class="appraise-btn">
            <button class="btn">提交订单</button>
            <p class="appraise-prompt">
                评价后获得
                <span class="appraise-tip">211</span>
                金币
            </p>

        </div>

    </div>
</div>
</body>
</html>