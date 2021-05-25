package com.car.sharing.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.sharing.service.UserService;
import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.RentalVO;
import com.car.sharing.vo.UserVO;

@Controller
public class UserController {
	final Logger logger = LoggerFactory.getLogger(this.getClass()); //로그확인
	
	@Autowired UserService userService;
	
	//회원가입 페이지
	@RequestMapping("/policy")
	public String policy() {
		return "user/policy";
	}
	
	//회원가입 페이지
	@RequestMapping("/signup")
	public String signup() {
		return "user/signup";
	}

	//회원가입 - 아이디 중복체크
	@RequestMapping("/idcheck")
	@ResponseBody
	public int idCheck(UserVO userVO) throws Exception {
		int result = userService.idCheck(userVO);
		
		return result;
	}
	
	//회원가입 - 핸드폰번호 중복체크
	@RequestMapping("/phonecheck")
	@ResponseBody
	public int phoneCheck(UserVO userVO) throws Exception {
		int result = userService.phoneCheck(userVO);
		
		return result;
	}
	
	//회원가입 - 면허증번호 중복체크
	@RequestMapping("/licensecheck")
	@ResponseBody
	public int licenseCheck(UserVO userVO) throws Exception {
		int result = userService.licenseCheck(userVO);
		
		return result;
	}
	
	//회원가입 - 유저정보 insert
	@RequestMapping("/joinuser")
	@ResponseBody
	public int joinUser(UserVO userVO) throws Exception {
		int result = userService.joinUser(userVO);
		
		return result;
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("userVO"); //현재 로그인된 아이디 정보를 사용
		
		//차량 예약 내역 가져오기
		ArrayList<CarLocationRentalVO> result = userService.reservationList(userVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result); //DB에서 가져온 데이터를 담아줘서 마이페이지에 데이터를 뿌려준다.
		mav.setViewName("user/mypage"); //보여지는 페이지가 마이페이지로 설정
		
		return mav;
	}
	
	//비밀번호 변경
	@RequestMapping("/pwchange")
	@ResponseBody
	public int pwChange(HttpSession session, @RequestParam String pw) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("userVO"); //현재 로그인된 아이디 정보를 사용
		
		if(userVO.getPw().equals(pw)) { //현재 로그인된 아이디의 비밀번호와 새로 입력한 비밀번호가 같을 시에 실패 처리
			return 2;
		}else { //현재 로그인된 아이디의 비밀번호와 새로 입력한 비밀번호가 다를 시에 비밀번호 변경
			userVO.setPw(pw);
			int result = userService.pwChange(userVO);
			return result;
		}
		
	}
	
	//차량 예약취소
	@RequestMapping("/reservationcancel")
	@ResponseBody
	public int reservationCancel(RentalVO rentalVO) throws Exception {
		int result = userService.reservationCancel(rentalVO);
		
		return result;
	}
	
}
