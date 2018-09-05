package eleme.entity;

/**
 * 商家分类实体类
 * @author momo
 *
 */
public class Category {
	
	private int cid;   //商家分类id
	private String c_name;   //分类名称
	private String tid;  //上下级id
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}

}
