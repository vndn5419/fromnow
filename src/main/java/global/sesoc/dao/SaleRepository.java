package global.sesoc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Analysis;
import global.sesoc.vo.Coupon;
import global.sesoc.vo.Sale;

@Repository
public class SaleRepository {

	@Autowired
	SqlSession session;

	public int insertSale(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		int result = mapper.insertSale(sale);

		return result;
	}

	public List<Sale> saleSelect(String userid) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> sale = mapper.saleSelect(userid);

		return sale;
	}

	public List<Sale> soldByDate(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByDate(sale);

		return saleList;
	}

	public List<Sale> soldByGender(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByGender(sale);

		return saleList;
	}

	public List<Sale> soldByAge(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByAge(sale);
		System.out.println(saleList);
		return saleList;
	}

	public List<Sale> soldByCountries(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByCountries(sale);

		return saleList;
	}

	public Sale soldPerPerson(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		Sale result = mapper.soldPerPerson(sale);

		return result;
	}

	public List<Sale> soldByDateInCountry(Sale sale) {
		System.out.println("reposi =" + sale);
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByDateInCountry(sale);

		System.out.println("reposi =" + saleList);
		return saleList;
	}

	public List<Sale> soldByGenderInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByGenderInCountry(sale);

		return saleList;
	}

	public List<Sale> soldByAgeInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.soldByAgeInCountry(sale);
		System.out.println(saleList);
		return saleList;
	}

	public Sale soldPerPersonInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		Sale result = mapper.soldPerPersonInCountry(sale);

		return result;
	}

	public List<Sale> viewedByGender(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByGender(sale);

		return saleList;
	}

	public List<Sale> viewedByCountries(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByCountries(sale);
		System.out.println("repository " + saleList);

		return saleList;
	}

	public List<Sale> viewedByAge(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByAge(sale);
		System.out.println(saleList);
		return saleList;
	}

	public List<Sale> viewedByDate(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByDate(sale);

		return saleList;
	}

	public List<Sale> viewedByGenderInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByGenderInCountry(sale);

		return saleList;
	}

	public List<Sale> viewedByAgeInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByAgeInCountry(sale);
		System.out.println(saleList);
		return saleList;
	}

	public List<Sale> viewedByDateInCountry(Sale sale) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> saleList = mapper.viewedByDateInCountry(sale);

		return saleList;
	}

	public Sale selectOneOrder(int sale_num) {
		System.out.println("resp" + sale_num);
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		Sale sale = mapper.selectOneOrder(sale_num);
		System.out.println("레파지토리 세일넘 : " + sale_num);

		return sale;
	}

	public List<Coupon> selectCoupon(Sale sale) {

		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Coupon> coupon = mapper.selectCoupon(sale);

		return coupon;
	}

	public List<Sale> buyerSelect(int product_num) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Sale> sale = mapper.buyerSelect(product_num);
		return sale;
	}

	public List<Coupon> myCouponSelect(String userid) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		List<Coupon> coupon = mapper.myCouponSelect(userid);

		return coupon;
	}

	public int updateCoupon(int coupon_num) {

		SaleMapper mapper = session.getMapper(SaleMapper.class);
		int result = mapper.updateCoupon(coupon_num);

		return result;
	}
	
	public Analysis InvestorAnalysis(int project_num) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		Analysis investorAnalysis = mapper.InvestorAnalysis(project_num);
		System.out.println("repository " + investorAnalysis);
		
		return investorAnalysis;
	}
	
	public Analysis PotentialInvestorAnalysis(int project_num) {
		SaleMapper mapper = session.getMapper(SaleMapper.class);
		Analysis PotentialInvestorAnalysis = mapper.PotentialInvestorAnalysis(project_num);
		return PotentialInvestorAnalysis;
	}	
}