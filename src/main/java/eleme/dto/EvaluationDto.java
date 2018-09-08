package eleme.dto;
/**
 * 包装评价和评价对应的商品名字
 * @author wu
 *
 */

import java.util.List;

import eleme.entity.Evaluation;

public class EvaluationDto {
	private Evaluation evaluation;
	private List<String> gname;
	public Evaluation getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(Evaluation evaluation) {
		this.evaluation = evaluation;
	}
	public List<String> getGname() {
		return gname;
	}
	public void setGname(List<String> gname) {
		this.gname = gname;
	}
	
}
