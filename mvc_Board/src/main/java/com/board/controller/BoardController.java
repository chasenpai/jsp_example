package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dto.BoardDto;
import com.board.service.BoardService;

@WebServlet("/")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String view = null;
		//URL에서 프로젝트 이름 뒷 부분의 문자열 얻기
		String uri = request.getRequestURI();
		String conPath = request.getContextPath(); 
		String com = uri.substring(conPath.length());
		
		
		//주어진 URL에 따라 동작 수행
		
		//게시판 목록
		if(com.equals("/list") || com.equals("/")){
			String tmp = request.getParameter("page");
			int pageNum = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 1;
			
			request.setAttribute("msgList", new BoardService().getMsgList(pageNum));
			request.setAttribute("pgnList", new BoardService().getPagination(pageNum));
			view = "list.jsp";
		
		
		//게시글 조회
		}else if(com.equals("/view")){
			//지정된 글 번호 얻기
			int num = Integer.parseInt(request.getParameter("num"));
			request.setAttribute("msg", new BoardService().getMsg(num));
			view = "view.jsp";
		
		
		//게시글 작성페이지
		}else if(com.equals("/write")) {
			//글 번호 값 얻기, 주어지지 않으면 0으로 설정
			String tmp = request.getParameter("num");
			int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;
			
			//새 글쓰기 모드
			BoardDto dto = new BoardDto();
			String action = "insert";
			
			//글 번호가 주어졌으면, 글 수정 모드
			if(num > 0) {
				dto = new BoardService().getMsgWrite(num);
				action = "update?num=" + num;
			}
			
			request.setAttribute("msg", dto);
			request.setAttribute("action", action);
			view = "write.jsp";
		
		//게시글 작성
		}else if(com.equals("/insert")) {
			request.setCharacterEncoding("utf-8");
			//양식에 입력되었던 값 읽기
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			try {
				new BoardService().insertMsg(writer, title, content);
				view = "redirect:list";
			} catch(Exception e) {
				request.setAttribute("errorMessage", e.getMessage());
				view = "errorBack.jsp";
			}
			
		//게시글 수정	
		}else if(com.equals("/update")) {
			request.setCharacterEncoding("utf-8");
			//글 번호 값 얻기
			int num = Integer.parseInt(request.getParameter("num"));
			//읽어들인 글 데이터를 변수에 저장
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			try {
				new BoardService().updateMsg(writer, title, content, num);
				view = "redirect:list";
				
			} catch(Exception e) {
				request.setAttribute("errorMessage", e.getMessage());
				view = "errorBack.jsp";
			}
			
		//게시글 삭제
		}else if(com.equals("/delete")) {
			//글 번호 값 얻기
			int num = Integer.parseInt(request.getParameter("num"));
			new BoardService().deleteMsg(num);
			view = "redirect:list";
		}
		
		
		//view에 담긴 문자열에 따라 포워딩 또는 리다이렉팅
		if(view.startsWith("redirect:")) {
			response.sendRedirect(view.substring(9));
		}else {
			request.getRequestDispatcher(view).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
