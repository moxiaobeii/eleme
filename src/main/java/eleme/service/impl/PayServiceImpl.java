package eleme.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alipay.api.AlipayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.ServerResponse;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;

import eleme.dao.PayDao;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.service.PayService;

public class PayServiceImpl implements PayService{
	
	//创建一个日志对象
    private static Log log = LogFactory.getLog(PayServiceImpl.class);
	
	/**
	 * 支付的方法
	 * 获得订单号,用户id,二维码路径
	 * @return 
	 */
	public static ServerResponse pay(String oId,int userId,String path) {
		//把订单号和二维码的url返回给前端,用map集合来装
		Map<String,String> resultMap = new HashMap<String,String>();
		try {
			//通过订单号和用户id来查询订单信息
			Orders order = PayDao.getPayDao().queryOrderByUserIdAndOderId(oId,userId);
			if(order ==null) {
				System.out.println("用户没有该订单");
				//跳转
			}
			resultMap.put("orderId", order.getOid());
			
			
			//通过订单信息生成支付的二维码信息

			// (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
	        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
	        String outTradeNo = order.getOid();

	        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
	        String subject = new StringBuilder().append("饿了么门店扫码支付,订单号:").append(outTradeNo).toString();

	        // (必填) 订单总金额，单位为元，不能超过1亿元
	        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
	        String totalAmount = String.valueOf(order.getTotal_price());

	        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
	        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
	        String undiscountableAmount = "0";

	        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
	        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
	        String sellerId = "";

	        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
	        String body = new StringBuilder().append("订单").append(outTradeNo).append("购买商品共").append(totalAmount).append("元").toString();

	        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
	        String operatorId = "test_operator_id";

	        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
	        String storeId = "test_store_id";

	        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
	        ExtendParams extendParams = new ExtendParams();
	        extendParams.setSysServiceProviderId("2088100200300400500");

	        // 支付超时，定义为15分钟
	        String timeoutExpress = "15m";

	        // 商品明细列表，需填写购买商品详细信息，
	        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();
	        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
	        
	        //通过订单号查询订单明细表
	        List<OrderDetails> orderDetails = PayDao.getPayDao().queryOrderDetailsByOrderId(outTradeNo);
	        //将查询出来的订单商品信息设置进去
	        // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
	        // 创建好一个商品后添加至商品明细列表
	        for(OrderDetails OrderDetail : orderDetails) {
		        GoodsDetail goods = GoodsDetail.newInstance(OrderDetail.getCart_id(), OrderDetail.getGname(),(long)OrderDetail.getGood_evaluation()*100, OrderDetail.getCount());
		        goodsDetailList.add(goods);

	        }

	        
	        // 创建扫码支付请求builder，设置请求参数
	        AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder()
	            .setSubject(subject).setTotalAmount(totalAmount).setOutTradeNo(outTradeNo)
	            .setUndiscountableAmount(undiscountableAmount).setSellerId(sellerId).setBody(body)
	            .setOperatorId(operatorId).setStoreId(storeId).setExtendParams(extendParams)
	            .setTimeoutExpress(timeoutExpress)
	            //回调地址
	            .setNotifyUrl("http://luoshaocong.s1.natapp.cc/eleme/payServlet?method=alipayCallback")//支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
	            .setGoodsDetailList(goodsDetailList);

	        /** 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
	         *  Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
	         */
	        Configs.init("zfbinfo.properties");

	        /** 使用Configs提供的默认参数
	         *  AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
	         */
	        AlipayTradeService tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();
	        
	        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
	        switch (result.getTradeStatus()) {
	            case SUCCESS:
	                log.info("支付宝预下单成功: )");

	                AlipayTradePrecreateResponse response = result.getResponse();
	                dumpResponse(response);

	                //判断upload路径是否存在
	                File folder = new File(path);
	                if(!folder.exists()) {
	                	folder.setWritable(true);
	                	folder.mkdirs();
	                }
	                // 需要修改为运行机器上的路径
	                //创建二维码的路径
	                String qrPath = String.format(path+"/qr-%s.png",response.getOutTradeNo());
	                //创建二维码的文件名
	                String qrFileName = String.format("qr-%s.png", response.getOutTradeNo());
	                //根据路径生成二维码
	                ZxingUtils.getQRCodeImge(response.getQrCode(), 256, qrPath);
	                //生成目标文件(路径加文件名)
	                File targetFile = new File(path,qrFileName);
	                //将目标二维码上传到服务器
	                //.........
	                //将生成的二维码路径放入结果集
	                resultMap.put("qrPath", qrPath);
	                resultMap.put("qrFileName", qrFileName);
	                log.info("qrPath:" + qrPath);
	                //                ZxingUtils.getQRCodeImge(response.getQrCode(), 256, filePath);
	                //将集合信息返回
	                return ServerResponse.createBySuccess(resultMap);

	            case FAILED:
	                log.error("支付宝预下单失败!!!");
	                return ServerResponse.createByErrorMessage("支付宝预下单失败!!!");

	            case UNKNOWN:
	                log.error("系统异常，预下单状态未知!!!");
	                return ServerResponse.createByErrorMessage("系统异常，预下单状态未知!!!");

	            default:
	                log.error("不支持的交易状态，交易返回异常!!!");
	                return ServerResponse.createByErrorMessage("不支持的交易状态，交易返回异常!!!");
	        }
	        
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return ServerResponse.createByErrorMessage("不支持的交易状态，交易返回异常!!!");

	}
	
	
	//检查订单的交易状态,第二个支付宝回调的接口,,,,,写在另一个servlet里.实现页面跳转
	public static ServerResponse aliCallback(Map<String,String> params) {
		//获得订单号,交易号,订单状态
		String oId = params.get("out_trade_no");
		String tradeNo = params.get("trade_no");
		String tradeStatus = params.get("trade_status");
		//对数据库查询此订单,并进行判断
		try {
			Orders order = PayDao.getPayDao().queryOrderByOderId(oId);
			if(order ==null) {
				System.out.println("非此商城订单");
				return ServerResponse.createByErrorMessage("非此商城订单");
			}
			if(order.getOrder_status() == 2) {	
				System.out.println("订单已支付,支付宝重复调用");
				return ServerResponse.createBySuccess("订单已支付,支付宝重复调用");
			}
			if("TRADE_SUCCESS".equals(tradeStatus)) {	//支付完成
				order.setOrder_status(2);
				//更新订单状态进数据库
				System.out.println("更新订单状态");
				PayDao.getPayDao().updateOrderByorderId(order);
				//跳转页面
				
			}
			return ServerResponse.createBySuccess();
			
		} catch (SQLException e) {
			log.error("查询订单失败");
			e.printStackTrace();
		}
		return ServerResponse.createBySuccess();
	}
	
	
	//查询该订单是否支付成功
	public static ServerResponse<Boolean> queryOrderPayStatus(int userId,String oid) {
		try {
			//对数据库进行查询此订单
			Orders order = PayDao.getPayDao().queryOrderByUserIdAndOderId(oid, userId);
			if(order == null) {
				return ServerResponse.createByErrorMessage("用户没有该订单");	
			}
			if(order.getOrder_status() == 2) {	//判断此订单是否支付成功
				return ServerResponse.createBySuccess();
			}
			return ServerResponse.createByError();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		ServerResponse serverResponse =  ServerResponse.createByError();
		if(serverResponse.isSuccess()) {
			return ServerResponse.createBySuccess(true);
		}
		return ServerResponse.createBySuccess(false);
	}
	

	  // 简单打印应答
    private static void dumpResponse(AlipayResponse response) {
        if (response != null) {
            log.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
            if (StringUtils.isNotEmpty(response.getSubCode())) {
                log.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(),
                    response.getSubMsg()));
            }
            log.info("body:" + response.getBody());
        }
    }
    

}
