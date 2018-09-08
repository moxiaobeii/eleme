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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js" charset="utf-8"></script>
   
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
    
    <span id="oid" style="display: none;">${oId }</span>
</body>

 <script type="text/javascript">
$(document).ready(function(){
	 //获得此id,轮询查询向后台查询此订单状态,若已支付则跳转页面

 /*
 window.setInterval(function(){
		 
		 var oid = $("#oid").text();
		 var params = {"method":"queryOrderPayStatus","oid":oid};
		 var url = "${pageContext.request.contextPath }/ordersServlet";

		 
		$.get(
			url,
			params,
			function(data){
				var result = data.result;
				if(result == "true"){
					alert("完成支付"); 
					//clearInterval();
					//完成支付,跳转页面
					window.location.href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage"; 
			}else{
					 alert("未完成支付"); 
				}
			},
			"json");  
		
  
 	},2000); 
	
 */
	 
	 $(".btn-stress").click(function(){
		//请求的路径
		window.location.href="${pageContext.request.contextPath }/consigneeCtroller?method=queryRecentlyOrderInfo&url=recentlyorderpage"; 
   	 });
})
</script>

</html>