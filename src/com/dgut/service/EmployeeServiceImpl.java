package com.dgut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Employee;
import com.dgut.mapper.EmployeeCustomMapper;
import com.dgut.mapper.EmployeeMapper;


@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeMapper mapper;
	
	
	
	
   @Autowired 
   private EmployeeCustomMapper customMapper;
	 
	
	
	@Override
	public int addemployee(Employee employee) {
		// TODO Auto-generated method stub

		return mapper.insertSelective(employee);
	}

	@Override
	public List<Employee> findEmployees() {
		// TODO Auto-generated method stub
		
		
		return customMapper.findEmployees();
	}

	@Override
	public Employee findEmployee(String id) {
		// TODO Auto-generated method stub
		return customMapper.findEmployee(id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(employee);
	}

	@Override
	public int deleteEmployee(int[] id) {
		// TODO Auto-generated method stub
		int i=0;
		for (i = 0; i < id.length; i++) {
		mapper.deleteByPrimaryKey(id[i]);
		
		}
		if(i==id.length)
			return 1;
		else {
			return 0;
		}
	}

	@Override
	public List<Employee> findEmployeeLike(Employee employee) {
		// TODO Auto-generated method stub
		return customMapper.findEmployeeLike(employee);
	}

}
