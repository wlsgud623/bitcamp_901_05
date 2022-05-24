package data.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import utility.FileUpload;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/mypage")
	public ModelAndView myPageInfo(
			@RequestParam String UserID) 
	{
		ModelAndView mView = new ModelAndView();
		UserDto dto = mypageService.getUser(UserID);
		mView.addObject("dto",dto);
		mView.setViewName("/mypage/mypage");
		return mView;
	}
	
	@PostMapping("/updateform") //유저수정
	public String update(@ModelAttribute UserDto dto,
			
			@RequestParam ArrayList<MultipartFile> upload_photo,
			HttpSession session,
			HttpServletRequest request) {
		mypageService.updateUser(dto);
		
		//현재 로그인한 userID
				String userID="tester"; //(String)session.getAttribute("로그인아이디");
				dto.setUserID(userID);
	
			//메인, 완성사진 업로드
			FileUpload fileUpload=new FileUpload();
			String photo=fileUpload.fileUploadEvent(upload_photo, request);
			
			dto.setPhoto(photo);
			
			
		return "/mypage/updateform";
	}
	
	
	@GetMapping("/scraprecipe") //레시피 스크랩
	  public ModelAndView scraprecipeList(@RequestParam String UserID) 
	  {
		ModelAndView mView = new ModelAndView();
		List<RecipeDto> list = mypageService.getscraprecipe(UserID);
		mView.addObject("list",list);
		mView.setViewName("mypage/mypage");	
		return mView;
	   }
	
	
	@GetMapping("/ownrecipe") //레시피 등록한거
	 public ModelAndView ownrecipeList(@RequestParam String UserID) 
	  {
		ModelAndView mview = new ModelAndView();
		List<RecipeDto> list = mypageService.getUserRecipeList(UserID);
		mview.addObject("list",list);
		mview.setViewName("mypage/mypage");

		
		return mview;
		
	   }
}


	
	
		 
	