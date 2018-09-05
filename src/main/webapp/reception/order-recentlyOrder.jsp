<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>个人资料页面</title>
    <!-- 基础样式CSS-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/basic.css">
    <!-- order页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order.css"/>
    <!-- header页面样式-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css"/>
    <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/sidebar.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/header.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-message.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-recentlyOrder.css">
    
    
    <!-- order页面样式库-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order-iconfont.css"/>
    <!-- JQuery库-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <script src="${pageContext.request.contextPath }/js/sidebar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/order.js"></script>
</head>
<body>
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
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>近三个月订单</span></span>
            </div>

            <div class="center-content">
                <!-- 左侧边导航栏-->
                <ul class="slideBar">
                    <li class="slideBarLi_one">
                        <h2>
                            <i class="fa fa-home" id="slideBarLi_one_myhome"></i><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=orderpersonpage" class="slideBarOption">个人中心</a>
                        </h2>
                    </li>
                    <li class="slideBarLi_two">
                        <h2><i class="fa fa-file" id="slideBarLi_two_myhome"></i>我的订单</h2>
                        <ul>
                            <li ><a href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage" class="slideBarOption">近三个月订单</a></li>
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
                	<div class="center-panel">
					    <h3 class="center-panel-h3"><span>近三个月订单</span></h3>
					    <img src="${pageContext.request.contextPath }/image/slideBarLi_two-takeout.png" class="slideBarLi_two_img">

    					<!-- 用于显示各种订单-->
			    <div class="panelContent">
			        <div class="order_statu">
			            <a  href="javascript:void(0)">热门问题</a>
			            <a  href="javascript:void(0)">随时关注订单状态</a>
			        </div>
			        <table class="order-list">
			            <th class="th1">下单时间</th>
			            <th class="th2">订单内容</th>
			            <th class="th3"></th>
			            <th class="th4">支付金额（元）</th>
			            <th class="th5">状态</th>
			            <th class="th6">操作</th>
			            
			          <c:forEach items="${OrderDetailInfo }" var="ordresInfo" end="4">  
			            <tr>
			                <td class="td-one">
			                    <p><fmt:formatDate value="${ ordresInfo.create_time }"  type="date" dateStyle="default"/> <br><br> <fmt:formatDate value="${ordresInfo.create_time}" pattern="HH:mm:ss"/></p>
			                    <i class="fa fa-circle-o" id="td-one-i"></i>		                    
			                </td>
			                <td class="td-two">
			                    <a href="javascript:void(0) "><img src="${pageContext.request.contextPath }/image/order_img.jpg"/></a>
			                </td>
			                <td class="td-three">
			                    <p>
			                    	<c:forEach items="${ordresInfo.orderDetails }" var="ordre_Details" varStatus="status" >
			                        	<span class="td-three-food"><a href="javascript:void(0) ">${ordre_Details.gname }&nbsp;*</a></span>			                                        
			                        	<span class="td-three-num"><a href="javascript:void(0) ">${ordre_Details.count }</a></span>
			                        	<c:out value="${status.last == true ? ' ':'+' }"></c:out>
			                         </c:forEach>  
			                        <span><a href="javascript:void(0) ">等 ${ordresInfo.good_count }个菜品</a></span>
			                    </p>
			                    <p>
			                        	订单号：<a href="javascript:void(0) ">${ordresInfo.oid}</a>
			                    </p>
			                </td>
			                <td class="td-four"><h3>${ordresInfo.total_price }</h3></td>
			                <td class="td-five">
			                	<h3>
			                		<c:choose>
			                			<c:when test="${ordresInfo.order_status==0 }">未付款</c:when>
			                			<c:when test="${ordresInfo.order_status==1 }">订单失效</c:when>
			                			<c:when test="${ordresInfo.order_status==2 }">已付款</c:when>
			                			<c:when test="${ordresInfo.order_status==3 }">未送达 </c:when>
			                			<c:when test="${ordresInfo.order_status==4 }">已送达</c:when>			                
			                		</c:choose>
			                	</h3>
			                </td>
			                <td class="td-six">
			                    <a href="javascript:void(0)" class="td-six-a1" onclick="orderDetails()">订单详情</a>
			                    <a href="javascript:void(0)" class="td-six-a2">再来一份</a>
			                </td>
			            </tr>
			          </c:forEach>
			         
			         
			        </table>
			    </div>
     			<p class="beforePage">上一页</p><p class="lastPage">下一页</p>
				</div>
               </div>
               
            </div>
        </div>
    </div>
    <div class="footer">
    	<jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>

</html>