<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div {margin: 0 auto;
		margin-top: 100px;
		width: 800px;
	}

	table {width: 800px; text-align: center;
	word-break: break-all;}
	h1{margin: 50px;
		text-align: center;}


</style>
</head>
<body>
<div>
	<h1>자유 게시판</h1>
	<table class="table">
		<thead class="table-dark">
		<tr>
			<th >제목</th>
			<td>${msg.title }</td>
		</tr>
		</thead>
		
		<tr class="table-light">
			<th>작성자</th>
			<td>${msg.writer }</td>
		</tr>
		<tr class="table-light">
			<th>작성일시</th>
			<td>${msg.regtime }</td>
		</tr>
		<tr class="table-light">
			<th>조회수</th>
			<td>${msg.hits }</td>
		</tr>
		
	</table>
	<table class="table">
		<tr>
			<td >${msg.content }</td>
		</tr>
	</table>
	<br>
	<input type="button" class="btn btn-dark" value="목록보기" onclick="location.href='list'">
	<input type="button" class="btn btn-dark" value="수정" onclick="location.href='write?num=${param.num}'">
	<input type="button" class="btn btn-dark" value="삭제" onclick="location.href='delete?num=${param.num}'">
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>