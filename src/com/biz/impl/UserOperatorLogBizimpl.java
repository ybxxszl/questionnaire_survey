package com.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.UserOperateLogBiz;
import com.dao.UserOperateLogMapper;
import com.vo.UserOperateLog;

@Service
public class UserOperatorLogBizimpl implements UserOperateLogBiz {

	@Autowired
	private UserOperateLogMapper userOperateLogMapper;
	
	/**
	 * 记录操作日志
	 */
	@Override
	public void setUserOperateLog(UserOperateLog userOperateLog) {
		// TODO Auto-generated method stub
		userOperateLogMapper.insert(userOperateLog);
	}

}
