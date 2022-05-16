<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("name", "홍길동");
	request.setAttribute("age", 25);
%>

<c:if test="${name == '홍길동' }">
	제 이름은 홍길동 입니다.<br><br>
</c:if>


나이를 맞춰보세요.
<c:choose>
	<c:when test="${age == 25 }">
		정답입니다.
	</c:when>
	<c:when test="${age > 25 }">
		그것보다 적습니다.
	</c:when>
	<c:otherwise>
		그것보다 많습니다.
	</c:otherwise>
</c:choose>
<br><br>


<c:forEach var="num" begin="0" end="10" step="1">
	 ${num }
</c:forEach>
<br><br>


<%
	request.setAttribute("numbers", new int[]{1, 2, 3, 4, 5});
%>

<c:forEach var="num" items="${numbers}">
	${num }<br>
</c:forEach>




</body>
</html>