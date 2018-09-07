package eleme.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import eleme.dao.EvaluationDao;
import eleme.dto.EvaluationData;
import eleme.dto.EvaluationDto;
import eleme.entity.Evaluation;
import eleme.service.EvaluationService;

public class EvaluationServiceImpl implements EvaluationService {

	/**
	 * 添加评价
	 */
	public void addEvaluation(EvaluationData evaluationData) {
		EvaluationDao evaluationDao = new EvaluationDao();
		// 将评价插入到评价表中
		Evaluation evaluation = new Evaluation();
		evaluation.setService_evaluation(evaluationData.getServiceNum());
		evaluation.setService_content(evaluationData.getTexterea());
		evaluation.setFeeding_speed(evaluationData.getSpeedTime());
		evaluation.setGood_evaluation(evaluationData.getAllfood());
		evaluation.setOid(evaluationData.getOid());
		evaluation.setBname(evaluationData.getBname());
		evaluation.setUsername(evaluationData.getUsername());
		Date evalDate = new Date();
		
		evaluationDao.addEvaluation(evaluation,evalDate.toLocaleString());

	}
	
	/**
	 * 获得商家的所有评价
	 */
	public List<EvaluationDto> getShopEval(String shopName) {
		EvaluationDao evaluationDao = new EvaluationDao();
		List<Evaluation> evaluations = evaluationDao.getShopEval(shopName);
		List<EvaluationDto> evaluationDtos = new ArrayList<EvaluationDto>();
		for (Evaluation evaluation : evaluations) {
			String oid = evaluation.getOid();
			List<String> gnames = evaluationDao.getGname(oid);
			EvaluationDto evaluationDto = new EvaluationDto();
			evaluationDto.setEvaluation(evaluation);
			evaluationDto.setGname(gnames);
			evaluationDtos.add(evaluationDto);
		}
		
		return evaluationDtos;
	}
	/**
	 * 获得商家满意的评价
	 * @param shopName
	 */
	public List<EvaluationDto> getSatisfaction(String shopName) {
		EvaluationDao evaluationDao = new EvaluationDao();
		List<Evaluation> evaluations = evaluationDao.getSatisfaction(shopName);
		List<EvaluationDto> evaluationDtos = new ArrayList<EvaluationDto>();
		for (Evaluation evaluation : evaluations) {
			String oid = evaluation.getOid();
			List<String> gnames = evaluationDao.getGname(oid);
			EvaluationDto evaluationDto = new EvaluationDto();
			evaluationDto.setEvaluation(evaluation);
			evaluationDto.setGname(gnames);
			evaluationDtos.add(evaluationDto);
		}
		
		return evaluationDtos;
	}
	
	/**
	 * 获得商家不满意的评价
	 * @param shopName
	 */
	public List<EvaluationDto> getNoSatisfaction(String shopName) {
		EvaluationDao evaluationDao = new EvaluationDao();
		List<Evaluation> evaluations = evaluationDao.getNoSatisfaction(shopName);
		List<EvaluationDto> evaluationDtos = new ArrayList<EvaluationDto>();
		for (Evaluation evaluation : evaluations) {
			String oid = evaluation.getOid();
			List<String> gnames = evaluationDao.getGname(oid);
			EvaluationDto evaluationDto = new EvaluationDto();
			evaluationDto.setEvaluation(evaluation);
			evaluationDto.setGname(gnames);
			evaluationDtos.add(evaluationDto);
		}
		
		return evaluationDtos;
	}
	
	
}
