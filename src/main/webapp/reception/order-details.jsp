<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
	<meta charset="UTF-8">
    <title>订单详情</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_70a6prvbmd7/iconfont.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/orderDetails.css" type="text/css"/>
       <!-- order页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order.css"/>
    <!-- header页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css"/>
      <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/sidebar.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/header.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-message.css">
	<!-- order页面样式库-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order-iconfont.css"/>
     <!--导入js文件-->
    <!-- JQuery库-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
</head>
<body >
<jsp:include page="sidebar.jsp"></jsp:include>

    <!--头部部分-->
    <header class="header">
    	<jsp:include page="header.jsp"></jsp:include>
    </header>

    <!--内容区-->
    <div class="bodyer">
        <div class="center">
            
            <!-- 地址导航栏 -->
            <div class="location">
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>地址管理</span></span>
            </div>

            <div class="center-content">
                <!-- 左侧边导航栏-->
                <ul class="slideBar">
                    <li class="slideBarLi_one">
                        <h2>
                            <i class="fa fa-home" id="slideBarLi_one_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserPersonCenterInfo"  class="slideBarOption">个人中心</a>
                        </h2>
                    </li>
                    <li class="slideBarLi_two">
                        <h2><i class="fa fa-file" id="slideBarLi_two_myhome"></i>我的订单</h2>
                        <ul>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo" class="slideBarOption">近三个月订单</a></li>
                        </ul>
                    </li>
                    <li class="slideBarLi_three">
                        <h2 ><i class="fa fa-user-o" id="slideBarLi_three_myhome"></i>我的资料</h2>
                        <ul>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryUserInfo"  class="slideBarOption">个人资料</a></li>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryConsigneeInfo"  class="slideBarOption">地址管理</a></li>
                        </ul>
                    </li>
                    <li class="slideBarLi_four ">
                        <h2>
                            <i class="fa fa-star"  id="slideBarLi_four_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=collectedBusinessInfo"  class="slideBarOption">我的收藏</a>
                        </h2>
                    </li>
                </ul>

                <!-- 中间内容部分-->
                <div class="center-box">
<!--内容区-->
<div class="content">
    <h3>订单详情</h3>
    <ul>
        <li style="width: 38.4%" class="dd">提交订单

        </li>
        <li style="width: 38.5%" class="jd">商家已接单
        </li>
        <li style="width: 23.1%" class="sd">已送达

        </li>
    </ul>
    <!--派送情况-->
    <div class="orderprogress-info">
        <div class="orderprogress-child">
            <h5>订单已完成</h5>
            <p>19:58确认送达</p>
            <div class="orderprogress-again">
                <a href="javascript:" class="orderprogress-again-item linktype">
                    再来一单
                </a>
                <a class="orderprogress-again-item buttontype">
                    评价
                </a>
            </div>
        </div>
    </div>
    <!--餐厅情况-->
    <div class="no-isolate">
        <div class="orderprogress-rsinfo">
            <a href="">
                <img src="" class="orderprogress-rsimg"/>
            </a>
            <div class="orderprogress-rsid">
                <h4 class="orderprogress-rtname">
                    <a href="" class="rtname"></a>
                </h4>
                <div class="orderprogress-rstextra">
                    <span></span>
                    <span></span>
                </div>
                <div class="orderprogress-rstoperate">
                    <a href=""><i class="iconfont icon-shoucang"></i>
                        收藏
                    </a>
                    <a href="">
                        <i class="iconfont icon-dengpao"></i>
                        投诉
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--订单详情-->
    <div class="orderprogress-cardtable">
        <div class="orderprogress-cardcell">
            <div class="orderprogress-total">
                <div class="orderprogress-totalrow orderprogress-totaltitle">
                    <span class="cell name">菜品</span>
                    <span class="cell quantity">数量</span>
                    <span class="cell price">小计（元）</span>
                </div>
                <!-- <div class="totalList">
                    <div class="orderprogress-totalrow ">
                        <span class="cell name">煎韭菜饺子</span>
                        <span class="cell quantity">1</span>
                        <span class="cell price">8.00</span>
                    </div>
                </div> -->
                <div class="totalList">
                    <div class="orderprogress-baseline"></div>
                </div>
                <div class="totalList">
                    <div class="orderprogress-totalrow ">
                        <span class="cell name">餐盒</span>
                        <span class="cell quantity"></span>
                        <span class="cell price">0.00</span>
                    </div>
                </div>
                <div class="totalList">
                    <div class="orderprogress-totalrow ">
                        <span class="cell name">商家配送</span>
                        <span class="cell quantity"></span>
                        <span class="cell price">0.00</span>
                    </div>
                </div>
                <div class="totalList">
                    <div class="orderprogress-baseline"></div>
                </div>
            </div>
            <div class="orderprogress-pay">
                实际支付
                <span class="sum">10.00</span>
            </div>

        </div>
        <!--收货人信息-->
        <div class="orderprogress-cardcell rightside">
            <div class="orderprogress-deliveryinfo ">
                <h5 class="orderprogress-deliverytitle">配送信息</h5>

                <div class="orderprogress-deliverygroup">
                    <p>
                        <span>配送方式：</span>
                        <span class="deliver"></span>
                    </p>

                    <p>
                        <span>送达时间：</span>
                        <span>尽快送达</span>
                    </p>
                </div>
                <div class="orderprogress-deliverygroup">
                    <p>
                        <span>联&nbsp;系&nbsp;人：</span>
                        <span class="pp"></span>
                    </p>

                    <p>
                        <span>联系电话：</span>
                        <span class = "tel"></span>
                    </p>

                    <p>
                        <span>收货地址：</span>
                        <span class="address"></span>
                    </p>
                </div>
                <div class="orderprogress-deliverygroup">
                    <p>
                        <span>发票信息：</span>
                        <span>无</span>
                    </p>

                    <p>
                        <span>备&nbsp;注&nbsp;：</span>
                        <span class="remark"></span>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div class="orderprogress-border"></div>

</div>
  </div>
            </div>
        </div>
    </div>
  <div class="footer">
    	<jsp:include page="footer.jsp"></jsp:include>
    </div>  
 <script>
	
		$.post(
                "${pageContext.request.contextPath}/orderDetailsServlet?method=getOrderDetails",
                 "oid="+${param.oid},
                 function(result){
                	var parsed = JSON.parse(result);
                	//alert(parsed.order.bname);
                	<%--更新商家信息--%>
                	$(".rtname").html(parsed.order.bname);
                	$(".orderprogress-rstextra").children("span").first().html("订单号："+parsed.order.oid);
                	<%--添加菜品--%>
                	var len = parsed.orderDetails.length;
                	var sum = 0;
                	for(var i = 0; i < len; i++){
                		<%--每次循坏代表一个菜品--%>
                		var name = $("<span></span>").addClass("cell").addClass("name").html(parsed.orderDetails[i].gname);
                		var quantity = $("<span></span>").addClass("cell").addClass("quantity").html(parsed.orderDetails[i].count);
                		var price = $("<span></span>").addClass("cell").addClass("price").html(parseFloat(parsed.orderDetails[i].subtotal).toFixed(2));
                		var foodDiv= $("<div></div>").addClass("orderprogress-totalrow").append(name,quantity,price);
                		var totalList = $("<div></div>").addClass("totalList").append(foodDiv);
                		$(".orderprogress-totaltitle").after(totalList);
                		<%--实际支付--%>
                		sum += parseFloat(parsed.orderDetails[i].subtotal);
                		$(".sum").html(sum.toFixed(2));
                	}
                	
                	<%--收货人信息--%>
                	$(".deliver").html(parsed.order.bname+"提供配送服务");
                	$(".pp").html(parsed.consignee.name);
                	$(".tel").html(parsed.consignee.telphone);
                	$(".address").html(parsed.consignee.address);
                	$(".remark").html(parsed.order.order_remarks);
                	//alert(typeof (parsed.order.order_status));
                	if(parsed.order.order_status==2){
                		$(".dd").first().css("color","#0089dc").nextAll().css("color","#999");
                	}else if(parsed.order.order_status==3){
                		$(".jd").css("color","#0089dc").prev().css("color","#999").end().next().css("color","#999");
                	}else if(parsed.order.order_status == 4){
                		$(".sd").css("color","#0089dc").prevAll().css("color","#999");
                	}else{
                		$("li").css("color","#999");
                	}
                	
                	//给评价按钮附上跳转链接
                	$(".buttontype").attr("href","evalation.jsp?oid="+${param.oid});            
                	}
                
              )
	
	/* $.post{
			"",
			"oid="+${param.oid},
			function(reulst){
				
			}
		} */
</script>
</body>
</html>