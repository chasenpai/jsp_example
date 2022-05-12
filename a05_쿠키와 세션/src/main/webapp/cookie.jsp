<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie cookie = new Cookie("userId", "gildong"); //쿠키 객체 생성
	cookie.setMaxAge(60 * 60 * 2); //쿠키의 지속시간 설정 - 초 * 분 * 시
	response.addCookie(cookie); //쿠키를 저장
	
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("userId")){
				out.println("userId에 저장된 값: " + c.getValue());
				break;
			}
		}
	}
	
	//Cookie cookie = new Cookie("userId", null);
	//cookie.setMaxAge(0);
	//response.addCookie(cookie);
	
	
%>

</body>
</html>