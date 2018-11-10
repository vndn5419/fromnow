package global.sesoc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Shipping;

@Repository
public class ShippingRepository{
	
	@Autowired
	SqlSession session;
	
	//Shipping DB insert
	public int insertShipping(Shipping shipping) {
		ShippingMapper mapper = session.getMapper(ShippingMapper.class);
		int result = mapper.insertShipping(shipping);
				
		return result;
	}
	
	//Shipping DB insert
	public List<Shipping> selectShipping(int project_num) {
		ShippingMapper mapper = session.getMapper(ShippingMapper.class);
		List<Shipping> result;
		result = mapper.selectShipping(project_num);
				
		return result;
	}
	
	
}
