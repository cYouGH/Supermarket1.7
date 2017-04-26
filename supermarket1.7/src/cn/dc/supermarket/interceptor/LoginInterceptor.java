package cn.dc.supermarket.interceptor;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.utils.GlobalSessionInfo;

public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation ai) throws Exception {
		User loginUser = (User) ActionContext.getContext().getSession().get(GlobalSessionInfo.USERNAME);
		System.out.println(ai.invoke());
		if(loginUser != null){
			return ai.invoke();
		}
		return "/login.action";
	}

}
