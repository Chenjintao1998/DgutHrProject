package com.dgut.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dgut.bean.Role;
import com.dgut.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	private RoleService service;
	
	
	@RequestMapping(value = "/findRoles", produces = "aplication/json;charset=utf-8")
	@ResponseBody
	public String findRoles() {

		List<Role> list = service.findRoles();
		
		Role role=new Role();
		role.setId(0);
		role.setName("«Î—°‘Ò…Ì∑›");
		List<Role> list1 = new ArrayList<Role>();
		list1.add(role);
		list1.addAll(list);
		//list1.forEach(li->System.out.println(li));
		//list.forEach(li->System.out.println(li));
		String json = JSON.toJSONString(list1);
		return json;
	}

	@RequestMapping(value = "roleAjax")
	@ResponseBody
	public String roleAjax(String role) {

		//System.out.println(role);

		int i = service.selectbyrole(role);
		System.out.println(i);
		if (i == 1) {
			
			return "0";
		}

		return "1";
	}

}
