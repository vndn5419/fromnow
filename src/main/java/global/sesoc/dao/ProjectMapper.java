package global.sesoc.dao;

import java.util.ArrayList;

import global.sesoc.vo.Coupon;
import global.sesoc.vo.Project;
import global.sesoc.vo.Sale;
import global.sesoc.vo.Viewer;
import global.sesoc.vo.WebMember;


public interface ProjectMapper {
   
   //project list 불러오기
   public ArrayList<Project> selectAll(Project project);
   
   //admin project list 불러오기 
   public ArrayList<Project> adminSelectAll(Project project);
   
   //project 정보 하나 불러오기
   public Project selectOneproject(int project_num);

   //project db insert
   public int insertProject(Project project);
   
   //myproject 리스트 불러오기
   public ArrayList<Project> myProjectsList(String co_id);
   
   //viewer 넣기
   public int insertViewer(Viewer viewer);
   
   //추천 상품 리스트 불러오기
   public ArrayList<Project> recommendList(WebMember member);
   
   //베스트 셀러 리스트 불러오기
   public ArrayList<Project> bestSellerList();

   // admin이 project 승인했을 때
   public int updateChecked(int project_num);

   // coupon 생성
   public int insertCoupon(Coupon coupon);
   
   // coupon 불러오기
   public ArrayList<Coupon> selectAllCoupon(int project_num);

   // coupon 당첨시 업데이트
   public int updateUserCoupon(Coupon coupon);

   // project 전체  제목만 가져오기
   public ArrayList<Project> selectTitle();
   
   // project 전체  제목만 가져오기
   public int purchasedProject(Sale sale);
}