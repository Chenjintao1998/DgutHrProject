package com.dgut.mapper;

import java.util.List;

import com.dgut.bean.Employee;

public interface EmployeeCustomMapper {
	List<Employee> findEmployees();

	Employee findEmployee(String id);

	List<Employee> findEmployeeLike(Employee employee);
}
