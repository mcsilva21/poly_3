package kr.ac.kopo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RootController {
	ArrayList<Image> list;
	
	final String path = "d://upload/";
	
	public RootController() {
		list = new ArrayList<Image>();
	}
	
	@GetMapping("/")
	String index(Model model) {
		model.addAttribute("list", list);
		
		return"index";
	}
	
	@PostMapping("/upload")
	String upload(Image item) {
		MultipartFile file = item.getUploadFile();
		if(file.getSize() > 1) {
			System.out.println(file.getOriginalFilename());
			
			try {
				String filename = file.getOriginalFilename();
				item.setImage(filename);
				file.transferTo(new File(path + filename));
				
				list.add(item);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	
		return "redirect:";
	}
	
	@PostMapping("/upload_ajax")
	String upload_ajax(Image item, Model model) {
		upload(item);
		
		model.addAttribute("list", list);
		
		return "list";
	}
}
