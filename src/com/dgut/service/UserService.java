package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.User;
@Service
public interface UserService {
	User login(String username);
	int selectbyphone(String phone);
	//int selectbyemail(String email);
	int adduser(User user);
	List<User> findUsers();
	List<User> findUserLike(User user);
    int deleteUser(String[] id);
	User findUser(String number);
	int updateUser(User user);
}
