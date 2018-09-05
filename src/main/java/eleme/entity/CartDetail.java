package eleme.entity;

public class CartDetail {
	private Goods goods;
	private int subCount;   //购买的数量
	private double subTotal;  //商品小计
	
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public int getSubCount() {
		return subCount;
	}
	public void setSubCount(int subCount) {
		this.subCount = subCount;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	@Override
	public String toString() {
		return "CartDetail [goods=" + goods + ", subCount=" + subCount + ", subTotal=" + subTotal + "]";
	}
	

}
