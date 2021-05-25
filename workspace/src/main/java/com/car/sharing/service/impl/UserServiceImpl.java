package com.car.sharing.service.impl;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.sharing.mapper.UserMapper;
import com.car.sharing.service.UserService;
import com.car.sharing.vo.CarLocationRentalVO;
import com.car.sharing.vo.RentalVO;
import com.car.sharing.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	final Logger logger = LoggerFactory.getLogger(this.getClass()); //로그확인
	
	@Autowired UserMapper userMapper;
	
	//회원가입 - 아이디 중복체크
	@Override
	public int idCheck(UserVO userVO) throws Exception {
		return userMapper.idCheck(userVO);
	}

	//회원가입 - 핸드폰번호 중복체크
	@Override
	public int phoneCheck(UserVO userVO) throws Exception {
		return userMapper.phoneCheck(userVO);
	}

	//회원가입 - 면허증번호 중복체크
	@Override
	public int licenseCheck(UserVO userVO) throws Exception {
		return userMapper.licenseCheck(userVO);
	}

	//회원가입 - 유저정보 insert
	@Override
	public int joinUser(UserVO userVO) throws Exception {
		return userMapper.joinUser(userVO);
	}

	//차량 예약 내역 가져오기	
	@Override
	public ArrayList<CarLocationRentalVO> reservationList(UserVO userVO) throws Exception {
		return userMapper.reservationList(userVO);
	}

	//차량 예약취소
	@Override
	public int reservationCancel(RentalVO rentalVO) throws Exception {
		return userMapper.reservationCancel(rentalVO);
	}

	//비밀번호 변경
	@Override
	public int pwChange(UserVO userVO) throws Exception {
		return userMapper.pwChange(userVO);
	}

}
