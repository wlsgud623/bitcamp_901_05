package data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;

@Controller
@RequestMapping("/input")
public class InputController {

	@GetMapping("/input")
	public String input() {
		return "/recipe/input";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute RecipeDto reDto,
			@ModelAttribute IngredientDto inDto,
			@ModelAttribute StepsDto stDto,
			@RequestParam ArrayList<MultipartFile> upload_main,
			@RequestParam ArrayList<MultipartFile> upload_step,
			@RequestParam ArrayList<MultipartFile> upload_complete,
			HttpSession session,
			HttpServletRequest request) {
		System.out.println(reDto);
		System.out.println(inDto);
		System.out.println(stDto);
		System.out.println(upload_main);
		System.out.println(upload_step);
		System.out.println(upload_complete);
		
		return "redirect:/";
	}
}
