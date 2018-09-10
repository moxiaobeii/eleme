package eleme.controller;


import eleme.entity.User;
import eleme.service.UserService;
import eleme.service.impl.UserServiceImpl;
import eleme.utils.GetMessageCode;

import javax.servlet.ServletException;
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

    /**
     * 发送验证码
     * @param request
     * @param response
     * @throws IOException
     */
    public void sendCode(HttpServletRequest request,HttpServletResponse response) throws IOException {

        String code = request.getParameter("code");
        String userPhone = request.getParameter("phone");

        //发送短信
        GetMessageCode.getCode(userPhone,code);
    }

    /**
     * 登陆成功，将用户信息保存到session中
     * @param request
     * @param response
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String userPhone = request.getParameter("phone");
        long phone = Long.parseLong(userPhone);

        UserService service = new UserServiceImpl();
        User user = service.getUser(phone);

        HttpSession session = request.getSession();
        session.setAttribute("user",user);

        //实现路径跳转
        String url = (String) session.getAttribute("url");
        if (url == null){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }else {
            session.removeAttribute("url");
            response.sendRedirect(url);
        }

    }

    /**
     * 退出系统
     * @throws ServletException 
     */
    public void quitSys(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        //1、用户session销毁
        HttpSession session = request.getSession();
        session.removeAttribute("user");

        //3、跳转到登陆页面
        request.getRequestDispatcher("/reception/login.jsp").forward(request, response);;
    }

}
