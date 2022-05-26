package data.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.rsocket.context.RSocketPortInfoApplicationContextInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.IngredientDto;
import data.dto.RecipeDto;

import data.dto.StepsDto;
import data.dto.UserDto;
import data.inter.MypageServiceInter;
import data.mapper.MemberMapperInter;
import data.mapper.MypageMapperInter;
import data.service.MemberService;
import data.service.MypageService;
import data.service.RecipeService;
import utility.FileUpload;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecipeService recipeService;
	
	@GetMapping("/mypage")
	public ModelAndView myPageInfo(
			@RequestParam String UserID) 
	{
		
		System.out.println("UserID"+UserID);
		ModelAndView mView = new ModelAndView();
		UserDto dto = mypageService.getUser(UserID);
		mView.addObject("dto",dto);
		List<RecipeDto> ownrecipeList = mypageService.getUserRecipeList(UserID);
		System.out.println(ownrecipeList.size());
		for (int i=0;i<ownrecipeList.size();i++) {
			System.out.println(ownrecipeList.get(i));
		}
		
		
		mView.addObject("ownrecipeList",ownrecipeList);
		mView.setViewName("/mypage/mypage");
	
		List<RecipeDto> scraprecipeList = mypageService.getScrapRecipeList(UserID);
		System.out.println(scraprecipeList.size());
		for (int i=0;i<scraprecipeList.size();i++) {
			System.out.println(scraprecipeList.get(i));
		
		}
		mView.addObject("scraprecipeList",scraprecipeList);
		mView.setViewName("/mypage/mypage");	
		return mView;
	}
	
	@GetMapping("/updateform")
	public ModelAndView update(
			@RequestParam String UserID) 
	{
	
		ModelAndView mView = new ModelAndView();
		UserDto dto = mypageService.getUser(UserID);
		
		mView.addObject("dto",dto);
		mView.setViewName("/mypage/updateform");
		return mView;
	}
	
	
	
	
	@PostMapping("/update") //유저수정
	public String update(@ModelAttribute UserDto dto,
			
			@RequestParam ArrayList<MultipartFile> upload_photo,
			HttpSession session,
			HttpServletRequest request) {
		    mypageService.updateUser(dto);
		
		    
		//현재 로그인한 userID
				String UserID="test"; //(String)session.getAttribute("로그인아이디EL");
				dto.setUserid(UserID);
	
			//사진 업로드ek
			FileUpload fileUpload=new FileUpload();
			String photo=fileUpload.fileUploadEvent(upload_photo, request);
			
			dto.setPhoto(photo);
			
			
		return "redirect:mypage?UserID="+UserID;
		
	}
	
	
	@GetMapping("/scraprecipe") //레시피 스크랩
	  public ModelAndView scraprecipeList(@RequestParam String UserID) 
	  {
		ModelAndView mView = new ModelAndView();
		List<RecipeDto> scraprecipeList = mypageService.getScrapRecipeList(UserID);
		mView.addObject("scraprecipeList",scraprecipeList);
		
	
		mView.setViewName("mypage/mypage");	
		return mView;
	   }
	
	
	@GetMapping("/ownrecipe") //레시피 등록한거
	 public ModelAndView ownrecipeList(@RequestParam String UserID) 
	  {
		ModelAndView mview = new ModelAndView();
		List<RecipeDto> ownrecipeList = mypageService.getUserRecipeList(UserID);
		//mview.addObject("ownrecipeList",ownrecipeList);
		//mview.setViewName("mypage/mypage");
		
		
		
		return mview;
		
	   }
}


	
	
		 
	
