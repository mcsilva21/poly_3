package kr.ac.kopo.quiz.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	String exam(HttpServletRequest request, HttpSession session) {
		Pager pager = new Pager();
		pager.setPage(1);
		List<Q> list = service.list(pager);
		
		
		Enumeration keys = request.getParameterNames();
		ArrayList<String> userArr = new ArrayList<String>();

		while(keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			System.out.println(key + " : " + request.getParameter(key));
			
			// key 값은 userquiz + 퀴즈아이디 로 시작하고, 
			// request.getParameter(key) 얻는 값은 사용자 선택 답안
			if(key.startsWith("userquiz"))
				userArr.add(key);
		}
		
		int count = 0;
		if(userArr.size() > 0) {
			for(String key : userArr) {
				// key 값에서 quizId 값은 substring 으로 추출하여, service.item() 에 넘겨 주어 해당 퀴즈 객체를 얻는다
				Q quizId = service.item( Integer.parseInt(key.substring(8)) );
				
				String answer = request.getParameter(key); 
				if( quizId.getRightAnswer() == Integer.parseInt(answer) )
					count++;
			}
		}
		
		if(session.getAttribute("score")!=null) {
			int score = count * 20;
			session.setAttribute("score", score);
		} else if (session.getAttribute("score")==null)		{
			session.setAttribute("score", 0);
		}

	
		return path + "result";
}
}
