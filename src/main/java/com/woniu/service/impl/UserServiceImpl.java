package com.woniu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woniu.dao.UserDao;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.User;
import com.woniu.service.IUserService;
@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	UserDao userDao;
	@Override
	public List<User> selectAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<User> list = userDao.selectAll(map);
		return list;
	}
	@Override
	public int getTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = userDao.getTotalCount(map);
		return totalCount;
	}
	@Override
	public void deleteUser(Integer uid) {
		// TODO Auto-generated method stub
		userDao.deleteUser(uid);
	}
	@Override
	public void delUsers(Integer[] uids) {
		// TODO Auto-generated method stub
		userDao.delUsers(uids);
	}
	@Override
	public User findOne(Integer uid) {
		// TODO Auto-generated method stub
		User user = userDao.findOne(uid);
		return user;
	}
	@Override
	public void resetPwd(User user) {
		// TODO Auto-generated method stub
		userDao.resetPwd(user);
	}
	@Override
	public void activation(User user) {
		// TODO Auto-generated method stub
		userDao.activation(user);
	}

}
