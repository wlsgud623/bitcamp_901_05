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
			@RequestParam String portions,
			@RequestParam String ingOrder,
			@RequestParam String ingName,
			@RequestParam String stepSec,
			@RequestParam ArrayList<MultipartFile> upload_main,
			@RequestParam ArrayList<MultipartFile> upload_step,
			@RequestParam ArrayList<MultipartFile> upload_complete,
			HttpSession session,
			HttpServletRequest request) {
		//현재 로그인한 userID
		String userID=(String)session.getAttribute("loginid");
		reDto.setUserID(userID);
		
		//양
		if (portions.length()>=1) {
			int portion=Integer.parseInt(portions.substring(0, 1));
			reDto.setPortion(portion);
		}
		
		//메인, 완성사진 업로드
		FileUpload fileUpload=new FileUpload();
		String mainPhoto=fileUpload.fileUploadEvent(upload_main, request);
		String completePhoto=fileUpload.fileUploadEvent(upload_complete, request);
		reDto.setMain_photo(mainPhoto);
		reDto.setComplete_photo(completePhoto);
		
		//태그를 입력하지 않았을 경우
		if (reDto.getTags()==null) {
			reDto.setTags("no tag");
		}
		
		//레시피 등록 후, 생성된 idx값 추출
		service.insertRecipe(reDto);
		int RECIPE_IDX=service.getLastRecipeIdx();
		
		//재료 정보 모음을 1개씩 분리
		String[] order=ingOrder.split(",");
		String[] bundle=inDto.getBundle().split(",");
		String[] ingredientName=ingName.split(",");
		String[] quantity=inDto.getQuantity().split(",");
		
		//재료를 1개씩 등록
		for (int i = 0; i < quantity.length; i++) {
			IngredientDto dto=new IngredientDto();
			dto.setRECIPE_IDX(RECIPE_IDX);
			dto.setWriteorder(Integer.parseInt(order[i]));
			dto.setBundle(bundle[i]);
			dto.setName(ingredientName[i]);
			dto.setQuantity(quantity[i]);
			
			service.insertIngredient(dto);
		}
		
		//단계별 사진 업로드
		String stepPhotoList=fileUpload.fileUploadEvent(upload_step, request);
		
		//단계 정보 모음을 1개씩 분리
		String[] stepsSec=stepSec.split(",");
		String[] text=stDto.getText().split(",split,");
		String[] stepPhoto=stepPhotoList.split(",");
			
		//한단계씩 등록
		for (int i = 0; i < stepPhoto.length; i++) {
			StepsDto dto=new StepsDto();
			dto.setRECIPE_IDX(RECIPE_IDX);
			dto.setStep(Integer.parseInt(stepsSec[i]));
			if (i == stepPhoto.length-1) {
				text[i]=text[i].substring(0, text[i].length()-6);
			}
			dto.setText(text[i]);
			dto.setPhoto(stepPhoto[i]);
			
			service.insertSteps(dto);
		}
		
		//user의 ownrecipe 목록 업데이트
		service.updateOwnRecipe(RECIPE_IDX, userID);
		
		return "redirect:/recipe/detail?idx="+RECIPE_IDX;
	}
	
}
