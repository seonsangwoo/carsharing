package com.car.sharing.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.car.sharing.service.LoginService;
import com.car.sharing.vo.UserVO;

@Controller
public class LoginController {
	final Logger logger = LoggerFactory.getLogger(this.getClass()); // 로그확인

	@Autowired LoginService loginService;
	
	//vue 데이터 테스트
	@RequestMapping(value = "/test")
	@ResponseBody
	public ArrayList<UserVO> tset() throws Exception {
		logger.info("테스트");
		ArrayList<UserVO> result = loginService.test();
		
		return result;
	}
	
	//기본 페이지
	@RequestMapping(value="/")
	public String index() {
		return "redirect:/login";
	}
		
	//로그인 페이지
	@RequestMapping(value="/login")
	public String login() {
		return "login/login";
	}
	
	//로그인 - id,pw 체크
	@RequestMapping(value="/logincheck")
	@ResponseBody
	public int loginCheck(UserVO userVO, HttpSession session) throws Exception{
		
		//logger.info("##############param############## : "+userVO);
		
		int result = loginService.loginCheck(userVO, session);
		
		return result;
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("userVO"); //로그아웃 처리해서 세션값 삭제
		return "redirect:/login"; //로그인페이지로 이동
	}

}
