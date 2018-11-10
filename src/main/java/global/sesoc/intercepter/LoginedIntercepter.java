package global.sesoc.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginedIntercepter extends HandlerInterceptorAdapter{
	
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String loginId =(String)session.getAttribute("mCategory");
		//
		System.out.println("인터셉터 처리함"+loginId);
		if(loginId ==null) {
			String contextPath = request.getContextPath();
			
			System.out.println(contextPath);
			response.sendRedirect(contextPath+"/logIn"); //주소표시줄 확인.
			return false;
		}
		
		return true;
	}
	
	
}
