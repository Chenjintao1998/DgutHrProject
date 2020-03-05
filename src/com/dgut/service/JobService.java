package com.dgut.service;

import java.util.List;

import com.dgut.bean.Job;
import com.dgut.bean.User;

public interface JobService {

	public List<Job> findjob();

	public int updateJob(Job job);

	public List<Job> findJobLike(Job job);

	public Job findjobid(int id);

	public int addjob(Job job);
	
	int selectbyjob(String job);
}
