package eleme.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import eleme.dao.BusinessDao;
import eleme.dto.BusinessDto;
import eleme.dto.GoodsDto;
import eleme.entity.*;
import eleme.service.BusinessService;
import eleme.utils.JedisPoolUtils;
import redis.clients.jedis.Jedis;

import java.lang.reflect.Type;
import java.util.*;

public class BusinessServiceImpl implements BusinessService {

	public Business getBusinessInfo(int bid) {
		BusinessDao dao = new BusinessDao();
		Business business = dao.getBusinessInfo(bid);
		return business;
	}

	public List<GoodsType> getGoodsType(int bid) {
		BusinessDao dao = new BusinessDao();
		List<GoodsType> goodsTypes = dao.getGoodsType(bid);
		return goodsTypes;
		
	}

	//查询所有分类以及每个分类下的商品
	public List<BusinessDto> getBusinessDtos(String bname, int bid) {
		
		BusinessDao dao = new BusinessDao();
		
		//获得所有的分类
		List<GoodsType> goodsTypes = dao.getGoodsType(bid);
		//获得所有的商品
		List<GoodsDto> goodsDtos = dao.getGoodsDto(bname);
		
		//返回每个分类下的所有商品
		List<BusinessDto> businessDtos = new ArrayList<BusinessDto>();

		for(GoodsType goodsType : goodsTypes) {
			BusinessDto businessDto = new BusinessDto();
			List<GoodsDto> goodsDtos2 = new ArrayList<GoodsDto>();
			businessDto.setGtname(goodsType.getGtname());
			businessDto.setExplain(goodsType.getExplain());
			for(GoodsDto goodsDto : goodsDtos) {		
				if (goodsType.getGtid() == goodsDto.getGtid()) {
					goodsDtos2.add(goodsDto);
				}
			}
			businessDto.setGoods(goodsDtos2);
			businessDtos.add(businessDto);
		}
		return businessDtos;
	}

	/**
	 * 获得购物的信息
	 * bid:商家id
	 * gid:商品id
	 */
	public Cart getCart(String bid1, String gid1) {
		
		int gid = Integer.parseInt(gid1);
		
		//调用服务层
		BusinessDao dao = new BusinessDao();
		
		Jedis jedis = JedisPoolUtils.getJedis();
		//获得商家id
		String current_bid = jedis.get("current_bid");
		
		//判断是不是当前商家id
		if (!current_bid.equals(bid1)) {
			//如果不是，就修改为当前商家id
			jedis.set("current_bid", bid1);
		}
		
		//1、判断购物车是否存在
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType(); 
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		//获取该商家下该商品的信息
		Goods goods = dao.getGoods(gid);
		//1.1  如果购物车不存在（第一次添加该商家商品）
		if (carts==null||"".equals(carts)) {
			Map<String, Cart> cMap = new HashMap<String, Cart>();
			//封装cartDetails
			CartDetail cartDetail = new CartDetail();
			cartDetail.setGoods(goods);
			cartDetail.setSubCount(1);
			cartDetail.setSubTotal(goods.getPrice());
			
			//将订单详情放到订单中
			Cart cart = new Cart();
			cart.setTotalCount(cartDetail.getSubCount());
			cart.setTotalMoney(cartDetail.getSubTotal());
			Map<Integer, CartDetail> map = new HashMap<Integer, CartDetail>();
			map.put(gid, cartDetail);
			cart.setMap(map);
			cMap.put(bid1, cart);
			jedis.set("cart_item", gson.toJson(cMap, type));
			return cart;
		}else {
			//1.2 如果购物车存在
			//判断该商家的id是否存在
			//1.2.1 如果该商家的id存在
			if (carts.containsKey(bid1)) {
				Cart cart = carts.get(bid1);
				//判断该商品是否存在
				if (cart.getMap().containsKey(gid)) {
					CartDetail cartDetail = cart.getMap().get(gid);
					int newSubCount = cartDetail.getSubCount()+1;
					cartDetail.setSubCount(newSubCount);
					cartDetail.setSubTotal(cartDetail.getGoods().getPrice()*newSubCount);				
					cart.getMap().put(gid,cartDetail);
				}else {
					CartDetail cartDetail = new CartDetail();
					cartDetail.setGoods(goods);
					cartDetail.setSubCount(1);
					cartDetail.setSubTotal(goods.getPrice());
					cart.getMap().put(gid,cartDetail);
				}
				//遍历该商家的购物车，计算总数量和总价格
				Iterator iterator = cart.getMap().keySet().iterator();
				int newCount = 0;
				double newPrice = 0.0;
				while(iterator.hasNext()) {
					Integer key = (Integer)iterator.next();
					newPrice += cart.getMap().get(key).getSubTotal();
					newCount +=cart.getMap().get(key).getSubCount();
					cart.setTotalMoney(newPrice);
					cart.setTotalCount(newCount);
				}
				carts.put(bid1, cart);
				jedis.set("cart_item", gson.toJson(carts, type));
				return cart;
				
			}else {
				//该商家的id不存在
				Cart cart = new Cart();
				CartDetail cartDetail = new CartDetail();
				cartDetail.setGoods(goods);
				cartDetail.setSubTotal(goods.getPrice());
				cartDetail.setSubCount(1);
				Map<Integer, CartDetail> map = new HashMap<Integer, CartDetail>();
				map.put(gid, cartDetail);
				cart.setMap(map);
				cart.setTotalCount(cartDetail.getSubCount());
				cart.setTotalMoney(goods.getPrice());
				//遍历该商家的购物车，计算总数量和总价格
				Iterator iterator = cart.getMap().keySet().iterator();
				int newCount = 0;
				double newPrice = 0.0;
				while(iterator.hasNext()) {
					Integer key = (Integer)iterator.next();
					newPrice += cart.getMap().get(key).getSubTotal();
					newCount +=cart.getMap().get(key).getSubCount();
					cart.setTotalMoney(newPrice);
					cart.setTotalCount(newCount);
				}
				carts.put(bid1, cart);
				jedis.set("cart_item", gson.toJson(carts, type));
				return cart;
			}
		}
	}

	//页面初始化的时候显示购物车
	public Cart show(String bid) {
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		if (carts != null){
			if (carts.containsKey(bid)){
				//如果商家的购物车存在
				Cart cart = carts.get(bid);
				return cart;
			}else {
				//如果商家的购物车不存在
				return null;
			}
		}else {
			return null;
		}
	}


	/**
	 * 更新购物车中商品
	 * @param gid
	 * @param bid
	 */
	public void updateGoods(String gid, String bid,double subTotal,int subCount,int totalCount,double totalMoney) {
		//获得购物车
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);

		//找到该商家的购物车
		Cart cart = carts.get(bid);
		//如果该购物车该商品数量为0，从购物车中去掉该商品
		if (subCount == 0){
			cart.getMap().remove(Integer.parseInt(gid));
		}else{
			CartDetail cartDetail = new CartDetail();
			cartDetail.setSubCount(subCount);
			cartDetail.setSubTotal(subTotal);
			cartDetail.setGoods(cart.getMap().get(Integer.parseInt(gid)).getGoods());

			cart.getMap().put(Integer.parseInt(gid),cartDetail);
		}
		cart.setTotalCount(totalCount);
		cart.setTotalMoney(totalMoney);
		carts.put(bid,cart);
		jedis.set("cart_item",gson.toJson(carts));
	}

	//清空购物车
	public void deleteGoods(String bid) {
		//先判断该商家的购物是否为空
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);
		if(carts!=null){
			carts.remove(bid);
		}
		jedis.set("cart_item",gson.toJson(carts));
	}

	public List<Goods> getAllGoods(String bname) {
		BusinessDao dao = new BusinessDao();
		List<Goods> goodsList = dao.getAllGoods(bname);
		return goodsList;
	}

	public List<Goods> getGoodsBySearchVal(String bname,String search) {
		BusinessDao dao = new BusinessDao();
		List<Goods> goodsList = dao.getGoodsBySearchVal(bname,search);
		return goodsList;
	}

	/**
	 * 根据当前商家bid获得购物车信息
	 * @return
	 */
	public Cart getCartByBid() {
		Jedis jedis = JedisPoolUtils.getJedis();
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Cart>>() {}.getType();
		Map<String, Cart> carts = gson.fromJson(jedis.get("cart_item"), type);

		String bid = jedis.get("current_bid");
		if (bid == null) {
			return null;
		}else {
			try {
				Cart cart = carts.get(bid);
				if (cart!=null){
					return cart;
				}else {
					return null;
				}
			}catch (Exception e) {
			}
			
		}
		return null;
		
	}

}
