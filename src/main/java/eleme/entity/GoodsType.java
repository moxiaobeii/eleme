package eleme.entity;

/**
 * 商品类型实体类
 * @author momo
 *
 */
public class GoodsType {
	
	private int gtid;  //商品类型id
	private String gtname;  //商品类型名称
	private String explain;  //类型说明
	private Business business;  //商家
	
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	
	public int getGtid() {
		return gtid;
	}
	public void setGtid(int gtid) {
		this.gtid = gtid;
	}
	public String getGtname() {
		return gtname;
	}
	public void setGtname(String gtname) {
		this.gtname = gtname;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	
	
}
