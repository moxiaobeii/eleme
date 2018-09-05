package eleme.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.entity.User;
import eleme.service.impl.OrderServiceImpl;

@WebServlet("/ordersServlet")
public class OrdersServlet extends BaseServlet {

	@SuppressWarnings("unused")
	public void queryConsignee(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		/**
		 * 查询用户地址
		 */
		//获得登录用户
		HttpSession session = request.getSession();
//		User loginUser = (User) session.getAttribute("LOGIN_USER");
		
		
		//模拟一个用户
		User loginUser = new User();
		loginUser.setUserId(1001);
		loginUser.setUsername("root");
		loginUser.setPassword("admin");
		loginUser.setTelphone(17875511823L);
		session.setAttribute("USER", loginUser);
		
		//模拟一个订单ID,查询出订单明细,遍历显示在前端页面
		String oid = "201808281508";
		
		//如果用户登录,查询出用户的信息和购物车信息
		if(loginUser != null) {
			int userId = loginUser.getUserId();
			//查询用户的收货表信息
			try {
				//查询此用户的收货地址
				List<Consignee> consignee = new OrderServiceImpl().queryConsigneeById(userId);
				request.setAttribute("ConsigneeAddressInfo", consignee);
				//查询此用户的当前订单的详情表
				List<OrderDetails> orderDetails = new OrderServiceImpl().queryOrderDetailsByOrderId(oid);
				session.setAttribute("OrderDetailsInfo", orderDetails);
				//跳转到订单页面
				request.getRequestDispatcher("/reception/order-info.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		//用户没有登录的情况下,跳转登录页面
		else {
			try {
				request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request, response);
				
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//插入收货地址的方法
	public void insertConsignee(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("USER");
		
		//获取前端传来的信息
		String name = request.getParameter("name");
		int sex = Integer.parseInt(request.getParameter("sex"));
		String location = request.getParameter("location");
		String adress = request.getParameter("adress");
		String resultAddress = location+adress;
		long telphone = Long.parseLong(request.getParameter("telphone"));
		
		try {
			new OrderServiceImpl().insertConsignee(name,sex,resultAddress,telphone,loginUser.getUserId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
