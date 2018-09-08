package eleme.controller;

import com.google.gson.Gson;
import eleme.dto.BusinessDto;
import eleme.entity.Business;
import eleme.entity.Cart;
import eleme.entity.Goods;
import eleme.entity.GoodsType;
import eleme.service.BusinessService;
import eleme.service.impl.BusinessServiceImpl;
import eleme.utils.JedisPoolUtils;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/business")
public class BusinessController extends BaseServlet {

	//获得商家基本信息
	public void getBusinessInfo(HttpServletRequest request, HttpServletResponse response) {

		//获取商家的id
		int bid = Integer.parseInt(request.getParameter("bid"));

		//设置商家的id为当前id
		Jedis jedis = JedisPoolUtils.getJedis();
		jedis.set("current_bid", String.valueOf(bid));

		BusinessService service = new BusinessServiceImpl();

		//查询该商家的所有信息
		Business business = service.getBusinessInfo(bid);

		//查询该商家的所有商品分类
		List<GoodsType> goodsTypes = service.getGoodsType(bid);

		//查询该商家的所有分类下的所有商品
		List<BusinessDto> businessDtos = service.getBusinessDtos(business.getBname(), bid);

		//查询购物车的信息
		Cart cart = service.show(String.valueOf(bid));

		request.setAttribute("business", business);
		request.setAttribute("goodsTypes", goodsTypes);
		request.setAttribute("businessDtos", businessDtos);
		request.setAttribute("cart", cart);
		try {
			request.getRequestDispatcher("/reception/seller-content.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//添加购物车并返回购物车的信息
	public void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String gid = request.getParameter("gid");
		String bid = request.getParameter("bid");
		//返回购物车的信息
		BusinessService service = new BusinessServiceImpl();
		Cart cart = service.getCart(bid, gid);
		System.out.println(cart.getTotalMoney() + ":" + cart.getTotalCount());
		Iterator iterator = cart.getMap().keySet().iterator();
		while (iterator.hasNext()) {
			Integer key = (Integer) iterator.next();
			System.out.println(cart.getMap().get(key).getSubCount() + ":" + cart.getMap().get(key).getSubTotal() + ":" + cart.getMap().get(key).getGoods().getGname());
		}
		//格式化购物车
		Gson gson = new Gson();
		String cartJson = gson.toJson(cart);
		//购物车数据回写
		PrintWriter out = response.getWriter();
		out.write(cartJson);
	}

	//更新购物车商品
	public void updateGoods(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		String gid = request.getParameter("gid");
		String bid = request.getParameter("bid");

		//商品小计
		double subTotal = Double.parseDouble(request.getParameter("subTotal"));
		//单个商品数量
		int subCount = Integer.parseInt(request.getParameter("subCount"));
		//总价格
		double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
		//总数量
		int totalCount = Integer.parseInt(request.getParameter("totalCount"));

		BusinessService service = new BusinessServiceImpl();
		service.updateGoods(gid, bid,subTotal,subCount,totalCount,totalMoney);
	}

	//清除购物车
	public void deleteGoods(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String bid = request.getParameter("bid");

		BusinessService service = new BusinessServiceImpl();
		service.deleteGoods(bid);
	}

	//商品评价
	public void getEvaluation(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		//获取商家的id
		int bid = Integer.parseInt(request.getParameter("bid"));

		//设置商家的id为当前id
		Jedis jedis = JedisPoolUtils.getJedis();
		jedis.set("current_bid", String.valueOf(bid));

		BusinessService service = new BusinessServiceImpl();

		//查询该商家的所有信息
		Business business = service.getBusinessInfo(bid);

		request.setAttribute("business",business);
		request.getRequestDispatcher("/reception/seller-evaluation.jsp").forward(request,response);

	}

	//搜索框
	public void search(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		String bname = request.getParameter("bname");
		String search = request.getParameter("searchVal");

		BusinessService service = new BusinessServiceImpl();
		List<Goods> goodsList = null;
		if (search == null || "".equals(search)){
			//查询所有
			goodsList = service.getAllGoods(bname);
		}else {
			//模糊查询
			goodsList = service.getGoodsBySearchVal(bname,search);
		}

		Gson gson = new Gson();
		String goods = gson.toJson(goodsList);

		PrintWriter out = response.getWriter();
		out.print(goods);
	}

	//获得购物车的信息
	public void getCart(HttpServletRequest request,HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		BusinessService service = new BusinessServiceImpl();
		Cart cart = service.getCartByBid();
		Gson gson = new Gson();
		
		String current_cart = null;
		
		if (cart != null) {
			current_cart = gson.toJson(cart);
		}
		System.out.println(current_cart);
		PrintWriter writer = response.getWriter();
		writer.print(current_cart);
	}

}

