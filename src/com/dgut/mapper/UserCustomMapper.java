package com.dgut.mapper;

import java.util.List;

import com.dgut.bean.User;

public interface UserCustomMapper {
	List<User> findUserAndRoleName();
	List<User> findUserLike(User user);
	User findUser(String number);
}
