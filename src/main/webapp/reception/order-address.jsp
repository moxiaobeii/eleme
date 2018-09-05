<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>地址管理页面</title>
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
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/order-address.css">	  
    
    <!-- order页面样式库-->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome/css/font-awesome.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/order-iconfont.css"/>
    <!-- JQuery库-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
    <!--导入js文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/sidebar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/order-address.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/order.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/orderInfo/orderInfo.js"></script>
    
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
                <span id="span1">当前位置:</span><span id="span2"><a href="javascript:void(0)">广州市南沙区人民政府</a></span><span id="span3"><a href="javascript:void(0)">[切换地址]</a></span><span id="span4"><i class="iconfont icon-xiangyou"></i><span>地址管理</span></span>
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
                		<div class="myaddress-center">
    						<h3 class="myaddress-center-h3">地址管理</h3>
   							 <div class="myaddress-center-div">   
       							<c:forEach items="${consigneeList }" var="consigneeInfo" varStatus="status">
	        						<div class="addressblock " >
		                               <div class="addressblock-div1" >
			                                <p class="addressblock-div1-p1">${consigneeInfo.name}</p>
			                                <span>${consigneeInfo.sex == 0 ? "先生" : "女士" }</span>
							                <button class="addressblock-div1-b1" onclick="updateConsignee()">修改</button>
							                <button class="addressblock-div1-b2" onclick="deleteConsignee()">删除</button>
			           					</div>
							            <div class="addressblock-div2">${consigneeInfo.address }</div>
							            <div class="addressblock-div3">${consigneeInfo.telphone }</div>
							            <p class="consigneeID">${consigneeInfo.con_id }</p>
	        						</div>
        						</c:forEach>

						        <div class="addressblock addNewAddressDiv" onclick="showAddressBlock()" >
						        <!-- onclick="showAddressBlock() -->
						            <i class="fa fa-plus"></i>添加新地址
						        </div>
						        
						       
    						</div>
						</div>
                </div>
            </div>
        </div>
    </div>
    
    
	
	<!--添加地址-->
    <div class="addressDiv">

    </div>
    <div class="addressdialog">
        <!-- 关闭按钮div -->
        <div class="addressdialog-close" onclick="showAddressBlock()">+</div>
        <div class="addressdialog-header">添加新地址</div>
        <div class="addressdialog-content">
            <div class="addressdialog-content-name">
                <label class="addressdialog-content-label">姓名</label>
                <input type="text" class="addressdialog-content-input" placeholder="请输入姓名" name="addressdialog-content-input-name">   
                <p class="addressdialog-content-p-error pname">请输入收获人的信息</p>            
            </div>
            <div class="addressdialog-content-sex">
                <label class="addressdialog-content-label">性别</label>
                <input class="addressdialog-content-label-input" type="radio" name="sex" value="0" checked="checked"> <label>男士</label>&nbsp;&nbsp;&nbsp;
                <input class="addressdialog-content-label-input" type="radio" name="sex" value="1"> <label>女士</label>
            </div>
            <div class="addressdialog-content-location">
                <label class="addressdialog-content-label">位置</label>
                <input class="addressdialog-content-input" placeholder="请输入小区、大厦或学校" name="addressdialog-content-input-location">
                <p class="addressdialog-content-p-error plocation">请输入位置信息</p>            
            
            </div>
            <div class="addressdialog-content-address">
                <label class="addressdialog-content-label">详细地址</label>
                <input class="addressdialog-content-input" placeholder="单元、门牌号" name="addressdialog-content-input-location-address">
                <p class="addressdialog-content-p-error paddress">请输入详细地址</p>                   
            </div>
            <div class="addressdialog-content-telphone">
                <label class="addressdialog-content-label">手机号</label>
                <input class="addressdialog-content-input" placeholder="请输入您的手机号码" name="addressdialog-content-input-telphone">
           		<p class="addressdialog-content-p-error ptelphone">请输入正确的手机号</p>            
            </div>
            <div class="addressdialog-content-save">
                <button class="addressdialog-content-save-button1" onclick="saveConsigneeInfo()">保存</button>
                <button class="addressdialog-content-save-button2" onclick="nosaveConsigneeInfo()">取消</button>
            </div>
        </div>
    </div>
    
    
    <div class="addressdialog2">
        <!-- 关闭按钮div -->
        <div class="addressdialog-close2" onclick="updateConsignee()">+</div>
        <div class="addressdialog-header2">编辑地址</div>
        <div class="addressdialog-content2">
            <div class="addressdialog-content-name2">
                <label class="addressdialog-content-label2">姓名</label>
                <input type="text" class="addressdialog-content-input2" placeholder="请输入姓名" name="addressdialog-content-input-name2">   
                <p class="addressdialog-content-p-error pname2">请输入收获人的信息</p>            
            </div>
            <div class="addressdialog-content-sex2">
                <label class="addressdialog-content-label2">性别</label>
                <input class="addressdialog-content-label-input2" type="radio" name="sex" value="0" checked="checked"> <label>男士</label>&nbsp;&nbsp;&nbsp;
                <input class="addressdialog-content-label-input2" type="radio" name="sex" value="1"> <label>女士</label>
            </div>
            <div class="addressdialog-content-location2">
                <label class="addressdialog-content-label2">位置</label>
                <input class="addressdialog-content-input2" placeholder="请输入小区、大厦或学校" name="addressdialog-content-input-location2">
                <p class="addressdialog-content-p-error2 plocation2">请输入位置信息</p>            
            
            </div>
            <div class="addressdialog-content-address2">
                <label class="addressdialog-content-label2">详细地址</label>
                <input class="addressdialog-content-input2" placeholder="单元、门牌号" name="addressdialog-content-input-location-address2">
                <p class="addressdialog-content-p-error2 paddress2">请输入详细地址</p>                   
            </div>
            <div class="addressdialog-content-telphone2">
                <label class="addressdialog-content-label2">手机号</label>
                <input class="addressdialog-content-input2" placeholder="请输入您的手机号码" name="addressdialog-content-input-telphone2">
           		<p class="addressdialog-content-p-error2 ptelphone2">请输入正确的手机号</p>            
            </div>
            <div class="addressdialog-content-save2">
                <button class="addressdialog-content-save-button12" onclick="updateConsigneeInfo()">保存</button>
                <button class="addressdialog-content-save-button22" onclick="updateConsignee()">取消</button>
            </div>
        </div>
    </div>
  
   
	<div class="deleteConsigneeInfo">
		<p class="deleteConsigneeInfo-p">确定要删除这条记录吗？</p>
		<button class="deleteConsigneeInfo-button1">确定</button>
		<button class="deleteConsigneeInfo-button2">取消</button>
	</div>
    <div class="footer">
    	<jsp:include page="footer.jsp"></jsp:include>
    </div>
    
</body>
<script>

	var num2;//收货人的id删除
	var num3;//收货人id修改
	var updateTelPhone;
	var locationAndLocation;
	var updateName;
	
	//修改收货人信息
	function updateConsignee(){
		$(".addressDiv").fadeToggle(2000);
		$(".addressdialog2").fadeToggle(1000);	
	}
	
	//修改收货人信息
	function updateConsigneeInfo(){
		
		var name = $(" input[ name='addressdialog-content-input-name2' ] ").val();
		//var location = $(".addressdialog-content-input").val();
		var sex = $(" input[ name='sex' ] ").val();
		var location = $(" input[ name='addressdialog-content-input-location2' ] ").val();
		var address = $(" input[ name='addressdialog-content-input-location-address2' ] ").val();
		var telphone = $(" input[ name='addressdialog-content-input-telphone2' ] ").val();
		var flag = true;
		
		
		if( name.length<1 ){
			$(".pname2").css("display","block");
			flag = false;
		}else{
			$(".pname2").css("display","none");
		}
		
		if(location.length<1){
			$(".plocation2").css("display","block");
			flag = false;
		}else{
			$(".plocation2").css("display","none");
		}
		
		if( address.length < 1){
			$(".paddress2").css("display","block");
			flag = false;
		}else{
			$(".paddress2").css("display","none");
		}
		
		if( (telphone.length != 11)) {
			$(".ptelphone2").css("display","block");
			flag = false;
		}else{
			$(".ptelphone2").css("display","none");
		}
		
		if(flag == true){
			
			var url = "${pageContext.request.contextPath }/consigneeCtroller?method=updateConsigneeInfo&name="+name+"&sex="+sex+"&location="+location+"&address="+address+"&telphone="+telphone+"  ";			
			$.post(
				url,
				"id="+num3,
				function(resultJSONObject){
					//var value = JSON.parse(resultJSONObject);
					$(".addressDiv").fadeToggle(2000);
					$(".addressdialog2").fadeToggle(1000);
					window.location.reload(true);
			});	
			
		  }
	}
	
	
	
	
	//确认删除收货人信息
	$(".deleteConsigneeInfo-button1").click(function(){
    	//var num = $(this).parents(".addressblock").find(".consigneeID").val(); 
    	//alert(num2);
		var url = "${pageContext.request.contextPath }/consigneeCtroller?method=deleteConsigneeInfo";			
    	$.post(
				url,
				"id="+num2,
				function(resultJSONObject){
					$(".addressDiv").fadeToggle(1000);
					$(".deleteConsigneeInfo").fadeToggle(1000);
					window.location.reload(true);
				});	
	})
	
	//取消保存收货人信息
	$(".deleteConsigneeInfo-button2").click(function(){
		$(".addressDiv").fadeToggle(1000);
    	$(".deleteConsigneeInfo").fadeToggle(1000);
	})
	
	//删除获取id
    $(".addressblock-div1-b2").click(function(){
    	$(".addressDiv").fadeToggle(1000);
    	$(".deleteConsigneeInfo").fadeToggle(1000);
    	
    	//获得当前div的索引
    	//var num = $(this).parents(".addressblock").index();
    	//alert(num);
    	
    	//获得id
    	num2 = $(this).parents(".addressblock").find(".consigneeID").html(); 
    	//alert(num2);
    	
    });	
	
	//修改获取id
	$(".addressblock-div1-b1").click(function(){
    	//$(".addressDiv").fadeToggle(1000);
    	//$(".addressdialog2").fadeToggle(1000);
    	
    	//获得当前div的索引
    	//var num = $(this).parents(".addressblock").index();
    	//alert(num);
    	
    	//获得id
    	num3 = $(this).parents(".addressblock").find(".consigneeID").html();    	
    	updateTelPhone = $(this).parents(".addressblock").find(".addressblock-div3").html(); 
    	locationAndLocation = $(this).parents(".addressblock").find(".addressblock-div2").html(); 
    	updateName = $(this).parents(".addressblock").find(".addressblock-div1-p1").html(); 
    		
    	
    		
    	$(" input[ name='addressdialog-content-input-telphone2' ] ").val(updateTelPhone);
    	$(" input[ name='addressdialog-content-input-location2' ] ").val(locationAndLocation);
    	$(" input[ name='addressdialog-content-input-location-address2' ] ").val(locationAndLocation);
    	$(" input[ name='addressdialog-content-input-name2' ] ").val(updateName);
    	
    });	
	
	
	//删除收货人信息
	function deleteConsignee(){
		
		//alert($(this).attr("id"));
		
		
		//alert(valResult);
		//$(".addressDiv").fadeToggle(2000);
		//$("").fadeToggle(1000);
		//$(this).siblings(".deleteConsigneeInfo").css("display","block");
		//$(this).css("display","block");
		//$(".myaddress-center-div").$(this).hide();
	}
	
	
	
	//添加收货人信息
	function showAddressBlock(){
		$(".addressDiv").fadeToggle(2000);
		$(".addressdialog").fadeToggle(1000);
	}
	
	//取消添加
	function nosaveConsigneeInfo(){
		$(".addressDiv").fadeToggle(2000);
		$(".addressdialog").fadeToggle(1000);
	}
	
	
	//保存信息
	function saveConsigneeInfo(){
		
		var name = $(" input[ name='addressdialog-content-input-name' ] ").val();
		//var location = $(".addressdialog-content-input").val();
		var sex = $(" input[ name='sex' ] ").val();
		var location = $(" input[ name='addressdialog-content-input-location' ] ").val();
		var address = $(" input[ name='addressdialog-content-input-location-address' ] ").val();
		var telphone = $(" input[ name='addressdialog-content-input-telphone' ] ").val();
		var flag = true;
		
		
		if( name.length<1 ){
			$(".pname").css("display","block");
			flag = false;
		}else{
			$(".pname").css("display","none");
		}
		
		if(location.length<1){
			$(".plocation").css("display","block");
			flag = false;
		}else{
			$(".plocation").css("display","none");
		}
		
		if( address.length < 1){
			$(".paddress").css("display","block");
			flag = false;
		}else{
			$(".paddress").css("display","none");
		}
		
		if( (telphone.length != 11)) {
			$(".ptelphone").css("display","block");
			flag = false;
		}else{
			$(".ptelphone").css("display","none");
		}
		
		if(flag == true){
			
			var url = "${pageContext.request.contextPath }/consigneeCtroller?method=saveConsigneeInfo&name="+name+"&sex="+sex+"&location="+location+"&address="+address+"&telphone="+telphone+"  ";			
			$.post(
				url,
				{uname:name,usex:sex, ulocation:location, uaddress:address, utelphone:telphone},
				function(resultJSONObject){
					var value = JSON.parse(resultJSONObject);
					$(".addressDiv").fadeToggle(2000);
					$(".addressdialog").fadeToggle(1000);
					window.location.reload(true);
			});	
			
		  }
	}
	
	
	$(document).ready(function(){
	    $(".addressblock").mouseenter(function(){
	        $(this).css("border-color","#0089DC");
	        $(this).find("button").css("color","#0089DC");
	    });
	    $(".addressblock").mouseleave(function(){
	        $(this).css("border-color","#DDDDDD");
	        $(this).find("button").css("color","#BBBBBB");
	    });
	    $(".addNewAddressDiv").mouseenter(function(){
	        $(this).css("color","#0089DC");
	        $(this).children("i").css("color","#0089DC");
	    });
	    $(".addNewAddressDiv").mouseleave(function(){
	        $(this).css("color","#0089DC");
	        $(this).children("i").css("color","#0089DC");
	    });
	});

</script>
</html>