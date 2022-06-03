package data.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.IngredientDto;
import data.dto.RecipeDto;
import data.dto.StepsDto;
import data.service.InputService;
import data.service.UpdateService;
import utility.FileUpload;

@Controller
@RequestMapping("/update")
public class UpdateController {

	@Autowired
	InputService service;
	
	@Autowired
	UpdateService updateService;
	
	@GetMapping("/updateform")
	public ModelAndView updateform(@RequestParam int RECIPE_IDX) {
		ModelAndView mav=new ModelAndView();
		RecipeDto reDto=updateService.getRecipe(RECIPE_IDX);
		
		List<IngredientDto> inList=new Vector<>();
		List<Integer> bdCount=new Vector<>();
		List<StepsDto> stList=new Vector<>();
		inList=updateService.getIngredient(RECIPE_IDX);
		bdCount=updateService.getBundleCount(RECIPE_IDX);
		stList=updateService.getSteps(RECIPE_IDX);
		
		mav.addObject("recipe", reDto);
		mav.addObject("ingredient", inList);
		mav.addObject("bundleCount", bdCount);
		mav.addObject("steps", stList);
		mav.addObject("ingClass", bdCount.size());
		mav.addObject("stepCount", stList.size());
		
		mav.setViewName("/recipe/update");
		return mav;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute RecipeDto reDto,
			@ModelAttribute IngredientDto inDto,
			@ModelAttribute StepsDto stDto,
			@RequestParam String portions,
			@RequestParam String ingName,
			@RequestParam String stepSec,
			@RequestParam String ingNum,
			@RequestParam String ingOrder,
			@RequestParam String stepNum,
			@RequestParam String ingDel,
			@RequestParam String stepDel,
			@RequestParam String stepPhotoDel,
			@RequestParam String compDel,
			@RequestParam ArrayList<MultipartFile> upload_main,
			@RequestParam ArrayList<MultipartFile> upload_step,
			@RequestParam ArrayList<MultipartFile> upload_complete,
			HttpServletRequest request) {
		/*ingDel, stepDel, compDel
		d : 기존 db 정보를 삭제
		u : 기존 db 정보 업데이트
		n : 새로 등록한 정보*/
		
		//레시피 기본 정보
		int idx=reDto.getRECIPE_IDX();
		
		//양
		if (portions.length()>=1) {
			int portion=Integer.parseInt(portions.substring(0, 1));
			reDto.setPortion(portion);
		}
		
		//태그를 입력하지 않았을 경우
		if (reDto.getTags()==null) {
			reDto.setTags("no tag");
		}
		
		//메인사진 업데이트
		FileUpload fileUpload=new FileUpload();
		String oldMainPhoto=updateService.getRecipe(idx).getMain_photo();
		String mainPhoto=fileUpload.fileUpdateEvent(oldMainPhoto, upload_main.get(0), request);
		reDto.setMain_photo(mainPhoto);
		
		//완성사진 업데이트
		String[] ifCompDel=compDel.split(",");
		String[] oldCompPhoto=updateService.getRecipe(idx).getComplete_photo().split(",");
		String newCompPhoto="";
		
		for (int i = 0; i < 4; i++) {
			if (ifCompDel[i].equals("d")) {
				fileUpload.deleteFile(oldCompPhoto[i], request);
				newCompPhoto+="no image";
			} else if (ifCompDel[i].equals("u")) {
				newCompPhoto+=fileUpload.fileUpdateEvent(oldCompPhoto[i],
						upload_complete.get(i), request);
			}
			if (i != 3) {
				newCompPhoto+=",";
			}
		}
		reDto.setComplete_photo(newCompPhoto);
		
		//레시피 업데이트
		updateService.updateRecipe(reDto);
		
		//재료 정보 모음을 1개씩 분리
		String[] ingredientNum=ingNum.split(",");
		String[] writeorder=ingOrder.split(",");
		String[] bundle=inDto.getBundle().split(",");
		String[] ingredientName=ingName.split(",");
		String[] quantity=inDto.getQuantity().split(",");
		String[] ifIngDel=ingDel.split(",");
		
		//재료를 1개씩 업데이트
		for (int i = 0; i < quantity.length; i++) {
			IngredientDto dto=new IngredientDto();
			dto.setWriteorder(Integer.parseInt(writeorder[i]));
			dto.setBundle(bundle[i]);
			dto.setName(ingredientName[i]);
			dto.setQuantity(quantity[i]);
			
			if (ifIngDel[i].equals("n")) {
				dto.setRECIPE_IDX(idx);
				service.insertIngredient(dto);
			} else if (ifIngDel[i].equals("u")) {
				dto.setNum(Integer.parseInt(ingredientNum[i]));
				updateService.updateIngredient(dto);
			} else if (ifIngDel[i].equals("d")) {
				int num=Integer.parseInt(ingredientNum[i]);
				updateService.deleteIngredient(num);
			}
		}
		
		//단계 정보 모음을 1개씩 분리
		String[] stepsSec=stepSec.split(",");
		String[] text=stDto.getText().split(",split,");
		String[] stepsNum=stepNum.split(",");
		String[] ifStepDel=stepDel.split(",");
		String[] ifPhotoDel=stepPhotoDel.split(",");
		String[] newStepPhoto=new String[ifStepDel.length];
		
		//단계별 사진 업데이트
		for (int i = 0; i < ifStepDel.length; i++) {
			if (ifStepDel[i].equals("d") || ifPhotoDel[i].equals("d")) {
				String oldStepPhoto=updateService.getPhotoByNum(Integer.parseInt(stepsNum[i]));
				fileUpload.deleteFile(oldStepPhoto, request);
				newStepPhoto[i]="no image";
			} else if (ifStepDel[i].equals("u") && ifPhotoDel[i].equals("u")) {
				String oldStepPhoto=updateService.getPhotoByNum(Integer.parseInt(stepsNum[i]));
				newStepPhoto[i]=fileUpload.fileUpdateEvent(oldStepPhoto,
						upload_step.get(i), request);
			} else if (ifStepDel[i].equals("n")) {
				newStepPhoto[i]=fileUpload.fileUpdateEvent("no image",
						upload_step.get(i), request);
			}
		}
					
		//한단계씩 업데이트
		for (int i = 0; i < ifStepDel.length; i++) {
			StepsDto dto=new StepsDto();
			dto.setStep(Integer.parseInt(stepsSec[i]));
			if (i == ifStepDel.length-1) {
				text[i]=text[i].substring(0, text[i].length()-6);
			}
			dto.setText(text[i]);
			dto.setPhoto(newStepPhoto[i]);
			
			if (ifStepDel[i].equals("n")) {
				dto.setRECIPE_IDX(idx);
				service.insertSteps(dto);
			} else if (ifStepDel[i].equals("u")) {
				dto.setNum(Integer.parseInt(stepsNum[i]));
				updateService.updateSteps(dto);
			} else if (ifStepDel[i].equals("d")) {
				int num=Integer.parseInt(stepsNum[i]);
				updateService.deleteSteps(num);
			}
		}
		
		return "redirect:/recipe/detail?idx="+idx;
	}
	
}
