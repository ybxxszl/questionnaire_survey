package com.biz;

import com.vo.User;

public interface UserBiz {
	
	User registerUser(User user);

	boolean judgeAccount(String account);

	User loginUser(User user);

	User changeUser(User user);

}
