package eleme.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import eleme.dto.EvaluationData;
import eleme.dto.EvaluationDto;
import eleme.service.EvaluationService;
import eleme.service.impl.EvaluationServiceImpl;
import net.sf.json.JSONObject;



@WebServlet("/evaluationServlet")
public class EvaluationServlet extends BaseServlet{
	

	public void getEvaluation(HttpServletRequest req,HttpServletResponse resp) {
		resp.setContentType("text/html;charset=utf-8");
			
		 //获得订单评价传来的参数
		String  eval = req.getParameter("eval");
		System.out.println(eval);
		JSONObject jsonobject = JSONObject.fromObject(eval);
		EvaluationData evaluationData  = (EvaluationData) JSONObject.toBean(jsonobject, EvaluationData.class);
		EvaluationService evaluationServiceImpl = new EvaluationServiceImpl();
		evaluationServiceImpl.addEvaluation(evaluationData);
	}
	
	public void getShopEvaluation(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获得参数店名
		String shopName = req.getParameter("shopName");
		System.out.println(shopName);
		EvaluationService evaluationServiceImpl = new EvaluationServiceImpl();
		List<EvaluationDto> shopEval = evaluationServiceImpl.getShopEval(shopName);
		Gson gson = new Gson();
		String evaluationsJson = gson.toJson(shopEval);
		System.out.println(evaluationsJson);
		out.print(evaluationsJson);
	}
	/**
	 * 获得商家的满意评价
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	public void getSatisfaction(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获得参数店名
		String shopName = req.getParameter("shopName");
		System.out.println(shopName);
		EvaluationService evaluationServiceImpl = new EvaluationServiceImpl();
		List<EvaluationDto> satisfaction = evaluationServiceImpl.getSatisfaction(shopName);
		Gson gson = new Gson();
		String evaluationsJson = gson.toJson(satisfaction);
		System.out.println(evaluationsJson);
		out.print(evaluationsJson);
	}
	
	/**
	 * 获得商家的满意评价
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	public void getNoSatisfaction(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获得参数店名
		String shopName = req.getParameter("shopName");
		System.out.println(shopName);
		EvaluationService evaluationServiceImpl = new EvaluationServiceImpl();
		List<EvaluationDto> noSatisfaction = evaluationServiceImpl.getNoSatisfaction(shopName);
		Gson gson = new Gson();
		String evaluationsJson = gson.toJson(noSatisfaction);
		System.out.println(evaluationsJson);
		out.print(evaluationsJson);
	}
	
	/**
	 * 判断该订单是否以评价过
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	public void getEval(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String oid = req.getParameter("oid");
		EvaluationService evaluationServiceImpl = new EvaluationServiceImpl();
		String eval = evaluationServiceImpl.getEval(oid);
		out.print(eval);
	}
}
