<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Orderbasic.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/pay/alipay.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css">
</head>
<body>



    <!--生成二维码-->
    <div class="QRcode" id="QRcode">
<!--         <div class="QRcode_close" id="QRcode_close"></div>-->        
		<div class="QRcode_header">请扫二维码</div>
        <div class="QRcode_content">
            <img src="${filePath }">
        </div>
        <div class="btn-box" style="width:140px;height:352px; margin: auto;">
     		<button class="btn-stress btn-lg" style="padding: 12px 30px;font-size: 16px;display: inline-block;line-height: 1;border: none; border-radius: 2px;outline: 0;cursor: pointer;text-align: center;background-color: #f74342;color: #fff;">完成支付</button>
        </div>
    </div>
</body>
</html>