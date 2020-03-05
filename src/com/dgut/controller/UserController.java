package com.dgut.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dgut.bean.RoleMenu;
import com.dgut.bean.User;
import com.dgut.service.RoleMenuService;
import com.dgut.service.UserService;
import com.dgut.utils.HttpUtils;
import com.dgut.utils.RandomNumberUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private RoleMenuService roleMenuService;
	
	@RequestMapping("index")
	public String login2() {
		
		return "login";
	}
	
	@RequestMapping("main")
	public String main() {
		
		return "main";
	}
	@RequestMapping("user_search")
	public String User_search() {
		
		return "user_search";
	}
	@RequestMapping("user_add")
	public String User_add() {
		
		return "user_add";
	}
	

	@RequestMapping("/login")
	public String login(String username, String password, HttpSession session, Model model) {
		String loginInfo = null;

		User user = service.login(username);

		if (user != null) {
			if (password.equals(user.getPassword())) {
				List<RoleMenu> menus = roleMenuService.getRoleMenuList(user.getRoleId());
				menus.forEach(item -> System.out.println(item));
				model.addAttribute("menus", menus);
				session.setAttribute("user", user);
				return "main";
			} else {
				loginInfo = "密码错误";
			}
		} else {
			loginInfo = "用户名不存在";
		}
		model.addAttribute("loginInfo", loginInfo);

		return "login";

	}

	@RequestMapping(value = "sendCode")
	@ResponseBody
	public String sendCode(String phone, HttpSession session, HttpServletRequest request) {

		
		 String code = RandomNumberUtil.getCode(6);
		 System.out.println("------------"+code);
		 String result = postApi(phone,
		  code); JSONObject obj = JSON.parseObject(result); String resultCode =
		  obj.getString("Code"); return resultCode.equals("OK") ? code : "-1";
		


		/*
		 * String result = "{\r\n" + "  \"Message\": \"发送成功\",\r\n" +
		 * "  \"RequestId\": \"B26BB173-E569-46BD-B0A7-7EAF581C06D7\",\r\n" +
		 * "  \"BizId\": \"267610413312539060^0\",\r\n" + "  \"Code\": \"OK\"\r\n" +
		 * "}"; JSONObject obj = JSON.parseObject(result); String resultCode
		 * =obj.getString("Code"); System.out.println(resultCode); boolean flag =
		 * resultCode.equals("OK"); System.out.println(flag); return flag ? code : "-1";
		 */


	}

	private String postApi(String phone, String code) {
		String result = "";
		String host = "http://smsmsgs.market.alicloudapi.com";
		String path = "/smsmsgs";
		String method = "GET";
		String appcode = "451949725cf44401b46216040f77b76e";
		Map<String, String> headers = new HashMap<String, String>();
		// 最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
		headers.put("Authorization", "APPCODE " + appcode);
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("param", code);
		querys.put("phone", phone);
		querys.put("sign", "175622");
		querys.put("skin", "1");
		// JDK 1.8示例代码请在这里下载： http://code.fegine.com/Tools.zip

		try {
			/**
			 * 重要提示如下: HttpUtils请从
			 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
			 * 或者直接下载： http://code.fegine.com/HttpUtils.zip 下载
			 *
			 * 相应的依赖请参照
			 * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
			 * 相关jar包（非pom）直接下载： http://code.fegine.com/aliyun-jar.zip
			 */
			HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
			// System.out.println(response.toString());如不输出json, 请打开这行代码，打印调试头部状态码。
			// 状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误
			// 获取response的body
			result = EntityUtils.toString(response.getEntity());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/quit")
	public String quit(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("reuser");
		return "login";
	}

	@RequestMapping("/adduser")
	@ResponseBody
	public String adduser(User user, Model model) {
		int n = service.adduser(user);
		System.out.println(user);
		String addInfo = "0";
		if (n > 0) {

			addInfo = "1";

		}
		model.addAttribute("addInfo", addInfo);

		System.out.println(user);
		return addInfo;

	}

	@RequestMapping(value = "numberAjax")
	@ResponseBody
	public String numberAjax(String number) {
		System.out.println(number);
		User user = new User();
		user = service.login(number);
		System.out.println(user);
		if (user != null) {
			return "1";
		}

		return "0";
	}

	@RequestMapping(value = "phoneAjax")
	@ResponseBody
	public String phoneAjax(String phone) {
		// System.out.println(phone);

		int i = service.selectbyphone(phone);
		// System.out.println("hahahahahaha"+i);
		if (i == 1) {
			return "1";
		}

		return "0";
	}

	/*
	 * @RequestMapping(value = "emailAjax")
	 * 
	 * @ResponseBody public String emailAjax(String email) {
	 * //System.out.println(phone);
	 * 
	 * int i=service.selectbyemail(email); //System.out.println("hahahahahaha"+i);
	 * if(i==1) { return "1"; }
	 * 
	 * return "0"; }
	 */
	// 鍒嗛〉
	@RequestMapping(value = "findUsers", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findUsers(int page, int rows) {

		PageHelper.startPage(page, rows);

		List<User> users = service.findUsers();

		String usersjson = JSON.toJSONString(users);
		PageInfo<User> info = new PageInfo<>(users);
		long total = info.getTotal();

		for (User user : users) {
			System.out.println("==-===" + user);
		}

		String json = "{\"total\":" + total + ",\"rows\":" + usersjson + "}";
		return json;
	}

	@RequestMapping(value = "findUser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findUser(String number) {

		User user = service.findUser(number);

		String usersjson = JSON.toJSONString(user);

		System.out.println("==-===" + user);

		return usersjson;
	}

	@RequestMapping(value = "findUserLike", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findUserLike(User user, int page, int rows) {

		PageHelper.startPage(page, rows);

		if (user.getNumber() != null && user.getNumber() != "")
			user.setNumber("%" + user.getNumber() + "%");
		if (user.getPhone() != null && user.getPhone() != "")
			user.setPhone("%" + user.getPhone() + "%");
		if (user.getUsername() != null && user.getUsername() != "")
			user.setUsername("%" + user.getUsername() + "%");
		/*
		 * if(user.getEmail()!=null&&user.getEmail()!="")
		 * user.setEmail("%"+user.getEmail()+"%");
		 */
		// System.out.println("-----------------------------"+user);
		List<User> users = service.findUserLike(user);

		String usersjson = JSON.toJSONString(users);
		PageInfo<User> info = new PageInfo<>(users);
		long total = info.getTotal();

		for (User user1 : users) {
			System.out.println(user1);
		}

		String json = "{\"total\":" + total + ",\"rows\":" + usersjson + "}";
		// System.out.println(json);
		return json;
	}

	@RequestMapping(value = "deleteUser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteUser(String[] id) {

		int i = service.deleteUser(id);
		if (i == 1)
			return "1";
		else {
			return "0";
		}
	}

	@RequestMapping(value = "updateUser", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateUser(User user) {

		User user_time = service.findUser(user.getNumber());
		user.setCreatedate(user_time.getCreatedate());
		int i = service.updateUser(user);

		if (i == 1)
			return "1";
		else {
			return "0";
		}
	}
}
