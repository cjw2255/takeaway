package com.woniu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.pojo.Message;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Role;
import com.woniu.service.IRoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	IRoleService iRoleService;
	@RequestMapping("show")
	public String show() {
		return "role/show";
	}
	@RequestMapping("saveUI")
	public String saveUI() {
		return "role/roleAdd";
	}
	@RequestMapping("updateUI")
	public String updateUI(Integer rid,Model model) {
		Role role = iRoleService.findOne(rid);
		model.addAttribute("role", role);
		return "role/roleUpdate";
	}
	@RequestMapping("roleindex")
	@ResponseBody
	public Object roleindex(PageBean<Role> pageBean) {
		Message message = new Message();
		try {
			//设置当前页
			if (pageBean.getCurrentPage()==null) {
				pageBean.setCurrentPage(1);
			}
			//设置每页显示的条目数
			pageBean.setPageSize(5);
			//设置总行数
			int totalCount = iRoleService.getTotalCount(pageBean);
			pageBean.setTotalCount(totalCount);
			//设置总页数
			int pages = pageBean.getTotalCount()%pageBean.getPageSize()==0?pageBean.getTotalCount()/pageBean.getPageSize():pageBean.getTotalCount()/pageBean.getPageSize()+1;
			pageBean.setPages(pages);
			List<Role> roleList = iRoleService.findAll(pageBean);
			//设置每页显示的数据
			pageBean.setData(roleList);
			message.setObj(pageBean);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	@RequestMapping("roleSave")
	@ResponseBody
	public Object roleSave(Role role) {
		Message message = new Message();
		try {
			iRoleService.roleSave(role);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("roleUpdate")
	@ResponseBody
	public Object roleUpdate(Role role) {
		Message message = new Message();
		try {
			iRoleService.roleUpdate(role);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("deleteRole")
	@ResponseBody
	public Object deleteRole(Integer rid) {
		Message message = new Message();
		try {
			iRoleService.deleteRole(rid);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
	
	@RequestMapping("delRoles")
	@ResponseBody
	public Object delRoles(Integer[] rids) {
		Message message = new Message();
		try {
			iRoleService.delRoles(rids);
			message.setFlag(true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message.setFlag(false);
		}
		return message;
	}
}
