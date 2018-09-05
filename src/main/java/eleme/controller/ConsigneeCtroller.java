package eleme.controller;

import com.google.gson.Gson;
import eleme.entity.Business;
import eleme.entity.Consignee;
import eleme.entity.Orders;
import eleme.entity.User;
import eleme.service.ConsigneeService;
import eleme.service.impl.ConsigneeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class consigneeCtrl
 */
@WebServlet("/consigneeCtroller")
public class ConsigneeCtroller extends BaseServlet {
	
	private int pageNow = 1;
	
	//查询收货人信息
	public void queryConsigneeInfo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		ConsigneeService consigneeService = new ConsigneeServiceImpl();
		List<Consignee> consigneeList = consigneeService.queryConsignee();
		request.setAttribute("consigneeList", consigneeList);
		request.getRequestDispatcher("/reception/order-address.jsp").forward(request, response);
//		response.sendRedirect("reception/order-address.jsp");
	}
	
	//查询用户个人信息
	public  void queryUserInfo(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
				
		
	
		
		//user1为测试数据
		User user1 = new User();
		user1.setUserId(1003);
		user1.setUsername("郭家康");
		user1.setTelphone(1787551181);
		user1.setPassword("a123");
		user1.setMyRedPaper(2);
		user1.setMyGold(56);
		user1.setMyCount(23);
		//session1为测试数据
		HttpSession session1 = request.getSession();
		session1.setAttribute("USER", user1);		
		
		HttpSession session = request.getSession();	
		User user = (User)session.getAttribute("USER");//从session 获取登录用户的信息
		
		
		if(user != null){
			ConsigneeService consigneeService = new ConsigneeServiceImpl();
			User userInfoList = (User)consigneeService.queryUserInfo(user);
			//查询出来后添加到request中
			request.setAttribute("UserInfo", userInfoList);
			
			request.getRequestDispatcher("/reception/orderPersonInfo.jsp").forward(request, response);
//			response.sendRedirect("reception/orderPersonInfo.jsp");
		}else{
			request.getRequestDispatcher("/reception/orderPersonInfo.jsp?").forward(request, response);
		}	
			
			
	}
	
	//查询收藏商家信息
	public void collectedBusinessInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ConsigneeService collectBusiness = new ConsigneeServiceImpl();
		List<Business> collectBusines = collectBusiness.queryCollectedBusinessInfo();
		request.setAttribute("collectedBusiness", collectBusines);
		request.getRequestDispatcher("/reception/order-mycollection.jsp").forward(request, response);
	}
	
	//用户个人中心页面查询
	public void queryUserPersonCenterInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		request.getRequestDispatcher("/reception/order-person.jsp").forward(request, response);
	}
	
	//查询用户近三个月订单
	public void queryRecentlyOrderInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		//测试数据
		int userId = 1003;
		
		ConsigneeService collectBusiness = new ConsigneeServiceImpl();
		List<Orders> recentlyOrders = collectBusiness.queryRecentlyOrderInfo(userId);		
		
		request.setAttribute("OrderDetailInfo",recentlyOrders );
				
		//判断是否是从recentlyorder页面送过来的参数
		String value = request.getParameter("url");
		
		if ("recentlyorderpage".equals(value)) {
			
			request.getRequestDispatcher("/reception/order-recentlyOrder.jsp").forward(request, response);
		}else if ("orderpersonpage".equals(value)) {
			request.getRequestDispatcher("/reception/order-person.jsp").forward(request, response);			
		}else{
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String json = gson.toJson(recentlyOrders);
			out.println(json);
		}
	}
	
	//保存用户体提交过来的收获人信息
	public void saveConsigneeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		
		String name = request.getParameter("name");
		String sex= request.getParameter("sex");
		String location = request.getParameter("location");
		String address =  request.getParameter("address");
		String telphone = request.getParameter("telphone");
		System.out.println(name + sex + location + address + telphone);
		
		int sex2 = Integer.parseInt(sex);
		long telphone2 = Long.parseLong(telphone);
		String address2 = location + address;
		
		Consignee consignee = new Consignee();
		int con_id = 1821;
		con_id += 1;
		consignee.setCon_id(con_id);
		consignee.setName(name);
		consignee.setSex(sex2);
		consignee.setAddress(address2);
		consignee.setTelphone(telphone2);
	
		ConsigneeService saveConsigneeInfo = new ConsigneeServiceImpl();
		saveConsigneeInfo.saveConsigneeInfo(consignee);
		
		ConsigneeService saveConsigneeInfo2 = new ConsigneeServiceImpl();
		List<Consignee> consigneeList = saveConsigneeInfo2.queryConsignee();
		
		Gson gson = new Gson();
		String json = gson.toJson(consigneeList);
		
		PrintWriter out = response.getWriter();
		out.print(json);
		
		
//		ConsigneeService consigneeService = new ConsigneeServiceImpl();
//		List<Consignee> consigneeList = consigneeService.queryConsignee();
//		request.setAttribute("consigneeList", consigneeList);
//		request.getRequestDispatcher("/reception/order-address.jsp").forward(request, response);
//		
		//request.setAttribute("consigneeList", consigneeList);
//		PrintWriter out = response.getWriter();
//		out.println("xixi");
		
	}
	
	//删除收货人信息
	public void deleteConsigneeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		//获取页面传送过来的id 
		String value = request.getParameter("id");
		int id = Integer.parseInt(value);
		ConsigneeService deleteConsigneeInfo = new ConsigneeServiceImpl();
		deleteConsigneeInfo.deleteConsigneeInfo(id);
	}
	
	//修改收货人信息
	public void updateConsigneeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		//HttpSession session = request.getSession();
		//User user = (User)session.getAttribute("USER");
		
		String name = request.getParameter("name");
		String sex= request.getParameter("sex");
		String location = request.getParameter("location");
		String address =  request.getParameter("address");
		String telphone = request.getParameter("telphone");
		//System.out.println(name + sex + location + address + telphone);
		String con_id = request.getParameter("id");
		//int user_id = user.getUserId();
		
		int sex2 = Integer.parseInt(sex);
		long telphone2 = Long.parseLong(telphone);
		String address2 = location + address;
		int cid = Integer.parseInt(con_id);
		
		Consignee consignee = new Consignee();
		consignee.setCon_id(cid);
		consignee.setName(name);
		consignee.setSex(sex2);
		consignee.setAddress(address2);
		consignee.setTelphone(telphone2);
		
		//System.out.println(con_id);
		ConsigneeService updateConsigneeInfo = new ConsigneeServiceImpl();
		updateConsigneeInfo.updateConsigneeInfo(consignee);
	}
	
	//实现近三个月订单分页功能
	public void queryRecentlyOrderPageByPage(HttpServletRequest request, HttpServletResponse response){
		
		String page = request.getParameter("status");
		
		//测试数据
		int userId = 1003;		
		ConsigneeService collectBusiness = new ConsigneeServiceImpl();
		List<Orders> recentlyOrders = collectBusiness.queryRecentlyOrderInfo(userId);	
		
		int totalCount = recentlyOrders.size();//总记录条数
		int totalPage = totalCount % 5 == 0 ? (totalCount / 5) : (totalCount / 5 ) + 1;
		
		List<Orders> orderListByPage = new ArrayList<Orders>();
		
		if( "before".equals(page)){
			//上一页
			if(pageNow == 1){
				System.out.println("已经是第一页");
			}else{
				pageNow -= 1;
				for(int i=0 ; i< pageNow*5; i++){
					recentlyOrders.remove(i);
				}
				request.setAttribute("recentlyOrdersByPage", recentlyOrders);
			}
		}else{
			//下一页
			if (pageNow == totalPage) {
				System.out.println("已经是最后一页");
			}else{
				pageNow += 1;
				for(int i=0 ; i< pageNow*5; i++){
					recentlyOrders.remove(i);
				}
				request.setAttribute("recentlyOrdersByPage", recentlyOrders);
			}
		}
		
		
		
	}
	
	
}
