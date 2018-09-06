package eleme.service;


import eleme.dto.BusinessDto;
import eleme.entity.Business;
import eleme.entity.Cart;
import eleme.entity.Goods;
import eleme.entity.GoodsType;

import java.util.List;

public interface BusinessService {

	//获得商家所有信息
	public Business getBusinessInfo(int bid);

	public List<GoodsType> getGoodsType(int bid);

	public List<BusinessDto> getBusinessDtos(String bname, int bid);

	public Cart getCart(String bid, String gid);

    public Cart show(String bid);

	public void updateGoods(String gid, String bid,double subTotal,int subCount,int totalCount,double totalMoney);

	public void deleteGoods(String bid);

    public List<Goods> getAllGoods(String bname);

	public List<Goods> getGoodsBySearchVal(String bname,String search);
}
