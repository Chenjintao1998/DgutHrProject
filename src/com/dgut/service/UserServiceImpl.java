package com.dgut.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.User;
import com.dgut.bean.UserExample;
import com.dgut.bean.UserExample.Criteria;
import com.dgut.mapper.UserCustomMapper;
import com.dgut.mapper.UserMapper;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserCustomMapper customMapper;
	
	private UserExample example=new UserExample();
	//Criteria criteria=noticeExample.createCriteria();
	@Override
	public User login(String username) {
		// TODO Auto-generated method stub
		example.clear();
		Criteria criteria=example.createCriteria();
		criteria.andPhoneEqualTo(username);
		List<User> user=mapper.selectByExample(example);
		System.out.println("--------------->"+user.size());
		if(user!=null&&user.size()>=1){
			System.out.println("--------------->"+user);
			return user.get(0);
		}		
		return mapper.selectByPrimaryKey(username);
	}
	
	public int adduser(User user) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(user);
	}

	@Override
	public int selectbyphone(String phone) {
		// TODO Auto-generated method stub
		/*Criteria criteria=example.createCriteria();
		example.clear();
		criteria.andPhoneEqualTo(phone);*/
		int i=0;
		//int num=0;
		List<User> users=new ArrayList<User>();
		users=mapper.selectByExample(example);
		for (User user : users) {
			if(user.getPhone().equals(phone))
			{	
				i=1;
				//num++;
			}
			//System.out.println(user);
		}
		//System.out.println(num);
		return i;
		
	}

	@Override
	public List<User> findUsers() {
		// TODO Auto-generated method stub
		//return mapper.selectByExample(new UserExample());
		return customMapper.findUserAndRoleName();
	}

	
	@Override
	public List<User> findUserLike(User user) {
		// TODO Auto-generated method stub
		  //example.clear();
		/*
		 * Criteria criteria=example.createCriteria();
		 * criteria.andNumberLike("%"+user.getNumber()+"%");
		 * criteria.andUsernameLike("%"+user.getUsername()+"%");
		 * criteria.andPhoneLike("%"+user.getPhone()+"%"); if(user.getRoleId()!=null)
		 * criteria.andRoleIdEqualTo(user.getRoleId()); example.or();
		 */
		 
		
		
		return customMapper.findUserLike(user);
	}

	@Override
	public int deleteUser(String[] id) {
		// TODO Auto-generated method stub
		int i;
		for (i = 0; i < id.length; i++) {
			mapper.deleteByPrimaryKey(id[i]);
			
		}
		if(i==id.length)
			return 1;
		else {
			return 0;
		}
	}
	
	/*
	 * @Override public int selectbyemail(String email) { // TODO Auto-generated
	 * method stub int i=0; //int num=0; List<User> users=new ArrayList<User>();
	 * users=mapper.selectByExample(example); for (User user : users) {
	 * if(user.getEmail().equals(email)) { i=1; //num++; }
	 * //System.out.println(user); } //System.out.println(num); return i; }
	 */

	@Override
	public User findUser(String number) {
		// TODO Auto-generated method stub
		
		return customMapper.findUser(number);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(user);
	}
}
