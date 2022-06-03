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
	
	@PostMapping("/updateform")
	public ModelAndView update(
			@RequestParam String userid) 
	{
	
		ModelAndView mView = new ModelAndView();
		UserDto dto = mypageService.getUser(userid);
		
		String address=dto.getAddress();
		String address1, address2;
		if (address == null) {
			address1="";
			address2="";
		} else {
			int index=address.indexOf(",");
			if (index<1) {
				address1=address;
				address2="";
			} else {
				address1=address.substring(0, index);
				address2=address.substring(index+1, address.length());
			}
		}
		
		mView.addObject("address1",address1);
		mView.addObject("address2",address2);
		mView.addObject("dto",dto);
		mView.setViewName("/mypage/updateform");
		return mView;
	}
	
	
	
	
	@PostMapping("/rivise") //유저수정ㅎ
	public String update(@ModelAttribute UserDto dto,
			@RequestParam ArrayList<MultipartFile> upload_photo,
			@RequestParam String address2, @RequestParam String address1,
			HttpSession session,
			HttpServletRequest request) {
			
		//현재 로그인한 userID
			String UserID=(String)session.getAttribute("loginid");
			dto.setUserid(UserID);
			System.out.println(dto.getName());
			
			if (dto.getPassword().equals("")) {
				String password=mypageService.getUser(UserID).getPassword();
				dto.setPassword(password);
			}
	
			//사진 업로드ek
			FileUpload fileUpload=new FileUpload();
			
			String photo=fileUpload.fileUpdateEvent(dto.getPhoto(), upload_photo.get(0), request);
			
			String address=address1+","+address2;
			dto.setAddress(address);
			dto.setPhoto(photo);
			mypageService.updateUser(dto);
			
		return "redirect:/mypage/mypage?UserID="+UserID;
		
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
		mview.addObject("ownrecipeList",ownrecipeList);
		mview.setViewName("mypage/mypage");
		
		
		
		return mview;
		
	   }
}


	
	
		 
	
