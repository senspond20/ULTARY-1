<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/cmnpostWrite.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
					<form action="<%= request.getContextPath() %>/cminsert.po" method="post" encType="multipart/form-data">
					<div id="sectiondiv1">
						<div id="sTop">공지사항 작성</div>
						<hr>
						<div id="sTitle">
							<label>Title : </label>
							<input name="title">
							<select name="postRange">
								<option value="1" selected>전체공개</option>
								<option value="3">나만보기</option>
							</select>
						</div>
						<hr>
						<div id="sContent">
							<label>Content : </label><br>
							<textarea name="postContent"></textarea>
						</div>
						<hr>
						<div id="sAdd">
							<label>카테고리 설정&nbsp;&nbsp;| </label>
							<select name="categorynum">
								<option value="1" selected>공지사항</option>
							</select>
						</div>
						<hr>
						<div id="sMedia">
							<div class="sMedia" id="media1">
								<img id="mediaImg1" width="100%" height="100%">
							</div>
							<div class="sMediaL"></div>
							<div class="sMedia" id="media2">
								<img id="mediaImg2" width="100%" height="100%">
							</div>
							<div class="sMediaL"></div>
							<div class="sMedia" id="media3">
								<img id="mediaImg3" width="100%" height="100%">
							</div>
							<div class="sMediaL"></div>
							<div class="sMedia" id="media4">
								<img id="mediaImg4" width="100%" height="100%">
							</div>
						</div>
						<hr>
						<div id="sSubmit">
							<input type="submit" value="Complete">
						</div>
						<div id="fileArea">
							<input type="file" id="Img1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
							<input type="file" id="Img2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
							<input type="file" id="Img3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
							<input type="file" id="Img4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
						</div>
					</div>
<script>
	$(function(){
		$("#fileArea").hide();
		
		$("#media1").click(function(){
			$("#Img1").click();
		});
		$("#media2").click(function(){
			$("#Img2").click();
		});
		$("#media3").click(function(){
			$("#Img3").click();
		});
		$("#media4").click(function(){
			$("#Img4").click();
		});
	});
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
							
			reader.onload = function(e){								
				switch(num){
				case 1: 
					$("#mediaImg1").attr("src", e.target.result);
					break;
				case 2:
					$("#mediaImg2").attr("src", e.target.result);
					break;
				case 3: 
					$("#mediaImg3").attr("src", e.target.result);
					break;
				case 4:
					$("#mediaImg4").attr("src", e.target.result);
					break;
				}
			}
							
			reader.readAsDataURL(value.files[0]);
		}
	}
	
</script>
				</form>
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>