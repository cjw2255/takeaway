package com.woniu.service;

import java.util.List;
import java.util.Map;

import com.woniu.pojo.PageBean;
import com.woniu.pojo.User;

public interface IUserService {

	List<User> selectAll(Map<String, Object> map);

	int getTotalCount(Map<String, Object> map);

	void deleteUser(Integer uid);

	void delUsers(Integer[] uids);

	User findOne(Integer uid);

	void resetPwd(User user);

	void activation(User user);

}
