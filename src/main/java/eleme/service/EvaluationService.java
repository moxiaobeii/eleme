package eleme.service;

import java.util.List;

import eleme.dto.EvaluationData;
import eleme.dto.EvaluationDto;
import eleme.entity.Evaluation;

public interface EvaluationService {
	
	/**
	 * 将评价数据插入表中
	 * @param evaluationData
	 */
	public void addEvaluation(EvaluationData evaluationData);
	
	/**
	 * 获得商店的所有评价
	 * @param shopName
	 */
	public List<EvaluationDto> getShopEval(String shopName);
	
	/**
	 * 获得商家满意的评价
	 * @param shopName
	 * @return
	 */
	public List<EvaluationDto> getSatisfaction(String shopName);
	
	/**
	 * 获得商家不满意的评价
	 * @param shopName
	 * @return
	 */
	public List<EvaluationDto> getNoSatisfaction(String shopName);
	
	/**
	 * 
	 * @param oid
	 * @return
	 */
	public String getEval(String oid);
}
