<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
	.div01 {margin: 0 auto;
		margin-top: 100px;
		width: 800px;
	}
	h1{margin: 50px;
		text-align: center;}

</style>
</head>
<body>
<div class="div01">
	<h1>자유 게시판</h1>
	<form method="post" action="${action}" >
		<table class="table">
			<thead class="table-dark">
			<tr>
				<th>게시글 작성</th>
				<td>&nbsp </td>
			</tr>
			</thead>
			<tr class="table-light">
				<th>제목  </th>
				<td>
					<input style="border:0 solid black" type="text" name="title" size="80" maxlength="80" value="${msg.title }">
				</td>
			</tr>
			<tr class="table-light">
				<th>작성자  </th>
				<td>
					<input style="border:0 solid black" type="text" name="writer" size="80" maxlength="20" value="${msg.writer }">
				</td>
			</tr>
			<tr class="table-light">
				<th>내용  </th>
				<td>
					<textarea style="border:0 solid black" name="content" cols="81" rows="10">${msg.content }</textarea>
				</td>
			</tr>
		</table>

		<br>
		<input type="submit" class="btn btn-dark" value="저장">
		<input type="button" class="btn btn-dark" value="취소" onclick="history.back()">
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>