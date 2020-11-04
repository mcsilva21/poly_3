package kr.ac.kopo.bookshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.bookshop.model.Customer;
import kr.ac.kopo.bookshop.model.Review;
import kr.ac.kopo.bookshop.service.ReviewService;

@Controller
@RequestMapping("/review/{bookid}")
public class ReviewController {
	final String path = "review/";
	
	@Autowired
	ReviewService service;
	
	@PostMapping("/review")
	   String review(@PathVariable int bookid, Model model, Review item, HttpSession session) {
	      add(bookid, item, session);
	      
	      list(bookid, model);
	      
	      return path + "reviews";
	   }
	
	
	@GetMapping("/reviews")
	String reviews(@PathVariable int bookid, Model model) {
		list(bookid, model);
		
		return path + "reviews";
	}
	
	

	
	
	@GetMapping("/list")
	String list(@PathVariable int bookid, Model model) {
		List<Review> list = service.list(bookid);	
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	String add() {
			return path + "add";
		}
	
	@PostMapping("/add")
	String add(@PathVariable int bookid, Review item, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("user");
		
		item.setCustid(customer.getCustid());
		item.setBookid(bookid);
		
		service.add(item);
		
		return "redirect:list";
	}
	
	
	
	@GetMapping("/{reviewid}/update")
	String update(@PathVariable int reviewid, Model model) {
		Review item = service.item(reviewid);
		
		model.addAttribute("item", item);
	
		return path + "update";
	}

	@PostMapping("/{reviewid}/update")
	String update(@PathVariable int bookid,  @PathVariable int reviewid, Review item, HttpSession session) {
		Customer user = (Customer) session.getAttribute("user");
		
		item.setReviewid(reviewid);
		item.setCustid(user.getCustid());
		item.setBookid(bookid);
		
		service.update(item);
		
		return "redirect:list";
		
		
	}
	
	@GetMapping("/{revuewid}/delete")
	String delete(@PathVariable int reviewid, HttpSession session) {
		
		Customer user = (Customer) session.getAttribute("user");
		
		service.delete(reviewid, user.getCustid());
		
		return "redirect:list";
	}
}
