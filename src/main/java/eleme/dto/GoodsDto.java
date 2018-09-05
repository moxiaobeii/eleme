package eleme.dto;

public class GoodsDto {
	
	private int gid;  //商品id
	private String bname;  //商家名称
	private String gname;  //商品名称
	private double price;  //商品价格
	private double shop_evaluation;  //商品评价
	private int months_amount;  //月销售量
	private String pimage;  //图片地址
	private int gtid;   //分类id
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getShop_evaluation() {
		return shop_evaluation;
	}
	public void setShop_evaluation(double shop_evaluation) {
		this.shop_evaluation = shop_evaluation;
	}
	public int getMonths_amount() {
		return months_amount;
	}
	public void setMonths_amount(int months_amount) {
		this.months_amount = months_amount;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getGtid() {
		return gtid;
	}
	public void setGtid(int gtid) {
		this.gtid = gtid;
	}
	
	
	
}
