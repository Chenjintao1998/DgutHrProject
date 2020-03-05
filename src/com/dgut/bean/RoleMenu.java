package com.dgut.bean;

import java.util.List;

public class RoleMenu {
	
	private Integer id;
	private String name;
	private String iconUrl;
	public String getIconUrl() {
		return iconUrl;
	}
	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
	private List<Menu> childs;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RoleMenu other = (RoleMenu) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public List<Menu> getChilds() {
		return childs;
	}
	public void setChilds(List<Menu> childs) {
		this.childs = childs;
	}
	@Override
	public String toString() {
		return "RoleMenu [id=" + id + ", name=" + name + ", childs=" + childs + "]";
	}

}
