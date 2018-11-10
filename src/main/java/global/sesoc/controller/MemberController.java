package global.sesoc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.dao.MemberRepository;
import global.sesoc.util.FileService;
import global.sesoc.vo.Company;
import global.sesoc.vo.WebMember;

@Controller
public class MemberController {

	@Autowired
	MemberRepository repository;

	// 홈화면 가기
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String goHome() {

		return "redirect:/";	
	}

	// 일반회원가입 화면요청
	@RequestMapping(value = "/memberSignIn", method = RequestMethod.GET)
	public String memberSignIn() {

		return "member/memberSignIn";
	}

	// 일반회원 및 기업회원 선택 화면요청
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String signIn() {

		return "common/signIn";
	}

	// 기업회원란 화면요청
	@RequestMapping(value = "/companySignIn", method = RequestMethod.GET)
	public String companySignIn() {

		return "company/companySignIn";
	}

	// 일반회원 가입
	@RequestMapping(value = "/memberSignIn", method = RequestMethod.POST)
	public String memberSignIn(MultipartFile upload, WebMember member, HttpSession session) {
		String uploadPath = System.getProperty("user.home") + "/Cryptokick/imgs/member/profile";
		
		if (upload.getOriginalFilename() != "") {

			String savedfile = FileService.saveFile(upload, uploadPath);

			member.setImage("/imgs/member/profile/"+savedfile);

		}
		int result = repository.insertMember(member);

		System.out.println(result);

		return "redirect:/";
	}

	// 기업회원 가입
	@RequestMapping(value = "/companySignIn", method = RequestMethod.POST)
	public String companySignIn(MultipartFile upload, Company company, HttpSession session) {
		String uploadPath = System.getProperty("user.home") + "/Cryptokick/imgs/company/profile";
		
		if (upload.getOriginalFilename() != "") {

			String savedfile = FileService.saveFile(upload, uploadPath);

			company.setCo_image("/imgs/company/profile/"+savedfile);

		}

		int result = repository.insertCompany(company);
		if (result == 1) {
			session.setAttribute("co_id", company.getCo_id());

			System.out.println(session.getAttribute("co_id"));
		}
		System.out.println(company);

		return "redirect:/";
	}

	// 로그인 화면요청
	@RequestMapping(value = "/logIn", method = RequestMethod.GET)
	public String logIn(HttpSession session) {

		return "common/logIn";
	}

	// 로그인 처리요청
	@RequestMapping(value = "/memberLoginIn", method = RequestMethod.POST)
	public String memberLoginIn(WebMember member, HttpSession session) {
		// System.out.println("처리요청한 값"+member);
		WebMember m = repository.selectOne(member);
		if (m != null) {
			session.setAttribute("userid", m.getUserid());
			String id = (String) session.getAttribute("userid");
			
			session.setAttribute("username", m.getFirstname());
			session.setAttribute("lastname", m.getLastname());
			session.setAttribute("zipcode", m.getZipcode());
			session.setAttribute("country", m.getCountry());
			session.setAttribute("state", m.getProvince());
			session.setAttribute("city", m.getCity());
			session.setAttribute("address1", m.getAddress1());
			session.setAttribute("address2", m.getAddress2());
			session.setAttribute("email", m.getEmail());
			session.setAttribute("phone", m.getPhone());
			session.setAttribute("mCategory", "member");
			System.out.println(id);
			return "redirect:/";

		} else {
			return "common/logIn";
		}

	}

	// 기업회원 로그인
	@RequestMapping(value = "/companyLogIn", method = RequestMethod.POST)
	public String companyLogIn(Company company, HttpSession session) {
		System.out.println("처리요청한 값"+company);
		Company c = repository.selectOneCompany(company);
		System.out.println(c);
		if (c != null) {
			session.setAttribute("userid", c.getCo_id());
			session.setAttribute("username", c.getCo_name());
			session.setAttribute("mCategory", "company");
			return "redirect:/";
		} else {
			return "common/logIn";
		}
	}

	// admin 로그인처리
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(String userid, HttpSession session) {

		session.setAttribute("userid", userid);
		session.setAttribute("mCategory", "admin");
		String id = (String) session.getAttribute("userid");
		System.out.println(id);

		return "home";

	}

	// 로그아웃 요청
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}

	// 중복확인
	@RequestMapping(value = "duplicateCheck", method = RequestMethod.POST)
	public @ResponseBody Integer duplicateCheck(@RequestBody WebMember member) {
		WebMember m = repository.idCheck(member);

		if (m != null)
			return 1; // 사용 불가능한 아이디
		else
			return 0; // 사용 가능한 아이디
	}

	// 멤버 업데이트화면요청
	@RequestMapping(value = "/memberProfile", method = RequestMethod.GET)
	public String selectMemberInfo(HttpSession session, Model model) { // model은 일시적인 현상임.
		WebMember member = new WebMember();
		member.setUserid((String) session.getAttribute("userid"));

		WebMember member1 = repository.selectOne(member);

		String[] sList = null;

		if (member1.getHobby() != null) {
			sList = member1.getHobby().split(",");

		}
		String media = null;
		String food = null;
		String technology = null;
		String arts = null;
		String publishing = null;
		String performance = null;
		String fashion = null;
		String others = null;

		ArrayList<String> hobbies = new ArrayList<>();
		for (int i = 0; i < sList.length; i++) {
			System.out.println(sList[i]);

			switch (sList[i]) {
			case "Media":
				media = sList[i];
				break;

			case "Food":
				food = sList[i];
				break;

			case "Technology":
				technology = sList[i];
				break;

			case "Arts":
				arts = sList[i];
				break;

			case "Publishing":
				publishing = sList[i];
				break;

			case "Performance":
				performance = sList[i];
				break;

			case "Fashion":
				fashion = sList[i];
				break;

			case "Others":
				others = sList[i];
				break;

			}
			hobbies.add(sList[i]);
		}
		;

		model.addAttribute("member", member1);
		model.addAttribute("media", media);
		model.addAttribute("food", food);
		model.addAttribute("technology", technology);
		model.addAttribute("arts", arts);
		model.addAttribute("publishing", publishing);
		model.addAttribute("performance", performance);
		model.addAttribute("fashion", fashion);
		model.addAttribute("others", others);

		System.out.println(member1);
		return "member/memberProfile";
	}

	// 멤버 업데이트
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MultipartFile upload, HttpSession session, WebMember member) { // model은 일시적인 현상임.
		
		String uploadPath = System.getProperty("user.home") + "/Cryptokick/imgs/member/profile";
		
		String id = (String) session.getAttribute("userid");
		member.setUserid(id);
		if (upload.getOriginalFilename() != "") {

			String savedfile = FileService.saveFile(upload, uploadPath);

			member.setImage(savedfile);

		}

		System.out.println("아이디" + id);

		System.out.println(member);
		int result = repository.memberUpdate(member);

		return "redirect:/";
	}

	// 회사 업데이트화면요청
	@RequestMapping(value = "/companyProfile", method = RequestMethod.GET)
	public String selectCompanyInfo(HttpSession session, Model model) { // model은 일시적인 현상임.

		Company company = new Company();
		company.setCo_id((String) session.getAttribute("userid"));

		Company company1 = repository.selectOneCompany(company);

		model.addAttribute("company", company1);

		System.out.println(company1);
		return "company/companyUpdate";
	}

	// 회사정보 업데이트
	@RequestMapping(value = "/companyUpdate", method = RequestMethod.POST)
	public String companyUpdate(MultipartFile upload, HttpSession session, Company company) { // model은 일시적인 현상임.
		String uploadPath = System.getProperty("user.home") + "/Cryptokick/imgs/company/profile";
		
		String id = (String) session.getAttribute("userid");
		company.setCo_id(id);
		if (upload.getOriginalFilename() != "") {

			String savedfile = FileService.saveFile(upload, uploadPath);

			company.setCo_image(savedfile);

		}

		System.out.println("아이디" + id);

		System.out.println(company);
		int result = repository.companyUpdate(company);

		return "redirect:/";
	}

}