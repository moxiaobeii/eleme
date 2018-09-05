<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css"/>

<title>Insert title here</title>
<!--导入jQuery文件-->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <!--外部引入公共css样式-->
    <!-- <link rel="stylesheet" type="text/css" href="../css/basic.css"> -->
    <!--外部引入小图标css样式-->
    <!-- <link rel="stylesheet" type="text/css" href="../css/font-awesome/css/font-awesome.css"> -->
    <!--外部引入头部私有样式-->
    <!-- <link rel="stylesheet" type="text/css"  href="../css/footer.css"> -->
</head>
<body>
<footer id="footer">
    <div id="bottom">
        <div class="footer-left">
            <h3>用户帮助</h3>
            <a href="/">我的客服</a>
        </div>
        <div class="footer-left">
            <h3>商务合作</h3>
            <a href="/">我要开店</a>
            <a href="/">加盟指南</a>
            <a href="/">市场合作</a>
            <a href="/">开放平台</a>
        </div>
        <div class="footer-left">
            <h3>关于我们</h3>
            <a href="/">饿了么介绍</a>
            <a href="/">加入我们</a>
            <a href="/">练习我们</a>
            <a href="/">规则中心</a>
        </div>
        <div class="footer-center">
            <div class="up">
                24小时客服热线 :
                <a href="/">10105757</a>
            </div>
            <div class="down">
                关注我们 :
                <div class="fa fa-weixin">
                    <div id="wechat-box">
                        <img src="../image/header-1.png">
                        <p>微信号: elemeorder</p>
                        <p>饿了么网上订餐</p>
                    </div>
                </div>
                <a href="/"><i class="fa fa-weibo"></i></a>
            </div>
        </div>
        <div class="footer-right">
            <a href="/">
                <img src="${pageContext.request.contextPath }/image/header-1.png">
            </a>
            <div>
                <h3>下载手机版</h3>
                <p>扫一扫,手机订餐方便</p>
            </div>
        </div>
        <div class="footer-down">
            <h5>所有方：上海拉扎斯信息科技有限公司</h5>
            <p>
                增值电信业务许可证 :
                <a href="/">沪B2-20150033</a> | <a href="/">沪ICP备 09007032</a> | <a href="/">上海工商行政管理</a> Copyright ©2008-2018 ele.me, All Rights Reserved.互联网药品信息服务资格证书 编号：（沪）-经营性-2016-0011
            </p>
        </div>
        <div class="footer-police">
            <a href="/">
                <img src="${pageContext.request.contextPath }/image/footer-1.jpg"/>
            </a>
        </div>
    </div>
</footer>
</body>
</html>