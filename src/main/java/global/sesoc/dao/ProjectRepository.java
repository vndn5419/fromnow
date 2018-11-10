package global.sesoc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Coupon;
import global.sesoc.vo.Project;
import global.sesoc.vo.Sale;
import global.sesoc.vo.Viewer;
import global.sesoc.vo.WebMember;

@Repository
public class ProjectRepository {

	// SqlSession 필요
	@Autowired
	SqlSession session;

	// Project 리스트 불러오기
	public ArrayList<Project> selectAll(Project project) {
		System.out.println("select All " + project);
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		ArrayList<Project> list = new ArrayList<>();
		list = mapper.selectAll(project);
		System.out.println("repository =" + list);
		return list;
	}

	// Admin Project 리스트 불러오기
	public ArrayList<Project> adminSelectAll(Project project) {
		System.out.println("select All " + project);
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		ArrayList<Project> list = new ArrayList<>();
		list = mapper.adminSelectAll(project);
		System.out.println("repository =" + list);
		return list;
	}

	// Project 하나 불러오기
	public Project selectOneproject(int project_num) {
		System.out.println("resp" + project_num);
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		Project project = mapper.selectOneproject(project_num);
		System.out.println(project);
		return project;
	}

	// Project DB insert
	public int insertProject(Project project) throws Exception{
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.insertProject(project);
		
		return result;
	}

	// company - myproject
	public ArrayList<Project> myProjectsList(String co_id) {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);

		ArrayList<Project> myProject = mapper.myProjectsList(co_id);

		return myProject;
	}

	// 글 조회시 ip값 추출 및 db입력
	public int insertViewer(Viewer viewer) {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.insertViewer(viewer);

		return result;
	}

	// 추천 상품 리스트 불러오기
	public ArrayList<Project> recommendList(WebMember member) {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		ArrayList<Project> result = mapper.recommendList(member);

		return result;
	}

	// 베스트셀러 리스트 불러오기
	public ArrayList<Project> bestSellerList() {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		ArrayList<Project> result = mapper.bestSellerList();

		return result;
	}

	// admin이 project 승인했을 때
	public int updateChecked(int project_num) {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.updateChecked(project_num);

		return result;
	}

	// coupon 생성
	public int insertCoupon(Coupon coupon) {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.insertCoupon(coupon);

		return result;
	}

	// coupon 생성
	public ArrayList<Coupon> selectAllCoupon(int project_num) {
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);

		ArrayList<Coupon> couponList = mapper.selectAllCoupon(project_num);

		return couponList;
	}

	// 당첨시 coupon update
	public int updateUserCoupon(Coupon coupon) {
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.updateUserCoupon(coupon);
		return result;
	}
	
	// project 
	public ArrayList<Project> selectTitle() {

		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		ArrayList<Project> list = new ArrayList<>();
		list = mapper.selectTitle();

		return list;
	}
	

	public int purchasedProject(Sale sale){
		ProjectMapper mapper = session.getMapper(ProjectMapper.class);
		int result = mapper.purchasedProject(sale);
		return result;
	}
	
}