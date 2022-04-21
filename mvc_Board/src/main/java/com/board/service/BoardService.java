package com.board.service;

import java.util.ArrayList;


import com.board.dao.BoardDao;
import com.board.dto.BoardDto;
import com.board.dto.Pagination;

public class BoardService {
	private static final int listSize=10;
	private static final int paginationSize = 3;
	
	//페이지네이션
	public ArrayList<Pagination> getPagination(int pageNum){
		ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
		
		//게시판의 전체 게시글 수를 담는다
		int numRecords = new BoardDao().getNumRecords();
		//게시글 리스트를 표시하는데 총 몇 페이지가 필요한지 계산
		int numPages = (int)Math.ceil((double)numRecords / listSize);
		
		//컨트롤의 첫 번째 숫자를 계산
		int firstLink = ((pageNum - 1) / paginationSize) * paginationSize + 1;
		
		//컨트롤의 마지막 번호를 계산
		int lastLink = firstLink + paginationSize - 1;
		if(lastLink > numPages) {
			lastLink = numPages;
		}
		//컨트롤 데이터를 ArrayList에 담는다
		if(firstLink > 1) {
			pgnList.add(new Pagination("이전", pageNum - paginationSize, false));
		}
		
		for(int i = firstLink; i <= lastLink; i++) {
			pgnList.add(new Pagination("" + i , i, i == pageNum));
		}
		
		if(lastLink < numPages) {
			int tmpPageNum = pageNum + paginationSize;
			if(tmpPageNum > numPages) {
				tmpPageNum = numPages;
			}
			pgnList.add(new Pagination("다음", tmpPageNum, false));
		}
		
		return pgnList;
	}
	
	
	//게시글 목록
	public ArrayList<BoardDto> getMsgList(int pageNum){
		return new BoardDao().list((pageNum - 1) * listSize, listSize);
	}
	
	
	//게시글 조회
	public BoardDto getMsg(int num) {
		//지정된 번호의 글을 DB에서 읽음
		BoardDto dto = new BoardDao().select(num, true);
		//글 제목과 내용이 웹 페이지에 올바르게 출력되도록 공백과 줄 바꿈 처리
		dto.setTitle(dto.getTitle().replace(" ", "&nbsp;"));
		dto.setContent(dto.getContent().replace(" ", "&nbsp;").replace("\n", "<br>"));
		
		return dto;
	}
	
	
	//게시글 작성 페이지
	public BoardDto getMsgWrite(int num) {
		return new BoardDao().select(num, false);
	}
	
	
	//게시글 작성
	public void insertMsg(String writer, String title, String content)throws Exception{
		//빈 칸이 하나라도 있으면 오류를 출력하고 종료
		if(writer == null || writer.length() == 0 || 
		   title == null || title.length() == 0 ||
		   content == null || content.length() == 0) {
			throw new Exception("모든 항목이 빈칸 없이 입력되어야 합니다.");
		}
		//글 데이터를 변수에 저장
		BoardDto dto = new BoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		//입력된 내용으로 새 글 레코드 추가
		new BoardDao().insert(dto);
		
	}
	
	
	//게시글 수정
	public void updateMsg(String writer, String title, String content, int num)throws Exception{
		//빈 칸이 하나라도 있으면 오류를 출력하고 종료
		if(writer == null || writer.length() == 0 ||
		   title == null || title.length() == 0 ||
		   content == null || content.length() == 0){
			throw new Exception("모든 항목이 빈칸 없이 입력되어야 합니다.");
		}
		//글 데이터를 변수에 저장
		BoardDto dto = new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		//입력된 내용으로 글 업데이트
		new BoardDao().update(dto);
	}
	
	
	//게시글 삭제
	public void deleteMsg(int num) {
		//지정된 글 번호의 레코드를 DB에서 삭제
		new BoardDao().delete(num);
	}
	
	
	
	
	
	
	
	
	
	
}
