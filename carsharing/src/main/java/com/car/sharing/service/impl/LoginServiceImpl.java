package com.car.sharing.service.impl;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.sharing.mapper.LoginMapper;
import com.car.sharing.service.LoginService;
import com.car.sharing.vo.UserVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	final Logger logger = LoggerFactory.getLogger(this.getClass()); //로그확인
	
	@Autowired LoginMapper loginMapper;

	//로그인 - id,pw 체크
	@Override
	public int loginCheck(UserVO userVO, HttpSession session) throws Exception {
		UserVO result = loginMapper.loginCheck(userVO);
		
		//result값이 있으면 userVO에 값을 넣어 1을 return하고 값이 없으면 0을 return한다.
		if(result != null) {
			session.setAttribute("userVO", result);
			//logger.info("##############result############## : "+userVO);
			return 1;
		}
		return 0;
	}

}
