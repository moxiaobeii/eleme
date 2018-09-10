package eleme.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import eleme.entity.Cart;
import eleme.entity.Consignee;
import eleme.entity.User;
import eleme.service.impl.OrderServiceImpl;
import eleme.service.impl.PayServiceImpl;
import eleme.utils.JedisPoolUtils;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
		User loginUser = (User) session.getAttribute("user");
		//获取购物车的信息
		Jedis jedis = JedisPoolUtils.getJedis();
		//1、判断购物车是否存在
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType(); 
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		//获得当前商家的id和购物车
		
		String bid = jedis.get("current_bid");	
		if(bid == null) {
			try {
				response.sendRedirect(request.getContextPath()+"/indexServlet?method=index");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Cart cart = carts.get(bid);
		//将购物车存入session,传递给前端。
		session.setAttribute("current_cart", cart);
		
		//如果用户登录,查询出用户的信息和购物车信息
		if(loginUser != null) {
			int userId = loginUser.getUserId();
			//查询用户的收货表信息
			try {
				//查询此用户的收货地址
				List<Consignee> consignee = new OrderServiceImpl().queryConsigneeById(userId);
				request.setAttribute("ConsigneeAddressInfo", consignee);				
				//跳转到订单页面
				request.getRequestDispatcher("/reception/order-info.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				String uri = request.getRequestURI().substring(7);
				String method= request.getQueryString();
				String url = uri + "?" + method;
				System.out.println(url);
				//用户没有登录的情况下,跳转登录页面
				response.sendRedirect(request.getContextPath()+"/reception/login.jsp");
				session.setAttribute("url",url);
				
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
		User loginUser = (User) session.getAttribute("user");
		
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
	
	//删除地址
	public void deleteConsignee(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		int conId = Integer.parseInt(request.getParameter("conId"));
		
		try {
			new OrderServiceImpl().deleteConsignee(conId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//修改地址
	public void modifyConsignee(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		//获取前端传来的信息
		String conId = request.getParameter("con_id");
		String name = request.getParameter("name");
		int sex = Integer.parseInt(request.getParameter("sex"));
		String location = request.getParameter("location");
		String adress = request.getParameter("adress");
		String resultAddress = location+adress;
		long telphone = Long.parseLong(request.getParameter("telphone"));
	
		try {
			new OrderServiceImpl().modifyConsignee(conId,name,sex,resultAddress,telphone);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//退出登录
	public void exitUser(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		//清空缓存
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		//获得当前商家的id和购物车
		String bid = jedis.get("current_bid");	
		carts.remove(bid);
		jedis.set("cart_item",gson.toJson(carts));
		//清空用户信息
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		try {
			//重定向到登录页面
			response.sendRedirect(request.getContextPath()+"/reception/login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	//写一个前台轮询查询此支付状态的接口,若支付成功,返回指引让前台跳转页面
	public void queryOrderPayStatus(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json; charset=utf-8");  
		PrintWriter writer = response.getWriter();
		
		HttpSession session = request.getSession();
		String oid = request.getParameter("oid");
		User user = (User) session.getAttribute("user");
		if(user == null) {		//返回用户需要登录
			response.sendRedirect(request.getContextPath()+"/reception/login.jsp");
		}
		boolean result =  PayServiceImpl.queryOrderPayStatus(oid);
		if(result) {
			//跳转页面
			request.getRequestDispatcher("/reception/pay.jsp").forward(request, response);
			
			writer.append("{\"result\":\"true\"}");
		}else {
			writer.append("{\"result\":\"false\"}");
		}
	}
	
}
