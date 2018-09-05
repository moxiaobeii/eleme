package eleme.entity;

import java.util.List;

public class BusinessGoods {
	private int bid;   // '商家id',
	private String bname;    // '商家名称',
	private double evaluation_score;   // '评价分数',
	private int distribution_time;   //'配送时间',
	private List<Goods> goods;   //'配送时间',
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
	public int getDistribution_time() {
		return distribution_time;
	}
	public void setDistribution_time(int distribution_time) {
		this.distribution_time = distribution_time;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	
	
}
