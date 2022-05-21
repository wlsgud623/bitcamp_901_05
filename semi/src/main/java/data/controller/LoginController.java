package data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.mapper.MemberMapperInter;
import data.service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private MemberService loginService;

	@Autowired
	private MemberMapperInter memberMapperInter;
	
	@GetMapping("/login")
	public String login()
	{
		return "/sign/login/login";
	}
	
	@GetMapping("/aftersignup_login")
	public String aftersignup_login()
	{
		return "/sign/login/aftersignup_login";
	}
	
	@PostMapping("/process")
	public String loginProcess(
				@RequestParam String UserID,
				@RequestParam String password,
				@RequestParam (required = false) String chkid, //아이디 저장 버튼 
				HttpSession session) 
	{
		System.out.println("chkid:" + chkid);
		//로그인 성공 여부
//		Map<String, String> map = new HashMap<>();
//		map.put("UserID", UserID);
//		map.put("password", password);
		int n = loginService.login(UserID,password);
		if(n == 1) {
			//세션 유지시간 지정
			session.setMaxInactiveInterval(60*60*6); //6시간 로그인 유지
			//아이디와 비밀번호가 맞는 경우
			session.setAttribute("loginid", UserID);
			//로그인한 사람의 이름 
			String name = memberMapperInter.getSearchName(UserID); //아이디로 이름 찾기
			session.setAttribute("loginname", name);
			session.setAttribute("saveid", chkid == null?"no":"yes"); //chkid가 null일때 'no'
			session.setAttribute("loginok", "yes"); //로그인 성공할 경우 value="yes"
			return "redirect:../"; //메인페이지로 이동
		}else {
			//아이디와 비밀번호가 다른 경우 

			return "redirect:login"; //다시 로그인 폼으로 이동
		}
	}
	
	// 메뉴바 로그아웃 클릭시
	@GetMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session)
	{
		//session에서 loginok 삭제
		session.removeAttribute("loginok");
	}
	
	
}










