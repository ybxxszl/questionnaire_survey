package com.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.UserBiz;
import com.dao.UserMapper;
import com.vo.User;
import com.vo.UserExample;
import com.vo.UserExample.Criteria;

@Service
public class UserBizimpl implements UserBiz {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 用户注册
	 */
	@Override
	public User registerUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:registerUser请求。。。");
		
		userMapper.insert(user);//将user存入数据库
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountEqualTo(user.getAccount());//根据account找到刚刚注册的user
		
		User u = userMapper.selectByExample(example).get(0);//返回user
		
		System.out.println("User:" + u.toString());
		
		return u;
		
	}

	/**
	 * 判断账号是否存在
	 */
	@Override
	public boolean judgeAccount(String account) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:judgeAccount请求。。。");
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountEqualTo(account);//判断数据库中是否有相同account的用户
		
		List<User> list = userMapper.selectByExample(example);
		
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
		
	}

	/**
	 * 用户登录
	 */
	@Override
	public User loginUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:loginUser请求。。。");
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountEqualTo(user.getAccount());
		criteria.andPasswordEqualTo(user.getPassword());//查看数据库中是否有账号和密码完全相同的用户，并返回
		
		List<User> list = userMapper.selectByExample(example);
		
		if(list.size()  == 0) {
			return null;
		} else {
			return list.get(0);
		}
		
	}

	/**
	 * 用户修改
	 */
	@Override
	public User changeUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("迟来的biz:changeUser请求。。。");
		
		userMapper.updateByPrimaryKey(user);//修改对应user
		
		User u = userMapper.selectByPrimaryKey(user.getUserId());//根据userId获取对应user
		
		System.out.println("User:" + u.toString());
		
		return u;
		
	}

}
