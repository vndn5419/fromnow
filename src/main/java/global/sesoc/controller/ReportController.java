package global.sesoc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.dao.SaleRepository;
import global.sesoc.vo.Analysis;
import global.sesoc.vo.Sale;
import global.sesoc.vo.Viewer;

@Controller
public class ReportController {
   
   @Autowired
   SaleRepository repository;
   
   @RequestMapping(value = "/getReport", method = RequestMethod.GET)
   public String contact(int project_num, Model model) {
      System.out.println("contact page");
      
      Sale sale = new Sale();
      sale.setProject_num(project_num);
		
      model.addAttribute("project_num", sale.getProject_num());
      
      System.out.println(model.toString());
      
      Analysis investorAnalysis = repository.InvestorAnalysis(project_num);
      System.out.println("Controller" + investorAnalysis);
      
      if(investorAnalysis!=null) {
    	  investorAnalysis.setBest_gender(investorAnalysis.getBest_gender().replace("a", "e"));	
      }
      model.addAttribute("analysis", investorAnalysis);
  
      Analysis potentialInvestorAnalysis = repository.PotentialInvestorAnalysis(project_num);
      System.out.println("Controller" + potentialInvestorAnalysis);
     
      if(potentialInvestorAnalysis!=null) {
    	  potentialInvestorAnalysis.setBest_gender(potentialInvestorAnalysis.getBest_gender().replace("a", "e"));	
      }
      model.addAttribute("potentialAnalysis", potentialInvestorAnalysis);
     
     
      return "company/consumerReport";
   }
	
   @ResponseBody
	@RequestMapping(value = "startPage", method = RequestMethod.GET)
	public Map<String, Object> startPage(Sale sale) {
		
		List<Sale> soldByCountriesList = repository.soldByCountries(sale);

		Map<String, Object> map = new HashMap();
	      String temp = "";
	   
	      for (int i = 0; i < soldByCountriesList.size(); i++) {
	          if(soldByCountriesList.get(i).getUserid() != null) {
	             System.out.println("나라:"+soldByCountriesList.get(i).getUserid());
	             temp = soldByCountriesList.get(i).getUserid();
	             map.put(temp, soldByCountriesList.get(i).getUserid());
	          }
	          System.out.println(soldByCountriesList.get(i).getSale_country());
	       }
		
		List<Sale> soldByDate = repository.soldByDate(sale);
		
		map.put("m", soldByDate);

		List<Sale> soldByAgeList = repository.soldByAge(sale);
		System.out.println("     "+soldByAgeList);
		map.put("a", soldByAgeList);
		
		List<Sale> soldByGenderList = repository.soldByGender(sale);
		
		map.put("s", soldByGenderList);
		
		Sale soldPerPerson = repository.soldPerPerson(sale);
		
		map.put("p", soldPerPerson);
		
		System.out.println(soldPerPerson);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "startPage1", method = RequestMethod.GET)
	public Map<String, Object> startPage1(Sale sale) {
		System.out.println("여기는 오냐?");
		List<Sale> soldByCountriesList = repository.soldByCountries(sale);

		Map<String, Object> map = new HashMap();
	      String temp = "";
	   
	      for (int i = 0; i < soldByCountriesList.size(); i++) {
	          if(soldByCountriesList.get(i).getUserid() != null) {
	             System.out.println("나라:"+soldByCountriesList.get(i).getUserid());
	             temp = soldByCountriesList.get(i).getUserid();
	             map.put(temp, soldByCountriesList.get(i).getUserid());
	          }
	          System.out.println(soldByCountriesList.get(i).getSale_country());
	       }
		
		List<Sale> soldByDate = repository.soldByDate(sale);
		
		map.put("m", soldByDate);

		List<Sale> soldByAgeList = repository.soldByAge(sale);
		System.out.println("     "+soldByAgeList);
		map.put("a", soldByAgeList);
		
		List<Sale> soldByGenderList = repository.soldByGender(sale);
		
		map.put("s", soldByGenderList);
		
		Sale soldPerPerson = repository.soldPerPerson(sale);
		
		map.put("p", soldPerPerson);
		
		System.out.println(soldPerPerson);
		
		return map;
	}
	
   
   @ResponseBody
   @RequestMapping(value = "/countryReport", method = RequestMethod.POST)
   public Map<String, Object> countryReport(@RequestBody Sale sale) {
      
      /*System.out.println("나라이름 : " + data.getProject_num());*/
      
      Map<String, Object> map = new HashMap();
      
		List<Sale> soldByDateInCountry = repository.soldByDateInCountry(sale);
		
		map.put("m", soldByDateInCountry);
		
		List<Sale> soldByAgeListInCountry = repository.soldByAgeInCountry(sale);
		System.out.println("Age =" + soldByAgeListInCountry);
		map.put("a", soldByAgeListInCountry);
		
		List<Sale> soldByGenderListInCountry = repository.soldByGenderInCountry(sale);
		
		map.put("s", soldByGenderListInCountry);
		
		System.out.println(soldByGenderListInCountry);
		
		Sale soldPerPersonInCountry = repository.soldPerPersonInCountry(sale);
		
		map.put("p", soldPerPersonInCountry);
		
		System.out.println("per Person =" + soldPerPersonInCountry);
		
      
      return map;
   }
   
   @ResponseBody
   @RequestMapping(value = "/countryReport1", method = RequestMethod.POST)
   public Map<String, Object> countryReport1(@RequestBody Sale sale) {
      
      /*System.out.println("나라이름 : " + data.getProject_num());*/
      
      Map<String, Object> map = new HashMap();
      
		List<Sale> viewedByDateInCountry = repository.viewedByDateInCountry(sale);
		
		map.put("m", viewedByDateInCountry);
		
		List<Sale> viewedByAgeListInCountry = repository.viewedByAgeInCountry(sale);
		System.out.println("Age =" + viewedByAgeListInCountry);
		map.put("a", viewedByAgeListInCountry);
		
		List<Sale> viewedByGenderListInCountry = repository.viewedByGenderInCountry(sale);
		
		map.put("s", viewedByGenderListInCountry);
		
		System.out.println(viewedByGenderListInCountry);
		
      return map;
   }
   
   @ResponseBody
	@RequestMapping(value = "viewedStat", method = RequestMethod.GET)
	public Map<String, Object> viewedStat(Sale sale) {
		
		System.out.println("Sale =" + sale);
		
		
		List<Sale> viewedByCountriesList = repository.viewedByCountries(sale);

		Map<String, Object> map = new HashMap();
	      String temp = "";
	   
	      for (int i = 0; i < viewedByCountriesList.size(); i++) {
	          if(viewedByCountriesList.get(i).getUserid() != null) {
	             System.out.println("viewed 나라:"+viewedByCountriesList.get(i).getUserid());
	             temp = viewedByCountriesList.get(i).getUserid();
	             map.put(temp, viewedByCountriesList.get(i).getUserid());
	          }
	       }
		
		
		List<Sale> viewedByGenderList = repository.viewedByGender(sale);
		
		map.put("s", viewedByGenderList);
		
		System.out.println(viewedByGenderList);
		
		List<Sale> viewedByAgeList = repository.viewedByAge(sale);
		System.out.println("     "+viewedByAgeList);
		map.put("a", viewedByAgeList);
		
		List<Sale> viewedByDate = repository.viewedByDate(sale);
		
		map.put("m", viewedByDate);
		System.out.println("resp HAS NO PROB");
		return map;
	}

}