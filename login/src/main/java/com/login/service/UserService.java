package com.login.service;

import com.login.dao.UserDao;
import com.login.vo.UserVo;

public class UserService {

	public int getLogin(String id, String pwd) {
		int result = new UserDao().login(id, pwd);
		
		return result;
	}
	
	public void getJoin(String id, String pwd, String name, String gender, String age, String phone, String zipcode, String addr, String addrDetail, String addrEtc) {
		
		UserVo vo = new UserVo();
		vo.setUserId(id);
		vo.setUserPwd(pwd);
		vo.setUserName(name);
		vo.setGender(gender);
		vo.setUserAge(Integer.parseInt(age));
		vo.setPhoneNum(phone);
		vo.setZipcode(zipcode);
		vo.setAddr(addr);
		vo.setAddrDetail(addrDetail);
		vo.setAddrEtc(addrEtc);
		
		new UserDao().joinId(vo);
		
	}
	
	public int getIdCheck(String id) {
		int result = new UserDao().checkId(id);
		
		return result;
	}
	
	
	public UserVo getInfo(String id) {
		UserVo vo = new UserDao().showInfo(id);
		return vo;
	}

	
	public void getUpdate(String pwd, String name, String phone, String zipcode, String addr, String addrDetail, String addrEtc, String id) {
		
		UserVo vo = new UserVo();
		vo.setUserPwd(pwd);
		vo.setUserName(name);
		vo.setUserId(id);
		vo.setPhoneNum(phone);
		vo.setZipcode(zipcode);
		vo.setAddr(addr);
		vo.setAddrDetail(addrDetail);
		vo.setAddrEtc(addrEtc);
		
		new UserDao().update(vo);
	}
	
	
	public void getDelete(String id) {
		new UserDao().delete(id);
	}
	
	
	public String getSearchId(String name, String phone) {
		String id = new UserDao().searchId(name, phone);
		
		return id;
	}
	
	
	public String getSearchPwd(String id, String name, String phone) {
		String pwd = new UserDao().searchPwd(id, name, phone);
		
		return pwd;
	}
	
}
