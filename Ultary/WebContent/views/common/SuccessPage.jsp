<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
body{
	width:400px;
	height:200px;
	text-align: center;
	margin-left:auto;
	margin-right: auto;
}
#closeBtn{
	margin-top:20px;
	width:80px;
	height:50px;
	font-size: 25px;
	font-weight: 900;
}
</style>
</head>
<body>
	<br><br><br><br><br>
	<% String msg = (String)request.getAttribute("msg"); %>
	<h1><%= msg %></h1>
	<button id="closeBtn">닫기</button>
<script>

	$('#closeBtn').click(function(){
		opener.document.location.href = "<%= request.getContextPath() %>/post.tl"
		window.close();
	});
</script>
</body>
</html>