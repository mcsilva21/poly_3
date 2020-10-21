package kr.ac.kopo.quiz.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.quiz.model.User;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		if(user == null)
			response.sendRedirect("/login");
		else if(!"admin".equals(user.getId()))
			response.sendRedirect("/");
		else		
			return true;		
			
		return false;
	}

}
