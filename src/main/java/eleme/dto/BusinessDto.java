package eleme.dto;

import java.util.List;

import eleme.entity.Goods;

public class BusinessDto {
	
	private String explain;  //商品分类说明
	
	private String gtname;   //商品分类
	
	private List<GoodsDto> goods;  //所有商品
	
	

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getGtname() {
		return gtname;
	}

	public void setGtname(String gtname) {
		this.gtname = gtname;
	}

	public List<GoodsDto> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodsDto> goods) {
		this.goods = goods;
	}
	
	
}
