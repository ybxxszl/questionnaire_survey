package com.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.UserLoginLogBiz;
import com.dao.UserLoginLogMapper;
import com.vo.UserLoginLog;

@Service
public class UserLoginLogBizimpl implements UserLoginLogBiz {

	@Autowired
	private UserLoginLogMapper userloginlogMapper;
	
	/**
	 * 记录登录日志
	 */
	@Override
	public void setUserLoginLog(UserLoginLog userloginlog) {
		// TODO Auto-generated method stub
		userloginlogMapper.insert(userloginlog);
		
	}

}
