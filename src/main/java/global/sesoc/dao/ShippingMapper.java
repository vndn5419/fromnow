package global.sesoc.dao;

import java.util.List;

import global.sesoc.vo.Shipping;

public interface ShippingMapper {
	
	//Shipping 정보 DB insert
	public int insertShipping(Shipping shipping);
	
	//Shipping 정보 project_num으로 select
	public List<Shipping> selectShipping(int project_num);
}
