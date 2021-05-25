package com.car.sharing.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.car.sharing.service.RentalService;
import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.LocationVO;
import com.car.sharing.vo.RentalVO;

@Controller
public class RentalController {

	final Logger logger = LoggerFactory.getLogger(this.getClass()); // 로그확인

	@Autowired RentalService rentalService;

	// 예약하기 페이지
	@RequestMapping(value = "/rental")
	public String rental() {
		return "rental/rental";
	}

	// 검색버튼 클릭하여 좌표값 가져오기
	@RequestMapping(value = "/getlatlong")
	@ResponseBody
	public ArrayList<LocationVO> getLatLong(RentalVO rentalVO, HttpSession session) throws Exception {
		ArrayList<LocationVO> result = rentalService.getlatlong(rentalVO, session);
		
		return result;
	}

	// 차량 상세 정보 리스트 가져오기
	@RequestMapping(value = "/getcarinfolist")
	@ResponseBody
	public ArrayList<CarLocationRentalVO> getCarInfoList(CarLocationRentalVO clrVO) throws Exception {
		ArrayList<CarLocationRentalVO> result = rentalService.getcarinfolist(clrVO);

		return result;
	}

	// 차량 정보 가져오기 (결제 페이지)
	@RequestMapping(value = "/reservation")
	public ModelAndView reservation(CarLocationRentalVO clrVO) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", clrVO); //rental페이지에서 가져온 데이터를 담아줘서 예약결제페이지에 데이터를 뿌려준다.
		mav.setViewName("rental/reservation"); //보여지는 페이지가 예약결제 페이지로 설정

		return mav;
	}

	
	//차량 예약하기
	@RequestMapping(value="/payment")
	@ResponseBody 
	public int payment(RentalVO rentalVO, HttpSession session) throws Exception {
		int result = rentalService.payment(rentalVO, session);
	  
		return result;
	 }
	  
	 //차량 예약 불가능한 시간 보기
	 @RequestMapping(value="/impossibletime")
	 @ResponseBody 
	 public ArrayList<RentalVO> impossibletime(RentalVO rentalVO) throws Exception {
		 ArrayList<RentalVO> result = rentalService.impossibletime(rentalVO);
		 
		 return result; 
	 }
	 

}
