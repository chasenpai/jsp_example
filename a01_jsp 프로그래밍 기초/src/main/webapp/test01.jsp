<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>JSP 동작 방식</h3>
<hr>
<p>1.클라이언트가 웹 서버에 *.jsp에 대한 요청을 하면, 웹 서버는 이 요청을 JSP 컨테이너로 넘긴다.</p>

<p>2.JSP 컨테이너는 해당 JSP 페이지를 찾아 서블릿(*.java)으로 변환 시키고 자바 파일을 컴파일한다.</p>

<p>3.자바 파일의 결과가 다시 사용자의 웹 브라우저로 전송되어 클라이언트가 요청한 결과를 받을 수 있게 된다.</p>

<p>웹 브라우저 => 웹 서버= > JSP 컨테이너= > *.jsp= > *.java => *.class => 웹 서버= > 웹 브라우저</p>

﻿
</body>
</html>