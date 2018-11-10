package global.sesoc.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.sesoc.dao.MemberRepository;
import global.sesoc.dao.ProjectRepository;
import global.sesoc.dao.ShippingRepository;
import global.sesoc.util.ExchangeRateInformation;
import global.sesoc.vo.Coupon;
import global.sesoc.vo.CreateProject;
import global.sesoc.vo.FileBean;
import global.sesoc.vo.Project;
import global.sesoc.vo.Sale;
import global.sesoc.vo.Shipping;
import global.sesoc.vo.WebMember;

@Controller
public class ProjectController {

	@Autowired
	ProjectRepository repository;
	@Autowired
	ShippingRepository srepository;
	@Autowired
	MemberRepository mrepository;

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
	String projectname;

	/*
	 * @RequestMapping(value = "/detailedProject", method = RequestMethod.GET)
	 * public String detailedProject() { System.out.println("여기까지옴.");
	 * 
	 * return "common/project/detailedProject"; }
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "getHash", method = RequestMethod.GET) public int
	 * getHash() { int nonce = 1;
	 * 
	 * while (true) {
	 * 
	 * if (nonce % 10000 == 0) { System.out.println("시도 : " + nonce);
	 * 
	 * }
	 * 
	 * if (CryptoCurrency.getHash(nonce + "").substring(0, 6).equals("000000")) {
	 * 
	 * System.out.println("정답: " + nonce);
	 * 
	 * return nonce;
	 * 
	 * }
	 * 
	 * nonce++; } }
	 */

	@RequestMapping(value = "/Projects", method = RequestMethod.GET)
	public String AllProjects(Project project, Model model, HttpSession session) {
		System.out.println(project);

		ArrayList<Project> plist = new ArrayList<>();

		project.setProject_num(0);

		model.addAttribute("category", project.getProject_category());

		if (project.getProject_category().equals("All")) {
			project.setProject_category(null);
		}

		if (project.getProject_content() == null) {
			project.setProject_content("Newest");
		}

		if (project.getProject_title() != null) {
			project.setProject_title(project.getProject_title().toLowerCase());
		}
		System.out.println(project);
		plist = repository.selectAll(project);
		System.out.println(plist);
		model.addAttribute("pList", plist);

		rownum = 9;
		count = 0;

		System.out.println(project.getProject_content());

		model.addAttribute("search", project.getProject_title());
		model.addAttribute("sort", project.getProject_content());

		String category = (String) session.getAttribute("mCategory");
		System.out.println("session저장 category값 : " + category);
		// 회원일 경우 추천상품 리스트
		if (category != null) {
			if (category.equals("member")) {
				WebMember member = new WebMember();
				String id = (String) session.getAttribute("userid");
				member.setUserid(id);
				WebMember result = mrepository.selectOne(member);
				System.out.println("현재 로그인중인 사용자 정보 : " + result);
				ArrayList<Project> recommendList = repository.recommendList(result);
				model.addAttribute("recommendList", recommendList);
				System.out.println("회원의 추천 리스트 : " + recommendList);
			}
		} else {
			ArrayList<Project> bestList = repository.bestSellerList();
			model.addAttribute("bestList", bestList);
			System.out.println("베스트 상품 리스트 : " + bestList);
		}

		return "common/project/projects";
	}

	@ResponseBody
	@RequestMapping(value = "/scrolldown", method = RequestMethod.GET)
	public ArrayList<Project> scrolldown(Project project) {
		System.out.println("scroll" + project);
		count++;

		if (project.getProject_category().equals("All")) {
			project.setProject_category(null);
		}

		if (project.getProject_content() == null) {
			project.setProject_content("Newest");
		}

		if (project.getProject_title() != null) {
			project.setProject_title(project.getProject_title().toLowerCase());
		}

		if (project.getProject_title() == "") {
			project.setProject_title(null);
		}

		project.setProject_num(rownum * count);
		ArrayList<Project> plist = new ArrayList<>();
		System.out.println(project);
		plist = repository.selectAll(project);
		System.out.println(plist);

		return plist;
	}

	// createProduct 페이지 요청
	@RequestMapping(value = "/createProject", method = RequestMethod.GET)
	public String createProjectForm() {

		return "company/project/createProject";
	}

	// createProject 등록 처리 요청
	@ResponseBody
	@RequestMapping(value = "/createProject", method = RequestMethod.POST)
	public Project createProject(@RequestBody CreateProject createProject, HttpSession session) throws Exception {
		System.out.println("컨트롤러 넘어온 값 : " + createProject);

		Project project = createProject.getProject();

		// Project content text파일 저장
		String projectcontent = project.getProject_content();
		String fileName = System.getProperty("user.home") + "/Cryptokick/text/" + project.getProject_title() + ".txt";

		File file = new File(System.getProperty("user.home") + "/Cryptokick/text");

		if (!file.exists()) {
			file.mkdirs();
		}

		try {
			// BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));

			// 파일안에 문자열 쓰기
			fw.write(projectcontent);
			fw.flush();

			// 객체 닫기
			fw.close();
			System.out.println("파일 쓰기 성공");

		} catch (Exception e) {
			e.getMessage();
		}
		project.setProject_content(fileName); // project 파일 content.txt 파일 저장 path
		project.setProject_checked("unchecked");

		String userid = (String)session.getAttribute("userid");
		
		project.setCo_id(userid); // project 파일 company id setting

		String temp = "/imgs/company/project/cover/" + project.getProject_coverImage();
		project.setProject_coverImage(temp);

		System.out.println("DB전달되기 전 project 값 : " + project);
		repository.insertProject(project);
		
		int project_num = project.getProject_num(); //insert한 프로젝트의 값을 다시 그대로 받아옴(select key를 통해서)
		
		List<Shipping> shippingList = createProject.getShippingList();

		if (shippingList.size() != 0) {
			for (int i = 0; i < shippingList.size(); i++) {
				shippingList.get(i).setProject_num(project_num);
				srepository.insertShipping(shippingList.get(i));
			}
		}

		return project;
	}

	// createProject 등록 처리 요청
	@ResponseBody
	@RequestMapping(value = "/coverImage", method = RequestMethod.POST)
	public String coverImage(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		Iterator<String> fileNameList = request.getFileNames();

		MultipartFile file = request.getFile(fileNameList.next());
		System.out.println("커버이미지명 : " + file.getOriginalFilename());
		String filePath = System.getProperty("user.home") + "/Cryptokick/imgs/company/project/cover/"
				+ file.getOriginalFilename();
		File tempfile = new File(filePath);
		// log.info(root_path + attach_path + filename);
		file.transferTo(tempfile);
		// System.out.println("파일 : "+myFile.getOriginalFilename());
		System.out.println("return되는 파일 : " + filePath);
		String fileName = file.getOriginalFilename();
		String fileUrl = "getCover/" + fileName;

		return fileUrl;
	}

	@RequestMapping(value = "/getCover/{fileName:.+}", method = RequestMethod.GET)
	public void getCover(@PathVariable("fileName") String fileName, HttpServletResponse response) throws Exception {
		String filePath = System.getProperty("user.home") + "/Cryptokick/imgs/company/project/cover/" + fileName;

		File f = new File(filePath);

		FileInputStream fis = new FileInputStream(f);

		FileCopyUtils.copy(fis, response.getOutputStream());
	}

	// ckeditor 첨부 이미지 등록
	@RequestMapping("/ckeditorImageUpload")
	public void procFileUpload(FileBean fileBean, HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {
		System.out.println("이미지업로드 upload : " + fileBean.getUpload());
		System.out.println("이미지업로드 upload : " + fileBean.getUpload().getOriginalFilename());
		String tempname = fileBean.getUpload().getOriginalFilename();
		String fileExtension = tempname.substring(tempname.lastIndexOf(".") + 1);
		System.out.println("업로드 파일 확장자 : " + fileExtension);
		String errorMsg = "Allow only image file(jpg, jpeg, gif, png)";
		if (!(fileExtension.equals("jpg") || fileExtension.equals("jpeg") || fileExtension.equals("gif")
				|| fileExtension.equals("png"))) {
			String msg = "{\"uploaded\": 0, \"fileName\": \"" + tempname + "\", \"error\": {\"message\" : \"" + errorMsg
					+ "\"}}";
			PrintWriter imsi = null;
			imsi = response.getWriter();
			imsi.println(msg);
			imsi.flush();
		} else {

			HttpSession session = request.getSession();
			String root_path = session.getServletContext().getRealPath("/");
			String attach_path = "resources/uploadImage/";

			String filePath = System.getProperty("user.home") + "/Cryptokick/imgs/company/project/content/"
					+ fileBean.getUpload().getOriginalFilename();

			PrintWriter printWriter = null;

			MultipartFile upload = fileBean.getUpload();
			String fileName = "";
			String CKEditorFuncNum = "";

			if (upload != null) {
				fileName = upload.getOriginalFilename();
				fileBean.setFilename(fileName);
				CKEditorFuncNum = fileBean.getCKEditorFuncNum();
				try {
					File file = new File(filePath);
					// log.info(root_path + attach_path + filename);
					upload.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			printWriter = response.getWriter();

			String fileUrl = "getImg/" + fileName;

			/*
			 * printWriter.
			 * println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
			 * + fileBean.getCKEditorFuncNum() + ",'" + fileUrl + "','success'" +
			 * ")</script>");
			 */

			String text = "{\"uploaded\": 1, \"fileName\": \"" + fileName + "\", \"url\": \"" + fileUrl + "\"}";
			printWriter.print(text);
			// printWriter.println("{'uploaded': 1, 'fileName': 'XQjCjpD.png', 'url':
			// 'c:/uploadimg/XQjCjpD.png'}");
			/*
			 * printWriter.println("{"); printWriter.println(" \"uploaded\": 1,");
			 * printWriter.println("\"fileName\":" + "\"" + filename+"\",");
			 * printWriter.println(" \"url\":" + "\"" + fileUrl +"\"" );
			 * printWriter.println("}");
			 */

			printWriter.flush();

			/*
			 * String file_path = attach_path + filename; model.addAttribute("file_path",
			 * file_path); model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
			 * 
			 * System.out.println("파일빈값 : "+fileBean + ", path값 :"+file_path);
			 * System.out.println("모델값 : "+model.toString());
			 */
			// return "editor";
		}
	}

	/*
	 * //ckeditor 이미지 첨부 후 다시 해당 이미지 불러오는 request
	 * 
	 * @RequestMapping(value = "/getImg/{fileName}", method = RequestMethod.GET)
	 * public void getImage(@PathVariable("fileName") String fileName,
	 * HttpServletResponse response) throws Exception {
	 * System.out.println("fileName값 : "+fileName);
	 * 
	 * String filePath = System.getProperty("user.home") +
	 * "/Cryptokick/imgs/company/project/content/" + fileName + ".jpg"; File f = new
	 * File(filePath); // 이제 파일을 보내주면 됩니다. FileInputStream fis = new
	 * FileInputStream(f); FileCopyUtils.copy(fis, response.getOutputStream()); }
	 */

	// ckeditor 이미지 첨부 후 다시 해당 이미지 불러오는 request
	@RequestMapping(value = "/getImg/{fileName:.+}", method = RequestMethod.GET)
	public void getImage2(@PathVariable("fileName") String fileName, HttpServletResponse response) throws Exception {
		System.out.println("fileName값 : " + fileName);

		String filePath = System.getProperty("user.home") + "/Cryptokick/imgs/company/project/content/" + fileName;
		File f = new File(filePath);
		// 이제 파일을 보내주면 됩니다.
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, response.getOutputStream());
	}

	// admin의 project 승인 처리
	//admin의  project 승인 처리
	@ResponseBody
	@RequestMapping(value = "/updateChecked", method = RequestMethod.GET)
	public int updateChecked(int project_num) {
		System.out.println("전" + project_num);
	
		Project temp = repository.selectOneproject(project_num);
	
		String date = temp.getProject_goaldate();
	
		Coupon coupon = new Coupon();
		coupon.setProject_num(project_num);
		coupon.setCoupon_date(date);
		coupon.setCoupon_discountrate(5);
		
		
		for (int i = 0; i < 16; i++) {
			double code = 0;
			if(i<10) {
				code = Math.random() * 10000000;
				System.out.println(code);
				ArrayList<Integer> firstList = new ArrayList<>();
				for(int j =0; j<firstList.size(); i++) {
					if((int)code == firstList.get(i)) {
						code = Math.random() * 10000000;
						j = 0;
					}
				}
				System.out.println(code);
				firstList.add((int)code);
				coupon.setCoupon_code((int) code);
			}
			if (i >= 10) {
				coupon.setCoupon_discountrate(10);
				code = Math.random() * 100000000;
				ArrayList<Integer> secondList = new ArrayList<>();
				for(int j =0; j<secondList.size(); i++) {
					if((int)code == secondList.get(i)) {
						code = Math.random() * 100000000;
						j = 0;
					}
				}
				secondList.add((int)code);
	
				coupon.setCoupon_code((int) code);
			}
			if (i == 15) {
				coupon.setCoupon_discountrate(15);
				code = Math.random() * 1000000000;
				coupon.setCoupon_code((int) code);
			}
			repository.insertCoupon(coupon);
		}
		int result = repository.updateChecked(project_num);
	
		System.out.println("후" + result);
	
		return result;
	}

	// admin 승인 요청 project list(즉, unchecked된 project list)
	@RequestMapping(value = "/adminProjects", method = RequestMethod.GET)
	public String adminProjects(Project project, Model model) {
		System.out.println(project);

		ArrayList<Project> plist = new ArrayList<>();

		project.setProject_num(0);

		model.addAttribute("category", project.getProject_category());

		project.setProject_content("Newest");

		System.out.println(project);
		plist = repository.adminSelectAll(project);
		System.out.println(plist);
		model.addAttribute("pList", plist);

		System.out.println(project.getProject_content());

		model.addAttribute("search", project.getProject_title());
		model.addAttribute("sort", project.getProject_content());

		System.out.println(project);

		return "common/project/adminProjects";
	}

}
