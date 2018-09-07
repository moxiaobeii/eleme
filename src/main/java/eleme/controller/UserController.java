package eleme.controller;


import eleme.entity.User;
import eleme.service.UserService;
import eleme.service.impl.UserServiceImpl;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by moxiaobei on 2018/9/6.
 **/
@WebServlet("/userController")
public class UserController extends BaseServlet{

    public void sendCode(HttpServletRequest request,HttpServletResponse response) throws IOException {

        String code = request.getParameter("code");
        String userPhone = request.getParameter("phone");

        HttpClient client = new HttpClient();
        PostMethod post = new PostMethod("http://gbk.api.smschinese.cn");
        post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码


        String uid = "kelchy";   //用户名
        String password = "d41d8cd98f00b204e980";   //密码
        String showCode = "饿了么登陆验证码：" + code;

        System.out.println(showCode);

        NameValuePair[] data ={ new NameValuePair("Uid", uid),new NameValuePair("Key", password),new NameValuePair("smsMob",userPhone),new NameValuePair("smsText",showCode)};
        post.setRequestBody(data);

        client.executeMethod(post);
        Header[] headers = post.getResponseHeaders();
        int statusCode = post.getStatusCode();
        System.out.println("statusCode:"+statusCode);
        for(Header h : headers)
        {
            System.out.println(h.toString());
        }
        String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
        System.out.println(result); //打印返回消息状态

    }

    /**
     * 登陆成功，将用户信息保存到session中
     * @param request
     * @param response
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String userPhone = request.getParameter("phone");
        long phone = Long.parseLong(userPhone);

        UserService service = new UserServiceImpl();
        User user = service.getUser(phone);

        HttpSession session = request.getSession();
        session.setAttribute("user",user);

    }

}
