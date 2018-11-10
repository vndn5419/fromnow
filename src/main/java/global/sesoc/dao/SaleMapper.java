package global.sesoc.dao;


import java.util.List;

import global.sesoc.vo.Analysis;
import global.sesoc.vo.Coupon;
import global.sesoc.vo.Sale;

public interface SaleMapper {
	
    public int insertSale(Sale sale);

    public List<Sale> saleSelect(String userid);
	
    public List<Sale> soldByDate(Sale sale);

    public List<Sale> soldByGender(Sale sale);

    public List<Sale> soldByAge(Sale sale);
	
    public List<Sale> soldByCountries(Sale sale);
	
    public Sale soldPerPerson(Sale sale);

    public List<Sale> soldByDateInCountry(Sale sale);
	
    public List<Sale> soldByGenderInCountry(Sale sale);
	
    public List<Sale> soldByAgeInCountry(Sale sale);
	
    public Sale soldPerPersonInCountry(Sale sale);
	
    public List<Sale> viewedByGender(Sale sale);

    public List<Sale> viewedByAge(Sale sale);
	
    public List<Sale> viewedByCountries(Sale sale);

    public List<Sale> viewedByDate(Sale sale);
	
    public List<Sale> viewedByGenderInCountry(Sale sale);

    public List<Sale> viewedByAgeInCountry(Sale sale);
	
    public List<Sale> viewedByDateInCountry(Sale sale);

	public Sale selectOneOrder(int sale_num);

	public List<Coupon> selectCoupon(Sale sale);

	public List<Sale> buyerSelect(int product_num);

	public List<Coupon> myCouponSelect(String userid);

	public int updateCoupon(int coupon_num);

	public Analysis InvestorAnalysis(int project_num);

	public Analysis PotentialInvestorAnalysis(int project_num);
	
}