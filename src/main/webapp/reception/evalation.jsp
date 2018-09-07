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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_6z27e4k1iup/iconfont.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font_le04b8lo41o/iconfont.css"/>
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
                    <a class="rtname">蒸品店</a>
                </h3>
                <p>
                           <span class="food">
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
            <span class="appraise-food-label" >评价菜品</span>
            <div class="appraise-food-info">

                <div class="appraise-food-item">
                	 <!-- <p class="food-item">
                        <span class="food-name">蒸韭菜饺子</span>
                        <span class="food-icon">
                            <a href="javascript:" class="iconfont icon-pingjia eva1"></a>
                            <a href="javascript:" class="iconfont icon-pingjia eva1"></a>
                            <a href="javascript:" class="iconfont icon-pingjia eva1"></a>
                            <a href="javascript:" class="iconfont icon-pingjia eva1"></a>
                            <a href="javascript:" class="iconfont icon-pingjia eva1"></a>
                        </span>
                        <span class="food-text">
                           	 评价美食
                        </span>
                    </p>   -->
                </div>

            </div>
        </div>
        <!--评价提交-->
        <div class="appraise-btn">
            <button class="btn" onclick="submin()">提交订单</button>
            <p class="appraise-prompt">
                评价后获得
                <span class="appraise-tip">211</span>
                金币
            </p>

        </div>

    </div>
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
            "oid="+ ${param.oid},
            
            function(result){
           	var parsed = JSON.parse(result);
           		$(".rtname").html(parsed.order.bname);
           		var len = parsed.orderDetails.length;
            	var countNum = 0;
            	for(var i = 0; i < len; i++){
            		countNum += parsed.orderDetails[i].count;
            		<!--创建菜品评价-->
                	var foodName = $("<span></span>").html(parsed.orderDetails[i].gname).addClass("food-name");
                	var inconf = $("<a></a>").addClass("iconfont").addClass("icon-pingjia").addClass("e" + i).attr("href","javascript:");
                	var inconf1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia").addClass("e" + i).attr("href","javascript:");
                	var inconf2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia").addClass("e" + i).attr("href","javascript:");
                	var inconf3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia").addClass("e" + i).attr("href","javascript:");
                	var inconf4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia").addClass("e" + i).attr("href","javascript:");

                	var span = $("<span></span>").append(inconf,inconf1,inconf2,inconf3,inconf4).addClass("food-icon");
                	
                	var foodText = $("<span></span>").html("评价美食").addClass("food-text").addClass("text" + i);
                	var p = $("<p></p>").append(foodName,span,foodText).addClass("food-item");
                	$(".appraise-food-item").append(p);
            	}
            	$(".food").html(parsed.orderDetails[0].gname + parsed.orderDetails[0].count+"份共" + countNum + "个菜品");
            	
            	  //对商品进行评价
                var ctr = 0;//为了控制点击评分后，鼠标移除不会有影响
                var length = 0;
                //鼠标移动和点击事件
                $(".icon-pingjia").mouseover(function(){
                   //鼠标移入颜色改变，后面兄弟节点不变
                   $(this).nextAll().css("color","#dbdbdb").end().add($(this).prevAll()).css("color","#eb6643");
                   length = $(this).add($(this).prevAll()).length;
                   var num = $(this).prop("class").substring(23);
                   var pnum = $(".food-item").length;
                   
                   updateText2(length,num,pnum);
                }).click(function(){
                   $(this).nextAll().css("color","#dbdbdb").end().add($(this).prevAll()).css("color","#eb6643");
                   ctr = 1;
                   length = $(this).add($(this).prevAll()).length;
                   var num = $(this).prop("class").substring(23);
                   var pnum = $(".food-item").length;
                   updateText2(length,num,pnum);
                  
                });
                
             //根据鼠标移动和点击，修改相应文和显示评价框
             var updateText2 = function(length,num,pnum){
                if(length == 1){
                //为了评价框的改变的时候，只改变相应评价文字
              	  for(var i = 0; i < pnum; i++){
              		 if(num == i +""){
              			 $(".food-text").eq(i).html("极差").css("color","rgb(163, 166, 175)");
              	  } 
              	  }
              	  
                   //$(".food-text").html("极差").css("color","rgb(163, 166, 175)");
                }else if(length == 2){
              	  for(var j = 0; j < pnum; j++){
               		 if(num == j +""){
               	         $(".food-text").eq(j).html("失望").css("color","rgb(163, 166, 175)");
               	  } 
               	  }
                }else if(length == 3){
              	  for(var i = 0; i < pnum; i++){
               		 if(num == i +""){
               	         $(".food-text").eq(i).html("一般").css("color","rgb(241, 139, 27)");
               	  } 
               	  }
                }else if(length == 4){
              	  for(var i = 0; i < pnum; i++){
               		 if(num == i +""){
               	         $(".food-text").eq(i).html("满意").css("color","rgb(241, 139, 27)");
               	  } 
               	  }

                }else if(length == 5){
              	  for(var i = 0; i < pnum; i++){
               		 if(num == i +""){
               	         $(".food-text").eq(i).html("惊喜").css("color","rgb(235, 102, 67)");
               	   } 
               	  }

                }else{
              	  for(var i = 0; i < pnum; i++){
                		 if(num == i +""){
                	         $(".food-text").eq(i).html("评价美食");
                	  } 
                	  }
                }
             };
			}
	)
	
	function submin(){
	//获取商家服务的评分
	var serviceCon = $(".score-text").html();
	var serviceNum = 0;
	if(serviceCon == "极差"){
		serviceNum = 1;
	}else if(serviceCon == "失望"){
		serviceNum = 2;
	}else if(serviceCon == "一般"){
		serviceNum = 3;
	}else if(serviceCon == "满意"){
		serviceNum = 4;
	}else if(serviceCon == "惊喜"){
		serviceNum = 5;
	}
	console.log(serviceNum)
	
	console.log($(".service-area").val());
	//对商家的评价
	var texterea = $(".service-area").val();
	//获得送餐速度
	var speedTime = $(".appraise-driver-time").text();
	//获得商品的评价
	var foodlist = $(".food-text");
	var allfood ;
	for(var i = 0; i < foodlist.length; i++){
		var foddtext = foodlist.eq(i).text();
		if(foddtext == "极差"){
			if(i == 0){
				allfood = "1"
			}else{
				allfood = allfood+"1";
			}
			
		}else if(foddtext == "失望"){
			if(i == 0){
				allfood = "2"
			}else{
				allfood = allfood+ "2";
			}
			
		}else if(foddtext == "一般"){
			if(i == 0){
				allfood = "3"
			}else{
				allfood = allfood+ "3";
			}
			
		}else if(foddtext == "满意"){
			if(i == 0){
				allfood = "4"
			}else{
				allfood = allfood+ "4";
			}
			
		}else if(foddtext == "惊喜"){
			if(i == 0){
				allfood = "5"
			}else{
				allfood = allfood+ "5";
			}
			
		}
	}
	//添加评价
	var username ="${user.username}";
	var eval = '{"serviceNum":'+serviceNum + ',"texterea":"'+texterea+ '","speedTime":"' +speedTime+'","allfood":"'+allfood + '","oid":"'+${param.oid}+'","bname":"'+$(".rtname").html()+'","username":"'+username+'"}';
	//var eval = '{"serviceNum":'+serviceNum + ',"texterea":"'+texterea+ '","speedTime":"' +speedTime+'", "allfood":"'+allfood + '","oid":"201808281518"}';

	console.log(eval)

	$.post(
			"${pageContext.request.contextPath}/evaluationServlet?method=getEvaluation",
			"eval=" + eval,
			function(){
				window.location.href = "order-details.jsp?oid=${param.oid}"
			}
	)
}
</script>
    <script src="${pageContext.request.contextPath }/js/evaluation.js"></script>

</body>
</html>