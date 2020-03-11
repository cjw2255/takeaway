package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Message;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Role;
import com.woniu.pojo.User;
import com.woniu.service.IRoleService;
import com.woniu.service.IUserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	IRoleService iRoleService;
	@Autowired
	IUserService userService;
	@RequestMapping("index")
	public String selectRole(Model model) {
		List<Role> roleList = iRoleService.selectRole();
		for (Role role : roleList) {
			if (role.getRname().equals("商家")) {
				model.addAttribute("bid", role.getRid());
			}else if (role.getRname().equals("普通用户")) {
				model.addAttribute("uid", role.getRid());
			}else if (role.getRname().equals("外卖员")) {
				model.addAttribute("tid", role.getRid());
			}
		}
		return "user/index";
	}
	
	@RequestMapping("selectAll")
	@ResponseBody
	public Object selectAll(Integer rid,PageBean<User> pageBean) {
		Message message = new Message();
		try {
			if (pageBean.getCurrentPage()==null) {
				pageBean.setCurrentPage(1);
			}
			pageBean.setPageSize(5);
			System.out.println(pageBean.getQueryVal());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("rid", rid);
			map.put("pageBean", pageBean);
			int totalCount = userService.getTotalCount(map);
			pageBean.setTotalCount(totalCount);
			int pages = pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1;
			pageBean.setPages(pages);
			
			List<User> list = userService.selectAll(map);
			pageBean.setData(list);
			message.setObj(pageBean);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}

	@RequestMapping("deleteUser")
	@ResponseBody
	public Object deleteUser(Integer uid) {
		Message message = new Message();
		try {
			userService.deleteUser(uid);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("delUsers")
	@ResponseBody
	public Object delUsers(Integer[] uids) {
		Message message = new Message();
		try {
			userService.delUsers(uids);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("resetPwd")
	@ResponseBody
	public Object resetPwd(Integer uid) {
		Message message = new Message();
		try {
			User user = userService.findOne(uid);
			user.setUpassword("123456");
			userService.resetPwd(user);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("activation")
	@ResponseBody
	public Object activation(Integer uid) {
		Message message = new Message();
		try {
			User user = userService.findOne(uid);
			user.setUstatus("激活");
			userService.activation(user);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("disable")
	@ResponseBody
	public Object disable(Integer uid) {
		Message message = new Message();
		try {
			User user = userService.findOne(uid);
			user.setUstatus("已停用");
			userService.activation(user);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
}
