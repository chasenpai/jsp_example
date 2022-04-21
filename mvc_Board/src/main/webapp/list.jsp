<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<meta charset="UTF-8">
<title>게시판 목록</title>

<style>
	.div01 {margin: 0 auto;
		margin-top: 100px;
		width: 800px;
	}
	

	
	h1{margin: 50px;
		text-align: center;}
	
	table {width: 800px; text-align: center;}
/*	.table th {background-color: #F7BE81;} */
	.num {width: 110px;}
	.title {width: 260px;}
	.writer {width:130px;}
	.regtime {width: 210px;}
	
	a:link {text-decoration: none; color: blue;}
	a:visited {text-decoration: none; color: black;} 
	a:hover {text-decoration: none; color: red;}
</style>
</head>
<body>
<div class="div01">
	<h1>자유 게시판</h1>
	<table class="table table-hover">
		<thead class="table-dark">	
			<tr>
				<th class="num" scope="col">번호</th>
				<th class="title" scope="col">제목</th>
				<th class="writer" scope="col">작성자</th>
				<th class="regtime" scope="col">작성일시</th>
				<th>조회수</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach var ="msg" items="${msgList }">
			<tr class="table-light">
				<td scope="row">${msg.num }</td>
				<td>
					<a href="view?num=${msg.num }">${msg.title }</a>
				</td>
				<td>${msg.writer }</td>
				<td>${msg.regtime }</td>
				<td>${msg.hits}</td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
	<br>
		<div style="width:800px; text-align: center;">
			<c:forEach var="pgn" items="${pgnList }">
				<a class="pgn" href="list?page=${pgn.pageNum }">
					<c:choose>
						<c:when test="${pgn.curPage }">
							<u>${pgn.display }</u>
						</c:when>
						<c:otherwise>
							${pgn.display }
						</c:otherwise>
					</c:choose>
				</a>&nbsp;	

			</c:forEach>
		</div>

	<br>
	<input type="button" class="btn btn-dark" value="글쓰기" onclick="location.href='write'">
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>