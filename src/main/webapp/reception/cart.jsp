<%--
  Created by IntelliJ IDEA.
  User: moxiaobei
  Date: 2018/9/2
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>脚本之家</title>
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".add").click(function(){
                var t=$(this).parent().find('input[class*=text_box]');
                t.val(parseInt(t.val())+1)
                setTotal();
            })
            $(".min").click(function(){
                var t=$(this).parent().find('input[class*=text_box]');
                t.val(parseInt(t.val())-1)
                if(parseInt(t.val())<0){
                    t.val(0);
                }
                setTotal();
            })
            function setTotal(){
                var s=0;
                $("#tab td").each(function(){
                    s+=parseInt($(this).find('input[class*=text_box]').val())
                        *parseFloat($(this).find('span[class*=price]').text());
                });
                $("#total").html(s.toFixed(2));
            }
            setTotal();
        })
    </script>
</head>
<body>
<table id="tab">
    <tr>
        <td>
            <span>单价:</span><span class="price">1.50</span>
            <input class="min" name="" type="button" value="-" />
            <input class="text_box" name="" type="text" value="1" />
            <input class="add" name="" type="button" value="+" /></td>
    </tr>
    <tr>
        <td>
            <span>单价:</span><span class="price">3.95</span>
            <input class="min" name="" type="button" value="-" />
            <input class="text_box" name="" type="text" value="1" />
            <input class="add" name="" type="button" value="+" /></td>
    </tr>
</table>
<p>总价:<label id="total"></label></p>
</body>
</html>
