package com.hyacinth;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;




/**
 * @author Andrew
 * UserRegister is use to register and validate information that register into the database
 */
public class UserRegister implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2800737974406552037L;
	private String loginID;
	private String name;
	private String password;
	private String email;
	private String qqnum;
	private Map<String, String> errors = null;
	public UserRegister() {
		super();
		this.loginID = "";
		this.name = "";
		this.password = "";
		this.email = "";
		this.qqnum = "";
		this.errors = new HashMap<String, String>();
	}
	/**
	 * isValidate() use for validate the information
	 * 输入验证器
	 * @return true if the input is right
	 */
	public boolean isValidate(){
		boolean validator = true;
		if(!this.loginID.matches("\\w{6,15}")){
			validator = false;
			this.loginID = "";
			errors.put("err_loginID", "ID只能是6-15位字母或数字或下划线");
		}
		if(!this.password.matches(".{6,15}")){
			validator = false;
			this.password = "";
			errors.put("err_password", "密码长度只能是6-15位");
		}
		if(!this.name.matches(".{0,15}")){
			validator = false;
			this.name = "";
			errors.put("err_name", "名字不能超过15位");
		}
		if(!this.email.matches("^\\w+@\\w+\\.\\w+\\.?\\w*$")){
			validator = false;
			this.email = "";
			errors.put("err_email", "这货不是E-MAIL");
		}
		if(!this.qqnum.matches(".{0,15}")){
			validator = false;
			this.qqnum = "";
			errors.put("err_qqnum", "QQ号码不能超过15位");
		}
		
		return validator;
	}
	
	/**
	 * getErrorMsg
	 * 获得错误信息
	 * @param key is the field in input
	 * @return 获得对应错误信息
	 */
	public String getErrorMsg(String key){
		String value = this.errors.get(key) ;
		return value==null?"":value ;
	}
	
	//下面都是自动生成的GETTER 和 SETTER
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQqnum() {
		return qqnum;
	}
	public void setQqnum(String qqnum) {
		this.qqnum = qqnum;
	}
	
	
	
}
