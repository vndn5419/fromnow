package global.sesoc.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.dao.FavoriteRepository;
import global.sesoc.dao.MemberRepository;
import global.sesoc.dao.ProjectRepository;
import global.sesoc.dao.ReplyRepository;
import global.sesoc.dao.RereplyRepository;
import global.sesoc.dao.SaleRepository;
import global.sesoc.dao.ShippingRepository;
import global.sesoc.util.CryptoCurrency;
import global.sesoc.util.Ipinfomation;
import global.sesoc.vo.Company;
import global.sesoc.vo.Coupon;
import global.sesoc.vo.Favorites;
import global.sesoc.vo.Project;
import global.sesoc.vo.Reply;
import global.sesoc.vo.Rereply;
import global.sesoc.vo.Sale;
import global.sesoc.vo.Shipping;
import global.sesoc.vo.Viewer;
import global.sesoc.vo.WebMember;

@Controller
public class ProjectController2 {

	int nonce;

	@Autowired
	ProjectRepository repository;

	@Autowired
	MemberRepository memberRepository;

	@Autowired
	ReplyRepository replyRepository;

	@Autowired
	RereplyRepository rereplyRepository;

	@Autowired
	ShippingRepository shippingRepository;

	@Autowired
	SaleRepository saleRepository;
	
	@Autowired
	FavoriteRepository favoriteRepository;

	@RequestMapping(value = "/showProjectImg", method = RequestMethod.GET)
	public String showprojectimg(int project_num, HttpServletResponse response) {
		String filename = null;

		Project project = new Project();
		System.out.println(project_num);
		project = repository.selectOneproject(project_num);
		filename = project.getProject_coverImage();

		String fullpath = System.getProperty("user.home") + "/Cryptokick" + filename;

		System.out.println(fullpath);

		// stream을 통해 실제 다운로드 실시

		FileInputStream file = null;
		ServletOutputStream fileout = null;

		try {
			file = new FileInputStream(fullpath);
			fileout = response.getOutputStream();

			FileCopyUtils.copy(file, fileout);

			file.close();
			fileout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// return null, 화면전환이 없음.
		return null;
	}

	@RequestMapping(value = "/showCompanyImg", method = RequestMethod.GET)
	public String showprojectimg(String co_id, HttpServletResponse response) {
		String filename = null;

		Company company = new Company();
		company.setCo_id(co_id);
		company = memberRepository.selectOneCompany(company);
		filename = company.getCo_image();

		String fullpath = System.getProperty("user.home") + "/Cryptokick" + filename;

		System.out.println(fullpath);

		// stream을 통해 실제 다운로드 실시

		FileInputStream file = null;
		ServletOutputStream fileout = null;

		try {
			file = new FileInputStream(fullpath);
			fileout = response.getOutputStream();

			FileCopyUtils.copy(file, fileout);

			file.close();
			fileout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// return null, 화면전환이 없음.
		return null;
	}

	// Project 객체 1개 읽어오기
	@RequestMapping(value = "/detailedProject1", method = RequestMethod.GET)
	public String detailedProject1(int project_num, Model model, HttpSession session) {
		System.out.println(project_num);

		Project project = repository.selectOneproject(project_num);

		String line = "";
		String projectcontent = "";

		try {
			// BufferedReader로 파일 읽어오기
			FileReader fr = new FileReader(project.getProject_content());
			BufferedReader br = new BufferedReader(fr);

			while ((line = br.readLine()) != null) {
				projectcontent += line;
			}
			br.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		project.setProject_content(projectcontent);

		Company company = new Company();
		company.setCo_id(project.getCo_id());

		company = memberRepository.selectOneCompany(company);

		model.addAttribute("company", company);
		model.addAttribute("project", project);

		System.out.println("detailed1" + company);

		List<Shipping> shippingList;
		shippingList = shippingRepository.selectShipping(project_num);
		if (shippingList == null) { // shipping정보가 존재하지 않을 때 빈 shippingList 객체 생성
			shippingList = new ArrayList<>();
		}

		model.addAttribute("shippingList", shippingList);
		System.out.println("shippingList 정보 : " + shippingList);

		double random = Math.random();

		nonce = (int) (random * 1000000000);

		String userid = (String) session.getAttribute("userid");
		Sale coupon = new Sale();
		coupon.setUserid(userid);
		coupon.setProject_num(project_num);
		List<Coupon> couponCheck = saleRepository.selectCoupon(coupon);
		model.addAttribute("couponCheck", couponCheck);
		
		Favorites favorites = new Favorites();
		favorites.setProject_num(project_num);
		favorites.setUserid(userid);
		
		Favorites check = favoriteRepository.selectOne(favorites);
		
		if(check==null) {
			model.addAttribute("favorites", "noFavorite");
		} else if(check!=null) {
			model.addAttribute("favorites", "favorites");			
		}
		
		return "common/project/detailedProject";
	}

	@ResponseBody
	@RequestMapping(value = "replyAll", method = RequestMethod.GET)
	public Map<String, Object> replyAll(HttpSession session, int project_num) {
		String userid = (String) session.getAttribute("userid");

		Reply reply = new Reply();

		reply.setProject_num(project_num);

		ArrayList<Reply> replyList = new ArrayList<>();

		replyList = replyRepository.replyAll(reply);

		Rereply rereply = new Rereply();
		ArrayList<Rereply> rereplyList = new ArrayList<>();

		Map<String, Object> map = new HashMap<>();

		for (int i = 0; i < replyList.size(); i++) {
			rereply.setReply_num(replyList.get(i).getReply_num());
			if (rereplyRepository.rereplyAll(rereply).isEmpty()) {
				rereplyList.add(null);
			} else {
				rereply = rereplyRepository.rereplyAll(rereply).get(0);
				rereplyList.add(rereply);
			}
		}
		;
		map.put("replyList", replyList);
		map.put("rereplyList", rereplyList);
		System.out.println(rereplyList);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "addReply", method = RequestMethod.POST)
	public Map<String, Object> addReply(@RequestBody Reply reply, HttpSession session) {

		String userid = (String) session.getAttribute("userid");

		reply.setUserid(userid);
		System.out.println("새로운" + reply);

		ArrayList<Reply> replyList = new ArrayList<>();

		int result = replyRepository.insertReply(reply);

		if (result == 0) {
			System.out.println("추가안됨");
			return null;
		}
		System.out.println("추가됨");
		replyList = replyRepository.replyAll(reply);

		Rereply rereply = new Rereply();
		ArrayList<Rereply> rereplyList = new ArrayList<>();

		Map<String, Object> map = new HashMap<>();

		for (int i = 0; i < replyList.size(); i++) {
			rereply.setReply_num(replyList.get(i).getReply_num());
			if (rereplyRepository.rereplyAll(rereply).isEmpty()) {
				rereplyList.add(null);
			} else {
				rereply = rereplyRepository.rereplyAll(rereply).get(0);
				rereplyList.add(rereply);
			}
			// rereply = rereplyRepository.rereplyAll(rereply).get(0);
			// if(rereply==null) {
			// rereplyList.add(null);
			// }
			// if(rereply!= null) {
			// rereplyList.add(rereply);
			// }
		}
		;
		map.put("replyList", replyList);
		map.put("rereplyList", rereplyList);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "addRereply", method = RequestMethod.POST)
	public Map<String, Object> addRereply(@RequestBody Rereply rereply, HttpSession session) {

		String userid = (String) session.getAttribute("userid");

		rereply.setCo_id("aaa");
		System.out.println("새로운" + rereply);

		System.out.println(rereply);
		int result = rereplyRepository.insertRereply(rereply);

		if (result == 0) {
			System.out.println("추가안됨");
			return null;
		}
		Reply reply = new Reply();
		reply.setProject_num(rereply.getProject_num());
		ArrayList<Reply> replyList = new ArrayList<>();
		ArrayList<Rereply> rereplyList = new ArrayList<>();
		System.out.println("추가됨");
		replyList = replyRepository.replyAll(reply);

		Map<String, Object> map = new HashMap<>();

		for (int i = 0; i < replyList.size(); i++) {
			rereply.setReply_num(replyList.get(i).getReply_num());
			if (rereplyRepository.rereplyAll(rereply).isEmpty()) {
				rereplyList.add(null);
			} else {
				rereply = rereplyRepository.rereplyAll(rereply).get(0);
				rereplyList.add(rereply);
			}
			// rereply = rereplyRepository.rereplyAll(rereply).get(0);
			// if(rereply==null) {
			// rereplyList.add(null);
			// }
			// if(rereply!= null) {
			// rereplyList.add(rereply);
			// }
		}
		;
		map.put("replyList", replyList);
		map.put("rereplyList", rereplyList);

		System.out.println(rereplyList);

		return map;
	}

	List<Coupon> couponList = null;
	int start = 0;
	int project_number = 0;

	// 잠재적 투자자(viwer) DB에 insert + Coupon select
	@ResponseBody
	@RequestMapping(value = "insertViewer", method = RequestMethod.GET)
	public int insertViewer(int project_num, HttpSession session) {
			String userid = (String) session.getAttribute("userid");
			Ipinfomation ipinfo = new Ipinfomation();
			Viewer viewer = new Viewer();

			viewer = ipinfo.login();
			viewer.setUserid(userid);
			viewer.setProject_num(project_num);

			repository.insertViewer(viewer);
			start = 1;
			project_number = project_num;

		couponList = repository.selectAllCoupon(project_num);
		// for(int i = 0; i<couponList.size(); i++) {
		// codeList.add(couponList.get(i).getCoupon_code()+"");
		// }
		// System.out.println(codeList.size());
		//
		if (couponList.size() < 1) {
			return 0;
		}
		return 1;
	}

	@RequestMapping(value = "getHash", method = RequestMethod.GET)
	public void getHash2(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException, InterruptedException {
		String userid = (String) session.getAttribute("userid");
		response.setContentType("text/event-stream");
		response.setCharacterEncoding("UTF-8");

		while (true) {

			PrintWriter printwriter = null;
			if (nonce % 10000 == 0) {
				printwriter = response.getWriter();
				printwriter.print("data: " + nonce / 10000 + "\n\n");
				response.flushBuffer();

			}
			String answer = CryptoCurrency.getHash(nonce + "");
			for (int i = 0; i < couponList.size(); i++) {
				if (answer.substring(0, (couponList.get(i).getCoupon_code() + "").length())
						.equals(couponList.get(i).getCoupon_code() + "")) {
					Coupon coupon = new Coupon();
					coupon.setCoupon_num(couponList.get(i).getCoupon_num());
					coupon.setUserid(userid);
					int result = repository.updateUserCoupon(coupon);
					printwriter = response.getWriter();
					printwriter
							.print("data:" + "Congratulations" + couponList.get(i).getCoupon_discountrate() + "\n\n");
					response.flushBuffer();
					couponList.remove(i);
					return;
				}

			}
			nonce++;
		}
	}

	@RequestMapping(value = "/myProjectsList", method = RequestMethod.GET)
	public String myProjectsList(String co_id, Model model, HttpSession session) {
		System.out.println(co_id);
		ArrayList<Project> myProject = repository.myProjectsList(co_id);
		Company company = new Company();
		company.setCo_id(co_id);
		Company result = memberRepository.selectOneCompany(company);

		model.addAttribute("myProject", myProject);
		model.addAttribute("company", result);

		return "company/project/myProjectsList";
	}

	@RequestMapping(value = "/anotherdetailedProject", method = RequestMethod.GET)
	public String anotherdetailedProject(int project_num, Model model, HttpSession session) {

		String userid = (String) session.getAttribute("userid");
		Ipinfomation ipinfo = new Ipinfomation();
		Viewer viewer = new Viewer();
		viewer = ipinfo.login();
		viewer.setUserid(userid);
		viewer.setProject_num(project_num);

		/*System.out.println(userid);
		System.out.println(viewer.getViewer_cityinfo());
		System.out.println(viewer.getViewer_ipinfo());
		*/Project project = repository.selectOneproject(project_num);

		WebMember mem = new WebMember();
		mem.setUserid(userid);
		WebMember result = memberRepository.selectOne(mem);

		if (result != null) {
			System.out.println("여기들어옴");
			repository.insertViewer(viewer);
		}
		;

		String line = "";
		String projectcontent = "";

		try {
			// BufferedReader로 파일 읽어오기
			FileReader fr = new FileReader(project.getProject_content());
			BufferedReader br = new BufferedReader(fr);

			while ((line = br.readLine()) != null) {
				projectcontent += line;
			}
			br.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		project.setProject_content(projectcontent);

		Company company = new Company();
		company.setCo_id(project.getCo_id());

		company = memberRepository.selectOneCompany(company);

		model.addAttribute("company", company);
		model.addAttribute("project", project);

		System.out.println("detailed1" + company);

		List<Shipping> shippingList;
		shippingList = shippingRepository.selectShipping(project_num);
		if (shippingList == null) { // shipping정보가 존재하지 않을 때 빈 shippingList 객체 생성
			shippingList = new ArrayList<>();
		}

		model.addAttribute("shippingList", shippingList);
		System.out.println("shippingList 정보 : " + shippingList);

		double random = Math.random();

		int nonce = 1;

		return "common/project/anotherdetailedProject";
	}

}
