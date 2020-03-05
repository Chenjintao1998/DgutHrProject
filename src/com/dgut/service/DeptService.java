package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.Dept;


@Service
public interface DeptService {

	
	List<Dept> findDept();
	public int updateDept(Dept dept);

	public List<Dept> findDeptLike(Dept dept);

	public Dept finddeptid(int id);

	public int adddept(Dept dept);

	int selectbydept(String dept);
}
