package com.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.biz.UserBiz;
import com.biz.UserLoginLogBiz;
import com.format.DataConvert;
import com.vo.User;
import com.vo.UserLoginLog;

@Controller
public class UserControl {

	@Autowired
	private UserBiz userBiz;

	@Autowired
	private UserLoginLogBiz userloginlogBiz;

	/**
	 * 用户注册
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/registerUser")
	public String registerUser(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model, User user) {

		System.out.println("迟来的web:registerUser请求。。。");

		DataConvert dataConvert = new DataConvert();// 创建String转为data的对象

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birthday = year + "-" + month + "-" + day;

		user.setUserId(getUUID());
		user.setBirthday(dataConvert.convert(birthday));// String转为data
		user.setPhoto("logo.jpg");
		user.setState(1);

		System.out.println("User:" + user.toString());

		userBiz.registerUser(user);

		return "index.jsp";

	}

	/**
	 * 判断账号是否存在
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/judgeAccount")
	@ResponseBody
	public String judgeAccount(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model, String account) {

		System.out.println("迟来的web:judgeAccount请求。。。");

		boolean flag = userBiz.judgeAccount(account);// 判断账号

		System.out.println("judgeAccount:" + flag);

		if (flag) {
			return "true";
		} else {
			return "false";
		}

	}

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/loginUser")
	@ResponseBody
	public String loginUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model,
			User user) {

		System.out.println("迟来的web:loginUser请求。。。");

		UserLoginLog userloginlog = new UserLoginLog();

		String msg = "";

		String verifyCode = (String) session.getAttribute("code");// 获取验证码
		String code = request.getParameter("code");
		String autoLogin = request.getParameter("autoLogin");
		System.out.println("verifyCode:" + verifyCode + "  code:" + code + "  autoLogin:" + autoLogin);
		if (verifyCode.equalsIgnoreCase(code)) {

			User u = userBiz.loginUser(user);

			if (u == null) {

				userloginlog = insertUserLoginLog(user, "2");

				msg = "账号或密码错误，登录失败";

				System.out.println(msg);

			} else if (u.getState() == 0) {

				userloginlog = insertUserLoginLog(user, "3");

				msg = "账号已被冻结，登录失败";

				System.out.println(msg);

			} else {

				// 将user存入cookie
				if ("autoLogin".equals(autoLogin)) {

					Cookie caccount = new Cookie("account", u.getAccount());
					Cookie cpassword = new Cookie("password", u.getPassword());

					response.addCookie(caccount);
					response.addCookie(cpassword);

				}

				session.setAttribute("user_session", u);// 将user存入session

				System.out.println("User:" + u.toString());

				userloginlog = insertUserLoginLog(user, "4");

				System.out.println("登录成功");

			}

		} else {

			userloginlog = insertUserLoginLog(user, "1");

			msg = "验证码错误，登录失败";

			System.out.println(msg);

		}

		userloginlogBiz.setUserLoginLog(userloginlog);// 记录登录日志

		if ("".equals(msg)) {

			try {
				response.sendRedirect("index.jsp");// 登录成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("IO异常");
				e.printStackTrace();
			}

		}

		return msg;// 登录失败

	}

	/**
	 * 用户退出
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/exitUser")
	public String exitUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {

		System.out.println("迟来的web:exitUser请求。。。");

		session.setAttribute("user_session", null);// 将session中user存为null

		return "index.jsp";

	}

	/**
	 * 用户修改
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/changeUser")
	public String changeUser(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model,
			User user, MultipartFile file) {

		System.out.println("迟来的web:changeUser请求。。。");

		User u = (User) session.getAttribute("user_session");// 获取userId、account、state

		user.setUserId(u.getUserId());
		user.setAccount(u.getAccount());
		user.setState(u.getState());

		DataConvert dataConvert = new DataConvert();// 创建String转为data的对象

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String birthday = year + "-" + month + "-" + day;

		user.setBirthday(dataConvert.convert(birthday));// String转为data

		// 关于头像
		String path = request.getSession().getServletContext().getRealPath("") + File.separator + "image"
				+ File.separator + "photo" + File.separator;
		File f = new File(path);
		if (!f.exists()) {// 没有对应文件夹则创建
			f.mkdirs();
		}
		if (file.isEmpty()) {
			user.setPhoto(u.getPhoto());
		} else {
			String filename = file.getOriginalFilename();// 获取文件名
			String photo = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			System.out.println("photo:" + filename);
			try {
				file.transferTo(new File(path + photo));// 复制文件并重命名
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				System.out.println("无效状态异常");
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("IO异常");
				e.printStackTrace();
			}

			user.setPhoto(photo);
		}

		System.out.println("User:" + user.toString());

		u = userBiz.changeUser(user);// 修改user并返回

		session.setAttribute("user_session", u);// 将user存入session

		return "showuser.jsp";

	}

	/**
	 * 将user转换成UserLoginLog
	 * 
	 * @param user
	 * @param n
	 * @return
	 */
	private UserLoginLog insertUserLoginLog(User user, String n) {
		// TODO Auto-generated method stub
		Date data = new Date();

		UserLoginLog userloginlog = new UserLoginLog();

		userloginlog.setUserLoginLogId(getUUID());
		userloginlog.setUserLoginAccount(user.getAccount());
		userloginlog.setUserLoginResultId(n);// 对应user_login_result
		userloginlog.setUserLoginTime(data);// 获取时间

		System.out.println("UserLoginLog:" + userloginlog.toString());

		return userloginlog;
	}

	public String getUUID() {

		UUID uuid = UUID.randomUUID();

		String temp = uuid.toString();

		return temp;

	}// 获取UUID

}
