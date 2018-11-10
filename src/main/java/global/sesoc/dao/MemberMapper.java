package global.sesoc.dao;

import global.sesoc.vo.Company;
import global.sesoc.vo.WebMember;

public interface MemberMapper {

	int insertMember(WebMember member);

	WebMember idCheck(WebMember member); //중복검사(일반회원에서의 중복검사)

	int insertCompany(Company company); //기업회원

	WebMember selectOne(WebMember member); //일반회원 로그인
 
	Company selectOneCompany(Company company); //기업회원 로그인  

	int memberUpdate(WebMember member); //멤버 업데이트

	int companyUpdate(Company company); //회사멤버 업데이트


}
