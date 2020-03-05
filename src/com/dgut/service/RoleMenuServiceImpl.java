package com.dgut.service;

import java.awt.event.ItemEvent;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Menu;
import com.dgut.bean.RoleMenu;
import com.dgut.mapper.RoleMenuMapper;

@Service
public class RoleMenuServiceImpl implements RoleMenuService {
	
	@Autowired
	private RoleMenuMapper mapper;

	@Override
	public List<RoleMenu> getRoleMenuList(Integer id) {
		List<Menu> list = mapper.selectRoleMenu(id);
		list.forEach(item -> System.out.println(item));
		List<RoleMenu> result = new ArrayList<RoleMenu>();
		list.forEach(Menu -> {
			boolean flag = false;
			int index;
			for (index = 0; index < result.size(); index++) {
				if(result.get(index).getId() == Menu.getParentId()) {
					flag = true;
					break;
				}
			}
			if(flag) {
				result.get(index).getChilds().add(Menu);
			}else {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setId(Menu.getId());
				roleMenu.setName(Menu.getName());
				roleMenu.setChilds(new ArrayList<Menu>());
				roleMenu.setIconUrl(Menu.getIconUrl());
				result.add(roleMenu);
			}
		});
		return result;
		
		
	}

}
