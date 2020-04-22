<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String originImg = (String)request.getParameter("originImg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 변경</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
body{
	width:400px;
	height:400px;
	text-align: center;
	margin-left:auto;
	margin-right: auto;
}
#imgdiv{
	width:300px;
	height:300px;
	border: 1px solid black;
	margin-left:auto;
	margin-right: auto;
	cursor: pointer;
}
#imgsubmit{
	margin-top:20px;
	width:80px;
	height:40px;
	font-size: 20px;
	font-weight: 900;
}
</style>
</head>
<body>
	<form id="profilechange" action="<%= request.getContextPath() %>/insertpro.tl" method="post" encType="multipart/form-data">
		<h1>프로필 사진 변경</h1>
		<div id="imgdiv">
			<img id="img" width="100%" height="100%">
		</div>
		<div id="filearea">
			<input type="file" id="proimage" multiple="multiple" name="proimage" onchange="LoadImg(this)">
		</div>
		<input type="hidden" name="originImg" value="<%= originImg %>">
		<input type="submit" id="imgsubmit" value="확인">
	</form>
</body>
<script>
	$(function(){
		$("#filearea").hide();
		
		$('#imgdiv').click(function(){
			$('#proimage').click();
		});	
		
		$('#profilechange').submit(function(){
			});
		
		$('#img').attr("src", "<%= request.getContextPath() %>/uploadFiles/<%= originImg %>");
		
	});
	
	function LoadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				$('#img').attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>
</html>