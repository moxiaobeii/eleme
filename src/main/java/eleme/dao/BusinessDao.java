package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import javax.management.Query;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.dto.BusinessDto;
import eleme.dto.GoodsDto;
import eleme.entity.Business;
import eleme.entity.Consignee;
import eleme.entity.Goods;
import eleme.entity.GoodsType;
import eleme.entity.User;
import eleme.utils.DataSourceUtils;

public class BusinessDao {

	public Business getBusinessInfo(int bid) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from business where bid = ?";
		Business business = null;
		try {
			business = runner.query(sql,new BeanHandler<Business>(Business.class),bid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return business;
	}
	
	public List<GoodsType> getGoodsType(int bid) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from goods_type where bid = ?";
		List<GoodsType> goodsType = null;
		try {
			goodsType = runner.query(sql, new BeanListHandler<GoodsType>(GoodsType.class),bid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsType;
	}
	
	public List<GoodsDto> getGoodsDto(String bname) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from goods where bname = ?";
		List<GoodsDto> goodsDtos = null;
		try {
			goodsDtos = runner.query(sql, new BeanListHandler<GoodsDto>(GoodsDto.class),bname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsDtos;
	}
	
	

	//获得商品的信息
	public Goods getGoods(int gid) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from goods where gid = ?";
		Goods goods = null;
		try {
			goods = runner.query(sql, new BeanHandler<Goods>(Goods.class),gid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goods;
	}
	
	public static void main(String[] args) {
		BusinessDao businessDao = new BusinessDao();
		List<GoodsDto> goodsDtos = businessDao.getGoodsDto("麦德乐炸鸡汉堡");
		for(GoodsDto goodsDto:goodsDtos) {
			System.out.println(goodsDto.getGid());
		}
		
	}
	
}
