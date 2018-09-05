package eleme.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import eleme.entity.Business;
import eleme.entity.BusinessGoods;
import eleme.entity.Goods;
import eleme.service.IndexService;

@WebServlet("/indexServlet")
public class IndexServlet extends BaseServlet{	
	//实例化service层
	IndexService indexService = new IndexService();
	//首先拿到全部商家的信息再去访问index.jsp首页
	public void index(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		//拿到全部商家信息
		List<Business> listIndex = indexService.indexOut("0");
		request.setAttribute("LISTINDEX", listIndex);
		try {
			request.getRequestDispatcher("/reception/index.jsp").forward(request, response);
		} catch (ServletException e) {
//			e.printStackTrace();
		} catch (IOException e) {
//			e.printStackTrace();
		}
		
	}
	
	//大导航栏
	public void indexOut(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		//首页按商家类别显示商家的功能
		//通过index-NavigationBar-out资源拿到当前点击的大导航栏中是第几个节点的索引值
		String indexT = request.getParameter("indexT");
		//把大导航栏选中的索引值传到IndexService层
		List<Business> listIndex = indexService.indexOut(indexT);
		if(listIndex !=null) {
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson(listIndex);
			try {
				PrintWriter out = response.getWriter();
				out.println(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			//说明是空的（返回一个空的json对象给前台）
			//将查询到的商家菜式集合转换为json对象，并传递回前台
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson("");
			try {
				PrintWriter out = response.getWriter();
				out.println("");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//小导航栏
	public void indexIn(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		//首页按商家类别显示商家的功能
		//通过index-NavigationBar-out资源拿到当前点击的大导航栏中是第几个节点的索引值
		String indexT = request.getParameter("indexT");
		String indexB = request.getParameter("indexB");
		//把大导航栏选中的索引值传到IndexService层
		List<Business> listIndex = indexService.indexIn(indexT, indexB);
		if(listIndex !=null) {
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson(listIndex);
			try {
				PrintWriter out = response.getWriter();
				out.println(json);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			//说明是空的（返回一个空的json对象给前台）
			//将查询到的商家菜式集合转换为json对象，并传递回前台
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson("");
			try {
				PrintWriter out = response.getWriter();
				out.println("");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//通过搜索框查询商家菜式信息
	public void indexSearch(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		//拿到要搜索的值
		String searchValue = request.getParameter("searchValue").trim();
		if(!"".equals(searchValue)) {
			//传到SearchService层
			List<BusinessGoods> listIndexSearch = indexService.indexSearch(searchValue);
//			for(BusinessGoods list:listIndexSearch) {
//				System.out.println(list.getBname());
//				for(Goods listGood:list.getGoods()) {
//					System.out.println(listGood.getGname());
//				}
//			}
			
			//将查询到的商家菜式集合转换为json对象，并传递回前台
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson(listIndexSearch);
			try {
				PrintWriter out = response.getWriter();
				out.println(json);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			//说明是空的（返回一个空的json对象给前台）
			//将查询到的商家菜式集合转换为json对象，并传递回前台
			//因为前端页面只能接字符串，所以只能把字符串方式返回过去（可以转换为json对象）
			//创建Gson对象
			Gson indexJson = new Gson();
			//将集合转换为JSON对象（序列化）
			String json = indexJson.toJson("");
			try {
				PrintWriter out = response.getWriter();
				out.println("");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
