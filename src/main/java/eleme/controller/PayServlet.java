package eleme.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.ResponseCode;
import com.alipay.demo.trade.ServerResponse;
import com.alipay.demo.trade.config.Configs;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mchange.v2.collection.MapEntry;

import eleme.entity.Cart;
import eleme.entity.CartDetail;
import eleme.entity.Consignee;
import eleme.entity.Goods;
import eleme.entity.User;
import eleme.service.impl.PayServiceImpl;
import eleme.utils.JedisPoolUtils;
import redis.clients.jedis.Jedis;

@WebServlet("/payServlet")
public class PayServlet extends BaseServlet {
/**
 * 支付接口,通过传来的订单号,去数据库查询该订单消息,进行判断是否已支付,未支付生成二维码来供用户支付
 */
	//创建一个日志对象
    private static Log log = LogFactory.getLog(PayServlet.class);
	
	//点击支付生成二维码的方法
	@SuppressWarnings("rawtypes")
	public ServerResponse pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 获取session判断用户是否登录
		 * 订单号判断订单是否存在,业务处理
		 * 获取upload文件夹路径
		 */

		//清空缓存
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		//获得当前商家的id和购物车
		String bid = jedis.get("current_bid");	
		carts.remove(bid);
		jedis.set("cart_item",gson.toJson(carts));
		//获取订单号
		String oId = request.getParameter("oid");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("USER");
		if(user == null) {
			//用户需要登录,跳转到登录页面
			request.getRequestDispatcher("/reception/login.jsp").forward(request, response);
		}
		//二维码的路径
		String path = request.getSession().getServletContext().getRealPath("upload");
		//调用service的pay方法,获取到该订单的支付二维码信息
		Map<String,String> resultMap = new HashMap<String,String>();
		ServerResponse serverResponse =  PayServiceImpl.pay(oId, user.getUserId(), path);
		
		//获取此二维码的路径
		resultMap = (Map<String, String>) serverResponse.getData();
		String qrFileName = resultMap.get("qrFileName");
		String filePath = request.getContextPath()+"/upload/"+qrFileName;
		request.setAttribute("filePath", filePath);
		
		request.getRequestDispatcher("/reception/alipay.jsp").forward(request, response);
		
		return serverResponse;
	}

	//支付的回调函数处理的接口,写在url上,获取支付宝传来的数据
	public Object alipayCallback(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("支付成功");
		
		
		Map<String,String> params = new HashMap<String, String>();
		//遍历map集合
		Map requestParams = request.getParameterMap();
		for(Iterator iter = requestParams.keySet().iterator();iter.hasNext();) {
			String name = (String)iter.next();
			String[] values = (String[]) requestParams.get(name);
			//拼接每一个values
			String valueStr = "";
			for(int i=0;i<values.length;i++) {
				valueStr = (i==values.length-1)?valueStr + values[i]:valueStr + values[i] + ",";
			}
			params.put(name, valueStr);
		}
		
		log.info("支付宝回调,sign:{},trade_status:{},参数:{}"+params.get("sign")+","+params.get("trade_status")+","+params.toString());
		ServerResponse serverResponse = PayServiceImpl.aliCallback(params);

		//验证支付宝的回调
		params.remove("sign_type");
		try {
			boolean alipayRSACheckedV2 = AlipaySignature.rsaCheckV2(params, Configs.getAlipayPublicKey(), "utf-8", Configs.getSignType());
			
			if(!alipayRSACheckedV2) {
				System.out.println("验证回调请求");
				return "success";
			}
		} catch (AlipayApiException e) {
			log.info("支付宝验证回调异常");
			return "success";
		}
		
		/**
		 * 逻辑验证
		 */
		//验证订单是否以支付
		//ServerResponse serverResponse = PayServiceImpl.aliCallback(params);
		if(serverResponse.isSuccess()) {
			return "success";
		}
		return "failed";
	}
	

	//写一个前台轮询查询此支付状态的接口,若支付成功,返回指引让前台跳转页面
	public ServerResponse<Boolean> queryOrderPayStatus(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String oid = (String) request.getAttribute("oid");
		User user = (User) session.getAttribute("LOGIN_USER");
		if(user == null) {		//返回用户需要登录
			return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
		}
		return PayServiceImpl.queryOrderPayStatus(user.getUserId(), oid);
	}
	
	//由订单页面点击跳转到支付页面的接口,获取订单信息,将此订单插入到数据库。并显示此订单的信息。
	@SuppressWarnings("unused")
	public void orderConfirm(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("USER");
		//获取此收货地址id
		String conId = request.getParameter("conId");
		Consignee consignee = new PayServiceImpl().queryConsignee(conId);
		request.setAttribute("current_con", consignee);
		//获取此订单详情,将之插入到数据库中
		Cart cart = (Cart) session.getAttribute("current_cart");
		Map<Integer, CartDetail> cartMap = cart.getMap();
		CartDetail cartDetail = null;
		for(CartDetail cartDetails:cartMap.values()) {
			cartDetail = cartDetails;
		}
		try {
			//将订单详情表插入到数据库
			//生成订单表,插入到数据库
			String oid = "c"+Math.random()*100000;
			request.setAttribute("oid", oid);
			boolean insertResult = false;
			if(!insertResult) {
				new PayServiceImpl().insertOrders(user.getUserId(),oid,cart,cartDetail,conId);
				new PayServiceImpl().insertOrdersDetail(user.getUserId(),oid,cartDetail);
				insertResult = true;
			}
			//跳转页面
			request.getRequestDispatcher("/reception/pay.jsp").forward(request, response);
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
	}
	
}
