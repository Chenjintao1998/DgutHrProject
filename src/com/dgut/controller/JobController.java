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
import com.dgut.bean.User;
import com.dgut.service.JobService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
public class JobController {


	@Autowired
	private JobService service;
	
	

	@RequestMapping("job_search")
	public String job_search() {
		
		return "job_search";
	}
	@RequestMapping("job_add")
	public String job_add() {
		
		return "job_add";
	}


	@RequestMapping(value="/getjob",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getjob(int page,int rows) {
		
		
		
		PageHelper.startPage(page,rows);
		
		List<Job> list=service.findjob();
		
		String listjson=JSON.toJSONString(list);
		
		PageInfo info=new PageInfo<>(list);
		long total=info.getTotal();
	
		
		list.forEach(li->System.out.println("++>"+li));

		String json="{\"total\":"+total+",\"rows\":"+listjson+"}";
		

		
		return json;
		
		
	}
	
	@RequestMapping(value="findJobs",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findJobs() {
		

		List<Job> list=service.findjob();
		
		Job dept=new Job();
		dept.setId(0);
		dept.setName("«Î—°‘Ò÷∞Œª");
		List<Job> list1 = new ArrayList<Job>();
		list1.add(dept);
		list1.addAll(list);
		String json = JSON.toJSONString(list1);
		
		
		
		return json;
		
		
	}
	
	
	@RequestMapping(value="/updatejob",produces="application/json;charset=utf-8")
	@ResponseBody
	public String updatejob(Job job) {
		 int in=service.updateJob(job);
		
		 String reInfo="0";
		 if(in>0) {
			 
			 reInfo="1";
		 }
		 return reInfo;
		 
		
	}
	
	@RequestMapping(value="/findJobLike",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findJobLike(Job job,int page,int rows) {
		
		
		PageHelper.startPage(page,rows);
	
		List<Job> list=service.findJobLike(job);
	    String listjson=JSON.toJSONString(list);
		
		PageInfo info=new PageInfo<>(list);
		long total=info.getTotal();
		System.out.println("-----ÔøΩÔøΩÔøΩÔøΩ"+total);
		
	
		String json="{\"total\":"+total+",\"rows\":"+listjson+"}";
		
		System.out.println(json);
		
		return json;
		
		
		
	}
	
	@RequestMapping(value="jobidAjax")
	@ResponseBody
	public String jobidAjax(String id){
		
		int i =  Integer.parseInt(id);
		Job job1=new Job();
		job1=service.findjobid(i);
		if(job1==null){
			return "0";
		}
		return "1";
	}
	
	@RequestMapping(value = "jobAjax")
	@ResponseBody
	public String jobAjax(String job) {

		//System.out.println(role);

		int i = service.selectbyjob(job);
		System.out.println(i);
		if (i == 1) {
			
			return "0";
		}

		return "1";
	}
	
	@RequestMapping("/addjob")
	@ResponseBody
	public String adduser(Job job,Model model) {
		
	
		int n=service.addjob(job);
		
		String addInfo="0";
		if(n>0) {
			
				addInfo="1";
			
		}
		model.addAttribute("addInfo",addInfo);
		
		System.out.println(job);
		return addInfo;
		
		
	}
	
	
	
}
