package global.sesoc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.dao.ProjectRepository;
import global.sesoc.dao.SaleRepository;
import global.sesoc.util.ExchangeRateInformation;
import global.sesoc.vo.Coupon;
import global.sesoc.vo.Project;
import global.sesoc.vo.Sale;

@Controller
public class SaleController {

	@Autowired
	SaleRepository repository;
	@Autowired
	ProjectRepository prepository;

	int rownum;
	int count;
	int totalprice;
	String firstname;
	String lastname;
	String zipcode;
	String country;
	String city;
	String address1;
	String address2;
	String phone;
	String email;
	String productname;
	String userid;
	int sale_amount;
	int project_num;

	@RequestMapping(value = "/cartPage", method = RequestMethod.GET)
	public String cartPage() {

		return "member/sale/cartPage";
	}

	@ResponseBody
	@RequestMapping(value = "orderInfo", method = RequestMethod.POST)
	public String orderInfo(@RequestBody Sale sale) {
		totalprice = sale.getSale_totalprice();
		firstname = sale.getSale_firstname();
		lastname = sale.getSale_lastname();
		zipcode = sale.getSale_zipcode();
		country = sale.getSale_country();
		city = sale.getSale_city();
		address1 = sale.getSale_address1();
		address2 = sale.getSale_address2();
		phone = sale.getSale_phone();
		email = sale.getSale_email();
		sale_amount = sale.getSale_amount();
		project_num = sale.getProject_num();

		// productname= sale.get
		System.out.println(firstname);

		return address1;
	}

	   @RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	   public String orderComplete(Model model, HttpSession session, int coupon_num) {
	      userid = (String) session.getAttribute("userid");
	      Sale sale = new Sale();
	      sale.setSale_totalprice(totalprice);
	      sale.setSale_firstname(firstname);
	      sale.setSale_lastname(lastname);
	      sale.setSale_zipcode(zipcode);
	      sale.setSale_country(country);
	      sale.setSale_city(city);
	      sale.setSale_address1(address1);
	      sale.setSale_address2(address2);
	      sale.setSale_phone(phone);
	      sale.setSale_email(email);
	      sale.setSale_amount(sale_amount);
	      sale.setUserid(userid);
	      sale.setProject_num(project_num); 
	      
	      prepository.purchasedProject(sale);
	      
	      SimpleDateFormat formatter = new SimpleDateFormat ( "YYYY-MM-dd", Locale.KOREA );
	      Date currentTime = new Date ( );
	      String dTime = formatter.format ( currentTime );
	      
	      System.out.println(sale);
	      
	      int result = repository.insertSale(sale);
	      
	      if(coupon_num != 0) {
	    	  System.out.println(coupon_num);
	    	  repository.updateCoupon(coupon_num);
	      }
	      
	      if(result > 0) {
	    	  sale.setSale_date(dTime);
	    	  model.addAttribute("sale", sale);
	    	  Project result_project = prepository.selectOneproject(sale.getProject_num());
	    	  model.addAttribute("project", result_project);
	      }

	      return "member/sale/orderComplete";
	   }

	@RequestMapping(value = "/paymentPage", method = RequestMethod.GET)
	public String paymentPage(Model model, int project_num, int sale_amount, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		System.out.println("페이먼트페이지 플젝넘:" + project_num);
		ExchangeRateInformation test1 = new ExchangeRateInformation();
		double currency = test1.exchange();

		Project project = prepository.selectOneproject(project_num);
		Sale couponSale = new Sale();
		couponSale.setUserid(userid);
		couponSale.setProject_num(project_num);

		List<Coupon> coupon = repository.selectCoupon(couponSale);

		model.addAttribute("project", project);
		model.addAttribute("currency", currency);
		model.addAttribute("coupon", coupon);
		model.addAttribute("amount", sale_amount);

		return "member/sale/paymentPage";
	}

	/*
	 * @RequestMapping(value="/favoritePage", method=RequestMethod.GET) public
	 * String favoritePage() {
	 * 
	 * 
	 * 
	 * 
	 * return "member/sale/favoritePage"; }
	 */

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String saleSelect(String userid, Model model) {
		
		System.out.println("userid : " + userid);
		List<Sale> sale = repository.saleSelect(userid);
		System.out.println("sale : " + sale);
		model.addAttribute("sale", sale);
		
		return "member/sale/orderList";
	}

	// 개인 오더정보
	@RequestMapping(value = "/commonOrderInfo", method = RequestMethod.GET)
	public String commonOrderInfo(Model model, int sale_num, HttpSession session) {

		Sale sale = new Sale();
		System.out.println("세일넘버" + sale_num);
		sale = repository.selectOneOrder(sale_num);
		model.addAttribute("sale", sale);

		return "member/sale/orderInfo";
	}
	
	// 상품별 구매자 리스트 불러오기
	@RequestMapping(value = "/buyerList", method = RequestMethod.GET)
	public String buyerList(Model model, int project_num) {

		List<Sale> buyerList = repository.buyerSelect(project_num);
		model.addAttribute("buyerList", buyerList);

		Project project = prepository.selectOneproject(project_num);
		model.addAttribute("project", project);

		System.out.println("바이어리스트 :" + buyerList);

		return "member/sale/buyerList";
	}
	
	// member 개인의 쿠폰함 
	@RequestMapping(value = "/myCoupon", method = RequestMethod.GET)
	public String myCoupon(Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		// Sale couponSale = new Sale();
		// couponSale.setUserid("teacher");
		// couponSale.setProject_num(project_num);
		List<Project> plist = prepository.selectTitle();
		List<Coupon> coupon = repository.myCouponSelect(userid);

		System.out.println(plist);

		model.addAttribute("coupon", coupon);
		model.addAttribute("project", plist);
		
		System.out.println("와타시노 쿠폰리스트 : "+coupon);
		
		return "member/sale/myCoupon";
	}

	
}