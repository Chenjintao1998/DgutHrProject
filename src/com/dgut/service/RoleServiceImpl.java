package com.dgut.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Role;
import com.dgut.bean.RoleExample;
import com.dgut.mapper.RoleMapper;
@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleMapper mapper;
	private RoleExample example=new RoleExample();
	
	
	public List<Role> findRoles() {

		return mapper.selectByExample(example);
	}

	@Override
	public int selectbyrole(String role) {
		// TODO Auto-generated method stub
		/*Criteria criteria=example.createCriteria();
		example.clear();
		criteria.andPhoneEqualTo(phone);*/
		int i=0;
		//int num=0;
		List<Role> roles=new ArrayList<Role>();
		roles=mapper.selectByExample(example);
		for (Role role1 : roles) {
			if(role1.getName().equals(role))
			{	
				i=1;
				//num++;
				System.out.println(role);
			}
			
		}
		//System.out.println(num);
		return i;
	}

}
