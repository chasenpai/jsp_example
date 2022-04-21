<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinCheck" method="post" name="joinForm">
		아이디: <input type="text" name="id" id="id" onkeydown="inputIdCheck()"><br>
		<button type="button" name="idCheckOk" onclick="checkId()">중복확인</button><br>
		<input type="hidden" name="idDup" value="idUnCheck">
		비밀번호: <input type="password" name="pwd"><br>
		비밀번호 확인 : <input type="password" name="pwdCheck" ><br>
		이름: <input type="text" name="name"><br>
		성별:
		남자<input type="radio" name="gender" value="남자" checked>
		여자<input type="radio" name="gender" value="여자"><br>
		나이<input type="text" name="age" ><br>
		전화번호<input type="text" name="phone"><br>
		우편번호<input type="text" name="zipcode" class="postcodify_postcode5" value="">
		<button type="button" id="postcodify_search_button">검색</button><br>
		주소<input type="text" name="addr" class="postcodify_address" value=""><br >
		상세주소<input type="text" name="addrDetail" class="postcodify_details" value="" ><br>
		기타<input type="text" name="addrEtc" class="postcodify_extra_info" value="" ><br>
		<input type="button" onclick="join()" value="회원가입">
	</form>
	

	
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>

	var form = document.joinForm;
	
	function join(){
		
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(!form.id.value){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		
		}else if(form.id.value.length <= 4 || form.id.value.length >= 16){
			alert("아이디는 4자이상 16자 이하로 입력해주세요.")
			form.id.focus();
			return;
		}else if(form.idDup.value != "idCheck"){
			alert("아이디 중복체크를 해주세요.")
			return;
			
		}else if(!form.pwd.value){
			alert("비밀번호를 입력해주세요.")
			form.pwd.focus();
			return;
		
		}else if(!reg.test(form.pwd.value)){
			alert("비밀번호는 8자리 이상, 대문자, 소문자, 숫자 ,특수문자가 모두 포함되어야 합니다.");
			form.pwd.focus();
			return;
		
		}else if(/(\w)\1\1\1/.test(form.pwd.value)){
			alert("같은 문자를 4번이상 연속 사용하실 수 없습니다")
			form.pwd.focus();
			return;
		
		}else if(form.pwd.value.search(form.id.value) != -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다");
			form.pwd.focus();
			return;
		
		}else if(hangleCheck.test(form.pwd.value)){
			alret("비밀번호에 한글을 사용할 수 없습니다");
			form.pwd.focus();
			return;
		
		}else if(form.pwd.value.search(/\s/) != -1){
			alert("비밀번호에 공백 없이 입력해주세요");
			form.pwd.focus();
			return;
			
		}else if(form.pwd.value != form.pwdCheck.value){
			alert("비밀번호를 확인해주세요");
			form.pwd.focus();
			return;
			
		}else if(!form.name.value){
			alert("이름을 입력해주세요.");
			form.name.focus();
			return;
		
		}else if(!form.age.value){
			alert("나이를 입력해주세요.");
			form.age.focus();
			return;
		
		}else if(!form.phone.value){
			alert("전화번호를 입력해주세요.");
			form.phone.focus();
			return;
			
		}else if(!form.zipcode.value){
			alert("우편번호와 주소를 입력해주세요.")
			form.zipcode.focus();
			return;
		}else {
			form.submit();
		
		}	
		
	}
	
	function checkId(){
		var id = joinForm.id.value;
		if(id.length==0 || id==""){
			alert("아이디를 입력해주세요.");
			form.id.focus();
		}else{
			window.open("idCheck?id="+id,"","width=500, height=300");
		}
	}
	
	function inputIdCheck(){
		var check = document.joinForm.idCheckOK;
		form.idDup.value="idUnCheck";
		form.idCheckOk.disabled=false;
		form.idCheckOk.style.opacity=1;
		/*form.idCheckOk.style.cursor="pointer";*/
	}

</script>

</html>