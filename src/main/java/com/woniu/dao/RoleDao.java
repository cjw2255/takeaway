package com.woniu.dao;

import java.util.List;

import com.woniu.pojo.PageBean;
import com.woniu.pojo.Role;

public interface RoleDao {

	List<Role> findAll(PageBean<Role> pageBean);

	int getTotalCount(PageBean<Role> pageBean);

	void roleSave(Role role);

	Role findOne(Integer rid);

	void roleUpdate(Role role);

	void deleteRole(Integer rid);

	void delRoles(Integer[] rids);

	List<Role> selectRole();

}
