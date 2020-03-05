package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.Employee;

@Service
public interface EmployeeService {

	int addemployee(Employee employee);
	List<Employee>findEmployees();
	Employee findEmployee(String id);
	int updateEmployee(Employee employee);
	int deleteEmployee(int[] id);
	List<Employee> findEmployeeLike(Employee employee);
	
}
