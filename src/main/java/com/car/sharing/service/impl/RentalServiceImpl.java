package com.car.sharing.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.sharing.mapper.RentalMapper;
import com.car.sharing.service.RentalService;
import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.LocationVO;
import com.car.sharing.vo.RentalVO;
import com.car.sharing.vo.UserVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService{

	final Logger logger = LoggerFactory.getLogger(this.getClass()); //로그확인
	
	@Autowired RentalMapper rentalMapper;
	
	//검색버튼 클릭하여 좌표값 가져오기
	@Override
	public ArrayList<LocationVO> getlatlong(RentalVO rentalVO, HttpSession session) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("userVO"); //현재 로그인된 아이디 정보를 사용
		int userSeq = userVO.getUserSeq();
		rentalVO.setUserSeq(userSeq);
		
		//예약하려는 시간에 같은 회원이 동일시간에 예약한 차량이 있는지 확인
		int rentalcheck = rentalMapper.rentalcheck(rentalVO);
		
		if(rentalcheck == 0) { //동일시간에 예약한 차량이 없다면 대여점의 좌표값을 가져와 반환한다.
			ArrayList<LocationVO> result = new ArrayList<LocationVO>();
			result = rentalMapper.getlatlong();
			return result;
		}
		return null; //동일시간에 예약한 차량이 있다면 null을 반환한다.
		
	}

	//차량 상세 정보 리스트 가져오기
	@Override
	public ArrayList<CarLocationRentalVO> getcarinfolist(CarLocationRentalVO clrVO) throws Exception {
		return rentalMapper.getcarinfolist(clrVO);
	}

	//차량 예약하기
	@Override 
	public int payment(RentalVO rentalVO, HttpSession session) throws Exception { 
		UserVO userVO = (UserVO)session.getAttribute("userVO"); //현재 로그인된 아이디 정보를 사용
		int userSeq = userVO.getUserSeq(); //로그인 되어있는 user_seq정보를 가져온다.
		rentalVO.setUserSeq(userSeq); //로그인 되어있는 user_seq정보를 rentalVO에 넣어준다.
		
		return rentalMapper.payment(rentalVO); 
	}

	//차량 예약 불가능한 시간 보기
	@Override
	public ArrayList<RentalVO> impossibletime(RentalVO rentalVO) throws Exception {
		return rentalMapper.impossibletime(rentalVO); 
	}

	
	
}
