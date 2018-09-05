package eleme.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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

import eleme.entity.OrderDetails;
import eleme.entity.User;
import eleme.service.impl.PayServiceImpl;

@WebServlet("/payServlet")
public class PayServlet extends BaseServlet {
/**
 * 支付接口,通过传来的订单号,去数据库查询该订单消息,进行判断是否已支付,未支付生成二维码来供用户支付
 */
	//创建一个日志对象
    private static Log log = LogFactory.getLog(PayServlet.class);
	
	//支付的方法
	@SuppressWarnings("rawtypes")
	public ServerResponse pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 获取session判断用户是否登录
		 * 订单号判断订单是否存在,业务处理
		 * 获取upload文件夹路径
		 */
		//模拟一个订单号
		String oId = "201808280001";
		
		//获取从前台传来的订单号
		//String oId = (String) request.getAttribute("oId");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("USER");
		if(user == null) {
			//用户需要登录,跳转到登录页面
			request.getRequestDispatcher("/reception/pay.jsp").forward(request, response);
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
	public void orderConfirm(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		//获取此订单详情,将之插入到数据库中
		List<OrderDetails> orderDetails = (List<OrderDetails>) session.getAttribute("OrderDetailsInfo");
		
		//跳转页面,并显示信息.
		try {
			request.getRequestDispatcher("/reception/pay.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
