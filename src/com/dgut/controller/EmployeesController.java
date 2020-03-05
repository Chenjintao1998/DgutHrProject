package com.dgut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dgut.bean.Employee;
import com.dgut.bean.User;
import com.dgut.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeeService service;
	

	@RequestMapping("employees_search")
	public String employees_search() {
		
		return "employees_search";
	}
	@RequestMapping("employees_add")
	public String employees_add() {
		
		return "employees_add";
	}
	
	
	@RequestMapping("/addemployee")
	@ResponseBody
	public String addemployees(Employee employee,Model model) {
		int n=service.addemployee(employee);
		System.out.println(employee);
		String addInfo="0";
		if(n>0) {
			
				addInfo="1";
			
		}
		model.addAttribute("addInfo",addInfo);

		return addInfo;
		
		
	}
	@RequestMapping(value ="findEmployees",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findEmployees(int page,int rows) {

		PageHelper.startPage(page,rows);
		List<Employee> employees=service.findEmployees();
		
		String employeesjson=JSON.toJSONString(employees);
		PageInfo<Employee> info=new PageInfo<>(employees);
		long total=info.getTotal();
		
		  for (Employee employee : employees) { System.out.println("==-==="+employee); }
		 
		String json="{\"total\":"+total+",\"rows\":"+employeesjson+"}";
		System.out.println("==-==="+json);
		return json;
		
		

	}	
	@RequestMapping(value ="findEmployee",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findEmployee(String id) {
		
		Employee employee=service.findEmployee(id);
		
		//System.out.println(employee);
		String employeejson=JSON.toJSONString(employee);
		
		
		  //System.out.println("==-==="+employeejson); 
		  
		 
		return employeejson;
		
		

	}
	@RequestMapping(value ="updateEmployee",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateEmployee(Employee employee) {
		
		
		
		Employee employee_time=service.findEmployee(employee.getId().toString());
		employee.setCreateDate(employee_time.getCreateDate());
	
		
		int i=service.updateEmployee(employee);
		
		if(i==1)
			return "1";
		else {
			return "0";
		}
		
		

	}	
	@RequestMapping(value ="deleteEmployee",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteEmployee(int[] id) {
		
		
		int i=service.deleteEmployee(id);
		

		if(i==1)
			return "1";
		else {
			return "0";
		}
		
		

	}	
	@RequestMapping(value ="findEmployeeLike",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findEmployeeLike(Employee employee,int page,int rows) {
		
		
		PageHelper.startPage(page,rows);
		
		
		if(employee.getName()!=null&&employee.getName()!="")
			employee.setName("%"+employee.getName()+"%");
		/*
		 * if(user.getEmail()!=null&&user.getEmail()!="")
		 * user.setEmail("%"+user.getEmail()+"%");
		 */
		//System.out.println("-----------------------------"+user);
		List<Employee> employees=service.findEmployeeLike(employee);
		
		String employeesjson=JSON.toJSONString(employees);
		PageInfo<Employee> info=new PageInfo<>(employees);
		long total=info.getTotal();
		
	
		 
		String json="{\"total\":"+total+",\"rows\":"+employeesjson+"}";
		//System.out.println(json);
		return json;
		
		

	}	
	
	
	
}
