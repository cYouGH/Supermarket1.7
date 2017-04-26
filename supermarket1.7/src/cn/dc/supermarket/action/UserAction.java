package cn.dc.supermarket.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.service.UserService;
import cn.dc.supermarket.utils.MailUtil;
import cn.dc.supermarket.utils.QueryPage;
import cn.dc.supermarket.utils.UUIDUtils;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	/**
	 * 作者：丁川
	 */
	private static final long serialVersionUID = 1L;
	private int page = 1;
	private User user = new User();
	private UserService userService;
	private String idArr;

	public String getIdArr() {
		return idArr;
	}

	public void setIdArr(String idArr) {
		this.idArr = idArr;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String exit() {
		//清空上下文中的session
		ActionContext.getContext().getSession().clear();
		return "exit";
	}

	public String regist() {
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setCode(code);
		user.setRegTime(new Date());
		userService.add(user);
		Thread t = new Thread(new MailUtil(user.getEmail(), code));
		t.start();
		return "registSuccess";
	}

	public void registCheck() {
		System.out.println("check username : " + user.getUsername());
		User checkUser = userService.get(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		if (checkUser != null) {
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public String activate() {
		System.out.println(user.getCode());
		User activeUser = userService.findByCode(user.getCode());
		if (activeUser != null) {
			activeUser.setIsActivated(1);
			userService.update(activeUser);
			return "activateSuccess";
		}
		return "activateFaild";
	}

	public String login() {
		// 通过ModelDriven拿到页面登陆对象的用户名和密码，并进行查询
		User checkUser = userService.get(user.getUsername());
		// 判断数据库是否含有用户，并进行检测
		if (checkUser != null && checkUser.getPassword().equals(user.getPassword())) {
			// 将用户基本信息放入session中
			ActionContext.getContext().getSession().put("loginUser", checkUser);
			// 设置session失效时间为120分钟
			// session.setMaxInactiveInterval(120 * 60);
			return SUCCESS;
		} else {
			// 返回登录失败信息
			this.addActionMessage("用户名或密码错误，请重新登陆！");
			return ERROR;
		}
	}

	public String delete() {
		User loginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		// 不允许删除超级管理员admin
		if (user.getUid() != 1 && user.getUid() != loginUser.getUid()) {
			User userFind = userService.findById(user.getUid());
			System.out.println(user.getUsername());
			if (userFind != null) {
				userService.delete(userFind);
			}
		}
		return "deleteSuccess";

	}

	public String findByName() {
		System.out.println(user.getUsername());
		user = userService.get(user.getUsername());

		return "findSuccess";
	}

	public String deleteChecked() {
		User loginUser = (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		String[] chkboxArr = idArr.split(",");
		for (int i = 0; i < chkboxArr.length; i++) {
			int deleteId = Integer.parseInt(chkboxArr[i].trim());
			User user = userService.findById(deleteId);
			// 不允许删除超级管理员和自己
			if (deleteId != 1 && deleteId != loginUser.getUid()) {
				userService.delete(user);
			}
		}
		return "deleteSuccess";
	}

	public String add() {
		user.setRegTime(new Date());
		userService.add(user);
		return "addPage";

	}

	public String findAllByPage() {
		int limit = 5;
		QueryPage<User> queryResult = userService.findAllByPage(page, limit);
		ActionContext.getContext().getValueStack().set("pageBean", queryResult);
		return "listPage";
	}

	public String edit() {
		userService.update(user);
		return "editSuccess";
	}

	public String update() {

		User existUser = userService.get(user.getUsername());
		if (user.getOldPassword().equals(existUser.getPassword())) {
			existUser.setPassword(user.getPassword());
			userService.update(existUser);
			return "redirectLogin";
		} else {
			this.addActionMessage("修改失败，原密码输入错误！");
		}
		return "changePswPage";
	}

	// *********right窗口页面跳转**********
	public String registPage() {
		return "registPage";
	}

	public String addPage() {
		 
		return "addPage";
	}

	public String editPage() {
		user = userService.findById(user.getUid());
		return "editPage";
	}

	public String changePswPage() {

		return "changePswPage";

	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public UserService getUserService() {
		return userService;
	}

	@Override
	public User getModel() {
		return this.user;
	}

}
