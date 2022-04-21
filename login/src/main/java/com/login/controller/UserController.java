package com.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.login.dao.UserDao;
import com.login.service.UserService;
import com.login.vo.UserVo;

@WebServlet("/")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/login") || com.equals("/")){;
			view = "login.jsp";
			
		}else if(com.equals("/loginCheck")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			int result = new UserService().getLogin(id, pwd);
			
			if(result == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				view = "redirect:main.jsp";
			}else {
				request.setAttribute("result", result);
				view = "login";
			}
				
		}else if(com.equals("/joinCheck")) {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String addr = request.getParameter("addr");
			String addrDetail = request.getParameter("addrDetail");
			String addrEtc = request.getParameter("addrEtc");
			
			new UserService().getJoin(id, pwd, name, gender, 
					age, phone, zipcode, addr, addrDetail, addrEtc);
			
			view = "redirect:login";
			
		}else if(com.equals("/idCheck")) {
			String id = request.getParameter("id");
			request.setAttribute("id", id);
			request.setAttribute("idCheck", new UserService().getIdCheck(id));

			view = "idCheck.jsp";
			
		}else if(com.equals("/logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			view = "login";
			
		}else if(com.equals("/userInfo") || com.equals("/updateInfo")) {
			String id = request.getParameter("id");
			request.setAttribute("info", new UserService().getInfo(id));
			
			if(com.equals("/userInfo")){
				view = "userInfo.jsp";
			}else {
				view = "updateUser.jsp";
			}
			
			
		}else if(com.equals("/update")){
			request.setCharacterEncoding("utf-8");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String addr = request.getParameter("addr");
			String addrDetail = request.getParameter("addrDetail");
			String addrEtc = request.getParameter("addrEtc");
			String id = request.getParameter("id");
			
			new UserService().getUpdate(pwd, name, phone, zipcode, 
					addr, addrDetail, addrEtc, id);
			
			view = "redirect:main.jsp";	
			
		}else if(com.equals("/delete")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			int result = new UserService().getLogin(id, pwd);
			
			if(result == 1) {
				new UserService().getDelete(id);
				HttpSession session = request.getSession();
				session.invalidate();
				view = "redirect:login";
			}else {
				request.setAttribute("result", result);
				view = "deleteUser.jsp";
			}
			
		}else if(com.equals("/searchId")) {
			request.setCharacterEncoding("utf-8");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");

			String id = new UserService().getSearchId(name, phone);
			
			if(id != null) {
				request.setAttribute("findId", "find");
				request.setAttribute("userId", id);
				view = "search.jsp";
			}else {
				request.setAttribute("findId", "null");
				view = "search.jsp";
			}
			
		}else if(com.equals("/searchPwd")) {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			String pwd = new UserService().getSearchPwd(id, name, phone);
			
			if(pwd != null) {
				request.setAttribute("findPwd", "find");
				request.setAttribute("userPwd", pwd);
				view = "search.jsp";
			}else {
				request.setAttribute("findPwd", "null");
				view = "search.jsp";
			}
		}
	
		if(view.startsWith("redirect:")) {
			response.sendRedirect(view.substring(9));
		}else{
			request.getRequestDispatcher(view).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
