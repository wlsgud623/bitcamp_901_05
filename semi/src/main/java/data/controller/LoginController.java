package data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.dto.UserDto;
import data.mapper.MemberMapperInter;
import data.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService loginService;

	@Autowired
	private MemberMapperInter memberMapperInter;
	
	@GetMapping("/login")
	public String login(Model model, HttpServletRequest request)
	{
		String referer = request.getHeader("Referer");
		model.addAttribute("ref", referer);
		model.addAttribute("msg", "0");
		return "/sign/login/login";
	}
	
	@GetMapping("/aftersignup_login")
	public String aftersignup_login()
	{
		
		return "/sign/login/aftersignup_login";
	}
	
	@PostMapping("/loginprocess")
	public String loginprocess(
				@RequestParam String userid,
				@RequestParam String password,
				@RequestParam String ref,
				@RequestParam (required = false) String chkid, //아이디 저장 버튼 
				HttpSession session,
				Model model) 
	{
		
		System.out.println("chkid:" + chkid);
		int n = loginService.login(userid,password);
		if(n == 1) {
			//세션 유지시간 지정
			session.setMaxInactiveInterval(60*60*6); //6시간 로그인 유지
			//아이디와 비밀번호가 맞는 경우
			session.setAttribute("loginid", userid);
			//로그인한 사람의 이름 
			String name = memberMapperInter.getSearchName(userid); //아이디로 이름 찾기
			session.setAttribute("loginname", name);
			session.setAttribute("saveid", chkid == null?"no":"yes"); //chkid가 null일때 'no'
			session.setAttribute("loginok", "yes"); //로그인 성공할 경우 value="yes"
			return "redirect:"+ref; //메인페이지로 이동
		}else {
			//아이디와 비밀번호가 다른 경우 
			model.addAttribute("ref", ref);
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			return "/sign/login/login"; //다시 로그인 폼으로 이동
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
	
	//네이버 로그인
	@PostMapping("/naver_login")
	@ResponseBody
	public Map<String, String> naverLogin(
				@RequestParam String name,
				HttpSession session
				) 
	{
		System.out.println(name);
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		
		//세션 유지시간 지정
		session.setMaxInactiveInterval(60*60*6); //6시간 로그인 유지
		//아이디와 비밀번호가 맞는 경우
		session.setAttribute("loginid", "jaja321");
//		//로그인한 사람의 이름 
//		String name = memberMapperInter.getSearchName(userid); //아이디로 이름 찾기
		session.setAttribute("loginname", "김주희");
//		session.setAttribute("saveid", chkid == null?"no":"yes"); //chkid가 null일때 'no'
		session.setAttribute("loginok", "yes"); //로그인 성공할 경우 value="yes"

		return map; 
	}   
	
	//카카오 로그인
		@PostMapping("/kakao_login")
		@ResponseBody
		public Map<String, String> kakaoLogin(
					@RequestParam String id,
					HttpSession session
					) 
		{
			System.out.println(id);
			Map<String, String> map = new HashMap<>();
			map.put("kakao_id", id);
			
			//세션 유지시간 지정
			session.setMaxInactiveInterval(60*60*6); //6시간 로그인 유지
			//아이디와 비밀번호가 맞는 경우
			session.setAttribute("loginid", "jaja321@naver.com");
//			//로그인한 사람의 이름 
//			String name = memberMapperInter.getSearchName(userid); //아이디로 이름 찾기
			session.setAttribute("loginname", "김주희");
//			session.setAttribute("saveid", chkid == null?"no":"yes"); //chkid가 null일때 'no'
			session.setAttribute("loginok", "yes"); //로그인 성공할 경우 value="yes"

			return map;
		}   
		
		@GetMapping("/kakao_main")
		public String kakaomain(Model model) {
			model.addAttribute("kakao", "yes");
			return "/";
		}
	
}
   









