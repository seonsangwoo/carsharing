package com.car.sharing.service;

import javax.servlet.http.HttpSession;

import com.car.sharing.vo.UserVO;

public interface LoginService {

	//로그인 - id,pw 체크
	int loginCheck(UserVO userVO, HttpSession session) throws Exception;

}
