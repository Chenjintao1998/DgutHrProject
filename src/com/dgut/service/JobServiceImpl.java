package com.dgut.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Job;
import com.dgut.bean.JobExample;

import com.dgut.mapper.JobMapper;
@Service
public class JobServiceImpl implements JobService{
    @Autowired
    private JobMapper mapper;
    
    
	
	
	@Override
	public List<Job> findjob() {
		// TODO Auto-generated method stub
		List<Job> list=mapper.selectByExample(new JobExample());
		return list;
	}

	@Override
	public int updateJob(Job job) {
		// TODO Auto-generated method stub
		
		return mapper.updateByPrimaryKeySelective(job);
	}

	@Override
	public List<Job> findJobLike(Job job) {
		
		JobExample example=new JobExample();
		
		example.clear();
		if(job.getId()==null&&(job.getName()==null||"".equals(job.getName()))){
			return null;
		}
		com.dgut.bean.JobExample.Criteria criteria=example.createCriteria();
		criteria.andNameLike("%"+job.getName()+"%");	
		if(job.getId()!=null) {
			criteria.andIdEqualTo(job.getId());
		}		
	    example.or();
		
		return mapper.selectByExample(example);
		
	}

	@Override
	public Job findjobid(int id) {
		
		// TODO Auto-generated method stub
	
		return 	mapper.selectByPrimaryKey(id);
	}

	@Override
	public int addjob(Job job) {
		
		return mapper.insert(job);
	}

	@Override
	public int selectbyjob(String job) {
		JobExample example=new JobExample();
		int i=0;
		//int num=0;
		List<Job> jobs=new ArrayList<Job>();
		jobs=mapper.selectByExample(example);
		for (Job job1 : jobs) {
			if(job1.getName().equals(job))
			{	
				i=1;
				//num++;
				System.out.println(job1);
			}
			
		}
		//System.out.println(num);
		return i;
	}

}
