$(function(){
    //搜索框获取焦点就显示地图信息
    $("#pickerInput").focusin(function(){
        $("#map-logo").animate({
            top:'-300px'
        },3);
        setTimeout(
            function(){
                $("#pickerBox").animate({
                    top:'-200px',
                    left:'-116px'
                },1000);
                setTimeout(function(){
                    $(".content-out").css("height", "750px");
                    setTimeout(function(){
                        $("#container").animate({
                            height:'430px'
                        },1100);
                    },800);
                },60);

            },
            100
        );
    });
    
    

});