<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="joinAction.jsp" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="id" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="pwd" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="이름을 입력하세요"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="남" checked>남
				<input type="radio" name="gender" value="여">여
			</td>
		</tr>
		<tr>
			<td>가입경로</td>
			<td>
				<select name="path">
					<option value="웹검색">인터넷</option>
					<option value="광고">광고</option>
					<option value="지인소개">지인소개</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
				<select name="field" multiple>
					<option value="사회">사회</option>
					<option value="경제">경제</option>
					<option value="정치">정치</option>
					<option value="연예">연예</option>
					<option value="스포츠">스포츠</option>
					<option value="게임">게임</option>
				</select>
			</td>
		</tr>
	</table><br>
	<input type="submit" value="가입하기">
</form>

</body>
</html>