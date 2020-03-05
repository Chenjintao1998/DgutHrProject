package com.dgut.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Dept;
import com.dgut.bean.DeptExample;
import com.dgut.bean.Role;
import com.dgut.mapper.DeptMapper;
@Service
public class DeptServiceImpl implements DeptService{

	@Autowired
	private DeptMapper mapper;
	
	

	@Override
	public List<Dept> findDept() {
		List<Dept>list=mapper.selectByExample(new DeptExample());
		return list;
	}


	@Override
	public List<Dept> findDeptLike(Dept dept) {
			
		DeptExample example=new DeptExample();
		
		if(dept.getId()==null&&(dept.getName()==null||"".equals(dept.getName()))){
			return null;
		}
		com.dgut.bean.DeptExample.Criteria criteria=example.createCriteria();
		criteria.andNameLike("%"+dept.getName()+"%");	
		if(dept.getId()!=null) {
			criteria.andIdEqualTo(dept.getId());
		}		
	    example.or();
	   
		return mapper.selectByExample(example);
		
	}


	@Override
	public int updateDept(Dept dept) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(dept);
	}


	@Override
	public Dept finddeptid(int id) {
		// TODO Auto-generated method stub
		return 	mapper.selectByPrimaryKey(id);
	}


	@Override
	public int adddept(Dept dept) {
		// TODO Auto-generated method stub
		return mapper.insert(dept);
	}


	@Override
	public int selectbydept(String dept) {
		DeptExample example=new DeptExample();
		int i=0;
		//int num=0;
		List<Dept> depts=new ArrayList<Dept>();
		depts=mapper.selectByExample(example);
		for (Dept dept1 : depts) {
			if(dept1.getName().equals(dept))
			{	
				i=1;
				//num++;
				System.out.println(dept1);
			}
			
		}
		//System.out.println(num);
		return i;
	}
   

}
