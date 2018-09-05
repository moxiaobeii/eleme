package eleme.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import eleme.entity.Consignee;
import eleme.entity.OrderDePackage;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.service.OrderDetailsService;
import eleme.service.impl.OrderDetailsServiceImpl;
@WebServlet("/orderDetailsServlet")
public class OrderDetailsServlet extends BaseServlet{
	public void getOrderDetails(HttpServletRequest req,HttpServletResponse resp) {
		resp.setContentType("text/html;charset=utf-8");
		
		
		//获得个人中心传过来的参数
		String oid = req.getParameter("oid");
		OrderDetailsService orderDetailsService = new OrderDetailsServiceImpl();
		//获得订单
		Orders ordersInfo = orderDetailsService.getOrdersInfo(oid);
		//获得订单详情的集合
		List<OrderDetails> orderDetails = orderDetailsService.getOrderDetails(oid);
		 //获得收货人信息
		Consignee consigneeInfo = orderDetailsService.getConsigneeInfo(oid);
		
		//打包上面三个对象，以gson数据格式通过ajax传递到订单详情页面
		 OrderDePackage orderDePackage = new OrderDePackage();
		 orderDePackage.setOrder(ordersInfo);
		 orderDePackage.setOrderDetails(orderDetails);
		 orderDePackage.setConsignee(consigneeInfo);
		 
		 Gson gson = new Gson();
		 String json = gson.toJson(orderDePackage);
//		 String json = gson.toJson(consigneeInfo);
		 try {
			PrintWriter out = resp.getWriter();
			String age = "haha";
			System.out.println(age);
			out.print(age);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		 
	}
}
