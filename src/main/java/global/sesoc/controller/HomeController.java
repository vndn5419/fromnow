package global.sesoc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.dao.MemberRepository;
import global.sesoc.dao.ProjectRepository;
import global.sesoc.vo.Project;
import global.sesoc.vo.WebMember;

@Controller
public class HomeController {
	
	@Autowired
	MemberRepository mrepository;
	@Autowired
	ProjectRepository repository;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		String category = (String) session.getAttribute("mCategory");
		System.out.println("session저장 category값 : " + category);
		//회원일 경우 추천상품 리스트
		if(category != null) {
			if(category.equals("member")) {
				WebMember member = new WebMember();
				String id = (String) session.getAttribute("userid");
				member.setUserid(id);
				WebMember result = mrepository.selectOne(member);
				System.out.println("현재 로그인중인 사용자 정보 : "+result);
				ArrayList<Project> recommendList = repository.recommendList(result);
				model.addAttribute("recommendList", recommendList);
				System.out.println("회원의 추천 리스트 : "+recommendList);
			}else{
				ArrayList<Project> bestList = repository.bestSellerList();
				model.addAttribute("bestList", bestList);
				System.out.println("베스트 상품 리스트 : " + bestList);
			} 
		} else {
			ArrayList<Project> bestList = repository.bestSellerList();
			model.addAttribute("bestList", bestList);
			System.out.println("베스트 상품 리스트 : " + bestList);			
		}
		return "home";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact() {
		
		return "contact";
	}
}
