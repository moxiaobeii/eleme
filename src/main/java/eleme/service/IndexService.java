package eleme.service;

import java.sql.SQLException;
import java.util.List;


import eleme.dao.IndexDao;
import eleme.entity.Business;
import eleme.entity.BusinessGoods;

public class IndexService {
	//实例化dao层
	IndexDao indexDao = new IndexDao();
	//大导航栏
	public List<Business> indexOut(String indexT){
		//业务逻辑：
		//1,判断大导航栏是点击了全部还是点击了指定的
		//2,查询能匹配出的商家信息
		List<Business> listIndex = null;
		int indexTI;
		if(indexT == null || "0".equals(indexT)) {
			//那么设置为0
			//indexTI = 0;
			//说明是显示全部商家信息
			try {
				listIndex = indexDao.indexAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			//说明大导航栏被点击过并且不是点击全部商家，那么就是要显示大导航栏特定索引值的全部商家信息
			indexTI = Integer.parseInt(indexT);
			try {
				listIndex = new IndexDao().indexMore(indexTI);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listIndex;
	}
	
	//小导航栏
	public List<Business> indexIn(String indexT, String indexB){
		//业务逻辑：
		//1,进来这里说明大导航栏不是点击显示全部商品(即非0非null)，而是选中了特定的选项
		//2,在指定大导航栏，判断小导航栏是否选中显示全部商品信息
		//3,查询能匹配出的商家信息
		List<Business> listIndex = null;
		int indexTI = Integer.parseInt(indexT);
		int indexBI;
		if(indexB == null || "0".equals(indexB)) {
			//那么设置为0
			indexBI = 0;
			//说明是显示指定大导航栏的全部商家信息
			try {
				listIndex = indexDao.indexMore(indexTI);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			//说明小导航栏被点击过并且不是点击全部商家，那么就是要显示大导航栏和小导航栏特定索引值的商家信息
			indexBI = Integer.parseInt(indexB);
			try {
				listIndex = new IndexDao().indexLess(indexTI, indexBI);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listIndex;
	}

	//搜索框查询商家菜式信息
	public List<BusinessGoods> indexSearch(String searchValue) {
		//业务逻辑：
		//1,拿到搜索框用户输入的字符串
		//2,将字符串与商家名字和菜式名字匹配
		//3,查询能匹配出的商家和菜式信息
		List<BusinessGoods> listIndexSearch = null;
		try {
			listIndexSearch = indexDao.indexSearch(searchValue);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listIndexSearch;
	}
	
	
}
