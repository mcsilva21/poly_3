package kr.ac.kopo.quiz.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.quiz.model.Q;
import kr.ac.kopo.quiz.service.QService;
import kr.ac.kopo.quiz.util.Pager;

@Controller
@RequestMapping("/q")
public class QController {
	final String path = "q/";

	@Autowired
	QService service;

	@GetMapping({ "", "/list" })
	String list(Pager pager, Model model) {
		List<Q> list = service.list(pager);

		model.addAttribute("list", list);

		return path + "list";
	}

	@GetMapping("/add")
	String add() {
		return path + "add";
	}

	@PostMapping("/add")
	String add(Q item) {
		service.add(item);

		return "redirect:list";
	}

	@GetMapping("/{quizId}/update")
	String update(@PathVariable int quizId, Model model) {
		Q item = service.item(quizId);

		model.addAttribute("item", item);

		return path + "update";

	}

	@PostMapping("/{quizId}/update")
	String update(@PathVariable int quizId, Q item) {
		service.update(item);

		return "redirect:../list";
	}

	@GetMapping("{quizId}/delete")
	String delete(@PathVariable int quizId) {
		service.delete(quizId);

		return "redirect:../list";
	}

	@GetMapping("/quiz")
	String quiz(Pager pager, Model model) {
		List<Q> list = service.list(pager);

		model.addAttribute("list", list);

		return path + "quiz";
	}

	
	
	@GetMapping("/exam")
	String exam(Pager pager, Model model) {
		List<Q> list = service.list(pager);

		model.addAttribute("list", list);

		return path + "exam";
	}

	
	// 점수 계산
	@PostMapping("/exam")
	String test(HttpServletRequest request, HttpSession session) {
		
		
		Enumeration keys = request.getParameterNames();
		ArrayList<String> rightArr = new ArrayList<String>();
		ArrayList<String> userArr = new ArrayList<String>();

		while(keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			System.out.println(key + " : " + request.getParameter(key));
			char check = key.charAt(0);

			if ( check == 'r' ) {
				rightArr.add(request.getParameter(key));
			} else if (check == 'u'){
				userArr.add(request.getParameter(key));
			}
		}
		
		int count = 0;
		if(rightArr.size()>0 && userArr.size()>0) {
			for (int i = 0; i < rightArr.size(); i++) {
//				System.out.println( "list1 : " + rightArr.get(i) );
//				System.out.println( "list2 : " + userArr.get(i) );
				if ( rightArr.get(i).equals(userArr.get(i)) )
					count += 1;
			}
		}
		
		if(session.getAttribute("score")==null) {
			int score = count * 20;
			session.setAttribute("score", score);
		} else if (session.getAttribute("score")!=null)		{
			session.removeAttribute("score");
		}

	
		return path + "exam";
}
}
