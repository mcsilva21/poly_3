package kr.ac.kopo.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RootController {
	
	@RequestMapping("/")
	String index() {
		return "index";
	}
	
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(String id, String passwd, HttpSession session) {
		//사용자abc
		if("abc".equals(id) && "1234".equals(passwd)) {
			session.setAttribute("id", id);
			session.setAttribute("role", "user");
		//관리자xyz
		}else if("xyz".equals(id) && "5678".equals(passwd)) {
			session.setAttribute("id", id);
			session.setAttribute("role", "admin");
		}
		
		return "redirect:";
	}
	
	@RequestMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		return "redirect:";
	}
	
	@RequestMapping("/book/list")
	String book() {
		return "book";
	}
	
	@RequestMapping("/customer/list")
	String customer() {
	return "customer";
	}
	
	@RequestMapping("/order/list")
	String order() {
		return "order";
	}

}
