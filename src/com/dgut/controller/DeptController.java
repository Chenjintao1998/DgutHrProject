package com.dgut.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dgut.bean.Dept;
import com.dgut.bean.Job;
import com.dgut.bean.Role;
import com.dgut.service.DeptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService service;
	

	@RequestMapping("dept_search")
	public String dept_search() {
		
		return "dept_search";
	}
	@RequestMapping("dept_add")
	public String job_add() {
		
		return "dept_add";
	}
	
	@RequestMapping(value="getdept",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getdept(int page,int rows) {
		
		
		
		PageHelper.startPage(page,rows);
		
		List<Dept> list=service.findDept();
		
		String listjson=JSON.toJSONString(list);
		
		PageInfo info=new PageInfo<>(list);
		long total=info.getTotal();
		
		
		list.forEach(li->System.out.println("++>"+li));
		
		String json="{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		
		
		return json;
		
		
	}
	
	@RequestMapping(value="findDepts",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findDepts() {
		

		List<Dept> list=service.findDept();
		
		Dept dept=new Dept();
		dept.setId(0);
		dept.setName("«Î—°‘Ò≤ø√≈");
		List<Dept> list1 = new ArrayList<Dept>();
		list1.add(dept);
		list1.addAll(list);
		String json = JSON.toJSONString(list1);
		
		
		
		return json;
		
		
	}
	

	@RequestMapping(value="/updatedept",produces="application/json;charset=utf-8")
	@ResponseBody
	public String updatedept(Dept dept) {
		 int in=service.updateDept (dept);
		
		 String reInfo="0";
		 if(in>0) {
			 
			 reInfo="1";
		 }
		 return reInfo;
		 
		
	}
	
	@RequestMapping(value="/findDeptLike",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findDeptLike(Dept dept,int page,int rows) {
		
		
		PageHelper.startPage(page,rows);
	
		List<Dept> list=service.findDeptLike(dept);
	    String listjson=JSON.toJSONString(list);
		
		PageInfo info=new PageInfo<>(list);
		long total=info.getTotal();
		//System.out.println("-----ÔøΩÔøΩÔøΩÔøΩ"+total);
		
	
		String json="{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		System.out.println(json);
		
		return json;
		
		
		
	}
	
	@RequestMapping(value="deptidAjax")
	@ResponseBody
	public String deptidAjax(String id){
		
		int i =  Integer.parseInt(id);
		Dept dept1=new Dept();
		dept1=service.finddeptid(i);
		if(dept1==null){
			return "0";
		}
		return "1";
	}
	@RequestMapping(value = "deptAjax")
	@ResponseBody
	public String deptAjax(String dept) {

		//System.out.println(role);

		int i = service.selectbydept(dept);
		System.out.println(i);
		if (i == 1) {
			
			return "0";
		}

		return "1";
	}
	
	
	
	@RequestMapping("/adddept")
	@ResponseBody
	public String adddept(Dept dept,Model model) {		
	
		int n=service.adddept(dept);		
		String addInfo="0";
		if(n>0) {			
				addInfo="1";			
		}
		model.addAttribute("addInfo",addInfo);
		return addInfo;
		
		
	}
	
	
}

