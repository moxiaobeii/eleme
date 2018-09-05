package eleme.service;

import java.sql.SQLException;
import java.util.List;

import eleme.entity.Consignee;

public interface OrderService {

	public List<Consignee> queryConsigneeById(int userId)throws SQLException;

}
