<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<meta charset="UTF-8">
    <title>通过导航栏选中显示到结果</title>
    <!--导入jQuery文件-->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <script src="../js/index-NavigationBar-in.js"></script>
    <!--外部引入公共css样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/basic.css">
    <!--外部引入小图标css样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
    <!--外部引入头部私有样式-->
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/index-NavigationBar-in.css">
</head>
<body>
<%
		//处理请求（浏览器到服务器）的编码
		request.setCharacterEncoding("UTF-8");
%>

	<div class="ordMes-main-in">
	    
	    
	    <%-- <c:forEach var= "business" items="${indexJson}">
	    	<a href="/" class="sellers">
	        <div class="seller-logo">
	            <img src="${business.logo }" alt="${business.bname }">
	            <span>28分钟</span>
	        </div>
	        <div class="seller-mes">
	            <div class="seller-title">${business.bname }</div>
	            <div class="star">
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star"></span>
	                <span class="fa fa-star-half-full"></span>
	            </div>
	            <div class="seller-cost">配送费￥${business.distribution_fee }</div>
	            <div class="seller-activity"></div>
	        </div>
	        <div class="seller-mes-hide-out hide">
	            <div class="seller-mes-hide-in">
	                <div class="seller-mes-hide-name">${business.bname }</div>
	                <div class="seller-mes-hide-type">${business.category }</div>
	                <ul class="seller-mes-hide-other">
	                    <li>配送费￥${business.distribution_fee }</li>
	                    <li>
	                        	平均
	                        <span class="service-time">${business.distribution_time }</span>
	                        	分钟送达
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </a>
	    </c:forEach> --%>
	    
	
	</div>
</body>
</html>