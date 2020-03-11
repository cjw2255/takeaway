package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.RoleDao;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Role;
import com.woniu.service.IRoleService;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
	@Autowired
	RoleDao roleDao;
	@Override
	public List<Role> findAll(PageBean<Role> pageBean) {
		// TODO Auto-generated method stub
		List<Role> roleList = roleDao.findAll(pageBean);
		return roleList;
	}
	@Override
	public int getTotalCount(PageBean<Role> pageBean) {
		// TODO Auto-generated method stub
		int totalCount = roleDao.getTotalCount(pageBean);
		return totalCount;
	}
	@Override
	public void roleSave(Role role) {
		// TODO Auto-generated method stub
		roleDao.roleSave(role);
	}
	@Override
	public Role findOne(Integer rid) {
		// TODO Auto-generated method stub
		Role role = roleDao.findOne(rid);
		return role;
	}
	@Override
	public void roleUpdate(Role role) {
		// TODO Auto-generated method stub
		roleDao.roleUpdate(role);
	}
	@Override
	public void deleteRole(Integer rid) {
		// TODO Auto-generated method stub
		roleDao.deleteRole(rid);
	}
	@Override
	public void delRoles(Integer[] rids) {
		// TODO Auto-generated method stub
		roleDao.delRoles(rids);
	}
	@Override
	public List<Role> selectRole() {
		// TODO Auto-generated method stub
		List<Role> roleList = roleDao.selectRole();
		return roleList;
	}

}
