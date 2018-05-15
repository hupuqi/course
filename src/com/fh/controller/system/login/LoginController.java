package com.fh.controller.system.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.User;
import com.fh.service.system.administrator.AdministratorService;
import com.fh.service.system.student.StudentService;
import com.fh.service.system.teacher.TeacherService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.RightsHelper;
import com.fh.util.Tools;

/*
 * 总入口
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name = "studentService")
	private StudentService studentService;
	@Resource(name = "administratorService")
	private AdministratorService administratorService;
	@Resource(name = "teacherService")
	private TeacherService teacherService;

	/**
	 * 访问登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login_toLogin")
	public ModelAndView toLogin() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value = "/login_login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",fh,");
		
		if (null != KEYDATA && KEYDATA.length == 3) {
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码

			String USERNAME = KEYDATA[0];
			String PASSWORD = KEYDATA[1];

			pd.put("USERNAME", USERNAME);
			String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString(); // 密码加密
			pd.put("PASSWORD", passwd);
			// 判断用户类型，然后去验证用户
			String type = KEYDATA[2];
			if (type != null) {
				User user = null;
				if (type.equals("1")) {
					// 学生
					pd = studentService.getUserByNameAndPwd(pd);
					if (pd != null) {
						user = new User();
						user.setUSER_ID(pd.getString("student_id"));
						user.setUSERNAME(pd.getString("student_no"));
						user.setPASSWORD(pd.getString("student_password"));
						user.setNAME(pd.getString("student_name"));
					} else {
						errInfo = "usererror"; // 用户名或密码有误
					}

				} else if (type.equals("2")) {
					// 老师
					pd = teacherService.getUserByNameAndPwd(pd);
					if (pd != null) {
						user = new User();
						user.setUSER_ID(pd.getString("teacher_id"));
						user.setUSERNAME(pd.getString("teacher_no"));
						user.setPASSWORD(pd.getString("teacher_password"));
						user.setNAME(pd.getString("teacher_name"));
					} else {
						errInfo = "usererror"; // 用户名或密码有误
					}
				} else if (type.equals("3")) {
					// 管理员
					pd = administratorService.getUserByNameAndPwd(pd);
					if (pd != null) {
						user = new User();
						user.setUSER_ID(pd.getString("administrator_id"));
						user.setUSERNAME(pd.getString("administrator_no"));
						user.setPASSWORD(pd.getString("administrator_password"));
						user.setNAME(pd.getString("administrator_name"));
					} else {
						errInfo = "usererror"; // 用户名或密码有误
					}
				}
				if (user != null) {
					session.removeAttribute(Const.USERTYPE);
					session.setAttribute(Const.USERTYPE, type);
					session.setAttribute(Const.SESSION_USER, user);
					session.removeAttribute(Const.SESSION_SECURITY_CODE);
					// shiro加入身份验证
					Subject subject = SecurityUtils.getSubject();
					UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD);
					try {
						subject.login(token);
					} catch (AuthenticationException e) {
						errInfo = "身份验证失败！";
					}
				}

			}

		} else {
			errInfo = "codeerror"; // 验证码输入有误
		}
		if (Tools.isEmpty(errInfo)) {
			errInfo = "success"; // 验证成功
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 访问系统首页
	 */
	@RequestMapping(value = "/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {

			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();

			User user = (User) session.getAttribute(Const.SESSION_USER);
			if (user != null) {
				mv.setViewName("system/admin/index");
				mv.addObject("user", user);
			} else {
				mv.setViewName("system/admin/login");// session失效后跳转登录页面
			}

		} catch (Exception e) {
			mv.setViewName("system/admin/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 进入tab标签
	 * 
	 * @return
	 */
	@RequestMapping(value = "/tab")
	public String tab() {
		return "system/admin/tab";
	}

	/**
	 * 进入首页后的默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login_default")
	public String defaultPage() {
		return "system/admin/default";
	}

	/**
	 * 用户注销
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();

		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");

		// shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		pd = this.getPageData();
		String msg = pd.getString("msg");
		pd.put("msg", msg);

		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd", pd);
		return mv;
	}

}
