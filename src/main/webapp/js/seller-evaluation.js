/**
 * Created by wu on 2018/9/7.
 */
function eval(){
	$(".evalBtn").click(function(){
		var eval=$(this).html();
		if(eval == "满意"){
			$(this).prev().removeClass("active").end().addClass("active");
			$(".evaluation").children("li").remove();
			var shopName=$(".shop_name").html();
			   //用ajax获得商店的所有评价数据，
			    $.post(
					"${pageContext.request.contextPath}/evaluationServlet?method=getSatisfaction",
			    	"shopName=" + shopName,
			    	function(result){
						var parsed = JSON.parse(result);
						for(var i = 0; i < parsed.length; i++){
							//用户头像
							var userImg = $("<span></span>").addClass("user_img");
							//评价内容
							var userName = $("<h4></h4>").addClass("eval-userName").html(parsed[i].evaluation.username);//用户名
							//评价内容   1.2商家服务评价
							var pingfenhui1 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui2 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui3 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui4 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var pingfenhui5 = $("<a></a>").addClass("iconfont").addClass("icon-pingfenhui");
							var icon = $("<span></span>").addClass("icon").append(pingfenhui1,pingfenhui2,pingfenhui3,pingfenhui4,pingfenhui5);
							var rateText = $("<span></span>").addClass("rate-text");
							var rateStart = $("<p></p>").addClass("rate-start").append(icon,rateText);
							var evalStart = $("<div></div>").addClass("eval-start").append(rateStart);
							var evalMain = $("<div></div>").addClass("eval-main").append(evalStart);
							//根据服务等级，点亮icon图标
							
							if(parsed[i].evaluation.service_evaluation == 5){
				
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								pingfenhui4.css("color","red");
								pingfenhui5.css("color","red");
								rateText.html("惊喜").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 4){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								pingfenhui4.css("color","red");
								rateText.html("满意").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 3){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								pingfenhui3.css("color","red");
								rateText.html("一般").css("color","red");
							}else if(parsed[i].evaluation.service_evaluation == 2){
								pingfenhui1.css("color","red");
								pingfenhui2.css("color","red");
								rateText.html("失望").css("color","#999");
							}else{
								pingfenhui1.css("color","red");
								rateText.html("极差").css("color","#999");
							}
							var evaltime = $("<span></span>").addClass("eval-time").html(parsed[i].evaluation.evalDate);
							var evalContent = $("<div></div>").addClass("eval-content").append(userName,evalMain,evaltime);
							//商品评价
							for(var j = 0; j < parsed[i].evaluation.good_evaluation.length; j++){
								//商品名
								var foodName = $("<span></span>").addClass("food-name").html(parsed[i].gname[j]);
								//商品评分
								var font1 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font2 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font3 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font4 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia");
								var font5 = $("<a></a>").addClass("iconfont").addClass("icon-pingjia"); 
								var iconItem = $("<span></span>").addClass("icon-item").append(font1,font2,font3,font4,font5);
								var foodText = $("<span></span>").addClass("food-text");
								var p = $("<p></p>").append(iconItem,foodText);
								var foodIcon = $("<div></div>").addClass("food-icon").append(p);
								var evalFood = $("<div></div>").addClass("eval-food").append(foodName,foodIcon);
								evalContent.append(evalFood);
								//获得菜品的评分
								var num = parsed[i].evaluation.good_evaluation.charAt(j)+"";
								if(num == "5"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									font4.css("color","red");
									font5.css("color","red");
									foodText.html("惊喜").css("color","red");
								}else if(num == "4"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									font4.css("color","red");	
									foodText.html("满意").css("color","red");

								}else if(num == "3"){
									font1.css("color","red");
									font2.css("color","red");
									font3.css("color","red");
									foodText.html("一般").css("color","red");

								}else if(num == "2"){
									font1.css("color","red");
									font2.css("color","red");
									foodText.html("失望").css("color","#999");

								}else{
									font1.css("color","red");
									foodText.html("极差").css("color","#999");

								}
							}
							var li = $("<li></li>").addClass("evaluation-item").append(userImg,evalContent);
							$(".evaluation").append(li);
						}    	
			    	}
			    	 
			    	 
			    )
		}
	});
}