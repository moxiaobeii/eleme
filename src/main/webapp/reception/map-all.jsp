<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title></title>
<!--导入jQuery文件-->
<script src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<!--导入js文件-->
<script src="${pageContext.request.contextPath }/js/map-all.js"></script>
<!-- 外部引用css样式 -->
<link rel="stylesheet" type="text/css" href="../css/map-all.css">
<meta charset="UTF-8">
<!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PoiPicker/examples/index.html -->
<base href="//webapi.amap.com/ui/1.0/ui/misc/PoiPicker/examples/" />
<!-- <meta charset="utf-8"> -->
<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
<style>
    #container {
        width:1200px;
        height: 0;
        /*margin: 13px auto;*/
        font-size: 13px;
        /*background-color: rgb(73, 158, 222);*/
        display: block;
        position: absolute;
        top: -20px;
        left: -115px;
    }
    #pickerBox {
        position: absolute;
        z-index: 9999;
        top: 30px;
        left: 130px;
        width: 300px;
        margin-top: 100px;
    }

    #pickerInput {
        width: 700px;
        height: 50px;
        padding: 2px 10px;
        font-size: 17px;
    }

    #poiInfo {
        background: #fff;
    }
    #btn{
            position: absolute;
            top: 0;
            right: -552px;
            height: 58px;
            width: 128px;
            font-size: 18px;
            background-color: #f74342;
            color: white;
            text-align: center;
            line-height: 58px;
            cursor: pointer;
            display: inline-block;
        }
        #btn:hover{
            background-color: rgb(230, 38, 37);
        }

    .amap_lib_placeSearch .poibox.highlight {
        background-color: #CAE1FF;
    }

    .amap_lib_placeSearch .poi-more {
        display: none!important;
    }

</style>
</head>
<body>
	<div class="content-all">
        <div class="content-out">
            <div class="content-in">
                <div class="header">
                    <p>
                        <a href="">
                            <img src="//shadow.elemecdn.com/faas/desktop/media/img/map-logo.9a26ef.png" alt="eleme">
                        </a>
                    </p>
                    <span class="map-header-right">
	                    <c:if test="${user != null}">
			               <a class="user-name">
	                           <img src="//shadow.elemecdn.com/faas/desktop/media/img/default-avatar.38e40d.png">
	                           <span id="userName">${sessionScope.user.username}</span>
	                       </a>
			            </c:if>
			            <c:if test="${user == null}">
			            	<a class="user-name">
		                           <span id="userName">登录/注册</span>
		                       </a>
			            </c:if>
                        <a class="set-up-shop">我要开店</a>
                    </span>
                </div>
                <div class="search" id="search">
                    <!--<h2 class="map-logo" id="map-logo">-->
                    <img id="map-logo" src="//shadow.elemecdn.com/faas/desktop/media/svg/map-logo-center.425427.svg" alt="eleme">
                    <!--</h2>-->
                    <div id="pickerBox">
                        <input id="pickerInput" placeholder="请输入你的收货地址" />
                        <div id="poiInfo"></div>
                        <!-- 搜索按钮 -->
                    	<div id="btn">搜索</div>
                    </div>
                    <div id="container" class="map" tabindex="0"></div>
                </div>
                <div class="footer">
                    <div class="footer-up">
                        <div class="footer-up-left">
                            <img src="//shadow.elemecdn.com/faas/desktop/media/img/appqc.95e532.png" alt="扫码下载 APP">
                            <span>扫码下载 APP</span>
                        </div>
                        <div class="footer-up-right">
                            <p>新用户首次下单</p>
                            <strong class="sale">最高立减30元</strong>
                            <p>立即下载APP，享更多优惠吧！</p>
                        </div>
                    </div>
                    <div class="footer-down">
                        <h5>
                            <a href="/">我要开店</a> | <a href="/">联系我们</a> | <a href="/">服务条款和协议</a> | <a href="/">营业执照</a> | <a href="/">加入我们</a> | <a href="/">蜂鸟配送</a>  | <a href="/">失信人员查询</a></h5>
                        <p>
                            增值电信业务许可证 :
                            <a href="/">沪B2-20150033</a> | <a href="/">沪ICP备 09007032</a> | <a href="/">上海工商行政管理</a> Copyright ©2008-2018 ele.me, All Rights Reserved.互联网药品信息服务资格证书 编号：（沪）-经营性-2016-0011
                        </p>
                    </div>
                    <div class="footer-police">
                        <a href="/">
                            <img src="//shadow.elemecdn.com/faas/desktop/media/img/picp_bg.e373b3.jpg"/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript" src='//webapi.amap.com/maps?v=1.4.9&key=03f30406b0608633115f48a1082015de'></script>
    <!-- UI组件库 1.0 -->
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
    <script type="text/javascript">
	   /* 点击查看全部商家则跳转到首页 */
	   function btn(){
	   	window.location.href='index.jsp';
	   }
        var map = new AMap.Map('container', {
            zoom: 10
        });

        AMapUI.loadUI(['misc/PoiPicker'], function(PoiPicker) {

            var poiPicker = new PoiPicker({
                city:'广州',
                input: 'pickerInput'
            });

            //初始化poiPicker
            poiPickerReady(poiPicker);
        });

        function poiPickerReady(poiPicker) {

            window.poiPicker = poiPicker;

            var marker = new AMap.Marker();

            var infoWindow = new AMap.InfoWindow({
                offset: new AMap.Pixel(0, -20)
            });

            //选取了某个POI
            poiPicker.on('poiPicked', function(poiResult) {

                var source = poiResult.source;
                var poi = poiResult.item;
                var info = {
                    地区: poi.name
//                        地址: poi.address
                };

                marker.setMap(map);
                infoWindow.setMap(map);

                marker.setPosition(poi.location);
                infoWindow.setPosition(poi.location);

                infoWindow.setContent('<div style="padding: 5px 35px;width: 200px"><h3 style="font-size: 17px;text-align: center">' + info.地区
                + '</h3><p style="text-align: center">附近有<span style="color: red">278</span>家外卖商家</p><buttion onclick="btn()" style="cursor: pointer;display:block;background-color: red;height: 30px;width: 80px;text-align: center;line-height: 30px;padding: 2px 8px;color: white;margin: 0 auto">查看商家</buttion></div>');
                infoWindow.open(map, marker.getPosition());

                //map.setCenter(marker.getPosition());
            });

            poiPicker.onCityReady(function() {
//                poiPicker.suggest('美食');
            });

        }
    </script>
</body>
</html>