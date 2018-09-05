package eleme.entity;

import java.util.Map;

public class Cart {
	
	//该购物车中存储的n个购物项
	private Map<Integer, CartDetail> map;
	
	//总价格
	private double totalMoney;
	
	//总数量
	private int totalCount;

	
	public Map<Integer, CartDetail> getMap() {
		return map;
	}

	public void setMap(Map<Integer, CartDetail> map) {
		this.map = map;
	}

	public double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "Cart [map=" + map + ", totalMoney=" + totalMoney + ", totalCount=" + totalCount + "]";
	}
	
	
}
