package eleme.entity;

import org.omg.CORBA.PRIVATE_MEMBER;

/**
 * 商家实体类
 * @author momo
 *
 */
public class Business {
	
	private int bid;   // '商家id',
	private String bname;    // '商家名称',
	private double evaluation_score;   // '评价分数',
	private int months_amount;     // '月销售量',
	private int offer_price;        //'起送价格',
	private int distribution_fee;   //'配送费',
	private int distribution_time;   //'配送时间',
	private String  category;   //'商家品类',
	private long telphone;    //'商家手机',
	private String business_hour;    //'营业时间',
	private String address;    //'商家地址',
	private double service_evaluation;    //'服务评价',
	private double good_evaluation;    //'菜品评价',
	private String logo;    //'商家logo',
    private int collection;    //'收藏  0:没收藏  1:收藏',
    
    private Category cate;
    

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public double getEvaluation_score() {
		return evaluation_score;
	}

	public void setEvaluation_score(double evaluation_score) {
		this.evaluation_score = evaluation_score;
	}

	public int getMonths_amount() {
		return months_amount;
	}

	public void setMonths_amount(int months_amount) {
		this.months_amount = months_amount;
	}

	public int getOffer_price() {
		return offer_price;
	}

	public void setOffer_price(int offer_price) {
		this.offer_price = offer_price;
	}

	public int getDistribution_fee() {
		return distribution_fee;
	}

	public void setDistribution_fee(int distribution_fee) {
		this.distribution_fee = distribution_fee;
	}

	public int getDistribution_time() {
		return distribution_time;
	}

	public void setDistribution_time(int distribution_time) {
		this.distribution_time = distribution_time;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getTelphone() {
		return telphone;
	}

	public void setTelphone(long telphone) {
		this.telphone = telphone;
	}

	public String getBusiness_hour() {
		return business_hour;
	}

	public void setBusiness_hour(String business_hour) {
		this.business_hour = business_hour;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getService_evaluation() {
		return service_evaluation;
	}

	public void setService_evaluation(double service_evaluation) {
		this.service_evaluation = service_evaluation;
	}

	public double getGood_evaluation() {
		return good_evaluation;
	}

	public void setGood_evaluation(double good_evaluation) {
		this.good_evaluation = good_evaluation;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public int getCollection() {
		return collection;
	}

	public void setCollection(int collection) {
		this.collection = collection;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}
    
    
    
}
