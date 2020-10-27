package kr.ac.kopo.quiz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.quiz.model.User;
import kr.ac.kopo.quiz.service.UserService;
import kr.ac.kopo.quiz.util.Pager;

@Controller
@RequestMapping("/user")
public class UserController {
	final String path = "user/";
	
	@Autowired
	UserService service;
	
	@GetMapping({"", "/list"})
	String list(Pager pager, Model model) {
		List<User> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(User item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/{userId}/update")
	String update(@PathVariable int userId, Model model) {
		User item = service.item(userId);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/{userId}/update")
	String update(@PathVariable int userId, User item) {
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/{userId}/delete")
	String delete(@PathVariable int userId) {
		service.delete(userId);
		
		return "redirect:../list";
	}

}
