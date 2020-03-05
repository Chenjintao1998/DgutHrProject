package com.dgut.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dgut.bean.Menu;

public interface RoleMenuMapper {
	public List<Menu> selectRoleMenu(@Param("id") Integer id);
	public List<Menu> selectChildren(Integer parentId);
}
