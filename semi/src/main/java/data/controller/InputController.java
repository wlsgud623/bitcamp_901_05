package data.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import data.service.InputService;
import utility.FileUpload;

@Controller
@RequestMapping("/input")
public class InputController {

	@Autowired
	InputService service;
	
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
		//현재 로그인한 userID
		String userID="tester"; //(String)session.getAttribute("로그인아이디");
		reDto.setUserID(userID);
		
		//메인, 완성사진 업로드
		FileUpload fileUpload=new FileUpload();
		String main_photo=fileUpload.fileUploadEvent(upload_main, request);
		String complete_photo=fileUpload.fileUploadEvent(upload_complete, request);
		reDto.setMain_photo(main_photo);
		reDto.setComplete_photo(complete_photo);
		
		//레시피 등록 후, 생성된 idx값 추출
		service.insertRecipe(reDto);
		int RECIPE_IDX=service.getLastRecipeIdx();
		
		//재료 정보 모음을 1개씩 분리
		String[] ing_class=inDto.getBundle().split(",");
		String[] ing_name=inDto.getName().split(",");
		String[] ing_quantity=inDto.getQuantity().split(",");
		
		//재료를 1개씩 등록
		for (int i = 0; i < ing_quantity.length; i++) {
			inDto.setRECIPE_IDX(RECIPE_IDX);
			inDto.setBundle(ing_class[i]);
			inDto.setName(ing_name[i]);
			inDto.setQuantity(ing_quantity[i]);
			
			service.insertIngredient(inDto);
		}
		
		//단계별 사진 업로드
		String stepPhotoList=fileUpload.fileUploadEvent(upload_step, request);
		
		//단계 정보 모음을 1개씩 분리
		String[] step_sec=stDto.getStep_sec().split(",");
		String[] step_text=stDto.getText().split(",split,");
		String[] step_photo=stepPhotoList.split(",");
			
		//한단계씩 등록
		for (int i = 0; i < step_photo.length; i++) {
			stDto.setRECIPE_IDX(RECIPE_IDX);
			stDto.setStep(Integer.parseInt(step_sec[i]));
			stDto.setText(step_text[i]);
			stDto.setPhoto(step_photo[i]);
			
			service.insertSteps(stDto);
		}
		
		//user의 ownrecipe 목록 업데이트
		service.updateOwnRecipe(RECIPE_IDX, userID);
		
		return "redirect:/";
	}
}
