package com.woniu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.woniu.pojo.User;

public interface UserDao {

	List<User> selectAll( Map<String, Object> map);

	int getTotalCount( Map<String, Object> map);

	void deleteUser(Integer uid);

	void delUsers(Integer[] uids);

	User findOne(Integer uid);

	void resetPwd(User user);

	void activation(User user);

}
