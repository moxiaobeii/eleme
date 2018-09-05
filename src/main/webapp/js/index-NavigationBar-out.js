$(function(){
    <!--导航栏选中显示餐馆的结果-->
    $(document).ready(function(){
        $.ajax({
            type: "POST", //用post方式传输
            data:'{}',
            dataType: "html", //数据格式：html
            url: 'index-NavigationBar-in.jsp', //目标地址
            contentType: "application/json",
            success: function(date) {
                $(".ordMes-main-in").html(date);
            }
        });
    });

    //商家导航栏选项卡
    //上
    $(".ordMes-search-main>.item").click(function(){
        //通过 .index()方法获取元素下标，从0开始，赋值给某个变量	
        var indexT = $(this).index();
        //被选中的追加一个类（即获得指定属性）
        $(this).addClass("choice-out");
        //其他的有该类的移除
        $(this).siblings(".item").removeClass("choice-out");
        $(".ordMes-search-main-next :first-child").addClass("choice-in").siblings().removeClass("choice-in");
        //如果选中的是全部商品则下面的导航栏隐藏
        if(indexT == 1 ){
            $(this).siblings("div").hide();
        }else{
            //让内容框的第 (indexT - 2) 个 div显示出来，其他的被隐藏
            $(".ordMes-search-main>.ordMes-search-main-next").eq(indexT -2).show().siblings("div").hide();
        }
        //把上面大的导航栏选项卡某个索引值indexT通过ajax传递到indexServlet层
        //(indexT-1)得到当前点击的是第几个选项(0就是代表全部商家，其他代表某个选项指定的商家)
        alert(indexT);
        $.post(
        	//把索引值传过去给indexServlet层的index方法
        	"/indexServlet?method=index", 
        	"indexT="+(indexT-1), 
            "json"
        );
        
    });
    
    
    //下
    $(".ordMes-search-main-next>.item").click(function(){
        //被选中的追加一个类（即获得指定属性）
        $(this).addClass("choice-in");
        //其他的有该类的移除
        $(this).siblings(".item").removeClass("choice-in");
        
        //把下面小的导航栏选项卡某个索引值indexT通过ajax传递到indexServlet层
        //获取当前选中的节点的索引值
        var indexB = $(this).index();
        alert(indexB);
        //(indexB)得到当前点击的是第几个选项(0就是代表全部商家，其他代表某个选项指定的商家)
        $.post(
        	//把索引值传过去给indexServlet层index方法
        	"/indexServlet?method=index", 
        	"indexB="+indexB, 
        	//回调函数拿到查询到的商家信息
        	function(indexJson){
        		alert(indexJson);
        	}, "json"
        );
    });

});
