<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기 테스트</title>
</head>
<body>
	<h1>메일 라이브러리 활용하기</h1>
	<p>보안 상 폭탄 메일을 방지하기 위해 라이브러리에서는<br>
	   보낼 사람의 이메일과 사용할 이메일 주소를 미리 정해 놓고<br>
	   변경할 수 없습니다.</p>
	   
	<form action="/mail/send.do" method="post">
		보낸 이 : <input type="text" name="sender" value="보낼_사람의_아이디" readonly> <br>
		받는 이 : <input type="text" name="receiver"> <br>
		제목 : <input type="text" name="title"> <br>
		내용 : <textarea cols="10" rows="5" name="contents"></textarea> <br>
		
		<button type="submit">보내기</button>
	</form>
</body>
</html>