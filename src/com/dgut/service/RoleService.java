package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.Role;
@Service
public interface RoleService {
	
	List<Role> findRoles();

	int selectbyrole(String role);

	
}
